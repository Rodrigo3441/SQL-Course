-- Step 1: Write a query
-- For US customers find the total number of customers and the average score

/* 
SELECT
	COUNT(*) AS total_customers,
	AVG(score) AS avg_score
FROM sales.Customers
WHERE country = 'USA'
*/

-- Step 2: Turning the query into a stored procedure

ALTER PROCEDURE get_customer_summary @Country NVARCHAR(50) = 'USA' AS
BEGIN
	BEGIN TRY

		DECLARE @total_customers INT, @avg_score FLOAT 

		-- ============================================
		-- Step 1: Prepare and Cleanup Data
		-- ============================================
		IF EXISTS (SELECT 1 FROM sales.Customers WHERE score IS NULL AND country = @Country)
		BEGIN
			PRINT('Updating NULL Scores to 0');
			UPDATE sales.customers
			SET score = 0
			WHERE score IS NULL and country = @country;
		END

		ELSE
		BEGIN
			PRINT('No NULL Scores found');
		END;

		-- ============================================
		-- Step 2: Generating Summary Reports
		-- ============================================
		-- Calculates total customers and average for a specific country
		SELECT
			@total_customers = COUNT(*),
			@avg_score = AVG(score)
		FROM sales.Customers
		WHERE country = @Country;

		PRINT 'Total Customers from ' + @Country + ': ' +  CAST(@total_customers AS NVARCHAR);
		PRINT 'Average Score from ' + @Country + ': ' + CAST(@avg_score AS NVARCHAR);

		-- ============================================
		-- Calculate total number of orders and total sales for specific country
		-- ============================================
		SELECT
			COUNT(OrderID) AS total_orders,
			SUM(sales) AS total_sales
		FROM sales.orders AS o
		JOIN sales.customers AS c
		ON c.customerid = o.CustomerID
		WHERE c.country = @Country;
	END TRY

	-- ============================================
	-- Error Handling
	-- ============================================
	BEGIN CATCH
		PRINT('An error occurred');
		PRINT('Error Message: ' + ERROR_MESSAGE());
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR));
		PRINT('Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR));
		PRINT('Error Procedure: ' + ERROR_PROCEDURE());
	END CATCH
END

-- execute the stored procedure
EXEC get_customer_summary @Country = 'Germany'
EXEC get_customer_summary
