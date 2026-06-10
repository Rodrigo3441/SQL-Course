USE salesdb;

-- find the products that have a price higher
-- than the average price of all producuts

SELECT
*
FROM (
	SELECT
	productid,
    price,
	AVG(price) OVER () AS average_price
	FROM products
    ) AS sub
WHERE price > average_price;

-- rank customers based on their total amount of sales
SELECT
*,
RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
FROM (
	SELECT
	customerid,
	SUM(sales) AS total_sales
	FROM orders
	GROUP BY customerid
	) AS sub;
    
-- show the products IDs, names, prices
-- and total number of orders

SELECT
productid,
product,
price,
	(SELECT COUNT(*) FROM orders) AS total_orders
FROM products;

-- show all customers details and find the total orders
-- for each customer
-- solving the task with a simple join query
SELECT
c.*,
COUNT(o.orderid)
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerid = o.customerid
GROUP BY c.customerid;

-- solving the task with subquery in join
SELECT
c.*,
o.total_orders
FROM customers AS c
LEFT JOIN(
		SELECT
		customerid,
		COUNT(*) AS total_orders
		FROM orders
		GROUP BY customerid
		) AS o
ON c.customerid = o.customerid;

-- find the products that have a price higher
-- than the average price of all products

SELECT
productid,
price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- show the details of orders made by customers in Germany
SELECT 
*
FROM orders
WHERE customerid IN (SELECT 
					customerid 
					FROM customers
					WHERE country = 'Germany');
                    
-- find female employees whose salaries are greater
-- than the salaries of any male employees
SELECT
	employeeid,
    firstname,
    salary
FROM employees
WHERE gender = 'F'
AND salary > ANY(SELECT
				salary
				FROM employees
				WHERE gender = 'M');

-- find female employees whose salaries are greater
-- than the salaries of all male employees
SELECT
	employeeid,
    firstname,
    salary
FROM employees
WHERE gender = 'F'
AND salary > ALL(SELECT
				salary
				FROM employees
				WHERE gender = 'M');
                
                
-- show all customers details and
-- find the total orders for each customer

SELECT
*,
	(SELECT COUNT(*) FROM orders AS o WHERE o.customerid = c.customerid) AS total_orders
FROM customers AS c;


-- show the details of orders made by customers in Germany

SELECT
*
FROM orders AS o
WHERE EXISTS (SELECT 1
			  FROM customers AS c
		  	  WHERE country = 'Germany'
              AND c.customerid = o.customerid);















    
    



