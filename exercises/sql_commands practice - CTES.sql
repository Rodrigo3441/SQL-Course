USE salesdb;
CREATE TABLE monthly_orders AS 
(
SELECT
MONTHNAME(orderdate) AS order_month,
COUNT(orderid) total_orders
FROM orders
GROUP BY MONTHNAME(orderdate)
);

SELECT *
FROM monthly_orders;

DROP TABLE monthly_orders;
