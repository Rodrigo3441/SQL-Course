USE salesdb;

-- step 1: Write a query
-- for US customers find the total number of customers and the average score
SELECT
	COUNT(*) AS total_customers,
	AVG(score) AS avg_score
FROM customers
WHERE country = 'USA';

-- step 2: turning the query into a stored procedure
DELIMITER //
CREATE PROCEDURE weekly_avg()
BEGIN
	SELECT
		COUNT(*) AS total_customers,
		AVG(score) AS avg_score
	FROM customers
	WHERE country = 'USA';
END //
DELIMITER ;

-- execute
CALL weekly_avg();

-- creating a stored procedure with parameters
DROP PROCEDURE IF EXISTS weekly_avg;

-- procedure declaration
DELIMITER //
CREATE PROCEDURE weekly_avg(
	IN target_country VARCHAR(50)
)

BEGIN
	-- prepare and cleanup data
IF EXISTS (SELECT 1 FROM customers WHERE score IS NULL AND country = target_country)
THEN
	UPDATE customers
	SET score = 0
	WHERE score IS NULL AND country = target_country;
END IF;

	-- generating reports
	SELECT
		COUNT(*) AS total_customers,
		AVG(score) AS avg_score
	FROM customers
	WHERE country = target_country;
    
    -- find the total number of orders and total sales
    SELECT
		COUNT(*) total_orders,
		SUM(sales) total_sales
	FROM orders AS o
	INNER JOIN customers AS c
	ON c.customerid = o.customerid
	WHERE c.country = target_country;
    
END //
DELIMITER ;

CALL weekly_avg('USA');

-- defining the database to the default in order to execute procedures
ALTER TABLE customers
MODIFY country VARCHAR(50)
COLLATE utf8mb4_0900_ai_ci;

SET SQL_SAFE_UPDATES = 0;


