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


def get_raw_data() -> pd.DataFrame:
    connection = get_connection()

    query = """
        select 
	        *
        from 
	        bookings.ticket_flights tf
        join
	        bookings.tickets t 
        on
	        tf.ticket_no = t.ticket_no
        where
	        tf.flight_id = 28935;
        """

    df = pd.read_sql_query(query, connection)

    connection.close()

    return df


def store_data(df: pd.DataFrame, path_to_file: str) -> None:
    df.to_csv(path_to_file, index=False)
    return None


if __name__ == '__main__':
    df = get_raw_data()
    store_data(df, '.\\passengers_data.csv')
