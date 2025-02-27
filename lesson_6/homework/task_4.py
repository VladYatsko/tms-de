def check_access(is_subscribed: bool, age: int, is_admin: bool, is_blocked: bool) -> bool:
    """
    Current function validates access in accordance with 4 specified params.
    User should be older than 18 and should be subscribed.
    User can be an admin.
    User can be blocked even if he is an admin.
    :param is_subscribed: bool value which shows if user is subscribed.
    :param age: shows the age of user.
    :param is_admin: bool value which shows if user is admin.
    :param is_blocked: bool value which shows if user is blocked.
    :return: True if user has access, else False.
    """
    if ((is_subscribed is True and age > 18) or is_admin is True) and is_blocked is not True:
        return True
    else:
        return False


if __name__ == '__main__':
    print(check_access(True, 19, False, False))
    print(check_access(False, 18, False, False))
    print(check_access(True, 19, True, True))
