#### June 11th




## What are Temporary Tables

Stores intermediate results in temporary storage within the database during the session

The database will drop all temporary tables once the session ends

## Session

The time between connecting to and disconnecting from the database

## Syntax and Example

**CREATE TEMPORARY TABLE table-name AS
(**
**SELECT**
**FROM table_name2
);**

## Temp Use Cases

### #1 Intermediate Results 

In ETL projects related to data warehouse, we are not allowed to modify directly the main data table, so we need to use temp tables in order to store the intermediate result of data transformations before loading it into the final storage system


## Summary

Structured collection of data like spreadsheet (columns and rows)

### Types

**Permanent: data live forever in database**
- CREATE / INSERT
- CTAS: Create Table as Select

**Temporary: Data live only during the session**

### CTAS Use Cases

- Optimize performance: persist complex SQL logic in table
- Creating Snapshot: to analyse bugs and data issues

### Advantage of Temp Tables

- Automatic cleanup of data after session ends