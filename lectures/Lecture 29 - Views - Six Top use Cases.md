#### June 10th



## Database Structure and DDL

![](../images/Lecture%2029/image%2001%20-%20database%20structure.png)

### Database Server

Stores, manages and provides access to databases for users or applications

### Database

Collection of information that is sotred in a structured way

### Schema

Inside each database we can find multiple schemas. Schema is like a logical layer that groups related objects together

### Table

A place where data is stored and organized into rows and columns

### View

It's a virtual table that shows data without storing it physically

### DDL - Data Definition Language

A set of commands that allows us to define and manage the structure of a database

Some commands:

- CREATE
- ALTER
- DROP
## Three Levels Architecture

- View Level
- Logical Level
- Physical Level

### Physical Level (Internal)

It's the lowest level of the database where actual data is stored, and usually who has access to this layer is DBA (database administrators)

DBAs usually manages:

- Data Files
- Partitions
- LOGs
- Catalog
- Blocks
- Caches

### Logical Level (Conceptual)

At this level you have to deal on how to organize your data. Normally we have applications developer or we have like data engineers that access that access the logical level in order to define the structure of the data.

Some tasks at this level:

- Tables
- Relationships
- Views
- Indexes
- Procedures
- Functions

### View Level (External)

The highest level of abstraction in the database. You can have set of views for each group. 

The focus of this layer is to make it friendly for the end users

## What are Views

Virtual table based on the result set of query, without storign the data in database. Views are persisted SQL queries in the database.

Views have the same structure as normal tables, but without any data inside it.

For each view there is like a query attached to it. We don't have data, but we have the query to get the data

- **Normal table:** Physical table
- **View table:** Virtual table

If you select data from the view, SQL will trigger the query that is attached to the view and it will query the physicall table and then the result will fit the structure of the view.

Views are like a persited logic in the database

| Table          | View              | Query                     |
| -------------- | ----------------- | ------------------------- |
| physical table | Virtual table     | Query sent to the databae |
| Real data      | Abstraction layer | you                       |

## Views vs Tables

| View             | Table            |
| ---------------- | ---------------- |
| No persistance   | Persited Data    |
| Easy to Maintain | Hard to Maintain |
| Slow response    | Fast response    |
| Read only        | Read/Write       |

## Views vs CTE

| Views                                | CTEs                           |
| ------------------------------------ | ------------------------------ |
| Reduce redundancy in multi-queries   | Reduce redundancy in 1 query   |
| Improve reusability in multi-queries | Improve reusability in 1 query |
| Persisted logic                      | Temporary logic                |
| Need to maintain (CREATE/DROP)       | No maintenance (Auto cleanup)  |

## Views Syntax

**CREATE VIEW VIEW_NAME AS** <br>
**(**<br>
**SELECT**<br>
**FROM**<br>
**WHERE**<br>
**)**

## Views - Use Cases

### #1 - Central Complex Query Logic

Store central complex query logic in the database, for access by multiple queries, reducing project complexity

### #2 - Hide Complexity

Views can be used to hide the complexity of database tables and offers users more friendly and easy-to-consume objects

### #3 Data Security

Use views to enforce security and protect sensitive data, by hiding columns and/or rows from tables

### #4 Flexibility and Dynamic

They allow you to make changes in the database without breaking analyst's queries and scripts.

Since the database consumers such as data analiysts, data scientists and so on frequentely query the data, you cannot make modifications in the database, because it'll break scripts and make everyone to scream. 

Instead of it, you give them access to the view, and you can feel free to make any modifications that you want to the database, as long as you update the view to the same result structure as before.

### #5 Multiple Languages

You can also use views to provide different result languages, such as table and column names

### #6 Virtual Data Marts in DWH

Views can be used as data marts in data warehouse system, because they provide a flexibe and efficient way to present data.

**Data Mart:** It's a strucute/access pattern to data warehouse environments. The data mart is a subset of the data warehouse that focuses on a specific businnes line, department, subject area, or team

![](../images/Lecture%2029/image%2002%20-%20datawarehouse%20views%20usecase.png)


## Summary

Virtual table based on result of query without storing data
We use views to persis complex SQL query in database
Views are better than CTE - improves reusability in multiple queries
Views are better than tables - flexible and easy to maintain