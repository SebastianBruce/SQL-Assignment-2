-- SQL Assignment 2
-- Sebastian, Yoko, Jason, Allison
-- 02-16-2024

USE my_guitar_shop;

-- Q1
-- Write a SELECT statement that joins the Categories table to the Products table and returns these columns: 
-- category_name, product_name, list_price. Sort the result set by category_name and then by product_name in ascending sequence.
SELECT c.category_name, p.product_name, p.list_price
FROM categories AS c INNER JOIN products AS p ON c.category_id = p.category_id
ORDER BY category_name, product_name;

-- Q2
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
-- Return one row for each address for the customer with an email address of allan.sherwood@yahoo.com.
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers AS c INNER JOIN addresses AS a ON c.customer_id = a.customer_id
WHERE c.email_address = 'allan.sherwood@yahoo.com';

-- Q3
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: first_name, last_name, line1, city, state, zip_code.
-- Return one row for each customer, but only return addresses that are the shipping address for a customer.
SELECT c.first_name, c.last_name, a.line1, a.city, a.state, a.zip_code
FROM customers AS c INNER JOIN addresses AS a ON c.customer_id = a.customer_id;

-- Q4
-- Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. 
-- This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
-- Use aliases for the tables. Sort the final result set by last_name, order_date, and product_name.
SELECT c.last_name, c.first_name, o.order_date, p.product_name, oi.item_price, oi.discount_amount, oi.quantity
FROM customers AS c 
INNER JOIN orders as o ON c.customer_id = o.customer_id 
INNER JOIN order_items AS oi ON o.order_id = oi.order_id 
INNER JOIN products AS p ON oi.product_id = p.product_id
ORDER BY c.last_name, o.order_date, p.product_name;

-- Q5
-- Write a SELECT statement that returns the product_name and list_price columns from the Products table. 
-- Return one row for each product that has the same list price as another product.
SELECT p1.product_name, p1.list_price
FROM products p1 JOIN products p2
	ON p1.product_id != p2.product_id AND
	   p1.list_price = p2.list_price	   
ORDER BY product_name;

-- Q6
-- Write a SELECT statement that returns these two columns:
-- category_name
-- product_id 
-- Return one row for each category that has never been used. 
SELECT c.category_name, p.product_id
FROM categories AS c LEFT JOIN products AS p ON c.category_id = p.category_id
WHERE p.product_id IS NULL;

-- Q7
-- Use the UNION operator to generate a result set consisting of three columns from the
-- Orders table:
-- ship_status 	A calculated column that contains a value of SHIPPED or NOT SHIPPED
-- order_id 	The order_id column
-- order_date 	The order_date column
-- If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. 
-- Otherwise, it should contain a value of NOT SHIPPED. Sort the final result set by order_date.
SELECT 'SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT 'NOT SHIPPED' AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY order_date;





