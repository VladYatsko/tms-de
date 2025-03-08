import random
from typing import List


def find_min_value(num_list: List[int]) -> str:
    """
    Current function finds minimal value in a list.
    :param num_list: list of numbers
    :return: minimal value in a list
    """
    min_value = num_list[0]

    for num in num_list:
        if num < min_value:
            min_value = num

    return f'Min value: {min_value}'


print(find_min_value([random.randint(1, 150) for _ in range(0, 30)]))
