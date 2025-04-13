-- Task 2
select
	min(amount) as min_amount,
	max(amount) as max_amount,
	max(amount) - min(amount) as amount_delta,
	PERCENTILE_CONT(0.5) within group (order by amount) as median_amount,
	array_agg(amount) as all_amounts
from
	bookings.ticket_flights;
