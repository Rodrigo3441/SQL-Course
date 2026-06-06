#### April 4th



## What is Subquery

A query inside another query, they can be used in order to simplify queries

## Why Subqueries

In complex tasks, you might have to do several in the same query, and it can get very difficult, because the query can become unreadable and very long to debug.

**Example**

| **Steps for a task**    | **Query (non-subquery)**                                        | **Subquery** |
| ----------------------- | --------------------------------------------------------------- | ------------ |
| Step 1: Join Tables     | Will be a really big query, really hard to debug and understand | Query 1      |
| Step 2: Filtering       |                                                                 | Query 2      |
| Step 3: Transformations |                                                                 | Query 3      |
| Step 4: Aggregations    |                                                                 | Main Query   |

## Subquery Categories

### Result Types

| Scalar<br><br>           | Row<br><br>                             | Table<br><br>                             |
| ------------------------ | --------------------------------------- | ----------------------------------------- |
| Returns one single value | Returns multiple rows and single column | Return multiple rows and multiple columns |
### Dependency

- Non-Correlated and Correlated

### Location | Clause

| SELECT | FROM | JOIN | WHERE                | WHERE               |
| ------ | ---- | ---- | -------------------- | ------------------- |
|        |      |      | Comparison Operators | Logical Operators   |
|        |      |      | < > = != >= <=       | IN, ANY, ALL EXISTS |

## Subquery in FROM Clause

**SELECT \***
**FROM (SELECT column FROM table1 WHERE condition)**

## Subquery in SELECT Clause

**SELECT Column1,**
	**(SELECT Column FROM table1 WHERE condition) AS alias**
**FROM table1**

### Rules – SELECT subquery

Only scalar subqueries are allowed to be used (subqueries that returns one single value)

## Subquery in JOIN Clause

Used to prepare the data (filtering or aggregation) before joining it with other tables


## Subquery in WHERE Clause ANY operator

**SELECT column1, column2**
**FROM table1**
**WHERE column < ANY(SELECT column FROM table1 WHERE condition)**

## Non-Correlated Subquery

A subquery that can run independently from the Main Query

## Correlated Subquery

A subquery that relays on values from the Main Query

## Non-Correlated vs Correlated Subquery

|             | **Non-Correlated Subquery**                                                              | **Correlated Subquery**                                                               |
| ----------- | ---------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| Definition  | Subquery is independent of the main query                                                | Subquery is dependent of the main query                                               |
| Execution   | Executed once and its result is used by the main query<br><br>Can be executed on its Own | Executed for each row processed by the main query<br><br>Can’t be executed on its Own |
| Easy to use | Easier to read                                                                           | Harder to read and more complex                                                       |
| Performance | Executed only once leads to better performance                                           | Executed multiple times leads to bad performance                                      |
| Usage       | Static Comparisons, Filtering with Constants                                             | Row-by-Row comparisons, Dynamic filtering                                             |

## EXISTS Clause

Check if a subquery returns any rows

**SELECT column1, column2**
**FROM table2**
**WHERE EXISTS (SELECT 1 FROM table1 WHERE table1.ID = table2.ID)**

For each row in Main Query, it runs the subquery

- No result? Rows of main query is excluded
- Returns value? Row of main query is included

