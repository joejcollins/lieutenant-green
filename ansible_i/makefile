include ../makefile

compile:  # Compile the requirements files using pip-tools.
	rm -f requirements.*
	.venv/bin/python -m piptools compile --output-file=requirements.txt
	echo "# Add this package" >> requirements.txt
	echo "--editable ." >> requirements.txt
