-- ==========================================
-- DDL: CREATE TABLES
-- ==========================================

CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    city TEXT,
    signup_date TEXT
);

CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ==========================================
-- DML: SEED TEST DATA
-- ==========================================

INSERT INTO customers (customer_id, first_name, last_name, city, signup_date) VALUES 
(1, 'Олександр', 'Петренко', 'Київ', '2025-01-15'),
(2, 'Марія', 'Коваль', 'Львів', '2025-02-10'),
(3, 'Андрій', 'Мельник', 'Одеса', '2025-03-01'),
(4, 'Ірина', 'Шевченко', 'Київ', '2025-03-12'),
(5, 'Максим', 'Бойко', 'Харків', '2025-04-05');

INSERT INTO products (product_id, product_name, category, price) VALUES 
(101, 'Бездротові навушники', 'Електроніка', 2499.00),
(102, 'Смарт-годинник', 'Електроніка', 5499.50),
(103, 'Рюкзак міський', 'Аксесуари', 1200.00),
(104, 'Кавоварка крапельна', 'Дім та кухня', 3100.00),
(105, 'Книга з програмування', 'Книги', 850.00),
(106, 'Органайзер для кабелів', 'Аксесуари', 350.00);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES 
(1001, 1, '2026-01-10', 'Delivered'),
(1002, 2, '2026-01-15', 'Delivered'),
(1003, 1, '2026-02-01', 'Processing'),
(1004, 3, '2026-02-05', 'Delivered'),
(1005, 4, '2026-02-20', 'Cancelled'),
(1006, 5, '2026-03-02', 'Delivered');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES 
(1, 1001, 101, 1),
(2, 1001, 106, 2),
(3, 1002, 102, 1),
(4, 1003, 104, 1),
(5, 1004, 105, 3),
(6, 1004, 103, 1),
(7, 1005, 101, 1),
(8, 1006, 102, 2),
(9, 1006, 106, 1);
