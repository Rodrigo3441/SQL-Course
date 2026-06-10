USE salesdb;

-- find the running total of sales for each month
-- using cte
WITH cte_monthly_summary AS (
SELECT
	MONTHNAME(orderdate) AS order_month,
	SUM(sales) AS total_sales,
    COUNT(orderid) AS total_orders,
	SUM(quantity) AS total_quantities
FROM orders
GROUP BY MONTHNAME(orderdate)
)

SELECT
*
FROM cte_monthly_summary;

-- using view
CREATE OR REPLACE VIEW v_monthly_summary AS 
(
	SELECT
		MONTHNAME(orderdate) AS order_month,
		SUM(sales) AS total_sales,
		COUNT(orderid) AS total_orders,
		SUM(quantity) AS total_quantities
	FROM orders
	GROUP BY MONTHNAME(orderdate)
);

SELECT
	order_month,
	SUM(total_sales) OVER (ORDER BY order_month ASC) AS running_total 
FROM v_monthly_summary;

DROP VIEW v_monthly_summary;

