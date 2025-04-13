select
	departure_airport,
	count(*) as number_of_flights
from
	bookings.flights
where
	actual_departure is not null
group by 
	departure_airport 
having
	count(*) < 50
order by 
	number_of_flights desc;
