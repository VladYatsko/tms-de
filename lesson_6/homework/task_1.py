import math


def calculate_discriminant(a: float | int, b: float | int, c: float | int) -> float:
    """
    Current function calculates the discriminant.
    :param a: float or int value for the first variable.
    :param b: float or int value for the second variable.
    :param c: float or int value for the third variable.
    :return: discriminant value
    """
    return math.pow(b, 2) - 4 * a * c


def calculate_square_root(a: float | int, b: float | int, disc: float | int) -> tuple:
    """
    Current function calculates the square roots.
    :param a: float or int value for the first variable.
    :param b: float or int value for the second variable.
    :param disc: discriminant value
    :return: square roots.
    """
    root_one = ((-b) + math.sqrt(disc)) / (2 * a)
    root_two = ((-b) - math.sqrt(disc)) / (2 * a)
    return round(root_one, 2), round(root_two, 2)


def calculate_zero_root(a: float | int, b: float | int) -> float:
    """
    Current function calculates the zero root.
    :param a: float or int value for the first variable.
    :param b: float or int value for the second variable.
    :return: zero root.
    """
    return (-b) / (2 * a)


if __name__ == '__main__':
    discriminant = calculate_discriminant(1, 5, 1)
    if discriminant > 0:
        print(calculate_square_root(1, 5, discriminant))
    elif discriminant == 0:
        print(calculate_zero_root(1, 5))
    else:
        print('Discriminant is negative. No roots are available')
