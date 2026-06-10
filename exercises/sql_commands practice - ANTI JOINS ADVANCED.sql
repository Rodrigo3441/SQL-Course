USE mydatabase;

/* get all customers who haven't placed any order */
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL;

/* get all orders without matching customers */
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL;

-- get all orders without matching customers USING LEFT JOIN
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL;

/* find customers without orders and orders without customers */
-- FULL ANTI JOIN equivalency 
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON o.customer_id = c.id
WHERE c.id IS NULL;

/* find all users and orders */
-- FULL JOIN equivalency
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON o.customer_id = c.id;

/* get all customers along with thir orders, but only
for customers who have placed an order (without using INNER JOIN) */
SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

-- solution 1: LEFT JOIN, keeping only customers that have an order
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL;

/* generate all possible combinations of customers and orders */
SELECT *
FROM customers AS c
CROSS JOIN orders AS o





