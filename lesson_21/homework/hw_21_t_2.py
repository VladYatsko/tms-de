from typing import List, Generator
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


def get_statuses() -> List[str]:
    """
    Current function collects the list of statuses.
    :return: list of statuses.
    """
    connection = get_connection()
    cursor = connection.cursor()

    query = """
        select distinct status
        from bookings.flights;
    """

    cursor.execute(query)

    list_of_statuses = [str(status[0]) for status in cursor.fetchall()]

    cursor.close()
    connection.close()

    return list_of_statuses


def get_size() -> int:
    connection = get_connection()
    cursor = connection.cursor()

    query = """
            select count(*)
            from bookings.flights;
        """

    cursor.execute(query)
    result = cursor.fetchone()

    cursor.close()
    connection.close()

    return result[0]


def status_generator(statuses: List[str], size: int) -> Generator:
    for flight_id in range(1, size + 1):
        yield choice(statuses), flight_id


def update_statuses() -> None:
    """
    Current function updates the statuses in the table.
    :return:
    """
    with get_connection() as connection:
        with connection.cursor() as cursor:
            query = """
                UPDATE bookings.flights
                SET status = %s
                WHERE flight_id = %s
            """

            try:
                extras.execute_batch(cursor, query, status_generator(get_statuses(), get_size()))

                connection.commit()

                print(f'Update process is completed for {get_size()} records.')
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
    update_statuses()
