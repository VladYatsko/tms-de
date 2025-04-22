import psycopg2
import pandas as pd


def get_connection() -> psycopg2.connect:
    return psycopg2.connect(
        host='localhost',
        database='demo',
        port='5432',
        user='postgres',
        password='postgres'
    )


def add_aircraft(aircraft_code: str, model: str, range_km: int) -> None:
    connection = get_connection()
    cursor = connection.cursor()

    query = """INSERT INTO bookings.aircrafts (aircraft_code, model, range)
                VALUES(%s, %s, %s);
            """

    cursor.execute(query, (aircraft_code, model, range_km))
    connection.commit()

    cursor.close()
    connection.close()

    return None


def update_range(aircraft_code: str, range_km: int) -> None:
    connection = get_connection()
    cursor = connection.cursor()

    query = """UPDATE bookings.aircrafts
                SET range = %s
                WHERE aircraft_code = %s;
            """

    cursor.execute(query, (range_km, aircraft_code))

    connection.commit()

    cursor.close()
    connection.close()

    return None


def export_flights_to_csv(file_path, conn) -> None:
    query = """
        SELECT f.flight_no, 
               dep.airport_name AS departure_airport,
               arr.airport_name AS arrival_airport,
               f.scheduled_departure,
               f.scheduled_arrival,
               a.model AS aircraft
        FROM bookings.flights f
        JOIN bookings.airports dep ON f.departure_airport = dep.airport_code
        JOIN bookings.airports arr ON f.arrival_airport = arr.airport_code
        JOIN bookings.aircrafts a ON f.aircraft_code = a.aircraft_code;

    """

    df = pd.read_sql_query(query, conn)

    df.to_csv(file_path, index=False)

    print('Successfully exported flights to csv')

    return None


# with psycopg2.connect(
#         host='localhost',
#         database='demo',
#         port='5432',
#         user='postgres',
#         password='postgres'
# ) as connector:
#     with connector.cursor() as cursor:


if __name__ == '__main__':
    #  add_aircraft('LO7', 'Jetpack', 30)
    update_range('LO7', 100)
    export_flights_to_csv('.\\flights.csv', get_connection())
