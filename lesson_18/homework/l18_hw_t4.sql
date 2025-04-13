select
    f1.flight_id as flight_1,
    f2.flight_id as flight_2,
    f1.departure_airport,
    f1.scheduled_departure as departure_time_1,
    f2.scheduled_departure as departure_time_2
from
    bookings.flights f1
join
    bookings.flights f2
on 
	f1.departure_airport = f2.departure_airport
and 
	f1.flight_id != f2.flight_id
and 
	f1.flight_id < f2.flight_id
and 
	abs(extract(epoch from f1.scheduled_departure - f2.scheduled_departure)) <= 3600;
