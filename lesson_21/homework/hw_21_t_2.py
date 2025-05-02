from typing import List, Generator, Dict
from random import choice
import psycopg2
from psycopg2 import extras


def get_connection() -> psycopg2.connect:
    """
    Current function establishes database connection
    :return: connection object.
    """
    return psycopg2.connect(
        host='localhost',
        database='demo',
        port='5432',
        user='postgres',
        password='postgres'
    )


def update_flights_status(updates: List[Dict[str, object]]) -> None:
    """
    Batch update of flight statuses.
    :param updates: List of dicts with 'flight_id' and 'new_status'.
    :return: None
    """
    query = """
        UPDATE bookings.flights
        SET status = %s
        WHERE flight_id = %s
    """

    data = [(item['new_status'], item['flight_id']) for item in updates]

    with get_connection() as connection:
        with connection.cursor() as cursor:
            try:
                extras.execute_batch(cursor, query, data)
                connection.commit()

                print(f"{cursor.rowcount} flight status(es) updated.")
            except psycopg2.ProgrammingError:
                print('Pay attention to syntax or missing table or incorrect number of attributes')
            except IndexError:
                print('Incorrect number of records to be updated.')
            except psycopg2.DataError:
                print('Incorrect size to be updated')
            except psycopg2.OperationalError:
                print('Connection error')
            finally:
                return None


if __name__ == '__main__':
    updates = [
        {"flight_id": 123, "new_status": "Cancelled"},
        {"flight_id": 456, "new_status": "Delayed"}
    ]
    update_flights_status(updates)
