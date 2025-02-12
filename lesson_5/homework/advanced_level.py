def count_complex_expression() -> float:
    """
    Current function calculates the result of a complex expression.
    :return: Float number as a result of the expression.
    """
    return (10 + 20) / 5 + 3 * (8 - 2)


def count_bracket_expression() -> float:
    """
    Current function calculates the result of a bracket expression.
    :return: Float number as a result of the expression.
    """
    return 100 - (30 / (2 + 3)) * 4 + 10


if __name__ == '__main__':
    print(count_complex_expression())
    print(count_bracket_expression())
