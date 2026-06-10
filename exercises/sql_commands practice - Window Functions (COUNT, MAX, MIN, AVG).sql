USE salesdb;

/*
Find the total number of orders
additionally provide details such order id and order date
find the total orders for each customers
*/
SELECT 
	orderid,
	orderdate,
    customerid,
	COUNT(*) OVER() AS totalOrders,
    COUNT(*) OVER(PARTITION BY customerid) AS totalOrdersPerCustomer
FROM orders;

/*
find the total number of customers
additionally provide all customer's details
*/
SELECT
*,
COUNT(*) OVER() AS totalCustomers
FROM customers;

/*
find the total number of score for the customers
*/
SELECT
*,
COUNT(score) OVER() AS totalScores
FROM customers;

/*
Check whether the table 'Orders' contains any duplicate rows
*/
SELECT
orderid,
COUNT(*) OVER(PARTITION BY orderid) AS checkpk
FROM orders;


SELECT *
FROM (
	SELECT
		orderid,
		COUNT(*) OVER(PARTITION BY orderid) AS checkpk
	FROM orders_archive
) AS sub WHERE checkpk > 1;

/* 
find the total sales across all orders
and the total sales for each product
additionally, provide details such as order id and order date
*/

SELECT
orderid,
orderdate,
sales,
productid,
SUM(sales) OVER() AS totalSales,
SUM(sales) OVER(PARTITION BY productid) AS totalSalesPerProduct
FROM orders;

/*
find the percentage contribution of each product's sales to the total sales
*/
-- percentage for every individual product
SELECT *,
totalSalesByProduct*100/totalSales AS percentageContribution
FROM (
		SELECT
        orderid,
		productid,
        sales,
		SUM(sales) OVER() AS totalSales,
		SUM(sales) OVER(PARTITION BY productid) AS totalSalesByProduct
		FROM orders
	) as sub;
    
-- for every sale
SELECT
orderid,
productid,
sales,
SUM(sales) OVER() AS totalSales,
ROUND(sales*100/SUM(sales) OVER(), 2) AS percentageContribution
FROM orders;

/*
find the average sales across all orders
and the average sales for each product
additionally, provide details such as orderid and orderdate
*/
SELECT
orderid,
orderdate,
productid,
sales,
AVG(COALESCE(sales, 0)) OVER() AS totalAverage,
AVG(COALESCE(sales, 0)) OVER(PARTITION BY productid) AS totalProductAverage
FROM orders;

/*
find the average score of customers
additionally, provide details such as customerid and lastname
*/
SELECT
customerid,
lastname,
score,
AVG(COALESCE(score,0)) OVER() AS avgScore
FROM customers;

/*
find all orders where sales
are higher than the average sales across all orders
*/

SELECT *
FROM (
	SELECT
		orderid,
		productid,
		sales,
		AVG(COALESCE(sales, 0)) OVER() AS avgSales
	FROM orders
) AS sub WHERE sales > avgSales;

/*
find the highest and lowest sales across all orders
and the highest and lowest sales for each product
additionally, provide details such as order ID and order date
*/

SELECT
orderid,
orderdate,
productid,
sales,
MAX(sales) OVER() AS highest_sales,
MIN(sales) OVER() AS lowest_sales,
MAX(sales) OVER(PARTITION BY productid) AS highest_sales_by_product,
MIN(sales) OVER(PARTITION BY productid) AS lowest_sales_by_product
FROM orders;

-- show the employees with the highest salaries
SELECT
firstname,
lastname,
salary
FROM (
	SELECT 
	firstname,
	lastname,
    salary,
	MAX(salary) OVER () AS highest_salary
	FROM employees
) AS sub WHERE salary = highest_salary;

/*
calculate the deviation of each sale from both
the minimum and maximum sales amounts
*/

SELECT
orderid,
orderdate,
productid,
MAX(sales) OVER() highestsales,
MIN(sales) OVER() lowestsales,
sales - MIN(sales) OVER() AS deviationfrommin,
MAX(sales) OVER() - sales AS deviationfrommax
FROM orders;

-- calculate the moving average of sales for each product over time
SELECT
orderid,
productid,
orderdate,
sales,
AVG(sales) OVER(PARTITION BY productid) AS avgbyproduct,
AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate ASC) AS movingaverage
FROM orders;

/* calculate the moving average of sales for each product over time
including only the next order
*/
SELECT
orderid,
productid,
orderdate,
sales,
AVG(sales) OVER(PARTITION BY productid) AS avgbyproduct,
AVG(sales) OVER(PARTITION BY productid ORDER BY orderdate ASC ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS rollingaverage
FROM orders;