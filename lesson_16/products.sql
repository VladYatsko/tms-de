CREATE TABLE IF NOT EXISTS products (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	price REAL NOT NULL,
	quantity INTEGER NOT NULL,
	total_value REAL GENERATED ALWAYS AS (price * quantity) STORED
);

INSERT INTO products (id, name, price, quantity)
VALUES
    (101, 'Ноутбук ASUS ZenBook', 899.99, 15),
    (102, 'Смартфон Xiaomi Redmi Note', 299.99, 42),
    (103, 'Наушники Sony WH-CH710', 129.99, 37),
    (104, 'Планшет Samsung Galaxy Tab A', 249.99, 18),
    (105, 'Монитор LG 27UL500', 349.99, 12),
    (106, 'Клавиатура Logitech K380', 39.99, 56),
    (107, 'Мышь Razer DeathAdder', 59.99, 23),
    (108, 'Внешний жесткий диск Seagate 1TB', 59.99, 31),
    (109, 'Фитнес-браслет Xiaomi Mi Band', 34.99, 68),
    (110, 'Роутер TP-Link Archer C6', 79.99, 14);

SELECT * FROM products;