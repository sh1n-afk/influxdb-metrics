# InfluxDB Metrics Management

This files automates the process of writing and querying metrics in InfluxDB.

## Directory Structure
- `data/`: Contains `.lp` files with sample metric data.
- `scripts/`: Contains scripts to write data to InfluxDB and run queries.
- `README.md`: Documentation for the project.

## Usage

## Prerequisites
1. Install [InfluxDB CLI](https://docs.influxdata.com/influxdb/latest/tools/influx-cli/) and ensure it's accessible in your `PATH`. - [brew install influxdb-cli
]
2. Ensure InfluxDB is running locally or accessible remotely.

## Setup

1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd influxdb-metrics-main

2. Run the setup script to create the organization, buckets, and configure the CLI:
    bash scripts/setup_influxdb.sh

3. Write sample data to the buckets:
    bash scripts/write_data.sh

4. Query the data to verify:
    bash scripts/queries.sh


##Scripts

setup_influxdb.sh
    Automates the creation of:
        Organization (argusdb).
        API token (with write and read permissions).
        Buckets.

write_data.sh
    Writes predefined sample data from data/ directory into the respective buckets.

queries.sh
    Queries data from all buckets and displays it in a tabular format.

##Troubleshooting
    CLI Not Configured for argusdb
        Run the following to ensure your CLI is correctly configured:
            influx config set --config-name default --org argusdb --active
