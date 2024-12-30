.DEFAULT_GOAL:= help  # because it's is a safe task.

clean:  # Remove all build, test, coverage and Python artifacts.
	rm -rf .venv
	rm -rf *.egg-info
	find . -name "*.pyc" -exec rm -f {} \;
	find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

.PHONY: docs  # because there is a directory called docs.
docs:  # Build the Sphinx documentation from the markdown files and the API documentation.
	rm -rf docs/_api
	.venv/bin/sphinx-apidoc --extensions myst_parser,autodoc2 -o docs/_api src/lieutenant_green
	rm -rf docs/_build
	.venv/bin/sphinx-build -b html docs docs/_build

docs-serve:  # Serve the docs
	python -m http.server --directory docs/_build

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

lint:  # Lint the code with ruff and mypy.
	.venv/bin/ruff check ./src ./tests
	.venv/bin/mypy ./src ./tests
	.venv/bin/sourcery review ./src ./tests

lock:  # Create the lock file and requirements file.
	rm -f requirements.*
	uv pip compile pyproject.toml --python .venv/bin/python --output-file=requirements.txt
	uv pip compile pyproject.toml --python .venv/bin/python --extra=dev --output-file=requirements.dev.txt

report:  # Report the python version and pip list.
	.venv/bin/python --version
	.venv/bin/python -m pip list -v

test:  # Run tests.
	.venv/bin/pytest ./tests --verbose --color=yes
	.venv/bin/pytest --cov=lieutenant_green --cov-fail-under=80

venv:  # Create an empty virtual environment (enough to create the requirements files).
	uv venv .venv

venv-dev:  # Create the development virtual environment.
	$(MAKE) venv
	uv pip install --python .venv/bin/python --requirements requirements.dev.txt
	uv pip install --python .venv/bin/python --editable .

venv-prod:  # Create the production virtual environment.
	$(MAKE) venv
	uv pip install --python .venv/bin/python --requirements requirements.txt
	uv pip install --python .venv/bin/python --editable .
