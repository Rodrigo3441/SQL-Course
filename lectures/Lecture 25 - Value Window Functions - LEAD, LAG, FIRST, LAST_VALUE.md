#### April 3rd


## What are Value Window Functions

They are functions that you can use to access values from other rows

## Syntax

![](../images/Lecture%2025/image%2001%20-%20value%20window%20functions%20syntax.png)

## LEAD

Access a value from the next row within a window

## LAG

Access a value from the previous row within a window

## Example

**LEAD(sales, 2, 10) OVER(PARTITION BY productid ORDER BY orderdate)**

- **Sales**: expression is required (any data type)
- **2:** offset (optional) number of rows forward or backward from current row, default = 1
- **10:** default value (optional) returns default value if next/previous row is not available, default = NULL

![](../images/Lecture%2025/image%2002%20-%20lead%20lag.png)

![](../images/Lecture%2025/image%2003%20-%20lead%20lag.png)

## Time Series Analysis

The process of analyzing the data to understand patterns, trends, and behaviors over time

- **Year-over-Year (YoY):** Analyze the overall growth or decline of the business performance over time
- **Month-over-Month (MoM):** Analyze short-term trends and discover patterns in seasonality

## Customer Retention Analysis

Measure customer’s behavior and loyalty to help businesses build strong relationships with customers


## FIRST_VALUE and LAST_VALUE

Access a value from the first row and last row within a window, respectively


![](../images/Lecture%2025/image%2004%20-%20last%20value%20and%20first%20value.png)

FIRST_VALUE will work properly in the default RANGE, but for getting the expected result in LAST_VALUE, you need to specify a different RANGE

**LAST_VALUE(sales) OVER (ORDER BY month ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)**

![](../images/Lecture%2025/image%2005%20-%20last%20value.png)

## Window Value (Analytical) Functions Summary

### Types

- Previous value: LAG
- Next value: LEAD
- First value: FIRST_VALUE
- Last value: LAST_VALUE

### Rules

- Expression: Any data type
- ORDER BY: required
- Frame: optional

### Use Cases

- Time series Analysis: MoM and YoY
- Time gaps analysis: Customer retention
- Comparison analysis: Extreme Highest/Lowest

