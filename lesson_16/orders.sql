PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS orders (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	amount REAL NOT NULL,
	status TEXT DEFAULT 'pending' CHECK(status IN ('delivered', 'processing', 'shipped', 'cancelled', 'pending')),
	order_date DATETIME DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY (user_id) REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE SET NULL
);

INSERT INTO orders (user_id, amount, status, order_date) VALUES
    (1, 899.99, 'delivered', '2023-10-01 09:15:22'),
    (2, 299.99, 'processing', '2023-10-02 14:30:45'),
    (3, 129.99, 'shipped', '2023-10-03 11:20:33'),
    (1, 349.99, 'pending', '2023-10-04 16:45:12'),
    (4, 249.99, 'delivered', '2023-09-28 10:10:10'),
    (5, 39.99, 'cancelled', '2023-09-30 13:25:18'),
    (6, 59.99, 'delivered', '2023-10-01 17:30:00'),
    (7, 59.99, 'processing', '2023-10-02 08:15:42'),
    (8, 34.99, 'shipped', '2023-10-03 19:20:55'),
    (9, 79.99, 'pending', '2023-10-04 12:35:27'),
    (10, 129.99, 'delivered', '2023-09-29 15:40:33'),
    (2, 349.99, 'processing', '2023-10-03 10:25:19'),
    (3, 39.99, 'delivered', '2023-09-27 14:50:08'),
    (5, 899.99, 'shipped', '2023-10-02 09:15:22');