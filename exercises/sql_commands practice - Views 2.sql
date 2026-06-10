USE salesdb;

-- provide a view that combines details from orders, products, customers and employees
CREATE OR REPLACE VIEW v_order_details AS 
(
	SELECT
		o.orderid,
		o.orderdate,
		p.product,
		p.category,
		CONCAT(c.firstname, ' ', IFNULL(c.lastname, '')) AS customer_name,
		c.country AS customer_country,
		CONCAT(e.firstname, ' ', IFNULL(e.lastname, '')) AS salesperson_name,
		e.department,
		o.sales,
		o.quantity
	FROM orders AS o
		LEFT JOIN products AS p
	ON o.productid = p.productid
		LEFT JOIN customers AS c
	ON o.customerid = c.customerid
		LEFT JOIN employees AS e
	ON o.salespersonid = e.employeeid
);

SELECT *
FROM v_order_details;