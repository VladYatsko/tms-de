import os
import shutil
import config
import pandas as pd


def get_statistics(path_to_files: str) -> None:
    """
    Current function creates statistics on each received file.
    :param path_to_files: Path to the raw data files.
    :return: None. Just creates statistics on each received file.
    """

    files = [f.name for f in os.scandir(path_to_files) if f.is_file()]

    for file in files:
        df = pd.read_csv(os.path.join(path_to_files, file))
        stats_df = df.describe(include='all')

        for key in config.STATS_ANALYTICAL_PATHS.keys():

            if key in file.lower():
                stats_df.to_csv(config.STATS_ANALYTICAL_PATHS[key], index=True)

    return None


def move_processed_files(path_to_files: str) -> None:
    """
    Current function moves processed files to processed location.
    :param path_to_files: path to the raw data files.
    :return: None. Just moves processed files to processed location.
    """
    source_folder = path_to_files
    destination_folder = path_to_files + 'processed\\'

    for file in os.listdir(source_folder):
        source_file = os.path.join(source_folder, file)
        destination_file = os.path.join(destination_folder, file)

        if os.path.isfile(source_file):
            shutil.move(source_file, destination_file)

    return None


if __name__ == '__main__':
    get_statistics('.\\data\\raw\\analytical\\')
    move_processed_files('.\\data\\raw\\analytical\\')
