# Mount the raw data
whoami
mkdir --parents ./data/raw
echo "$LIEUTENANT_GREEN_GCS_READONLY_KEY" | jq '.' > /tmp/key.json
gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache 567866 ./data/raw
