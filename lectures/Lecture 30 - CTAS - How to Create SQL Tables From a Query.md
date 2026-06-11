#### June 11th



## What are database tables?

A table is a structured colletion of data, similar to a spreadsheet or grid (excel)

- **Column:** represent fields
- **Row:** represent records (each line is a unique record)

## Table types

### Permanent Tables

Stays forerer as long as you don't drop them

Ways to create them:

- **CREATE/SELECT**
- **CTAS**
### Temporary Tables

will be deleted once the search ends


## CREATE/INSERT vs CTAS

### CREATE/INSERT

1. Create | Define the structure of table
2. Insert | Insert Data into the table 

## CTAS (Create Table as Select)

Create a new table based on the result of an SQL query

The definition and the data will be automatically defined by the result of the query


## CTAS vs Views

| CTAS                                        | View                                                                          |
| ------------------------------------------- | ----------------------------------------------------------------------------- |
| Stored data                                 | Do not store data, only the query that is responsible for retrieving the data |
| The query of CTAS has been executed already | The query of view has not yet been executed                                   |

Querying views is slower than querying CTAS tables, because each time you select something from a view, the database needs to retrieve the data from another table in order to fill the virtual table and then your query is executed

CTAS can retrieve outdated data! because they hold static data and they are not updated each time you query them

in other hand Views always retrieve new data, because each time you query a view, it needs to query another table in order to get the data and then retrieve the data for you

## CREATE/INSERT and CTAS Syntax

### CREATE/INSERT

#### DDL Statement

**CREATE TABLE table_name**
**(**
	**ID INT,**
	**Name VARCHAR (50)** 
)

#### Insert Statement

**INSERT INTO table_name
VALUES (1, 'Frank')**

### CTAS

**CREATE TABLE name AS**
**(**
**SELECT**
**FROM**
**WHERE**
**)**

## CTAS - Use Cases

### #1 Optimize Performance

Sometimes a view can take really long time until retrieving the data, so you can replace a view with a CTAS, so the intermediate result will executed only once (maybe in the morning) and will be stored, then the users can have a really fast access

### #2 Creating a Snapshot

In some scenarios you might have to analyse data quality issues in a table, but at the same time the table keeps being updated, so you may not be able to analyse the data. 

in order to solve that, you can use snapshots in order to store the data and analyse it without having the data updated

### #3 Physical Data Mart

Persisting the Data Marts of a DWH improves the speed of data retrieval compared to using viewsf