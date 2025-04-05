PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS promocodes (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	code TEXT UNIQUE,
	discount_percent INTEGER CHECK(discount_percent BETWEEN 1 AND 100),
	valid_from DATETIME,
	valid_to DATETIME,
	max_uses INTEGER DEFAULT NULL CHECK (max_uses >= 0 OR max_uses IS NULL),
	is_active INTEGER DEFAULT 1 CHECK (is_active IN (0, 1)),
	created_by INTEGER,

	FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TRIGGER IF NOT EXISTS check_promocode_dates
BEFORE INSERT ON promocodes
FOR EACH ROW
BEGIN
    SELECT
    CASE
        WHEN NEW.valid_to < NEW.valid_from THEN
            RAISE (ABORT, 'valid_to cannot be earlier than valid_from.')
    END;
END;

INSERT INTO promocodes (code, discount_percent, valid_from, valid_to, max_uses, is_active, created_by)
VALUES
	('SPRING2025', 15, '2025-03-01 00:00:00', '2025-05-31 23:59:59', 100, 1, 1),
	('WELCOME15', 15, '2024-01-01 00:00:00', '2025-01-01 00:00:00', NULL, 0, 2),
	('FREESHIP2025', 5, '2025-04-01 00:00:00', '2025-06-30 23:59:59', 500, 1, 3),
	('BLACKFRIDAY2024', 50, '2024-11-22 00:00:00', '2024-11-30 23:59:59', 1000, 0, 4),
	('NEWYEAR2025', 25, '2025-12-20 00:00:00', '2026-01-10 00:00:00', NULL, 0, 5),
	('SUMMER2025', 20, '2025-06-01 00:00:00', '2025-08-31 23:59:59', 300, 0, 6),
	('FLASHSALE2025', 30, '2025-04-01 00:00:00', '2025-04-07 23:59:59', 50, 1, 7),
	('STUDENT2025', 15, '2025-01-15 00:00:00', '2025-12-31 23:59:59', NULL, 1, 8),
	('EXTRA5', 5, '2024-03-01 00:00:00', '2024-06-01 00:00:00', 200, 0, 9),
	('VIP2025', 100, '2025-01-01 00:00:00', '2025-12-31 23:59:59', 10, 1, 10);

SELECT
	*
FROM
	promocodes;
