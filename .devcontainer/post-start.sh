# Mount the raw data
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY > /tmp/key.json
mkdir --parents ./data/raw
gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache 567866 ./data/raw
