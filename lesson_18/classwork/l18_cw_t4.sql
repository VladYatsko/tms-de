select
	a.model,
	s.fare_conditions,
	count(*) as number_of_seats
from
	bookings.seats s
left join
	bookings.aircrafts a
on
	s.aircraft_code = a.aircraft_code
group by 
	a.model,
	s.fare_conditions
order by 
	a.model,
	s.fare_conditions; 