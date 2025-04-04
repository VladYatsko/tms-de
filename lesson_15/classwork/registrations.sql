PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS registrations (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	student_id INTEGER,
	course_id INTEGER,
	registration_date DATE,
	mark INTEGER,
	FOREIGN KEY (student_id) REFERENCES students(id),
	FOREIGN KEY (course_id) REFERENCES courses(id)
)

INSERT INTO registrations (student_id, course_id, registration_date, mark)
VALUES
	(1, 2, '01-09-2011', 10),
	(2, 2, '01-09-2011', 2),
	(4, 1, '01-09-2011', 5),
	(4, 4, '01-09-2011', 4),
	(5, 1, '01-09-2011', 7);

SELECT
	*
FROM
	registrations;

DELETE FROM registrations
WHERE student_id IN (
	SELECT
		r.student_id
	FROM
		registrations AS r
	LEFT JOIN
		students AS s
	ON
		s.id = r.student_id
	LEFT JOIN
		courses AS c
	ON
		c.id = r.course_id
	WHERE
		s.first_name = 'UserFour'
	AND
		s.last_name = 'LaastNamee'
	AND
		c.course = 'Databases'
)
AND
	course_id IN (
		SELECT
			c.id
    	FROM
    		courses c
    	WHERE
    		c.course = 'Databases'
	);

SELECT
	*
FROM
	registrations;

