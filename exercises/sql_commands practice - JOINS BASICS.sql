USE mydatabase;
/*Retrieve all data from customers and orders in two different results*/
SELECT *
FROM customers;

SELECT *
FROM orders;

/*Get all customers along with their  orders, but only for customers who have placed an order*/
SELECT 
c.id, 
c.first_name,
o.order_id,
o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;

/* get all customers along with their orders including those without orders */
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

/* get all customers along with their orders, including orders without matching customers */
SELECT *
FROM customers AS C
RIGHT JOIN orders AS o
ON o.customer_id = c.id;

-- previous exercise but using left join
SELECT *
FROM orders AS o
LEFT JOIN customers AS C
ON o.customer_id = c.id;

/* get all customers and all orders, even if there's no match */
-- FULL join doesn't work on mysql
SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id;

-- equivalent version of FULL JOIN using RIGHT + LEFT JOIN
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.id

UNION

SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON o.customer_id = c.id;
