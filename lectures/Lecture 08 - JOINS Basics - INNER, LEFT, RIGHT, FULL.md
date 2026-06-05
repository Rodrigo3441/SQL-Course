#### December 2nd


## What are SQL JOINS

You use them to combine two or more tables to combine the result by matching a key value

## When to use JOINS

| Action                           | Description                                                                               | Recommended Join                                              |
| -------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Recombine data                   | The data might be in different tables, and you want to combine all data in just one table | **INNER, LEFT, FULL**                                         |
| Data Enrichment 'Get extra data' | You want to get extra information from another table                                      | **LEFT**                                                      |
| Check for Existence ‘filtering’  | Check if data from one table is in another table                                          | **INNER, LEFT + WHERE, FULL, LEFT ANTI JOIN, FULL ANTI JOIN** |
## JOIN Types

![697](image%2001%20-%20data%20types.png)

![591](image%2002%20-%20joins.png)

## Basics

### Two Results (NO JOIN)

![254](image%2003%20-%20no%20join.png)

Returns data from tables without combining them

You want to see all rows from A and B

**SELECT * FROM A; SELECT * FROM B;**

### INNER JOIN

![260](image%2004%20-%20inner%20join.png)

Return the matching rows from both tables

**SELECT * FROM A INNER JOIN B ON A.key = B.key**

ON \<condition>  you must specify a common column in both of the tables.

On INNER AND FULL JOIN, tables order doesn’t matter

#### DEFAULT: INNER

![](image%2005%20-%20default%20inner.png)

**Best Practices**

For long table names, you can add an alias for the tables, like:

**FROM customers AS c**

Then every time you want to reference that table, you use:

**c.column_name**

For clarity, you may specify which value comes from which table

## LEFT JOIN

![265](image%2006%20-%20left%20join.png)

Returns all rows from LEFT and only matching from RIGHT
A is the primary source of data and B is the secondary (additional data)

**SELECT * FROM A LEFT JOIN B ON A.key = B.key**

On LEFT JOIN, the order matter, you must specify the correct order of the tables
SQL places all data of LEFT table, and just after it, checks the matching in the RIGHT table

“You get all stuff from LEFT table, and just the matching from the RIGHT table”

## RIGHT JOIN

![262](image%2007%20-%20right%20join.png)

Returns all rows from RIGHT and only matching from LEFT
B is the primary source of data and A is the secondary (additional data)

**SELECT * FROM A RIGHT JOIN B ON A.key = B.key**

On RIGHT JOIN, the order matter, you must specify the correct order of the tables

## FULL JOIN

![259](image%2008%20-%20full%20join.png)

Returns all rows from both tables

**SELECT * FROM A FULL JOIN B ON A.key = B.key**

On INNER AND FULL JOIN, tables order doesn’t matter