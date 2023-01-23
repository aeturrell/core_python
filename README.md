# core_python

This repository has all Python versions of exercises from the CORE Econ textbook "Doing Economics". Find the originals here: https://www.core-econ.org/doing-economics/index.html.

This was a passion project to bring the joy of doing analysis with Python to the next generation of economists.

## What's in the tin

There is a notebook for each chapter of the CORE Econ "Doing Economics" textbook except for "Getting Started in Python", which appears once as a notebook but is used at the start of every chapter in the textbook.

The other files support the creation of the markdown files: poetry.lock and pyproject.toml for the Python environment, a plotting style file, some pre-commit hooks, and a make file.

## Converting notebooks to markdown

To convert all of the notebooks to markdown, you'll need the Python environment installed. The Python environment is tracked by [poetry](https://python-poetry.org/). Use `poetry install` to install the Python environment.

The easiest way to convert all of the notebooks is using make and the provided make file. To build all markdown documents from notebooks, use `make`. To clean the `outputs/` folder, it's `make clean`. The makefile also includes a run with a markdown formatter that applies to all markdown files.

Sometimes it's useful to convert a single notebook to check the output markdown is okay. An example of the command to convert a notebook to markdown is:

```python
poetry run jupyter nbconvert empirical_project_1.ipynb --to markdown --output empirical_project_1.md
```

## Modifying the notebooks

Pre-commit is enabled for this project, with hooks for:

- black-nb and black
- nbstripout
- flake8
- the various ones at [pre-commit hooks](https://github.com/pre-commit/pre-commit-hooks)

Run

```text
poetry run pre-commit run --all-files
```

before making a commit.
