-- 3.1
select
    departure_airport,
    count(*) as total_flights,
    count(*) filter (where actual_departure > scheduled_departure) AS delayed_flights,
    round(avg(extract(epoch from (actual_departure - scheduled_departure)) / 60), 2) as avg_delay_minutes
from 
    bookings.flights
--where 
--    departure_airport = 'SVO'
group by
    departure_airport;


-- 3.2
create or replace function bookings.get_airport_delay_stats(p_airport TEXT)
returns table (
    airport TEXT,
    total_flights INT,
    delayed_flights INT,
    avg_delay_minutes NUMERIC
) as $$
begin
	if not exists (select 1 from bookings.airports where airport_code = p_airport) then
        raise exception 'Airport code "%" does not exist', p_airport;
    end if;

    return QUERY

    select 
        f.departure_airport::TEXT,
        count(*)::INT as total_flights,
        count(*) filter (where f.actual_departure > f.scheduled_departure)::INT as delayed_flights,
        round(avg(extract(epoch from (f.actual_departure - f.scheduled_departure)) / 60), 2)::NUMERIC
    from bookings.flights f
    where f.departure_airport = p_airport
    group by f.departure_airport;
end;
$$ language plpgsql;

drop function bookings.get_airport_delay_stats;


select
	*
from
	bookings.get_airport_delay_stats('SVO');