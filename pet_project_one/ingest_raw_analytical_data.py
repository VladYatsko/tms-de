import json
import config
import requests
import pandas as pd
from typing import Dict


def get_raw_data() -> Dict[str, pd.DataFrame]:
    """
    Current function collects data from API and stores it into dict in form of DataFrames.
    :return: Dictionary of DataFrames.
    """
    collected_data = {}

    try:
        for endpoint in config.ENDPOINTS_ANALYTICAL:
            collected_data[endpoint] = pd.DataFrame(requests.get(f'{config.URL}{endpoint}?{config.API_KEY}',
                                                                 timeout=config.TIMEOUT).json())
    except json.decoder.JSONDecodeError:
        print('Incorrect JSON format')
    except requests.exceptions.ConnectionError:
        print('Connection error')
    except requests.exceptions.Timeout:
        print('Timeout error')

    return collected_data


def process_data(raw_data) -> Dict[str, pd.DataFrame]:
    """
    Current function adds created_at column to keep timestamp for added data.
    :param raw_data: Dictionary of DataFrames.
    :return: Updated dictionary of DataFrames with created_at column.
    """
    try:
        for endpoint in config.ENDPOINTS_ANALYTICAL:
            raw_data[endpoint]['created_at'] = pd.Timestamp.now().strftime('%Y%m%d_%H%M%S')

    except Exception as e:
        print(f'Error: {e}')

    return raw_data


def write_raw_analytical_data(updated_data: Dict[str, pd.DataFrame]) -> None:
    try:
        for endpoint in config.ENDPOINTS_ANALYTICAL:
            updated_data[endpoint].to_csv(f'{config.RAW_ANALYTICAL_DATA_PATHS[endpoint]}',
                                          index=False, encoding='utf-8')

    except PermissionError:
        print('File is used. Please close the file and try again.')

    except MemoryError:
        print('Memory Error. File is too big.')

    return None


if __name__ == '__main__':
    raw_dataset = get_raw_data()
    processed_data = process_data(raw_dataset)
    write_raw_analytical_data(processed_data)
