-- Execution Time: 1088.971 ms
explain analyze
select 
	t.passenger_id,
	t.passenger_name,
	count(*) as number_of_flights
from
	bookings.ticket_flights tf 
join
	bookings.tickets t 
on
	tf.ticket_no = t.ticket_no
group by
	t.passenger_id,
	t.passenger_name
order by
	number_of_flights desc
limit
	10;


create index if not exists idx_tickets_ticket_no
  on bookings.tickets (ticket_no);

create index if not exists idx_ticket_flights_ticket_no
  on bookings.ticket_flights (ticket_no);


-- Execution Time: 1059.072 ms
explain analyze
select 
	t.passenger_id,
	t.passenger_name,
	count(*) as number_of_flights
from
	bookings.ticket_flights tf 
join
	bookings.tickets t 
on
	tf.ticket_no = t.ticket_no
group by
	t.passenger_id,
	t.passenger_name
order by
	number_of_flights desc
limit
	10;