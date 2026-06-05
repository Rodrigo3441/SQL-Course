#### November 28th


DDL commands do not retrieve data, just create or alter the structure of the data

## CREATE

Define the structure of your data

**CREATE DATABASE**
**CREATE TABLE**

![357](../images/Lecture%2005/image%2001%20-%20CREATE.png)
![](../images/Lecture%2005/image%2002%20-%20ALTER.png)

You can use **CONSTRAINT alias PRIMARY KEY (column)** to define the **PRIMARY KEY** of a table

## ALTER

if you want to edit a table, you can use table to remove, add or change the type of a column

![526](../images/Lecture%2005/image%2003%20-%20ALTER.png)

About adding columns, the new column are appended at the end of table by default.
If you want to change the order of the columns, you’ll have to DROP table, and then create again

## DROP

Used to delete a database or a table.

**DROP TABLE table_name**
**DROP DATABASE database_name**