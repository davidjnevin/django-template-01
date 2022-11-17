# Django 4 project template

This project is under heavy development.

This project provides a single repo for a django 4 project for my future projects and is inspired by the [python/alicante meetupselector repositoriy.](https://github.com/pythonalicante/MeetupSelector)

## Prerequisites

- Python v3.10 or higher ([installation](https://wiki.python.org/moin/BeginnersGuide/Download)).
- Python pip package manager ([installation](https://pip.pypa.io/en/stable/installation/)).
- Python virtual environments ([doc](https://docs.python.org/3/tutorial/venv.html), [guide](https://realpython.com/python-virtual-environments-a-primer/)).
- Docker ([installation](https://docs.docker.com/engine/install/)).
- Git ([installation](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)).

### Optional

- Make ([doc](https://www.gnu.org/software/make/manual/make.html)).

## How to install and run the project

Fork this project in GitHub to your own account. Clone repository to your local, navigate to `django-template-01` directory and run the following commands:

```
git clone https://github.com/davidjnevin/django-template-01
cd django-template-01
```
Generate a SECRET_KEY

```
python -c 'from django.core.management.utils import get_random_secret_key; \
            print(get_random_secret_key())'
```
Edit the example.env as needed.

```
cp example.env .env
```

To use this template run

```
django-admin startproject --template /path/to/this/template <your_new_project_name>
```

Do a find and replace of `{{ project_name }}` in your project folder.

Replace `{{ project_name }}` with <your_new_project_name>

To run the project:

```
make build  # To create Docker images
make run  # To run the project
make createsuperuser  # To create an administrator user in the application
```

## Contributors

<a href="https://github.com/davidjnevin/django-template-01/graphs/contributors">
  <img
  src="https://contributors-img.web.app/image?repo=davidjnevin/django-template-01" />
</a>

Made with [contributors-img](https://contributors-img.web.app).

## License

This software is released under the [GPLv3 license](LICENSE).

## Contact

- [Twitter](https://twitter.com/davidjnevin) @davidjnevin.
