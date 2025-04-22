import psycopg2
import pandas as pd


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
    connection = get_connection()

    query = f"""
        select
	        f.flight_no,
	        f.actual_departure,
	        f.actual_arrival,
	        ac.model,
	        round(avg(tf.amount), 2) as average_amount
        from
	        bookings.flights f 
        join 
	        bookings.airports a1
        on
	        f.departure_airport = a1.airport_code
        join 
	        bookings.airports a2
        on
	        f.arrival_airport = a2.airport_code
        join 
	        bookings.aircrafts ac
        on
	        f.aircraft_code = ac.aircraft_code
        join
	        bookings.ticket_flights tf
        on
	        f.flight_id = tf.flight_id
        where
	        a1.city = '{departure_city}'
        and
	        a2.city = '{arrival_city}'
	    group by
	        f.flight_no,
	        f.actual_departure,
	        f.actual_arrival,
	        ac.model;    
    """

    route_df = pd.read_sql_query(query, connection)
    route_df.to_csv(path_to_file, index=False)

    connection.close()

    return None


if __name__ == '__main__':
    write_the_route()
