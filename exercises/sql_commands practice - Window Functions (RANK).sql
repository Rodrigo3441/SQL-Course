USE salesdb;

-- find the total sales across all orders
SELECT 
SUM(sales) AS total_sales
FROM orders;

-- find the total sales for each product
SELECT
productid,
SUM(sales) AS total_sales
FROM orders
GROUP BY productid;

-- find the total sales for each product
-- additionally provide details such orderid and order date
SELECT
productid,
orderid,
orderdate,
SUM(sales) OVER(PARTITION BY productid) AS total_sales
FROM orders;

-- find the total sales across all orders
-- additionally provide details such orderid and orderdate
SELECT 
orderid,
orderdate,
productid,
SUM(sales) OVER() AS total_sale
FROM orders;


-- find the total sales across all orders
-- find the total sales for each product
-- additionally provide details such orderid and orderdate
SELECT 
orderid,
orderdate,
productid,
SUM(sales) OVER(PARTITION BY productid) AS total_sale
FROM orders;

-- find the total sales across all orders
-- find the total sales for each product
-- additionally provide details such orderid and orderdate
SELECT 
orderid,
orderdate,
productid,
sales,
SUM(sales) OVER(PARTITION BY productid) AS total_sale_by_product,
SUM(sales) OVER() AS total_sales
FROM orders;

-- find the total sales for each combination of product and order status
SELECT 
orderid,
orderdate,
productid,
orderstatus,
SUM(sales) OVER(PARTITION BY productid, orderstatus) AS sales_by_product_and_status
FROM orders;

-- rank each order based on their sales from highest to lowest
-- additionally provide details such order id and order date

SELECT
orderid,
orderdate,
sales,
RANK() OVER (ORDER BY sales DESC) AS rank_sales
FROM orders;


-- ROWS FRAME
SELECT 
orderid,
orderdate,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY orderstatus ORDER BY orderdate ROWS 2 PRECEDING) total_sales
FROM orders;

-- find the total sales for each order status, only for two products 101 and 102
SELECT 
orderid,
productid,
orderdate,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY orderstatus) total_sales
FROM orders
WHERE productid IN (101, 102);

-- rank customers based on their total sales
SELECT 
customerid,
SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS rank_customer
FROM orders
GROUP BY customerid;