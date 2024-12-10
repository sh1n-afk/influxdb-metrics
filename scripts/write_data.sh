#!/bin/bash

# Write data for NodeExpCPUMetrics
influx write --bucket NodeExpCPUMetrics --org argusdb --precision ns -f ../data/NodeExpCPUMetrics.lp

# Write data for NodeExpMemoryMetrics
influx write --bucket NodeExpMemoryMetrics --org argusdb --precision ns -f ../data/NodeExpMemoryMetrics.lp

# Write data for NodeExpNetworkMetric
influx write --bucket NodeExpNetworkMetric --org argusdb --precision ns -f ../data/NodeExpNetworkMetric.lp

# Write data for NodeExpDiskStats
influx write --bucket NodeExpDiskStats --org argusdb --precision ns -f ../data/NodeExpDiskStats.lp

# Write data for FaultDetailStructure
influx write --bucket FaultDetailStructure --org argusdb --precision ns -f ../data/FaultDetailStructure.lp

echo "Data written successfully to all buckets."
