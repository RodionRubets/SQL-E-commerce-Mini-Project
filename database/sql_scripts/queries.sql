-- 1. Selecting delivered orders with customer details (JOIN + WHERE)
SELECT 
    orders.order_id,
    orders.order_date,
    orders.status,
    customers.first_name,
    customers.last_name,
    customers.city
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.status = 'Delivered';

-- 2. Detailed report for orders where item quantity is greater than 1
SELECT 
    orders.order_id,
    customers.first_name,
    customers.last_name,
    order_items.quantity 
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_items ON orders.order_id = order_items.order_id 
WHERE order_items.quantity > 1;

-- 3. Comprehensive report: joining 4 tables (customer, product, quantity, and date)
SELECT 
    customers.first_name,
    customers.last_name,
    products.product_name,
    order_items.quantity,
    orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_items ON orders.order_id = order_items.order_id 
JOIN products ON order_items.product_id = products.product_id;
