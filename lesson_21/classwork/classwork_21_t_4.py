from classwork_21_t_3 import get_connection


def increase_ticket_amount(fare_conditions: str, amount: int, percent: float):
    connection = get_connection()
    cursor = connection.cursor()

    query = """
                    UPDATE bookings.ticket_flights
                    SET amount = %s * %s + %s
                    WHERE fare_conditions = %s;
            """

    cursor.execute(query, (amount, percent, amount, fare_conditions))
    connection.commit()

    connection.close()

    return None


if __name__ == '__main__':
    increase_ticket_amount('Business', 500, 0.2)
