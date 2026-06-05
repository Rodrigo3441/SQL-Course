
## How to query the data using SQL

Commands

**SELECT, DISTINCT, TOP(LIMIT) FROM, WHERE, GROUP BY, ORDER BY, HAVING**

## What is a SQL Query

SQL Query can be understood as a command line that focus in answer question about your data stored inside a database.

![erro](../images/Lecture%2004/image%2001%20-%20flowchart.png)

## SQL Clauses

### SELECT \*
Retrieves All Columns (Everything)

### FROM
Tells SQL Where to find your data

**SELECT * FROM table_name**
Retrieves the whole table, and then select everything

**SELECT few columns**
Pick only the columns you need instead of all

**SELECT**
**Col 1,**
**Col 2,**
**FROM table_name**

### WHERE
Filter your data based on a condition
**SELECT \***
**FROM**
**WHERE** **condition**

### ORDER BY
Sort your data
It can be **ASC** or **DESC** (Ascending or Descending)
**SELECT \***
**FROM**
**ORDER BY column_used_to_order mechanism(ASC/DESC)**
Default mechanism is **ASC**, but it is important to write for code clarity

**SORT DATA USING MULTIPLE COLUMNS (NESTED SORTING)**
**ORDER BY col1 ASC, col2, DESC**
The order of columns is very important.

### GROUP BY
Combine rows with the same value
Aggregates a column by another column
Total score by country

**SELECT**
**Country, -> Category**
**SUM(score) -> Aggregation**
**From table**
**GROUP BY country**

| <img src="../images/Lecture 04/image 02 - group by.png" style="width: 200px; height: auto;">
 | <img src="../images/Lecture 04/image 03 - group by result.png" style="width: 200px; height: auto;"> |
| ------------------------------------ | ------------------------------------------------ |
You can combine all of them
**SUM() AS name:** Alias (shorthand name assigned to a column or table in a query)

#### GROUP BY RULE
All columns in the SELECT must be either aggregated or included in the GROUP BY

## HAVING

Filter data after aggregation, can be used only with GROUP BY

**GROUP BY**
**HAVING condition**

**WHERE =** Before aggregation
**HAVING =** After aggregation

Query that finds the average score for each country, considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430:

**SELECT**
	country,
	AVG(score) AS average_score
**FROM customers**
**WHERE score != 0**
**GROUP BY country**
**HAVING average_score > 430**

## DISTINCT

Removes duplicates (repeated values)
Each value appears only once

| ![262](../images/Lecture%2004/image%2004%20-%20distinct.png) | ![205](../images/Lecture%2004/image%2005%20-%20distinct%20result.png) |
| ------------------------------------- | ---------------------------------------------- |

## TOP / LIMIT

Restrict the number of rows returned in the results

**SELECT \***
**FROM Table**
**LIMIT 3**

## Coding Order

**SELECT DISTINCT TOP 2**
	**COL1,**
	**SUM(COL2)**
**FROM TABLE**
**WHERE COL = 10**
**GROUP BY COL1**
**HAVING SUM(COL2)>30**
**ORDER BY COL1 ASC**

1-      Filter Columns<br>
2-      Filter Duplicates<br>
3-      Filter Result Rows<br>
4-      Filter Rows Before Aggregation<br>
5-      Filter rows after aggregation<br>

### Execute Order

1-      FROM<br>
2-      WHERE<br>
3-      GROUP BY<br>
4-      HAVING<br>
5-      SELECT DISTINCT<br>
6-      ORDER BY<br>
7-      TOP<br>

## My Comments

In SQL, you cannot use the alias total_students inside HAVING. That alias only works in the SELECT and ORDER BY sections.