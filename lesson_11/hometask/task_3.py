from typing import List


def calculate_average(numbers: List[int]) -> float | str:
    """
    Calculates the average of a list of numbers.
    :param numbers: List of numbers.
    :return: average of the numbers.
    """
    try:
        return sum(numbers) / len(numbers)
    except ZeroDivisionError:
        return 'List is empty'
    except TypeError:
        return 'Type Error'


if __name__ == '__main__':
    print(calculate_average([1, 2, 3, 4, 5]))
    print(calculate_average([]))
    print(calculate_average([1, 2, '3']))
