def perform_division() -> float | str:
    """
    Current function provides division by entered number with error handling
    :return: Result of division by entered number or message
    """
    try:
        user_input = int(input("Enter a number: "))
        return 100 / user_input
    except ZeroDivisionError:
        return "You can't divide by zero."
    except ValueError:
        return "Please enter a number."


if __name__ == "__main__":
    print(perform_division())
