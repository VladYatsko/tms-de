-- Получить статистику (кол-во и среднее) по билетам в разрезах:
-- По классу обслуживания
-- По аэропорту вылета
-- По комбинации класс + аэропорт вылета
select
	tf.fare_conditions,
	f.departure_airport, 
	count(*) as overall_count,
	avg(tf.amount) as avg_cost
from
	bookings.ticket_flights tf 
join
	bookings.flights f 
on
	tf.flight_id = f.flight_id
group by 
	grouping sets (
		(fare_conditions, departure_airport),
		(fare_conditions),
		(departure_airport),		
		()
	);
