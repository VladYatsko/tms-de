def normalize_accounts() -> dict:
    """
    Current function normalizes accounts from flat file into dict structure.
    :return: Structured accounts as dictionary.
    """
    with open('.\\files\\accounts.txt', 'r', encoding='utf-8') as accounts_file:
        accounts = accounts_file.readlines()
        accounts_list = []

        for account in accounts:
            accounts_list.append(account.strip().split(':'))

        accounts_dict = {}

        for i in range(len(accounts_list)):
            accounts_dict[accounts_list[i][0]] = int(accounts_list[i][1])

        return accounts_dict


def normalize_transactions() -> list:
    """
    Current function normalizes transactions from flat file into list structure.
    :return: normalized transactions as list.
    """
    with open('.\\files\\transactions.txt', 'r', encoding='utf-8') as transactions_file:
        transactions = transactions_file.readlines()
        transactions_list = []

        for transaction in transactions:
            transactions_list.append(transaction.strip().split(':'))

        return transactions_list


def write_accounts(accounts_dict: dict, transactions_list: list) -> None:
    """
    Current function writes accounts into flat file.
    :param accounts_dict: Dictionary of accounts.
    :param transactions_list: List of transactions.
    :return: None. Writes transactional changes into file.
    """
    with open('.\\files\\accounts.txt', 'w', encoding='utf-8') as accounts_file:
        for key in accounts_dict.keys():
            for i in range(len(transactions_list)):
                if key == transactions_list[i][0]:
                    accounts_dict[key] += int(transactions_list[i][1])

        for key, value in accounts_dict.items():
            accounts_file.write(f'{key}:{value}\n')

        return None


if __name__ == '__main__':
    final_accounts_dict = normalize_accounts()
    final_transactions_list = normalize_transactions()
    write_accounts(final_accounts_dict, final_transactions_list)
