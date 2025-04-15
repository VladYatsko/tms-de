--Посчитать и вывести названия городов, между которыми осуществлялись перелеты
select 
	da.city as departure_city,
	aa.city as arrival_city,
	count(*) as number_of_flights
from
	bookings.flights f
join 
	bookings.airports da
on
	f.departure_airport = da.airport_code
join 
	bookings.airports aa
on
	f.arrival_airport = aa.airport_code
group by
	departure_city, arrival_city
order by
	number_of_flights desc;


-- Посчитать количество проданных билетов
-- Вывести итоговую стоимость перелетов
-- Среднюю стоимость билета
select
	flight_no,
	count(tf.ticket_no) as number_of_sold,
	sum(tf.amount) as overall_sum,
	round(avg(tf.amount), 2) as avg_amount
from
	bookings.ticket_flights tf
join
	bookings.flights f
on
	tf.flight_id = f.flight_id
group by
	f.flight_no;
