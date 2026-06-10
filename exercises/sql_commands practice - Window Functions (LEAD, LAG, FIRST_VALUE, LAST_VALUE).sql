USE salesdb;

/*
Analyze the month-over-month (MoM) performance
by finding the percentage change in sales
between the current and previous month
*/ 
SELECT
*,
(currentMonthSales - previousMonthSales) AS MoMChange,
CONCAT(
	ROUND(
			(
			currentMonthSales - previousMonthSales
			) /previousMonthSales * 100
		, 1), '%'
	) AS MoMPercentageChange
FROM (
	SELECT
		MONTH(orderdate) AS month,
		SUM(sales) AS currentMonthSales,
		LAG(SUM(sales)) OVER(ORDER BY MONTH(orderdate)) AS previousMonthSales
	FROM orders
	GROUP BY
		MONTH(orderdate)
) AS SUB;

/*
analyze customer loyalty by ranking customers
based on the average number of days between orders
*/
SELECT 
customerid,
AVG(daysUntilNextOrder) avgDays,
RANK() OVER(ORDER BY COALESCE(AVG(daysUntilNextOrder), 999999)) AS rankAVG
FROM (
	SELECT
		orderid,
		customerid,
		orderdate AS currentOrder,
		LEAD(orderdate) OVER (PARTITION BY customerid ORDER BY orderdate) AS nextOrder,
		DATEDIFF(LEAD(orderdate) OVER (PARTITION BY customerid ORDER BY orderdate), orderdate) daysUntilNextOrder
	FROM orders
) AS SUB
GROUP BY
	customerid;
    
/*
find the lowest and highest sales for each product
find the difference in sales between the current and the lowest sales
*/
SELECT
	orderid,
	productid,
	sales,
	FIRST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales ASC) AS lowestSales,
    LAST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales ASC RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS highestSales,
    FIRST_VALUE(sales) OVER(PARTITION BY productid ORDER BY sales DESC) AS highestSalesByFirstValue,
    MIN(sales) OVER(PARTITION BY productid) AS minSales,
    MAX(sales) OVER(PARTITION BY productid) AS maxSales,
    sales - MIN(sales) OVER(PARTITION BY productid) AS salesDifference
FROM orders;


