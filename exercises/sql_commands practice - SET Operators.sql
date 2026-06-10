USE salesdb;

SELECT
firstname,
lastname
FROM customers

UNION

SELECT
firstname,
lastname
FROM employees;

/* combine the data from employees and customers into one table */
SELECT
firstname,
lastname
FROM employees
UNION
SELECT
firstname,
lastname
FROM customers;

/* combine the data from employees and customers into one table, including duplicates */
SELECT
firstname,
lastname
FROM employees
UNION ALL
SELECT
firstname,
lastname
FROM customers;

/* find employees who are not customers at the same time */
SELECT
firstname,
lastname
FROM employees
EXCEPT
SELECT
firstname,
lastname
FROM customers;

/* find employees who are also customers */
SELECT
firstname,
lastname
FROM employees
INTERSECT
SELECT
firstname,
lastname
FROM customers;

/* orders are stored in separate tables (orders and ordersarchive)
combine all orders into one report without duplicates */

SELECT
'Orders' AS sourcetable,
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
sales,
creationtime
FROM orders
UNION
SELECT
'OrdersArchive' AS sourcetable,
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
sales,
creationtime
FROM orders_archive
ORDER BY orderid;