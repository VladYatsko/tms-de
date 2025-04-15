create materialized view if not exists bookings.airports_mv as
select
	*
from
	bookings.airports;


create or replace function bookings.refresh_airports_mv()
returns trigger as $$
begin
	refresh materialized view bookings.airports_mv;
	return new;
end;
$$ language plpgsql;


create trigger trg_refresh_airports_mv
after insert or update on bookings.airports
for each row
execute function bookings.refresh_airports_mv();


insert into bookings.airports (
    airport_code,
    airport_name,
    city,
    longitude,
    latitude,
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
	*
from
	bookings.airports_mv
where
	airport_code = 'ZZZ';


drop trigger if exists trg_refresh_airports_mv on bookings.airports;
drop function if exists bookings.refresh_airports_mv;