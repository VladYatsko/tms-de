PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS books (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	book_name TEXT,
	publish_year INTEGER,
	author_id INTEGER,
	in_stock INTEGER CHECK(in_stock >= 0),
	status TEXT CHECK(status IN ('Available', 'On hands', 'In repairment')),
	FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books (book_name, publish_year, author_id, in_stock, status)
VALUES
	('Book 1', 2000, 1, 5, 'Available'),
	('Book 2', 1960, 3, 1, 'In repairment'),
	('Book 3', 1998, 2, 0, 'On hands'),
	('Book 4', 2010, 5, 1, 'Available'),
	('Book 5', 2003, 1, 2, 'Available'),
	('Book 6', 2003, 4, 4, 'In repairment'),
	('Book 7', 2000, 1, 8, 'Available'),
	('Book 8', 2006, 1, 0, 'On hands'),
	('Book 9', 2003, 5, 1, 'Available');

SELECT
	*
FROM
	books;

SELECT
	b.book_name
FROM
	books AS b
LEFT JOIN
	authors AS a
ON
	a.id = b.author_id
WHERE
	a.full_name = 'Some Author';

SELECT
	book_name
FROM
	books
WHERE
	status = 'Available';