# File ingestion project.

## Description
Current project performs file ingestion from [CoinGecko](https://docs.coingecko.com/reference/introduction) API and stores analytical and transactional data to collect basic measurements from received data.

## Installation
To install the project please execute:
```git
git clone https://github.com/VladYatsko/tms-de.git
```

## Use case
To execute the queries you need to create your API key. Please refer to the [documentation](https://docs.coingecko.com/v3.0.1/reference/setting-up-your-api-key).
*Please note* that file paths are provided in config file which is excluded by [.gitignore](./.gitignore).

To execute the code under Windows OS please use [script_runner.bat](./script_runner.bat) file.

To execute the code under Linux/MacOS please use [script_runner.sh](./script_runner.sh) file.

For Linux/MacOS you need to execute the script below first:
```bash
chmod +x ./script_runner.sh
```

This script allows to ingest and collect data once in a day.