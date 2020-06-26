-- Get the names and the quantities in stock for each product.
SELECT product_name, units_in_stock FROM products;

-- Get a list of current products (Product ID and name).
SELECT product_id, product_name FROM products;

-- Get a list of the most and least expensive products (name and unit price).
SELECT product_name, unit_price
FROM products 
WHERE unit_price IN ((SELECT MAX (unit_price) FROM products), (SELECT MIN (unit_price) FROM products));

-- Get products that cost less than $20.
SELECT product_name, unit_price FROM products
WHERE unit_price < 20;

-- Get products that cost between $15 and $25.
SELECT product_name, unit_price FROM products
WHERE unit_price BETWEEN 15 AND 20;

-- Get products above average price.
SELECT product_name, unit_price
FROM products 
WHERE unit_price > (SELECT AVG (unit_price) FROM products);

-- Find the ten most expensive products.
SELECT product_name, unit_price
FROM products 
ORDER BY unit_price DESC
LIMIT 10;

-- Get a list of discontinued products (Product ID and name).
SELECT product_name, discontinued
FROM products 
WHERE discontinued = 1;

-- Count current and discontinued products.
SELECT discontinued, COUNT (discontinued)
FROM products
GROUP BY discontinued;

--Find products with less units in stock than the quantity on order.
SELECT product_name, units_in_stock, units_on_order
FROM products 
WHERE units_on_order > units_in_stock;

-- Find the customer who had the highest order amount
-- create subquery
SELECT DISTINCT company_name
FROM
(SELECT c.customer_id, c.company_name, o.order_id
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.customer_id) as
subquery;
-- create new table
CREATE TABLE best_customer_table AS
SELECT c.customer_id, c.company_name, sum(od.unit_price*od.quantity) AS total_revenue
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.customer_id
JOIN order_details AS od ON od.order_id = o.order_id
GROUP BY c.customer_id, c.company_name
ORDER BY total_revenue DESC
LIMIT 1;

-- create new view
CREATE VIEW best_customer AS
SELECT c.customer_id, c.company_name, sum(od.unit_price*od.quantity) AS total_revenue
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.customer_id
JOIN order_details AS od ON od.order_id = o.order_id
GROUP BY c.customer_id, c.company_name
ORDER BY total_revenue DESC;
--call the view
SELECT *
FROM best_customer;

--Get orders for a all employee sorted by highest quantity
SELECT e.employee_id, e.last_name, e.first_name, o.order_id, od.unit_price, od.quantity
FROM employees AS e
JOIN orders AS o ON e.employee_id = o.employee_id
JOIN order_details AS od ON od.order_id = o.order_id
GROUP BY e.employee_id, e.last_name, e.first_name, o.order_id, od.unit_price, od.quantity
ORDER BY od.quantity DESC;

--Get orders for a given employee and the according customer
SELECT e.employee_id, e.last_name, e.first_name, o.order_id, c.company_name, od.unit_price, od.quantity
FROM employees AS e
JOIN orders AS o ON e.employee_id = o.employee_id
JOIN order_details AS od ON od.order_id = o.order_id
JOIN customers AS c ON o.customer_id = c.customer_id
WHERE e.employee_id = 4
GROUP BY e.employee_id, e.last_name, e.first_name, o.order_id, c.company_name, od.unit_price, od.quantity;

-- Display the names of customers who ordered the same set of products as customers from Brazil
SELECT DISTINCT product_name 
FROM (
SELECT o.customer_id, c.company_name, c.country, od.product_id, p.product_name, od.quantity 
FROM orders AS o
JOIN order_details AS od ON od.order_id = o.order_id
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN products AS p ON od.product_id = p.product_id

WHERE c.country = 'Brazil'
GROUP BY o.customer_id, c.company_name, c.country, od.product_id, p.product_name, od.quantity) as product;


-- Find the hiring age of each employee

-- Create views and/or named queries for some of these queries

