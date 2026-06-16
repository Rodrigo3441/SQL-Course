-- creating a table as select
SELECT *
INTO Sales.DBCustomers
FROM Sales.Customers

-- creating a clustered index
CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID
ON Sales.DBCustomers (CustomerID)

-- queries frenquently used
SELECT
*
FROM Sales.DBCustomers
WHERE LastName = 'Brown';

SELECT
*
FROM Sales.DBCustomers
WHERE FirstName = 'Anna';

-- creating indexes on columns frequently used
CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
ON Sales.DBCustomers (LastName);

CREATE NONCLUSTERED INDEX idx_DBCustomers_FirstName
ON Sales.DBCustomers (FirstName);

-- Composite Indexes
SELECT *
FROM Sales.DBCustomers
WHERE Country = 'USA' AND Score > 500;

CREATE INDEX idx_DBCustomers_CountryScore
ON Sales.DBCustomers (Count ry, Score);

-- Clustered columnstore indexing
CREATE CLUSTERED COLUMNSTORE INDEX idx_DBCustomers_CS
ON Sales.DBCustomers;

DROP INDEX idx_DBCustomers_CS ON Sales.DBCustomers;

CREATE NONCLUSTERED COLUMNSTORE INDEX idx_DBCustomers_CS_FirstName
ON Sales.DBCustomers (FirstName);