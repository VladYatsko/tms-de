explain analyze
select
    departure_airport,
    count(*) as total_flights,
    avg(extract(epoch from (actual_arrival - scheduled_arrival)) / 60) as avg_delay_minutes
from
	bookings.flights
where
	scheduled_departure >= '2023-01-01'
group by
	departure_airport
order by
	total_flights desc
limit
	10;