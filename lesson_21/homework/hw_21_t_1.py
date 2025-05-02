import csv
import psycopg2


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


def write_the_route(departure_city: str = 'Москва',
                    arrival_city: str = 'Санкт-Петербург',
                    path_to_file: str = '.\\route.csv') -> None:
    """
    Current function writes the route data to the csv file
    :param departure_city: City of departure to be searched for
    :param arrival_city: City of arrival to be searched for
    :param path_to_file: File to be saved
    :return: Nothing. Just writes the route data to the csv file
    """
    with get_connection() as connection, connection.cursor() as cursor:
        query = """
            SELECT
                f.flight_no,
                f.actual_departure,
                f.actual_arrival,
                ac.model,
                ROUND(AVG(tf.amount), 2) AS average_amount
            FROM
                bookings.flights f
            JOIN bookings.airports a1 ON f.departure_airport = a1.airport_code
            JOIN bookings.airports a2 ON f.arrival_airport = a2.airport_code
            JOIN bookings.aircrafts ac ON f.aircraft_code = ac.aircraft_code
            JOIN bookings.ticket_flights tf ON f.flight_id = tf.flight_id
            WHERE
                a1.city = %s AND a2.city = %s
            GROUP BY
                f.flight_no,
                f.actual_departure,
                f.actual_arrival,
                ac.model;
        """

        cursor.execute(query, (departure_city, arrival_city))
        rows = cursor.fetchall()

        headers = [desc[0] for desc in cursor.description]

        with open(path_to_file, mode='w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerow(headers)
            writer.writerows(rows)

        return None


if __name__ == '__main__':
    write_the_route()
