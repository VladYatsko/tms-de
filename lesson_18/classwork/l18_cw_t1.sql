select distinct
	flight_no	
from
	bookings.flights f
left join 
	bookings.seats s
on
	f.aircraft_code = s.aircraft_code
left join
	bookings.airports a 
on
	a.airport_code = f.departure_airport
where
	a.city = 'Москва'
and
	s.fare_conditions = 'Business';

