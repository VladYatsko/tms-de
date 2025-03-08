from typing import List


def find_first_same_entry(first_num_array: List[int], second_num_array: List[int]) -> str | None:
    """
    Current functions finds the first same entry in same position between 2 arrays of the same length.
    :param first_num_array: the first array
    :param second_num_array: the second array
    :return: first same entry in same position or None.
    """
    for i in range(len(first_num_array)):
        if first_num_array[i] == second_num_array[i]:
            return f'First same number is {first_num_array[i]}'

    return None


print(find_first_same_entry([1, 2, 3, 4, 5], [2, 3, 4, 5, 6]))
print(find_first_same_entry([1, 2, 3, 4, 5], [2, 3, 4, 6, 5]))
