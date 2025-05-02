EXPLAIN ANALYZE
SELECT bp.boarding_no, t.passenger_id
FROM bookings.boarding_passes bp
JOIN bookings.tickets t ON bp.ticket_no = t.ticket_no
JOIN bookings.seats s ON bp.seat_no = s.seat_no
JOIN bookings.bookings b ON t.book_ref = b.book_ref
WHERE 
  t.passenger_id in ('0856 579180', '4723 695013')
  AND boarding_no < 100;


CREATE INDEX idx_bp_ticket_no ON bookings.boarding_passes(ticket_no);
CREATE INDEX idx_bp_seat_no ON bookings.boarding_passes(seat_no);
CREATE INDEX idx_tickets_ticket_no ON bookings.tickets(ticket_no);
CREATE INDEX idx_tickets_passenger_id ON bookings.tickets(passenger_id);
CREATE INDEX idx_tickets_book_ref ON bookings.tickets(book_ref);
CREATE INDEX idx_bookings_book_ref ON bookings.bookings(book_ref);
CREATE INDEX idx_bp_boarding_no ON bookings.boarding_passes(boarding_no);
CREATE INDEX idx_seats_seat_no ON bookings.seats(seat_no);


EXPLAIN ANALYZE
SELECT bp.boarding_no, t.passenger_id
FROM bookings.boarding_passes bp
JOIN bookings.tickets t ON bp.ticket_no = t.ticket_no
JOIN bookings.seats s ON bp.seat_no = s.seat_no
JOIN bookings.bookings b ON t.book_ref = b.book_ref
WHERE 
  t.passenger_id in ('0856 579180', '4723 695013')
  AND boarding_no < 100;
