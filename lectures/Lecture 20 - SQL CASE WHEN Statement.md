#### February 25th


## CASE Statement

Evaluates a list of conditions and returns a value when the first condition is met

## Syntax

**CASE**<br>
	**WHEN condition1 THEN result1**<br>
	**WHEN condition2 THEN result2**<br>
	**WHEN condition3 THEN result3**<br>
	**ELSE result**
**END**

## How it works

### Example 01

**CASE**<br>
	**WHEN sales > 50 THEN ‘High’**<br>
**END**

| sales | CASE |
| ----- | ---- |
| 60    | High |
| 30    | NULL |
| 15    | NULL |
| NULL  | NULL |

### Example 02

**CASE**<br>
	**WHEN sales > 50 THEN ‘High’**<br>
	**WHEN sales  > 20 THEN ‘Medium’**<br>
**END**

| **sales** | **CASE** |
| --------- | -------- |
| 60        | High     |
| 30        | Medium   |
| 15        | NULL     |
| NULL      | NULL     |

### Example 03

**CASE**<br>
	**WHEN sales > 50 THEN ‘High’**<br>
	**WHEN sales  > 20 THEN ‘Medium’**<br>
	**ELSE ‘Low’**
**END**

| **sales** | **CASE** |
| --------- | -------- |
| 60        | High     |
| 30        | Medium   |
| 15        | Low      |
| NULL      | Low      |

## Rules - Case Stamentent

The data type of the results must be matching

Case statement can be used anywhere in the query

## Use Cases

### \#1 Use Case - Categorizing Data

Main purpose is Data Transformation<br>
Derive new information<br>
Create new Column based on existing data
#### Categorizing Data

Group the data into different categories based on certain conditions

### \#2 Use Case - Mapping Values

Transform the values from one form to another

For example, in some databases the order status can be stored as 0 or 1, and when generating reports, you might want to transform 0 and 1 into ‘active’ and ‘inactive’

| Status before transformation | Status after transformation |
| ---------------------------- | --------------------------- |
| 0                            | Inactive                    |
| 1                            | Active                      |

### \#3 Use Case - Handling NULLs

Replace NULLs with a specific value
NULLs can lead to inaccurate results, which can lead to wrong decision-making

### \#4 Use Case - Conditional Aggregation

Apply aggregate functions only on subsets of data that fulfill certain condtions

## Quick Form - Case Stamentent

When you have to compare one single variable/column to many values, you can use the short form of CASE instead of typing the same thing thousand times:

**CASE**<br>
	**WHEN country = ‘Germany’ THEN ‘DE’**<br>
	**WHEN country = ‘India’ THEN ‘IN’**<br>
	**WHEN country = ‘United States THEN ‘US’**<br>
	**WHEN country = ‘France’ THEN ‘FR’**<br>
	**WHEN country = ‘Italy’ THEN ‘IT’**<br>
	**ELSE ‘n/a’**
**END**

In short form, you can specify the value you want to compare after CASE statement word, and just specify the value you will evaluate to the default value:

**CASE country**<br>
	**WHEN ‘Germany’ THEN ‘DE’**<br>
	**WHEN ‘India’ THEN ‘IN’**<br>
	**WHEN ‘United States THEN ‘US’**<br>
	**WHEN ‘France’ THEN ‘FR’**<br>
	**WHEN ‘Italy’ THEN ‘IT’**<br>
	**ELSE ‘n/a’**<br>
**END**