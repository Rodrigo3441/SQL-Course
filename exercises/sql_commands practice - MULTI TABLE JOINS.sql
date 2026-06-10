USE salesdb;

/* using salesdb, retrieve a list of all orders, along with the related customers, product,  and employee details. For each order, display:
Order ID, Customer's Name, Product name, Sales, Price, Sales person's name */

SELECT
o.orderid AS order_id,
c.firstname AS customer_first_name,
c.lastname AS customer_last_name,
p.product AS product_name,
o.sales AS sales,
p.price AS price,
e.firstname AS sales_person_name
FROM orders AS o
LEFT JOIN customers AS c
ON o.customerid = c.customerid
LEFT JOIN products AS p
ON o.productid = p.productid
LEFT JOIN employees AS e
ON o.salespersonid = e.employeeid;

SELECT *
FROM customers;

SELECT *
FROM employees;

SELECT *
FROM orders;

SELECT *
FROM products;
