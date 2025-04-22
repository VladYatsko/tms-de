import psycopg2


def get_connection() -> psycopg2.connect:
    return psycopg2.connect(
        host='localhost',
        database='demo',
        port='5432',
        user='postgres',
        password='postgres'
    )


def insert_data(ticket_no: str, book_ref: str | None, passenger_id: str, passenger_name: str) -> None:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
        INSERT INTO bookings.tickets (ticket_no, book_ref, passenger_id, passenger_name)
        VALUES(%s, %s, %s, %s);
    """

    cursor.execute(query, (ticket_no, book_ref, passenger_id, passenger_name))
    connection.commit()

    connection.close()

    print('Data is inserted')

    return None


if __name__ == '__main__':
    insert_data('1234567890123', 'ABCDEF', 'PASS1', 'Иванов Иван')
    insert_data('1234567890124', 'ABCDEF', 'PASS2', 'Петров Петр')
