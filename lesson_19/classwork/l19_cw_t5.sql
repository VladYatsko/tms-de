create view bookings.moscow_departures_vw as
select
	distinct flight_no
from
	bookings.flights f
join
	bookings.airports a
on
	f.departure_airport = a.airport_code
where
	a.city = 'Москва';

select
	*
from 
	bookings.moscow_departures_vw;