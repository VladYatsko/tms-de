-- 5.1
select 
    f1.departure_airport as origin,
    f1.arrival_airport as intermediate,
    f2.arrival_airport as destination,
    f1.flight_id as first_leg,
    f2.flight_id as second_leg,
    f1.scheduled_departure as first_leg_departure,
    f2.scheduled_departure as second_leg_departure
from 
    bookings.flights f1
join 
    bookings.flights f2
on 
    f1.arrival_airport = f2.departure_airport
where 
    f1.departure_airport = 'ABA'
and
	f2.arrival_airport != f1.departure_airport
and 
	f2.scheduled_departure > f1.scheduled_arrival
and
	f2.scheduled_departure - f1.scheduled_arrival <= interval '4 hours'
order by 
    f1.scheduled_departure;


-- 5.2
create or replace function bookings.get_one_intermediate_routes(p_airport_code TEXT)
returns table (
    origin TEXT,
    intermediate TEXT,
    destination TEXT,
    first_leg_flight_id INT,
    second_leg_flight_id INT,
    first_leg_departure TIMESTAMP,
    second_leg_departure TIMESTAMP
)
as $$
begin
    return QUERY
    select 
        f1.departure_airport::TEXT,
        f1.arrival_airport::TEXT,
        f2.arrival_airport::TEXT,
        f1.flight_id,
        f2.flight_id,
        f1.scheduled_departure::TIMESTAMP WITHOUT TIME ZONE,
        f2.scheduled_departure::TIMESTAMP WITHOUT TIME ZONE
    from 
        bookings.flights f1
    join 
        bookings.flights f2
    on 
        f1.arrival_airport = f2.departure_airport
    where 
        f1.departure_airport = p_airport_code
    and
		f2.arrival_airport != f1.departure_airport
    and 
		f2.scheduled_departure > f1.scheduled_arrival
    and 
		f2.scheduled_departure - f1.scheduled_arrival <= interval '4 hours';
end;
$$ language plpgsql;


select
	* 
from
	bookings.get_one_intermediate_routes('ABA');