explain analyze
select *
from bookings.boarding_passes
where seat_no = '12A';


create index idx_boarding_passes_seat_no
on bookings.boarding_passes (seat_no);


explain analyze
select *
from bookings.boarding_passes
where seat_no = '12A';


select
  relname as object_name,
  pg_size_pretty(pg_total_relation_size(oid)) as total_size
from pg_class
where relname in ('boarding_passes', 'idx_boarding_passes_seat_no');