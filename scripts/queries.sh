#!/bin/bash

# Query for NodeExpCPUMetrics
echo "Querying NodeExpCPUMetrics..."
influx query '
from(bucket:"NodeExpCPUMetrics") 
  |> range(start: 1970-01-01T00:00:00Z) 
  |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
  |> group()
  |> keep(columns: ["_time", "cpu_total", "cpu_usage", "cpu_idle"])
'

# Query for NodeExpMemoryMetrics
echo "Querying NodeExpMemoryMetrics..."
influx query '
from(bucket:"NodeExpMemoryMetrics") 
  |> range(start: 1970-01-01T00:00:00Z) 
  |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
  |> group()
  |> keep(columns: ["_time", "memory_total", "memory_usage", "memory_available", "memory_total_bytes", "memory_used_bytes", "memory_available_bytes", "memory_buffered_bytes", "memory_cached_bytes", "memory_swap_total_bytes", "memory_swap_free_bytes"])
'

# Query for NodeExpNetworkMetric
echo "Querying NodeExpNetworkMetric..."
influx query '
from(bucket:"NodeExpNetworkMetric") 
  |> range(start: 1970-01-01T00:00:00Z) 
  |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
  |> group()
  |> keep(columns: ["_time", "network_name", "network_flag", "network_flag_int", "network_mtu", "network_rx_bytes", "network_rx_packet", "network_rx_error", "network_rx_dropped", "network_rx_compressed", "network_rx_fifo", "network_rx_frame", "network_rx_multicast", "network_tx_bytes", "network_tx_packet", "network_tx_error", "network_tx_dropped", "network_tx_compressed", "network_tx_fifo", "network_tx_collision", "network_tx_carrier"])
'

# Query for NodeExpDiskStats
echo "Querying NodeExpDiskStats..."
influx query '
from(bucket:"NodeExpDiskStats") 
  |> range(start: 1970-01-01T00:00:00Z) 
  |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
  |> group()
  |> keep(columns: ["_time", "device", "read_bytes", "write_bytes", "in_progress"])
'

# Query for FaultDetailStructure
echo "Querying FaultDetailStructure..."
influx query '
from(bucket:"FaultDetailStructure") 
  |> range(start: 1970-01-01T00:00:00Z) 
  |> pivot(rowKey:["_time"], columnKey:["_field"], valueColumn:"_value")
  |> group()
  |> keep(columns: ["_time", "device", "severity", "description", "timestamp"])
'
