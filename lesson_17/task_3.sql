select
	to_char(book_date, 'Month') as month_of_year,
	count(*) as number_of_bookings,
	sum(total_amount) as overall_sum_per_month,
	array_agg(book_date order by book_date) as set_of_bookings
from
	bookings.bookings
group by
	month_of_year;