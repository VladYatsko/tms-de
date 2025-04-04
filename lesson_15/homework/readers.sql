CREATE TABLE IF NOT EXISTS readers (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	reader_name TEXT,
	reader_ticket_num INTEGER,
	registration_date DATE,
	contact_phone INTEGER,
	email TEXT UNIQUE
);

CREATE TRIGGER check_registration_date
BEFORE INSERT ON readers
FOR EACH ROW
BEGIN
    SELECT
    CASE
        WHEN NEW.registration_date > DATE('now') THEN
            RAISE (ABORT, 'Registration date cannot be in the future.')
    END;
END;

INSERT INTO readers (reader_name, reader_ticket_num, registration_date, contact_phone, email)
VALUES
	('Reader One', 2, '01-09-2024', 9379992, 'someemail1@gmail.com'),
	('Reader Two', 4, '01-09-2012', 9379993, 'someemail2@gmail.com'),
	('Reader Three', 10, '01-09-2020', 9379994, 'someemail3@gmail.com'),
	('Reader Four', 22, '01-09-2021', 9379995, 'someemail4@gmail.com'),
	('Reader Five', 14, '01-09-2019', 9379996, 'someemail5@gmail.com'),
	('Reader Six', 18, '01-09-2009', 9379997, 'someemail6@gmail.com');

SELECT
	*
FROM
	readers;

SELECT
	reader_name
FROM
	readers
WHERE
	registration_date BETWEEN '01-09-2012' AND '01-09-2021';