#### June 12th (I switched to Microsoft SQL Server)




## What is Stored Procedure

It's a set of SQL statements that are stored in the database in order to be used every time you want

## Stored Procedure vs Query

| Stored Procedure      | Query              |
| --------------------- | ------------------ |
| multiple transactions | 1 time transaction |
| program               | request            |
 
## Stored Procedure vs Coding with Python

Either you put your sql statements in a stored procedure or in a python code

## Stored Procedure Syntax

### Microsoft SQL Server

#### Definition

**CREATE PROCEDURE procedure_name AS**
**BEGIN**

**-- sql statements go here**

**END**

#### Execution (call)

**EXEC procedure_name**
**CALL procedure_name**

### MySQL

**DELIMITER //**<br>
**CREATE PROCEDURE weekly_avg()**<br>
**BEGIN**<br>
	**SELECT**<br>
		**COUNT(*) AS total_customers,**<br>
		**AVG(score) AS avg_score**<br>
	**FROM customers**<br>
	**WHERE country = 'USA';**<br>
**END //**<br>
**DELIMITER** ;

## Parameters

Placeholders used to pass values as input from the caller to the procedure, allowing dynamic data to be processed

Parameters pass values into a stored procedure or return values back to the caller
## Variables

Placeholders used to store values to be used later in the procedure

variables temporarily store and manipulate data during its execution 

## Error Handling

It gives you the control on what's going to happen once you have an error

**BEGIN TRY**<br>
**\-- sql statements that might cause an error**<br>
**END TRY**<br>

**BEGIN CATCH**<br>
**\-- sql statements to handle the error**<br>
**END CATCH**<br>