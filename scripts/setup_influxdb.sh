#!/bin/bash

# Variables
ORG_NAME="argusdb"
BUCKETS=("NodeExpCPUMetrics" "NodeExpMemoryMetrics" "NodeExpNetworkMetric" "NodeExpDiskStats" "FaultDetailStructure")

# Create Organization if not exists
if influx org list | grep -q "$ORG_NAME"; then
  echo "Organization '$ORG_NAME' already exists."
else
  echo "Creating organization: $ORG_NAME..."
  influx org create --name "$ORG_NAME"
fi

# Create API token
if [ -z "$INFLUX_TOKEN" ]; then
  echo "Creating API token..."
  TOKEN=$(influx auth create --org "$ORG_NAME" --write-buckets --read-buckets --json | jq -r '.token')
  echo "Generated token: $TOKEN"
  influx config set --config-name default --token "$TOKEN" --org "$ORG_NAME" --host-url http://localhost:8086 --active
else
  echo "Using existing token."
fi

# Create Buckets
for BUCKET in "${BUCKETS[@]}"; do
  if influx bucket list | grep -q "$BUCKET"; then
    echo "Bucket '$BUCKET' already exists."
  else
    echo "Creating bucket: $BUCKET..."
    influx bucket create --name "$BUCKET" --org "$ORG_NAME" --retention 0
  fi
done

echo "Setup completed successfully."
