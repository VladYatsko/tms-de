def calculate_sum_and_multiplication() -> tuple | None:
    """
    Current function calculates the sum and multiplication of user specified number.
    :return: sum and multiplication of user specified number.
    """
    try:
        input_number = int(input("Enter a 3 digit number: "))
        first_digit = input_number // 100
        third_digit = input_number % 10
        second_digit = (input_number % 100 - third_digit) // 10

        return (first_digit + second_digit + third_digit), (first_digit * second_digit * third_digit)
    except ValueError:

        return None


if __name__ == "__main__":
    print(calculate_sum_and_multiplication())
