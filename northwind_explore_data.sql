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
SELECT * FROM order_details;
