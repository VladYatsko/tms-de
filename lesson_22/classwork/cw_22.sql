create database tech_gadgets;

create schema if not exists production;

create schema if not exists analytics;

create schema if not exists sandbox;

create role data_engineer;

create role data_analyst;

create role manager;

grant select on all tables in schema analytics to manager;

grant all privileges on all tables in schema analytics to data_engineer;

grant all privileges on all tables in schema production to data_engineer;

grant all privileges on all tables in schema sandbox to data_engineer;

grant all privileges on all tables in schema sandbox to data_analyst;

grant select on all tables in schema analytics to data_analyst;

grant select on all tables in schema production to data_analyst;

-- Таблицы в схеме production
CREATE TABLE production.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    stock_quantity INT NOT NULL
);

CREATE TABLE production.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE production.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES production.customers(customer_id),
    order_date TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE production.order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES production.orders(order_id),
    product_id INT REFERENCES production.products(product_id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Таблицы в схеме analytics
CREATE TABLE analytics.sales_stats (
    stat_id SERIAL PRIMARY KEY,
    period DATE NOT NULL,
    total_sales DECIMAL(12,2) NOT NULL,
    top_product_id INT REFERENCES production.products(product_id)
);

CREATE TABLE analytics.customer_segments (
    segment_id SERIAL PRIMARY KEY,
    segment_name VARCHAR(50) NOT NULL,
    criteria TEXT NOT NULL,
    customer_count INT NOT NULL
);
