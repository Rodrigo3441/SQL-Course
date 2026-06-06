#### December 4th

## What are SET OPERATORS

Combine the results of multiple queries into a single result set.

## Difference between JOINs and SETs

### JOINs

Used to combine columns, must be connected by a Key column

#### TYPES OF JOINS

**INNER JOIN, LEFT JOIN, RIGHT JOIN AND FULL JOIN**

![236](../images/Lecture%2011/image%2001%20-%20join%20example.png)

### SETs

Combine the rows, must havethe same number of colums

#### TYPES OF SETS

**UNION, UNION ALL, EXCEPT, INTERSECT**

![157](../images/Lecture%2011/image%2002%20-%20set%20example.png)

## Syntax and Rules

**SELECT \***
**FROM Customers**

**UNION**

**SELECT \***
**FROM Employees**

You have two different queries, and you put the SET operator between them

### \#1 Rule | SQL Clauses

SET Operators can be used almost in all clauses
WHERE | JOIN | GROUP BY | HAVING

But there is one exception

ORDER BY is allowed only once at the end of query

Do not use ORDER BY in each query, only at the end

Example:

**SELECT \***
**FROM Customers**

**UNION**

**SELECT \***
**FROM Employees**

**ORDER BY FirstName**

### \#2 Rule | Number of Column

The number of columns in each query must be the same

![390](../images/Lecture%2011/image%2003%20-%20union%20example.png)

### \#3 Rule | Data Types

Data types of columns in each query must be compatible

| ![](../images/Lecture%2011/image%2004%20-%20employees%20table.png) | ![212](../images/Lecture%2011/image%2005%20-%20customers%20table.png) |
| ------------------------------------------- | ---------------------------------------------- |
Using the previous query as example, as you can see, each specified column has the same data type

### \#4 Rule | Order of Column

The order of the columns in each query must be the same

![393](../images/Lecture%2011/image%2006%20-%20union%20example%202.png)

As you can see, both queries start with firstname and after, lastname.

### \#5 Rule | Column Aliases

The column names in the result set are determined by the column names specified in the first query.

The first query is responsible for naming the columns of the result.

### \#6 Rule | Correct Column

Even if all rules are met and SQL show no errors, the result may be incorrect.

Incorrect column selection leads to inaccurate results.

**In short, all rules**

1. ORDER BY can be used only once
2. Same number of columns
3. Matching data types
4. Same order of columns
5. First query controls aliases
6. Mapping correct columns


## UNION

![165](../images/Lecture%2011/image%2007%20-%20union.png)

Return all DISTINCT and UNIQUE rows from both queries

Removes duplicate rows from the result

## UNION ALL

![168](../images/Lecture%2011/image%2008%20-%20union%20all.png)

Returns all rows from both queries, including duplicates

**UNION ALL is generally faster than UNION**

If you’re confident there are no duplicates, use UNION ALL

Use UNION ALL to find duplicates and quality issues

## EXCEPT (MINUS)

![159](../images/Lecture%2011/image%2009%20-%20except%20minus.png)

Returns all distinct rows from the first query that are not found in the second query

The order of the queries affects the final result

It is the only one where the order of queries affects the final result

## INTERSECT

![168](../images/Lecture%2011/image%2010%20-%20intersect.png)

Return only the rows that are common in both queries, and remove duplicates as well

## UNION Uses - Combine Information

Combine similar information before analyzing the data

![](../images/Lecture%2011/image%2011%20-%20union%20use%20case%201.png)


Database developers divide the data into multiple tables to optimize performance and archive old data

![](../images/Lecture%2011/image%2012%20-%20union%20use%20case%202.png)


You can add a static column in your data analysis to specify the source of the data (where the data comes from)

![](../images/Lecture%2011/image%2013%20-%20static%20column.png)

Result

![697](../images/Lecture%2011/image%2014%20-%20static%20column%20result.png)


## EXCEPT Use Cases
### Delta Detection

Identifying the difference or changes (delta) between two batches of data

For example, data engineers build data pipelines in order to load daily new data from the source systems to a data warehouse of a data lake. Now in those data pipelines we have to build a logic in order to identify what are the new data that is generated from the source system in order to insert it inthe data warehouse. One way to do it is to use the set operator except in order to compare the current data with the previous load.

### Data Completeness Check

Except operator can be used to compare tables to detect discrepancies between databases

For example, you want to pass all records from Database A to Database B, and after doing the process, you want to check if all data have been moved successfully, then you can use the SET operator EXCEPT between the two tables from the two Databases, in order to find any record that is still in Database A which is not migrated to the Database B, and the best result is that we will not get anything. That means all the rows from database A exist in the database B.

## Summary

![](../images/Lecture%2011/image%2015%20-%20summary.png)