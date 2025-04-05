PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS reviews (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	product_id INTEGER,
	user_id INTEGER,
	rating INTEGER CHECK(rating BETWEEN 1 AND 5),
	review_text TEXT DEFAULT NULL,
	is_verified INTEGER DEFAULT 0 CHECK(is_verified IN (0, 1)),
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

	UNIQUE (product_id, user_id),
	FOREIGN KEY (product_id) REFERENCES products(id)
		ON DELETE CASCADE
		ON UPDATE SET NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
		ON DELETE CASCADE
		ON UPDATE SET NULL
);

INSERT INTO reviews (product_id, user_id, rating, review_text, is_verified, created_at)
VALUES
	(101, 1, 5, 'Отличный товар, рекомендую!', 1, '2024-01-10 12:00:00'),
	(101, 2, 4, 'Хорошее качество, но доставка подвела', 1, '2024-01-11 09:15:00'),
	(102, 3, 3, 'Средний продукт, ожидал большего', 0, '2024-01-12 14:30:00'),
	(102, 4, 2, 'Не соответствует описанию', 0, '2024-01-13 10:20:00'),
	(103, 5, 5, 'Просто супер, беру второй раз', 1, '2024-01-14 17:45:00'),
	(103, 6, 1, 'Очень плохо, испорчен товар', 1, '2024-01-15 08:00:00'),
	(104, 7, 4, 'Понравилось, но упаковка была мятая', 0, '2024-01-16 11:50:00'),
	(105, 8, 5, 'Лучший продукт в своей категории', 1, '2024-01-17 13:40:00'),
	(105, 9, 2, 'Слабенько, не оправдал ожиданий', 0, '2024-01-18 16:30:00'),
	(106, 10, 3, NULL, 0, '2024-01-19 15:00:00'),
	(107, 1, 5, 'Подарил другу — доволен!', 1, '2024-01-20 19:20:00'),
	(108, 2, 4, 'Все хорошо, спасибо!', 1, '2024-01-21 10:10:00'),
	(109, 3, 1, 'Разочарован покупкой', 0, '2024-01-22 12:55:00'),
	(110, 4, 3, 'Нормально за свою цену', 1, '2024-01-23 18:30:00');

SELECT
	*
FROM
	reviews;
