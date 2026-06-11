#### March 4th


## What are Window Functions

Perform calculations (for example: aggregation) on a specific subset of data, without losing the level of details of rows.


## How GROUP BY works

Let’s say you would like to see the total sales for each product:

| **ID** | **PRODUCT** | **SALES** |
| ------ | ----------- | --------- |
| 1      | Cap         | 10        |
| 2      | Cap         | 30        |
| 3      | Gloves      | 5         |
| 4      | Gloves      | 20        |
                
| **PRODUCT** | **TOTAL_SALES** |
| ----------- | --------------- |
| Caps        | 40              |
| Gloves      | 25              |

<br>

The final number of rows will be depending on the number of products we have stored on the database, and the final result will not show the id and additional information about the products, it will only show the name of each product and the total_sales. Small level of details.

### Same task but using Window Function

Total sales for each product. If you use window function SQL will execute each row individually from each other. Then, you aren’t going to lose additional information about the products

| **ID** | **PRODUCT** | **SALES** |
| ------ | ----------- | --------- |
| 1      | Cap         | 10        |
| 2      | Cap         | 30        |
| 3      | Gloves      | 5         |
| 4      | Gloves      | 20        |
<br>

| **ID** | **PRODUCT** | **Total_Sales** |
| ------ | ----------- | --------------- |
| 1      | Cap         | 40              |
| 2      | Cap         | 40              |
| 3      | Gloves      | 25              |
| 4      | Gloves      | 25              |
<br>

When you use window function, you are doing row-level calculations. For the previous example: in input data you have four rows, and in the output, you’re going to get four rows as well.

Both methods were able to solve the task. But:

- GROUP BY returns a single row for each group (changes the granularity)
- Window returns a result for each row (the granularity stays the same)

## Function Differences between GROUP BY and Window Functions

![](../images/Lecture%2022/image%2001%20-%20group%20by%20vs%20window%20functions.png)

## Window Functions - The Syntax

| Window Function | OVER Clause                                    |
| --------------- | ---------------------------------------------- |
| F(x)            | PARTITION Clause + ORDER Clause + Frame Clause |
### Example

**AVG(sales) OVER (PARTITION BY Category ORDER BY Orderdate ROWS  UNBOUNDED PRECEDING)**

#### AVG(sales)

a simple window function

#### Sales value inside AVG()

it’s a Function Expression / Arguments you pass to a function

Function Expression Cases:

| **Empty**              | **RANK() OVER (ORDER BY OrderDate)**                                       |
| ---------------------- | -------------------------------------------------------------------------- |
| **Column**             | **AVG(Sales) OVER (ORDER BY OrderDate)**                                   |
| **Number**             | **NTILE(2) OVER (ORDER BY OrderDate)**                                     |
| **Multiple Arguments** | **LEAD(Sales, 2, 10) OVER (ORDER BY OrderDate)**                           |
| **Conditional Logic**  | **SUM(CASE WHEN Sales > 100 THEN 1 ELSE 0 END) OVER (ORDER BY OrderDate)** |

## OVER

Tells SQL that the function used is a window function, it defines a window or subset of data

## PARTITION BY

Divides the result into partitions (windows). It tells to SQL how to divide your data

## ORDER BY

Sort the data within a window (Ascending | Descending)

## Window Frame

Defines a subset of rows within each window that is relevant for the calculation

### Example

**AVG(sales) OVER (PARTITION BY Category ORDER BY Orderdate ROWS BETWEEN CURRENT ROW AND UNBOUNDED PRECEDING)**

| **ROWS**    | **BETWEEN** | **CURRENT ROW**              | **AND** | **UNBOUNDED PRECEDING**       |
| ----------- | ----------- | ---------------------------- | ------- | ----------------------------- |
| Frame Types |             | Frame Boundary (Lower value) |         | Frame Boundary (Higher Value) |
| ROWS        |             | CURRENT ROW                  |         | CURRENT ROW                   |
| RANGE       |             | N PRECEDING                  |         | N FOLLOWING                   |
|             |             | UNBOUNDED PRECEDING          |         | UNBOUNDED FOLLOWING           |
### Rules

- Frame Clause can only be used together with order by clause
- Lower value must be before the higher value

### Compact Frame

For only PRECEDING, the CURRENT ROW can be skipped

- NORMAL FORM: **ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING**
- SHORT FORM: **ROWS 2 FOLLOWING**

## Window Functions - Rules

### \#1 Rule

Window Functions can be used ONLY in SELECT and ORDER BY Clause

### \#2 Rule

Nesting Window Functions is not allowed

### \#3 Rule

SQL execute Window Functions after WHERE Clause

### \#4 Rule

Window Function can be used together with GROUP BY in the same query, ONLY if the same columns are used

