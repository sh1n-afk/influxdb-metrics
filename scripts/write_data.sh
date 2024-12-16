#!/bin/bash

# Variables
ORG_NAME="argusdb"
DATA_DIR="data"

# Write data for each .lp file in the data directory
for FILE in "$DATA_DIR"/*.lp; do
  BUCKET=$(basename "$FILE" .lp)
  echo "Writing data to bucket: $BUCKET..."
  influx write --bucket "$BUCKET" --org "$ORG_NAME" --precision ns -f "$FILE" || echo "Error writing to bucket: $BUCKET"
done

echo "Data written successfully to all buckets."
