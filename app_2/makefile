include ../makefile

compile:  # Compile the requirements files using pip-tools.
	rm -f requirements.*
	.venv/bin/python -m piptools compile --output-file=requirements.txt
	echo "# Add this package and the independent support package" >> requirements.txt
	echo "--editable ." >> requirements.txt
	echo "--editable ../package_b" >> requirements.txt

run:  # Run app2.
	.venv/bin/python main_2.py
