USE salesdb;

/*
Rank the orders based on their sales from highest to lowest
*/
SELECT
orderid,
productid,
sales,
ROW_NUMBER() OVER(ORDER BY sales DESC) AS salesRowNumber,
RANK() OVER(ORDER BY sales DESC) AS salesRank,
DENSE_RANK() OVER(ORDER BY sales DESC) AS salesDenseRank
FROM orders;

-- find the top highest sales for each product
SELECT
orderid,
productid,
sales
FROM (
	SELECT
		orderid,
		productid,
		sales,
	ROW_NUMBER() OVER(PARTITION BY productid ORDER BY sales DESC) AS rankByProduct
	FROM orders
) AS sub WHERE rankByProduct = 1;

-- find the lowest 2 customers based on their total sales
SELECT
*
FROM (
	SELECT
		customerid,
		SUM(sales) AS totalSales,
		ROW_NUMBER() OVER (ORDER BY SUM(sales) ASC) RankCustomers
	FROM orders
	GROUP BY customerid
) AS sub WHERE RankCustomers <= 2;

-- assign unique IDs to the rows of the 'Orders Archive' table
SELECT
	ROW_NUMBER() OVER (ORDER BY orderid ASC) AS uniqueId,
	orderid,
	productid,
	customerid,
	salespersonid,
	orderdate,
	shipdate,
	orderstatus,
	shipaddress,
	billaddress,
	quantity,
	sales, creationtime
FROM orders_archive;

/*
identify duplicate rows in the table 'orders archive'
and return a clean result without any duplicates
*/
SELECT
*
FROM (
	SELECT
		*,
		ROW_NUMBER() OVER (PARTITION BY orderid ORDER BY creationtime DESC) AS uniquerows
	FROM orders_archive
) AS sub WHERE uniquerows = 1;

-- NTILE tests
SELECT
orderid,
sales,
NTILE(4) OVER (ORDER BY sales DESC) AS fourbuckets,
NTILE(3) OVER (ORDER BY sales DESC) AS threebuckets,
NTILE(2) OVER (ORDER BY sales DESC) AS twobuckets,
NTILE(1) OVER (ORDER BY sales DESC) AS onebucket
FROM orders;

-- segment all orders into 3 categories: high, medium and low sales
SELECT
*,
CASE WHEN salesBuckets = 3 THEN 'low'
	 WHEN salesBuckets = 2 THEN 'medium' 
	 WHEN salesBuckets = 1 THEN 'high'
END AS salesCategories
FROM (
	SELECT
		orderid,
        sales,
		NTILE(3) OVER(ORDER BY sales DESC) AS salesBuckets
	FROM orders
) AS sub;

/* 
In order to export the data
divide the orders into 2 group
*/
SELECT
*,
NTILE(2) OVER (ORDER BY orderid ASC) AS buckets
FROM orders;

/*
Find the products that fall within
the highest 40% of prices
*/
SELECT
*,
CONCAT(cumulativeDistance*100, '%') AS formatedPercentage
FROM (
	SELECT
		product,
		price,
		CUME_DIST() OVER(ORDER BY price DESC) AS cumulativeDistance
	FROM products
) AS sub WHERE cumulativeDistance <= 0.4;
