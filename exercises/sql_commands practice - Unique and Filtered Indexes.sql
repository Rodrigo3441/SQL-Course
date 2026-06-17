-- unique index
SELECT * FROM Sales.Products;

-- creating a unique index on column product
CREATE UNIQUE NONCLUSTERED INDEX idx_products_product ON Sales.Products (Product);

-- trying to insert duplicate data into produt tables
INSERT INTO Sales.Products (ProductID, Product) VALUES (106, 'Caps');

-- filtered index
SELECT * FROM Sales.Customers
WHERE Country = 'USA';

CREATE NONCLUSTERED INDEX idx_Customers_Country
ON Sales.Customers (Country)
WHERE Country = 'USA';