select 
	t.passenger_name,
	tf.ticket_no,
	tf.fare_conditions
from 
	bookings.ticket_flights tf
left join
	bookings.tickets t
on
	tf.ticket_no = t.ticket_no;