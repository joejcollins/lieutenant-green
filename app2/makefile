.DEFAULT_GOAL:= help  # because it's is a safe task.

clean:  # Remove all build, test, coverage and Python artifacts.
	rm -rf .venv
	rm -rf *.egg-info
	find . -name "*.pyc" -exec rm -f {} \;
	find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

compile:  # Compile the requirements files using pip-tools.
	rm -f requirements.*
	.venv/bin/python -m piptools compile --output-file=requirements.txt
	echo "--editable ." >> requirements.txt
	echo "--editable ../package" >> requirements.txt

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

report:  # Report the python version and pip list.
	.venv/bin/python --version
	.venv/bin/python -m pip list -v

requirements:  # Install the requirements.
	$(MAKE) clean
	-pyenv update
	-pyenv install --skip-existing
	python -m venv .venv
	.venv/bin/python -m pip install --default-timeout=120 --requirement requirements.txt

run:  # Run app2.
	.venv/bin/python main2.py
