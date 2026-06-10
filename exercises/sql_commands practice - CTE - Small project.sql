USE salesdb;

-- step 01: find the total sales per customer (Standalone CTE)
WITH cte_total_sales AS 
(
SELECT
	customerid,
	SUM(sales) AS total_sales
FROM orders
GROUP BY customerid
)

-- step 02: find the last order date per customer (Standalone CTE)
, cte_last_order AS 
(
SELECT
	customerid,
	MAX(orderdate) AS last_order
FROM orders
GROUP BY customerid
)

-- step 03: rank customers based on total sales per customer (Nested CTE)
, cte_customer_rank AS
(
SELECT
customerid,
total_sales,
RANK() OVER(ORDER BY total_sales DESC) AS customer_rank
FROM cte_total_sales
)

-- step 04: segment customers based on their total sales (Nested CTE)
, cte_customer_segment AS 
(
SELECT
customerid,
CASE WHEN total_sales > 100 THEN 'High'
	 WHEN total_sales > 50 THEN 'Medium'
	 ELSE 'low'
END AS segment
FROM cte_total_sales
)

-- main query
SELECT
	c.customerid,
	c.firstname,
	c.lastname,
	cts.total_sales,
    clo.last_order,
    ccr.customer_rank,
    IFNULL(ccs.segment, 'None') AS segment
FROM customers AS c
LEFT JOIN cte_total_sales AS cts
ON c.customerid = cts.customerid
LEFT JOIN cte_last_order AS clo
ON c.customerid = clo.customerid
LEFT JOIN cte_customer_rank AS ccr
ON c.customerid = ccr.customerid
LEFT JOIN cte_customer_segment AS ccs
ON c.customerid = ccs.customerid
ORDER BY customer_rank