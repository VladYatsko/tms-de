CREATE TABLE IF NOT EXISTS courses (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	course TEXT,
	teacher_name TEXT,
	quantity_credits INTEGER
);

INSERT INTO courses (course, teacher_name, quantity_credits)
VALUES
	('Databases', 'Prepod One', 1),
	('UserOne', 'HisLast', 3),
	('UserTwo', 'Lastname', 5),
	('UserThree', 'LastNamee', 4),
	('UserFour', 'LaastNamee', 2);


SELECT * FROM courses;