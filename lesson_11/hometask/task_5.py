import csv
from datetime import datetime
from typing import List, Optional


class Transaction:
    def __init__(self, transaction_type: str, amount: float | int, date: str = None):
        self.transaction_type = transaction_type
        self.amount = amount
        self.date = date if date else datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def __repr__(self) -> str:
        return f"Transaction({self.transaction_type}, {self.amount}, {self.date})"


class Account:
    def __init__(self, account_number: str):
        self.account_number = account_number
        self.balance = 0
        self.transactions: List[Transaction] = []

    def process_transaction(self, transaction: Transaction) -> None:
        """
        Current function performs transaction on account.
        :param transaction: transaction to be performed on account.
        :return: None. Just appends the transaction to the list of transactions.
        """
        if transaction.transaction_type == "income":
            self.balance += transaction.amount
        elif transaction.transaction_type == "expense":
            self.balance -= transaction.amount
        self.transactions.append(transaction)

    def get_income(self) -> int | float:
        """
        Current function returns income amount.
        :return: Numeric value of income amount.
        """
        return sum(t.amount for t in self.transactions if t.transaction_type == "income")

    def get_expense(self) -> int | float:
        """
        Current function returns expense amount.
        :return: Numeric value of expense amount.
        """
        return sum(t.amount for t in self.transactions if t.transaction_type == "expense")

    def __repr__(self) -> str:
        return f"Account({self.account_number}), Balance: {self.balance}, Transactions: {len(self.transactions)}"


class Client:
    def __init__(self, name: str, client_id: str):
        self.name = name
        self.client_id = client_id
        self.accounts: List[Account] = []

    def add_account(self, account: Account) -> None:
        """
        Adds a new account.
        :param account: account to be added.
        :return: None. Appends the account to the list of accounts.
        """
        self.accounts.append(account)

    def get_total_balance(self) -> float | int:
        """
        Current function returns total balance.
        :return: Numeric value of total balance.
        """
        return sum(account.balance for account in self.accounts)

    def __repr__(self) -> str:
        return f"Client({self.name}, ID: {self.client_id})"


class Bank:
    def __init__(self, name: str):
        self.name = name
        self.clients: List[Client] = []

    def add_client(self, client: Client) -> None:
        """
        Adds a new client.
        :param client: Client to be added.
        :return: None. Appends the client to the list of clients.
        """
        self.clients.append(client)

    def find_client_by_id(self, client_id: str) -> Optional[Client]:
        """
        Find a client by id.
        :param client_id: Client to be found.
        :return: Client or None if client is not found.
        """
        return next((client for client in self.clients if client.client_id == client_id), None)

    def export_transactions_to_csv(self, client_id: str, filename: str) -> None:
        """
        Exports transactions to csv file.
        :param client_id: Client to be used.
        :param filename: Filename to export transactions to.
        :return:
        """
        client = self.find_client_by_id(client_id)
        if not client:
            print("Client not found!")
            return

        with open(filename, mode='w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(["Account Number", "Type", "Amount", "Date"])
            for account in client.accounts:
                for transaction in account.transactions:
                    writer.writerow([account.account_number, transaction.transaction_type,
                                     transaction.amount, transaction.date])
        print(f"Transactions exported to {filename}")

    def __repr__(self) -> str:
        return f"Bank({self.name})"


if __name__ == "__main__":
    bank = Bank("Best Bank")
    client1 = Client("Alice", "123")
    account1 = Account("ACC001")
    account1.process_transaction(Transaction("income", 1000))
    account1.process_transaction(Transaction("expense", 200))

    client1.add_account(account1)
    bank.add_client(client1)

    print(client1)
    print(client1.get_total_balance())

    bank.export_transactions_to_csv("123", ".\\hometask_files\\transactions.csv")
