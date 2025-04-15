select
	tf.fare_conditions,
	extract(month from f.scheduled_departure) as month_of_departure,
	a.airport_name,
	count(f.*) as overall_flights,
	sum(tf.amount) as overall_sum,
	avg(tf.amount) as overall_avg
from
	bookings.ticket_flights tf
join
	bookings.flights f
on
	tf.flight_id = f.flight_id
join
	bookings.airports a
on
	f.departure_airport = a.airport_code
group by
	grouping sets (
		(fare_conditions),
		(month_of_departure),
		(airport_name),
		(fare_conditions, month_of_departure),
		(fare_conditions, airport_name),
		(month_of_departure, airport_name),
		()
	);
	