#### November 28th


## INSERT

There are two methods to insert data into tables in SQL
### Manually Entry (Values)
You type a query and specify the data manually using SQL scripts
### Insert Using SELECT

You insert the results of a SELECT query from one table into another table
It can be made using INSERT INTO + SELECT QUERY

First you retrieve the data with SELECT Query, then, you insert the results with INSERT INTO (you write just one query INSERT + SELECT)

### MANUALLY INSERT SYNTAX

**INSERT INTO table_name (column1, column2, column3)**
**VALUES (value1, value2, value3);**

First you must specify the columns you want to insert information into the table and then, you must specify the data you will insert into the table.

### IMPORTANT

Columns and values must be in the same order.
If no columns are specified, SQL expects values for all columns.

The database doesn’t care about the order of the values as long as they match the correct data types, However, you must not enter values into the wrong column. (Matching data types, column count and constraints)

You can skip the columns if you insert values for every column

Columns not included in INSERT become NULL (unless a default or constraint exists)

### TIPS

Always list columns explicitly for clarity and maintainability

### Insert Using SELECT Syntax

![465](../images/Lecture%2006/image%2001%20-%20INSERT.png)

First, you retrieve the data from the source table, and then, the results are inserted into the destination table

You must match the data types to avoid errors

## UPDATE

Change the data of already existing row

### UPDATE SYNTAX

**UPDATE table_name**
**SET**
**column1 = value1,**
**column2 = value2**
**WHERE \<condition>**

### Note

ALWAYS use WHERE to avoid updating all rows unintentionally, **without a WHERE, all rows will be updated!**

### Best Practice

Check with SELECT before running UPDATE to avoid updating the wrong data

## DELETE

Delete a row from the table

### DELETE SYNTAX

**DELETE FROM table_name**
**WHERE \<condition>**

### Note

ALWAYS use WHERE to avoid DELETING all rows unintentionally, **without a WHERE, all rows will be deleted!**

## TRUNCATE

Clears the whole table at once without checking or logging (it has a better performance than DELETE FROM tbl_name)

Behind the scenes, DELETE FROM is much slow due logs and protocols.