# Django 4 project setup

This project is under heavy development.

This project when finished will provide a single repo for a django 4 project for my future projects.

## Prerequisites

- Python v3.10 or higher ([installation](https://wiki.python.org/moin/BeginnersGuide/Download)).
- Python pip package manager ([installation](https://pip.pypa.io/en/stable/installation/)).
- Python virtual environments ([doc](https://docs.python.org/3/tutorial/venv.html), [guide](https://realpython.com/python-virtual-environments-a-primer/)).
- Docker ([installation](https://docs.docker.com/engine/install/)).
- Git ([installation](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)).

### Optional

- Make ([doc](https://www.gnu.org/software/make/manual/make.html)).

```{todo}Title
Body Comeback
```

## How to install and run the project

Fork this project in GitHub to your own account. Clone repository to your local, navigate to `MeetupSelector` directory and execute the following commands:

```
git clone https://github.com/pythonalicante/MeetupSelector.git
cd MeetupSelector
cp example.env .env  # Edit this file as you want
make setup  # To create the virtualenv and install project dependencies
make build  # To create Docker images
make run  # To run the project
make createsuperuser  # To create an administrator user in the application
```

## Organization

This project manages the Issues and Tasks in [Taiga](https://tree.taiga.io/project/aalmiramolla-meetupselector/kanban). Feel free to open an Issue in GitHub, it's synchronised with Taiga. If you want to collaborate, read the next section.

## How to contribute?

Read [CONTRIBUTING.md](https://github.com/pythonalicante/Meetup-Selector/blob/main/CONTRIBUTING.md).

## Roadmap

To view the project roadmap, read the [roadmap section on documentation](https://pythonalicante.github.io/MeetupSelector/roadmap/).


## Contributors

<a href="https://github.com/pythonalicante/meetupselector/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=pythonalicante/meetupselector" />
</a>

Made with [contributors-img](https://contributors-img.web.app).

## License

This software is released under the [GPLv3 license](LICENSE).

## Contact

- [Discord](https://discord.com/invite/aDdTHZSggd).
- [Telegram](https://t.me/python_alc).
- [Twitter](https://twitter.com/python_alc) #PythonALC.
