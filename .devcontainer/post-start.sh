# Mount the raw data
mkdir --parents ./data/raw
printf "%s" $LIEUTENANT_GREEN_GCS_READONLY_KEY > /tmp/key.json
gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache 567866 ./data/raw
