-- show the employee hierarchy by displaying each employee's level within the organization
USE salesdb;

-- anchor query

WITH RECURSIVE hierarchy AS
(
SELECT
employeeid,
firstname,
managerid,
1 AS level
FROM employees
WHERE managerid IS NULL

UNION ALL

-- recursive query
SELECT
e.employeeid,
e.firstname,
e.managerid,
level + 1
FROM employees AS e
INNER JOIN hierarchy AS h
ON e.managerid = h.employeeid
)


-- main query

SELECT *
FROM hierarchy