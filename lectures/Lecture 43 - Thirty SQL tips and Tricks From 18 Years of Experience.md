#### June 17th



## Golden Rule

For small-medium tables, the query optimizer may react similarly to different query styles

Always check the `execution plan` to confirm performance improvements when optimizing your query

if there's no improvement, then just focus on `readability`


## Best Practices

### Fetching Data

#### Tip 01: Select Only What You Need

``` bash
-- Bad Practice
SELECT * FROM Sales.Customers;

-- Good Practice
SELECT CustomerID, FirstName, LastName FROM Sales.Customers;
```


#### Tip 02: Avoid Unnecessary DISTINCT and ORDER BY

``` bash
-- Bad Practice
SELECT DISTINCT
	FirstName
FROM Sales.Customers
ORDER BY FirstName;

-- Good Practice
SELECT
	FirstName
FROM Sales.Customers;
```


#### Tip 03: For Exploration Purpose, Limit rows!

``` bash
-- Bad Practice
SELECT
	OrderID,
	Sales
FROM Sales.Orders;

-- Good Practice
SELECT TOP 10
	OrderID,
	Sales
FROM Sales.Orders;
```



### Filtering Data
#### Tip 04: Create nonclustered Index on frequently used Column in WHERE clause

``` bash
SELECT * FROM Sales.Orders WHERE OrderStatus = 'Delivered'

-- Good Practice
CREATE NONCLUSTERED INDEX idx_Orders_OrderStatus ON Sales.Orders(OrderStatus);
```


#### Tip 05: Avoid applying functions to columns in WHERE clauses

**Example 01**

```bash
-- Bad Practice
SELECT * FROM Sales.Orders
WHERE LOWER(OrderStatus) = 'delivered';

-- Good Practice
SELECT * FROM Sales.Orders
WHERE OrderStatus = 'Delivered';
```


**Example 02**

```bash
-- Bad Practice
SELECT *
FROM Sales.Customers
WHERE SUBSTRING(FirstName, 1, 1) = 'A';

-- Good Practice
SELECT *
FROM Sales.Customers
WHERE FirstName LIKE 'A%';
```


**Example 03**

```bash
-- Bad Practice
SELECT *
FROM Sales.Orders
WHERE YEAR(OrderDate) = 2025;

-- Good Practice
SELECT *
FROM Sales.Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-12-31';
```


#### Tip 06: Avoid leading wildcards as they prevent index usage ('%value')

```bash
-- Bad Practice
SELECT *
FROM Sales.Customers
WHERE LastName LIKE '%Gold%';

-- Good Practice
SELECT *
FROM Sales.Customers
WHERE LastName LIKE 'Gold%';
```


#### Tip 07: Use IN instead of Multiple OR

```bash
-- Bad Practice
SELECT *
FROM Sales.Orders
WHERE CustomerID = 1 OR CustomerID = 2 OR CustomerID = 3;

-- Good Practice
SELECT *
FROM Sales.Orders
WHERE CustomerID IN (1, 2, 3);
```

### Joining Data
#### Tip 08: Understand the speed of joins and use INNER JOIN when possible

```bash
-- Best performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c INNER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID;

-- Slightly Slower Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c RIGHT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID;
SELECT c.FirstName, o.OrderID FROM Sales.Customers c LEFT JOIN Sales.Orders o ON c.CustomerID = o.CustomerID;

-- Worst Performance
SELECT c.FirstName, o.OrderID FROM Sales.Customers c OUTER JOIN Sales.Orders o ON c.CustomerID = o.CustomerID;
```


#### Tip 09: Use explicit join (ANSI Join) Instead of Implicit Join (non-ANSI Join)

```bash
-- Bad Practice
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c,
	Sales.Orders o
WHERE c.CustomerID = o.CustomerID;

-- Good Practice
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID;
```

#### Tip 10: Make sure to index the columns used in the ON clause

```bash
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID;

-- o.CustomerID is a foreign key
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Sales.Orders(CustomerID)
```


#### Tip 11: Filter Before Joining (Big Tables)

**Filter After Join (WHERE)**

```bash
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Delivered';
```


**Filter During Join (ON)**

```bash
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID
AND o.OrderStatus = 'Delivered';
```


**Filter Before Join (SUBQUERY)**

```bash
SELECT
	o.OrderID,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN (SELECT OrderID, CustomerID FROM Sales.Orders WHERE OrderStatus = 'Delivered') o
ON c.CustomerID = o.CustomerID;
```


#### Tip 12: Aggregate Before Joining (Big Tables)

**Group and Joining**
```bash
-- Best Practice for Small-Medium tables
SELECT
	c.CustomerID,
	c.FirstName,
	COUNT(o.OrderId) AS orderCount
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;
```


**Pre-Aggregated Subquery**
```bash
-- Best Practice For Big Tables
SELECT
	c.CustomerID,
	c.FirstName,
	o.OrderCount
FROM
	Sales.Customers c
INNER JOIN (
	SELECT CustomerID, COUNT(OrderID) AS orderCount
	FROM Sales.Orders
	GROUP BY CustomerID
) o
ON c.CustomerID = o.CustomerID;
```


**Correlated Subquery**

``` bash
-- Bad Practice

SELECT
	c.CustomerID,
	c.FirstName,
	(SELECT COUNT(o.OrderID)
	FROM Sales.Orders o
	WHERE o.CustomerID = c.CustomerID) AS orderCount
FROM Sales.Customers c;
```


#### Tip 13: Use Union instead of OR in Joins

```bash
-- Bad Practice
SELECT
	o.OrderId,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID
OR c.CustomerID = o.SalesPersonID;

-- Good Practice
SELECT
	o.OrderId,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.CustomerID
UNION
SELECT
	o.OrderId,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON c.CustomerID = o.SalesPersonID;
```

#### Tip 14: Check for Nested Loops and Use SQL

```bash
SELECT
	o.OrderId,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN 
	Sales.Orders o
ON c.CustomerID = o.CustomerID;

-- Good practice for having big table and small table
SELECT
	o.OrderId,
	c.FirstName
FROM
	Sales.Customers c
INNER JOIN 
	Sales.Orders o
ON c.CustomerID = o.CustomerID
OPTION (HASH JOIN);
```


#### Tip 15: use UNION ALL instead of using UNION | duplicates are acceptable

``` bash
-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive;

-- Best Practice
SELECT CustomerID FROM Sales.Orders
UNION ALL
SELECT CustomerID From Sales.OrdersArchive;
```

#### Tip 16: Use UNION ALL + DISTINCT instead of using UNION | duplicates are not acceptable

```bash
-- Bad Practice
SELECT CustomerID FROM Sales.Orders
UNION
SELECT CustomerID FROM Sales.OrdersArchive;

-- Best Practice
SELECT DISTINCT CustomerID
FROM (
	SELECT CustomerID FROM Sales.Orders
	UNION ALL
	SELECT CustomerID FROM Sales.OrdersArchive
) AS combinedData;
```


### Aggregating Data

#### Tip 17:  Use columnstore index for aggregations on large tables

``` bash
SELECT CustomerID, COUNT(OrderID) AS orderCount
FROM Sales.Orders
GROUP BY CustomerID;

CREATE CLUSTERED COLUMNSTORE INDEX Idx_Orders_Columnstore ON Sales.Orders;
```


#### Tip 18: Pre-Aggregate data and store it in new table for reporting

``` bash
SELECT
	MONTH(OrderDate) orderYear,
	SUM(Sales) AS totalSales
INTO
	Sales.SalesSummary
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

SELECT orderYear, totalSales FROM Sales.SalesSummary;
```


### Subqueries
#### Tip 19: JOIN x EXISTS x IN

**JOIN (Best Practice : If the performance equals to EXISTS)**

```bash
SELECT
	o.OrderID,
	o.Sales
FROM
	Sales.Orders o
INNER JOIN
	Sales.Customers c
ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA';
```


**EXISTS (Best Practice: Use it for large tables)**
```bash 
SELECT
	o.OrderID,
	o.Sales
FROM
	Sales.Orders o
WHERE EXISTS (
	SELECT 1
	FROM Sales.Customers c
	WHERE c.CustomerID = o.CustomerID
	AND c.Country = 'USA'
);
```

EXISTS better than JOIN because it stops at first match and avoid data duplication


**IN (Bad Practice)**
```bash
SELECT
	o.OrderID,
	o.Sales
FROM
	Sales.Orders o
WHERE o.CustomerID IN (
	SELECT CustomerID
	FROM Sales.Customers
	WHERE Country = 'USA'
);
```

The IN operator processes and evaluates all rows. It lacks an early exit mechanism

#### Tip 20: Avoid redundant logic in your query

```bash
-- Bad Practice
SELECT EmployeeID, FirstName, 'Above Average' Status
FROM Sales.Employees
WHERE Salary > (SELECT AVG(Salary) FROM Sales.Employees)
UNION ALL
SELECT EmployeeID, FirstName, 'Below Average' Status
FROM Sales.Employees
WHERE Salary < (SELECT AVG(Salary) FROM Sales.Employees)

-- Good Practice
SELECT
	EmployeeID,
	FirstName,
	CASE
		WHEN Salary > (AVG(Salary) OVER ()) THEN 'Above Average'
		WHEN Salary < (AVG(Salary) OVER ()) THEN 'Below Average'
		ELSE 'Average'
	END AS Status
FROM Sales.Employees
```


### Creating Tables (DDL)

#### Tips 21 until 25

- **Tip 21: Avoid Data types VARCHAR and TEXT**
- **Tip 22: Avoid (MAX) unnecessarily large lengths in data types**
- **Tip 23: Use the NOT NULL constraint where applicable**
- **Tip 24: Ensure all your tables have a clustered primary key**
- **Tip 25: Create a non-clustered index for foreign keys that are used frequently**

```bash
-- Bad Practice
CREATE TABLE CustomersInfoBadPractice(
	CustomerID INT,
	FirstName VARCHAR(MAX),
	LastName TEXT,
	Country VARCHAR(255),
	TotalPurchases FLOAT,
	Score VARCHAR(255),
	BirthDate VARCHAR(255),
	EmployeeID INT,
	CONSTRAINT FK_CustomerInfo_EmployeeID
	FOREIGN KEY (EmployeeID)
	REFERENCES Sales.Employees(EmployeeID)
);

-- Good Practice
CREATE TABLE CustomersInfo(
	CustomerID INT PRIMARY KEY CLUSTERED,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Country VARCHAR(50) NOT NULL,
	TotalPurchases FLOAT,
	Score INT,
	BirthDate DATE,
	EmployeeID INT,
	CONSTRAINT FK_CustomerInfo_EmployeeID
	FOREIGN KEY (EmployeeID)
	REFERENCES Sales.Employees(EmployeeID)
);
```


### Indexing

#### Tips 26 until 30

- **Tip 26: Avoid Over Indexing**
- **Tip 27: Drop Unused Indexes** 
- **Tip 28: Updated Statistics (Weekly)**
- **Tip 29: Reorganize and Rebuild Indexes (Weekly)**
- **Tip 30: Partition Large Tables (Facts) to improve performance next, apply a columnstore index for the best results**


## Final Thoughts

- Focus on writing clear queries
- Optimize performance only when necessary
- Always test using execution plan

