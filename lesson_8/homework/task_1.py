import sys
from typing import List


def split_even_and_odds(lst: List[int]) -> tuple:
    """
    Current function splits the even and odd numbers.
    :param lst: List of numbers.
    :return: Tuples of even and odd numbers.
    """
    return tuple(item for item in lst if item % 2 == 0), tuple(item for item in lst if item % 2 != 0)


print(split_even_and_odds(list([int(item) for item in sys.argv[1].split(',')])))
