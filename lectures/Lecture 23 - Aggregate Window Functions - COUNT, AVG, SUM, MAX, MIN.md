#### March 26th

![697](../images/Lecture%2023/image%2001%20-%20aggregate%20functions.png)

## COUNT

Return the number of rows within a window, counts the number of non-NULL values in the column

**COUNT(1) == COUNT(\*)**

Counts the number of values in a column, regardless of their data types

**COUNT(Product) OVER(PARTITION BY Product)**

![](../images/Lecture%2023/image%2002%20-%20count%20function%20example.png)

### Data Quality Issue

Duplicates leads to inaccuracies in analysis, COUNT() can be used to identify duplicates


#### Example 01

| ![450](../images/Lecture%2023/image%2003%20-%20count.png) | ![](../images/Lecture%2023/image%2004%20-%20count%20result.png) |
| ---------------------------------- | ---------------------------------------- |

As you can see, all lines from ‘checkpk’ column have the value one, therefore we do not have any duplicates

#### Example 02

| ![](../images/Lecture%2023/image%2005%20-%20count%202.png) | ![](../images/Lecture%2023/image%2006%20-%20count%202%20result.png) |
| ----------------------------------- | -------------------------------------------- |

In this second example, ‘checkpk’ column returns more than one, as a result we found duplicates in it

### COUNT Use Cases

- #1 Overall Analysis
- #2 Category Analysis
- #3 Quality Checks: Identify NULLs
- #4 Quality Checks: Identify Duplicates

## SUM

Return the sum of values within a window

**SUM(Sales) OVER(PARTITION BY Product)**

![](../images/Lecture%2023/image%2007%20-%20sum%20function%20example.png)

## AVG

Returns the average of values within a window

Task: Find the average sales for each product

**AVG(COALESCE(Sales,0)) OVER(PARTITION BY Product)**

![](../images/Lecture%2023/image%2008%20-%20avg%20function%20example.png)

## MIN / MAX

- **MIN:** Returns the lowest value within a window
- **MAX:** Returns the highest value within a window

**MIN(sales) OVER(PARTITION BY Product)**

![](../images/Lecture%2023/image%2009%20-%20min%20function%20example.png)

**MAX(sales) OVER(PARTITION BY Product)**

![](../images/Lecture%2023/image%2010%20-%20max%20function%20example.png)

## RUNNING AND ROLLING TOTAL

They aggregate sequence of members, and the aggregation is updated each time a new member is added (analysis over time).

### RUNNING TOTAL

Aggregate all values from the beginning up to the current point without dropping off older data.

### ROLLING TOTAL

Aggregate all values within a fixed time window (e.g. 30 days). As new data is added, the oldest data point will be dropped.

#### Example

![](../images/Lecture%2023/image%2011%20-%20running%20and%20rolling.png)


## Overview of Aggregation Functions

![](../images/Lecture%2023/image%2012%20-%20overview.png)