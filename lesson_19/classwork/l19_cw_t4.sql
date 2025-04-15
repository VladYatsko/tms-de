with flights_with_delta as (
	select
		flight_no,
		scheduled_departure,
		actual_departure,
		(actual_departure - scheduled_departure) as delay_delta
	from 
		bookings.flights
)

select
	*
from
	flights_with_delta
where
	delay_delta < (select avg(delay_delta) from flights_with_delta);