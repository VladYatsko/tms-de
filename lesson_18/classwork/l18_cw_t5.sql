select 
	a.model
from
	bookings.flights f
right join
	bookings.aircrafts a
on 
	f.aircraft_code = a.aircraft_code
where
	f.flight_id is null;