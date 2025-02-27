def is_granted(is_correct_login: bool, is_correct_password: bool, has_token: bool) -> bool:
    """
    Current function validates access to the system in accordance with user specified input.
    User should have correct combination of login and password or should have token.
    :param is_correct_login: bool value to check if login is correct.
    :param is_correct_password: bool value to check if password is correct.
    :param has_token: bool value to check if user has token.
    :return: access status.
    """
    if (is_correct_login and is_correct_password) or has_token:
        return True
    else:
        return False


if __name__ == '__main__':
    print(is_granted(True, True, False))
    print(is_granted(False, True, False))
    print(is_granted(False, False, True))
