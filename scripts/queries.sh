#!/bin/bash

BUCKETS=("NodeExpCPUMetrics" "NodeExpMemoryMetrics" "NodeExpNetworkMetric" "NodeExpDiskStats" "FaultDetailStructure")

for BUCKET in "${BUCKETS[@]}"; do
  echo "Querying bucket: $BUCKET..."
  influx query '
  from(bucket:"'"$BUCKET"'") 
    |> range(start: 1970-01-01T00:00:00Z)
    |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
    |> group()
  ' || echo "Error querying bucket: $BUCKET"
done
