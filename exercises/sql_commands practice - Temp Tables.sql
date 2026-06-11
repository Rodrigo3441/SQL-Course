USE salesdb;

CREATE TEMPORARY TABLE orders_temp AS (
SELECT
*
FROM orders
);

SELECT
*
FROM orders_temp;

DELETE
FROM orders_temp
WHERE orderstatus = 'Delivered';