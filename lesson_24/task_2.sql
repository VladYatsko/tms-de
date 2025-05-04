-- From classwork
select 
    f.flight_id,
    f.flight_no,
    f.scheduled_departure::date AS flight_date,
    ac.model,
    round(count(distinct bp.boarding_no)::decimal / total_seats.total * 100, 2) as load_percentage
from 
	bookings.flights f
join 
	bookings.aircrafts ac 
on 
	f.aircraft_code = ac.aircraft_code
join (
    select 
    	aircraft_code, 
    	count(*) as total
    from 
    	bookings.seats
    group by
    	aircraft_code
) total_seats
on 
	f.aircraft_code = total_seats.aircraft_code
left join 
	bookings.boarding_passes bp 
on
	f.flight_id = bp.flight_id
group by 
    f.flight_id,
    f.flight_no,
    f.scheduled_departure,
    ac.model,
    total_seats.total
order by
	load_percentage desc;


-- homework
select 
    to_char(scheduled_departure, 'Day') as day_of_week,
    round(avg(occupied_seats::decimal / total_seats) * 100, 2) as avg_load_percent
from (
    select 
        f.flight_id,
        f.scheduled_departure,
        count(distinct bp.boarding_no) as occupied_seats,
        ts.total_seats
    from 
    	bookings.flights f
    join (
        select 
        	aircraft_code, 
        	count(*) as total_seats
        from 
        	bookings.seats
        group by 
        	aircraft_code
    ) ts 
    on 
    	f.aircraft_code = ts.aircraft_code
    left join
    	bookings.boarding_passes bp 
    on
    	f.flight_id = bp.flight_id
    group by
    	f.flight_id, 
    	f.scheduled_departure, 
    	ts.total_seats
) as flight_loads
group by
	to_char(flight_loads.scheduled_departure, 'Day')
order by
	avg_load_percent DESC;


