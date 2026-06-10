USE salesdb;

-- provide a view for the EU sales team that combines details from all tables and excludes related to the USA

CREATE OR REPLACE VIEW v_order_details_eu AS 
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
    WHERE c.country != 'USA'
);

SELECT *
FROM v_order_details_eu;