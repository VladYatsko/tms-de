class NegativeNumberError(Exception):
    pass


def is_positive() -> str | bool:
    """
    Current function validates
    :return:
    """
    try:
        specified_number = int(input("Enter a number: "))
        if specified_number < 0:
            raise NegativeNumberError
        else:
            return True
    except ValueError:
        return 'Please enter a number'
    except NegativeNumberError:
        return 'Please enter a positive number'


if __name__ == '__main__':
    print(is_positive())
