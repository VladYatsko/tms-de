select
	count(*) as number_of_flights
from
	bookings.flights f
left join 
	bookings.airports a
on
	a.airport_code = f.departure_airport
where
	a.city = 'Москва'
and
	extract(month from f.scheduled_departure) = 10;