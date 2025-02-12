def calculate_rest_division(num: int) -> int:
    """
    Current function finds the rest of the number after division
    :param num: any integer
    :return: rest of the division on 3
    """
    return num % 3


def calculate_several_operations() -> float:
    """
    Current calculates expression with several operations
    :return: float number as a result of operation
    """
    return (15 - 3) * (2 + 4) / 6


def calculate_decimal() -> float:
    """
    Current function calculates the decimal number
    :return: float number with decimal part
    """
    return round(22 / 7, 1)


if __name__ == '__main__':
    print(calculate_rest_division(17))
    print(calculate_several_operations())
    print(calculate_decimal())
