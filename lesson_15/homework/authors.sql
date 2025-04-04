CREATE TABLE IF NOT EXISTS authors (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	full_name TEXT,
	year_of_birth INTEGER,
	country_of_origin TEXT,
	bio TEXT
);

INSERT INTO authors (full_name, year_of_birth, country_of_origin, bio)
VALUES
	('Some Author', 1875, 'UK', 'Famous author for sure'),
	('New Author', 1900, 'RU', 'Did a lot of stuff'),
	('Awesome Author', 1920, 'BY', 'Famous author'),
	('Genius', 2000, 'US', 'Wow'),
	('No books author', 1980, 'CH', 'Plans to become an author'),
	('Author', 1950, 'UK', 'Author for sure');

SELECT
	*
FROM
	authors;