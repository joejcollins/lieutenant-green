# Create the virtual environment.
make venv-dev
.venv/bin/pre-commit install

# Mount the raw data
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY > /tmp/key.json
mkdir ./data/raw
gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache 567866 ./data/raw
