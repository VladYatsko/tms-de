CREATE TABLE IF NOT EXISTS users (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	username TEXT UNIQUE NOT NULL,
	email TEXT UNIQUE NOT NULL,
	age INTEGER CHECK(age BETWEEN 0 AND 120),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP

	-- UNIQUE(username, email)
);

INSERT INTO users (username, email, age)
VALUES
    ('ivan_petrov', 'ivan.p@example.com', 28),
    ('anna_smirnova', 'anna.s@example.com', 32),
    ('alex_volkov', 'alex.v@example.com', 25),
    ('elena_kuz', 'elena.k@example.com', 41),
    ('dmitry_sokolov', 'dmitry.s@example.com', 19),
    ('olga_ivanova', 'olga.i@example.com', 23),
    ('sergey_fedorov', 'sergey.f@example.com', 37),
    ('marina_orlova', 'marina.o@example.com', 29),
    ('pavel_novikov', 'pavel.n@example.com', 45),
    ('ekaterina_bez', 'ekaterina.b@example.com', 31);

SELECT * FROM users;