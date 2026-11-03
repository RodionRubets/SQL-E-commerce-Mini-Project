# SQL-E-commerce-Mini-Project
A multi-table e-commerce relational database project in SQLite demonstrating SQL queries, aggregates, HAVING, and 4-way JOINs.

A practical mini-project demonstrating relational database design, data manipulation, and advanced SQL querying techniques using SQLite and DBeaver.

## 🛠 Tech Stack
- **Database:** SQLite
- **Client:** DBeaver
- **Language:** SQL (DDL, DML, DQL, Aggregations, JOINs)

## 📊 Database Schema
The project consists of 4 normalized relational tables:
1. **`customers`** — Store clients (`customer_id`, first name, last name, city, signup date).
2. **`products`** — Product catalog (`product_id`, product name, category, price).
3. **`orders`** — Customer orders (`order_id`, foreign key to `customers`, order date, status).
4. **`order_items`** — Order details / many-to-many junction table (`order_item_id`, `order_id`, `product_id`, quantity).

## 💡 Key Features & Concepts
- Designing relational structures with Primary and Foreign Keys (`FOREIGN KEY`).
- Multi-row batch data insertion (`Multi-row INSERT`).
- Data filtering, grouping, and aggregations (`WHERE`, `GROUP BY`, `AVG`, `ROUND`, `COUNT`).
- Filtering aggregated results using `HAVING`.
- Complex multi-table reporting using inner joins across up to 4 tables simultaneously (`INNER JOIN`).

## 📁 Example: 4-Way JOIN Query
The following query generates a complete sales report by joining all four tables to display customer names, purchased products, quantities, and order dates:

```sql
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
