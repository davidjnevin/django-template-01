#!/bin/bash

set -e
set -o nounset

postgres_ready() {
    python << END
import sys

from psycopg2 import connect
from psycopg2.errors import OperationalError

try:
    connect(
        dbname="${POSTGRES_DB}",
        user="${POSTGRES_USER}",
        password="${POSTGRES_PASSWORD}",
    )
except OperationalError:
    sys.exit(-1)
END
}

redis_ready() {
    python << END
import sys

from redis import Redis
from redis import RedisError


try:
    redis = Redis.from_url("${CELERY_BROKER_URL}", db=0)
    redis.ping()
except RedisError:
    sys.exit(-1)
END
}

wait_other_containers() {
	until postgres_ready; do
		>&2 echo "Waiting for PostgreSQL to become available..."
		sleep 5
	done
	>&2 echo "PostgreSQL is available"

	until redis_ready; do
		>&2 echo "Waiting for Redis to become available..."
		sleep 5
	done
	>&2 echo "Redis is available"
}

django_operations() {
	python3 manage.py collectstatic --noinput
	python3 manage.py migrate
}

cd /app


case $1 in
	"bash")
		bash;;
	"makemigrations")
		python3 manage.py makemigrations;;
	"beat")
		wait_other_containers ;\
		django_operations ;\
		celery \
			--app {{ project_name }}  \
			beat \
			--loglevel INFO \
			--scheduler django_celery_beat.schedulers:DatabaseScheduler
		;;
	"worker")
		wait_other_containers ;\
		django_operations ;\
		celery \
			--app {{ project_name }} \
			worker \
			--loglevel INFO
		;;
	"server")
		wait_other_containers ;\
		django_operations ;\
		if [ "$DJANGO_DEBUG" = "true" ]; then
			gunicorn \
				--reload \
				--bind 0.0.0.0:8000 \
				--workers 2 \
				--worker-class eventlet \
				--log-level DEBUG \
				--access-logfile "-" \
				--error-logfile "-" \
				{{ project_name }}.wsgi
		else
			python manage.py runserver 0.0.0.0:8000
		fi
		;;
	"createsuperuser")
		wait_other_containers ;\
		django_operations ;\
		python manage.py createsuperuser
		;;
	"shell")
		wait_other_containers ;\
		django_operations ;\
		python manage.py shell
		;;
	"test")
		wait_other_containers ;\
		django_operations ;\
		pytest
		;;
	"lint")
		isort --check-only {{ project_name }} tests
		black --check  {{ project_name }} tests
		flake8 {{ project_name }} tests
		mypy {{ project_name }}
		;;
	"*")
		exec "$@"
		;;
esac

