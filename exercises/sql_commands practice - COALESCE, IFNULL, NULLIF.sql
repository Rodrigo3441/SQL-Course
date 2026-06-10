USE salesdb;
-- Find the average scores of the customers

SELECT *
FROM customers;

-- AVG without treating NULLS
SELECT
AVG(score) AS avg_score
FROM customers;

-- AVG treating the NULLS
SELECT
AVG(COALESCE(score, 0)) AS avg_score
FROM customers;

/*
Display the full name of customers in a single field
by mearging their first and last names,
and add 100 bonus points to each customer's score
*/

SELECT *
FROM customers;

SELECT 
customerid,
CONCAT(firstname, ' ', COALESCE(lastname, '')) AS full_name,
COALESCE(score, 0) + 10 AS score_plus_bonus
FROM customers;

-- Sort the customers from lowest to highest scores, with NULLs appearing last
# slow way
SELECT
customerid,
score
FROM customers
ORDER BY COALESCE(score, 9999999999999999999999) ASC;

# professional way
SELECT
customerid,
score
FROM customers
ORDER BY CASE WHEN score IS NULL THEN 1 ELSE 0 END ASC, score ASC;

# Find the sales price for each order by diving the sales by the quantity
SELECT *
FROM orders;

SELECT
orderid,
sales,
quantity,
sales / NULLIF(quantity, 0) AS sales_price
FROM orders;

# identify the customers who have no scores
SELECT
*
FROM customers
WHERE score IS NULL;

# list all customers who have scores
SELECT
*
FROM customers
WHERE score IS NOT NULL;

# list all details for customers who have not placed any orders
SELECT *
FROM customers;
SELECT *
FROM orders;

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerid = o.customerid
WHERE o.customerid IS NULL;




