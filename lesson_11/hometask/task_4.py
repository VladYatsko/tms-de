from typing import List


def create_file(path_to_file: str) -> None | str:
    """
    This function creates a new file to record.
    :param path_to_file: path to file to be stored
    :return: None. Just creates a new file.
    """
    try:
        open(path_to_file, 'x', encoding='utf-8').close()
    except FileExistsError:
        return 'File already exists.'


def collect_evens(path_to_file: str) -> List[int] | str:
    """
    This function collects even numbers from a file.
    :param path_to_file: path to file to be checked
    :return: list of even numbers.
    """
    try:
        with open(path_to_file, 'r', encoding='utf-8') as file:
            content = file.readlines()

            if not content:
                return 'Empty file'

            try:
                values = list(map(int, content[0].split(',')))
            except ValueError:
                return 'Invalid numbers'

            return [num for num in values if num % 2 == 0]

    except FileNotFoundError:
        return 'No such file or directory'


def collect_odds(path_to_file: str) -> List[int] | str:
    """
    This function collects odd numbers from a file.
    :param path_to_file: path to file to be checked.
    :return: List of odd numbers.
    """
    try:
        with open(path_to_file, 'r', encoding='utf-8') as file:
            content = file.readlines()

            if not content:
                return []

            try:
                values = list(map(int, content[0].split(',')))
            except ValueError:
                return 'Invalid numbers'

            return [num for num in values if num % 2 != 0]

    except FileNotFoundError:
        return 'No such file or directory'


def write_file(path_to_file: str, content: list[int]) -> None | str:
    """
    This function writes content to a file.
    :param path_to_file: path to file to be written
    :param content: List of odd or even numbers.
    :return: None. Just writes a new file.
    """
    with open(path_to_file, 'a', encoding='utf-8') as file:

        if not content:
            return 'Empty file'

        for num in content:
            file.write(f'{num}, ')

        return None


if __name__ == '__main__':
    create_file('.\\hometask_files\\even_numbers.txt')
    create_file('.\\hometask_files\\odd_numbers.txt')
    evens = collect_evens('.\\hometask_files\\numbers.txt')
    odds = collect_odds('.\\hometask_files\\numbers.txt')
    write_file('.\\hometask_files\\even_numbers.txt', evens)
    write_file('.\\hometask_files\\odd_numbers.txt', odds)
