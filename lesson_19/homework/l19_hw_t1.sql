create temporary table if not exists concrete_flights  as
select flight_id, departure_airport, scheduled_departure
from bookings.flights
where departure_airport = 'SVO';


create temporary table if not exists temp_moscow_airports as
select *
from bookings.airports
where city = 'Москва';


insert into concrete_flights (flight_id, departure_airport, scheduled_departure)
values 
	(999999, 'SVO', '2025-04-14 09:00:00');


insert into temp_moscow_airports (
    airport_code,
    airport_name,
    city,
    longitude,
    tatitude,
    timezone
)
values (
    'ZZZ',
    'Московский тестовый аэропорт',
    'Москва',
    37.6225,     
    55.7558,     
    'Europe/Moscow'
);


select
    f.flight_id,
    f.departure_airport,
    f.scheduled_departure,
    a.airport_name,
    a.city
from
    concrete_flights f
join
    temp_moscow_airports a 
on
	f.departure_airport = a.airport_code;


drop table if exists concrete_flights;
drop table if exists temp_moscow_airports;