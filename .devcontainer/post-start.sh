# Mount the raw data
mkdir --parents ./data/raw
# Pipe the key via sed because when CodeSpaces runs this script the encoding gets messed
# up. This isn't necessary in the terminal once the CodeSpace has started but I don't
# know why.  Something to do with encoding that is beyond me.
echo $LIEUTENANT_GREEN_GCS_READONLY_KEY | sed ':a;N;$!ba;s/\n/\\n/g' > /tmp/key.json
gcsfuse --key-file=/tmp/key.json --implicit-dirs --o ro --cache-dir .cache lieutenant-green-zzz ./data/raw
