with route_cities as (
	select
		f.flight_id,
		da.city as departure_city,
		aa.city as arrival_city
	from
		bookings.flights f
	left join 
		bookings.airports da 
	on 
		f.departure_airport = da.airport_code
	left join 
		bookings.airports aa 
	on 
		f.arrival_airport = aa.airport_code
)

select
	rc.departure_city,
	rc.arrival_city,
	round(avg(tf.amount), 2) as average_cost_per_route
from
	bookings.ticket_flights tf
inner join
	route_cities rc 
on 
	tf.flight_id = rc.flight_id
group by
	rc.departure_city,
	rc.arrival_city;