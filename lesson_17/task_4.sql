select
	a.airport_code,
	count(f.*) as overall_flights
from
	bookings.flights f
left join
	bookings.airports a
on
	f.departure_airport = a.airport_code
group by
	a.airport_code;


select
	count(distinct arrival_airport) as unique_arrival
from
	bookings.flights;


select
	array_agg(distinct arrival_airport) as array_of_airports
from
	bookings.flights;
