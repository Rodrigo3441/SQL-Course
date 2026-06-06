#### April 16th



## What is CTE

Temporary, named result set (virtual table), that can be used multiple times within your query to simplify and organize complex query

## CTE Types

- None-Recursive CTE (Standalone CTE, Nested CTE)
- Recursive CTE

## Standalone CTE

Defined and used independently. Runs independently as it’s self-contained and doesn’t rely on other CTEs or queries

## CTE Syntax

**WITH CTE-Name AS**
**(**
	**SELECT**
	**FROM  
	WHERE**
**)**

**SELECT**
**FROM CTE-Name**
**WHERE**

## Multiple Standalone CTEs

Use a comma in order to create more than one CTE 

**WITH CTE-Name1 AS**
**(**
	**SELET**
	**FROM  
	WHERE**
**)**
, **WITH CTE-Name2 AS**
**(**
	**SELECT**
	**FROM  
	WHERE**
**)**

## Nested CTE - Syntax

CTE inside another CTE, a nested CTE uses the result of another CTE, so it can’t run independently

**WITH CTE-Name1 AS**
**(**
	**SELECT**
	**FROM  
	WHERE**
**)**
, **WITH CTE-Name2 AS**
**(**
	**SELECT**
	**FROM CTE-Name1  
	WHERE**
**)**

## CTE Best Practices

- Rethink and refactor your CTEs before starting a new one
- Don’t use more than 5 CTEs in one query, otherwise, your code will be hard to understand and maintain

## Recursive CTE

Self-referencing query that repeatedly processes  data until a specific condition is met

### Syntax

**WITH CTE-Name AS**
**(**
**SELECT -> Anchor query**
**FROM  
WHERE

**UNION ALL / UNION

**SELECT -> Recursive query**
**FROM CTE-Name**
**WHERE (break condition)**
**)**