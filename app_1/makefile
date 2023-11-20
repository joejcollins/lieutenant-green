include ../makefile

compile:  # Compile the requirements files using pip-tools.
	rm -f requirements.*
	.venv/bin/python -m piptools compile --output-file=requirements.txt
	echo "# Add this package and the root package" >> requirements.txt
	echo "--editable ." >> requirements.txt
	echo "--editable .." >> requirements.txt

run:  # Run app_1.
	.venv/bin/python main_1.py

