#### April 16th



## What is CTE

Temporary, named result set (virtual table), that can be used multiple times within your query to simplify and organize complex query 

## CTE vs Subquery

![](../images/Lecture%2028/image%2001%20-%20cte%20vs%20subquery.png)

## CTE Types

- None-Recursive CTE (Standalone CTE, Nested CTE)
- Recursive CTE

## Standalone CTE

Defined and used independently. Runs independently as it’s self-contained and doesn’t rely on other CTEs or queries

## CTE Syntax

**WITH CTE-Name AS**<br>
**(**<br>
	**SELECT**<br>
	WHERE**<br>
**)**

**SELECT**
**FROM CTE-Name**
**WHERE**

## Multiple Standalone CTEs

Use a comma in order to create more than one CTE 

**WITH CTE-Name1 AS**<br>
**(**<br>
	**SELET**<br>
	**FROM  <br>
	WHERE**<br>
**)**<br>
, **WITH CTE-Name2 AS**<br>
**(**<br>
	**SELECT**<br>
	**FROM  <br>
	WHERE**<br>
**)**

## Nested CTE - Syntax

CTE inside another CTE, a nested CTE uses the result of another CTE, so it can’t run independently

**WITH CTE-Name1 AS**<br>
**(**<br>
	**SELECT**<br>
	**FROM  <br>
	WHERE**<br>
**)**<br>
, **WITH CTE-Name2 AS**<br>
**(**<br>
	**SELECT**<br>
	**FROM CTE-Name1  <br>
	WHERE**<br>
**)**

## CTE Best Practices

- Rethink and refactor your CTEs before starting a new one
- Don’t use more than 5 CTEs in one query, otherwise, your code will be hard to understand and maintain

## Recursive CTE

Self-referencing query that repeatedly processes  data until a specific condition is met

### Syntax

**WITH CTE-Name AS**<br>
**(**<br>
**SELECT -> Anchor query**<br>
**FROM**  <br>
**WHERE**<br>

**UNION ALL / UNION**

**SELECT -> Recursive query**
**FROM CTE-Name**
**WHERE (break condition)**
**)**