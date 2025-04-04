-- Creating the table
CREATE TABLE IF NOT EXISTS students (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	first_name VARCHAR(10),
	last_name VARCHAR(20),
	email VARCHAR(20),
	enter_date DATE
);

-- Filling the data
INSERT INTO students (first_name, last_name, email, enter_date)
VALUES
	('Uladzislau', 'Yatsko', 'yatsko.vladislav@gmail.com', '01-09-2011'),
	('UserOne', 'HisLast', 'someemail@gmail.com', '07-12-2013'),
	('UserTwo', 'Lastname', 'anotheremail@gmail.com', '01-01-2018'),
	('UserThree', 'LastNamee', 'onemoreemail@gmail.com', '03-03-2012'),
	('UserFour', 'LaastNamee', 'lastemail@email.com', '04-08-2015');

-- Simple select
SELECT
	*
FROM
	students;

-- Changing email
UPDATE students
SET email = 'normemail@gmail.com'
WHERE last_name = 'HisLast';

-- SELECT to see changes
SELECT
	*
FROM
	students;