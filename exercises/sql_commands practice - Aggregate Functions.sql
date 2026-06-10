USE salesdb;

-- Find the total number of orders
SELECT 
COUNT(*) AS total_orders
FROM orders;

-- find the total sales of all orders
SELECT 
SUM(sales) AS total_sales
FROM orders;

-- find the average sales of all orders
SELECT
AVG(sales) AS avg_sales
FROM orders;

-- find the highest sales of all orders
SELECT
MAX(sales) AS highest_sales
FROM orders;

-- find the lowest sales of all orders
SELECT
MIN(sales) AS lowest_sales
FROM orders;