-- Task 1
select
	a.model,
	count(*)
from
	bookings.seats s
left join
	bookings.aircrafts a
on
	a.aircraft_code = s.aircraft_code
group by
	model;

select
	a.model,
	s.fare_conditions,
	count(*)
from
	bookings.seats s
left join
	bookings.aircrafts a
on
	a.aircraft_code = s.aircraft_code
group by
	model, fare_conditions;

select
  	fare_conditions,
  	count(*) AS seat_count,
  	round(100.0 * count(*) / sum(count(*)) over (), 2) AS percentage
from
	bookings.seats
GROUP BY
	fare_conditions;

select
  	aircraft_code,
  	array_agg(seat_no ORDER BY seat_no) AS seats_array
from
	bookings.seats
group by
	aircraft_code;

