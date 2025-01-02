# Mount the raw data
mkdir --parents ./data/raw
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY > key1.json
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY | jq -c . > key2.json
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY | tr -d '\r\n' > key3.json
printf %s $LIEUTENANT_GREEN_GCS_READONLY_KEY > key4.json
# gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache 567866 ./data/raw
