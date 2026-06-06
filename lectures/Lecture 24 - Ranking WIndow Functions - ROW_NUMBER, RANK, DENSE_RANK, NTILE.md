#### April 3rd



## What are Ranking Window Functions

They are functions used in order to create a rank / integer-number order in the results

![](../images/Lecture%2024/image%2001%20-%20overview.png)

## Syntax

**RANK()  OVER(PARTITION BY productid ORDER BY sales)**

Expression must be empty, PARTITION BY is optional and ORDER BY is required

## RANK Functions

![](../images/Lecture%2024/image%2002%20-%20rank%20overview.png)

![](../images/Lecture%2024/image%2003%20-%20functions%20overview.png)

## ROW_NUMBER

Assign a unique number to each row, it doesn’t handle ties.

**ROW_NUMBER() OVER (ORDER BY sales DESC)**

![](../images/Lecture%2024/image%2004%20-%20row_number.png)

We have the same value twice, but with different ranks, that means ROW_NUMBER doesn’t handle the ties.

## RANK

Assign a rank to each row, it handles ties and leaves gaps in ranking

**RANK() OVER (ORDER BY sales DESC)**

![](../images/Lecture%2024/image%2005%20-%20rank.png)

There’s no a unique rank here, since some sales values are sharing the same rank, but RANK function leave gaps in rank numbers, in this example it skipped the value 3

## DENSE_RANK

Assign a rank to each row, it handles ties and doesn’t leave gaps in ranking

**DENSE_RANK() OVER (ORDER BY sales DESC)**

| **sales** | **RANK** |
| --------- | -------- |
| 100       | 1        |
| 80        | 2        |
| 80        | 2        |
| 50        | 3        |
| 20        | 4        |
We have shared ranks, but this time there’s no skipped rank numbers


## Integer-Base Ranking - Comparison

![](../images/Lecture%2024/image%2006%20-%20comparison.png)

## Paginating

The process of breaking down a large data into smaller, more manageable chunks.

## ROW_NUMBER | Use Cases

- Top-N Analysis
- Bottom-N Analysis
- Assign unique IDs
- Quality Checks: Identify Duplicates

## NTILE

Divides the rows into a specified number of approximately equal groups (Buckets)

![](../images/Lecture%2024/image%2007%20-%20bucket.png)

**NTILE(2) OVER (ORDER BY sales DESC)**

![](../images/Lecture%2024/image%2008%20-%20ntile.png)

## NTILE | Use Cases

- Data Analyst: Data Segmentation
- Data Engineer: Equalizing load processing
### Data Segmentation

Divides a dataset into distinct subsets based on certain criteria

### Equalizing Data

Breaks the entire data into small parts in order to be handled easily


## Percentage-Based Ranking

- CUME_DIST = position number / number of rows
- PERCENTAGE_RANK = position number – 1 / number of rows – 1

## CUME_DIST

Cumulative distribution calculates the distribution of data points within a window

![](../images/Lecture%2024/image%2009%20-%20cume%20dist.png)

**CUME_DIST() OVER (ORDER BY sales DESC)**

| **sales** | **DIST** |
| --------- | -------- |
| 100       | 0.20     |
| 80        | 0.60     |
| 80        | 0.60     |
| 50        | 0.80     |
| 30        | 1.00     |

## PERCENT_RANK

Calculates the relative position of each row

![313](../images/Lecture%2024/image%2010%20-%20percent%20rank.png)

**PERCENT_RANK() OVER (ORDER BY sales DESC)**

| **sales** | **per** |
| --------- | ------- |
| 100       | 0       |
| 80        | 0.25    |
| 80        | 0.25    |
| 50        | 0.75    |
| 30        | 1.00    |
## TIE Rule

- **CUME_DIST:** The position of the last occurrence of the same value
- PERCENT_RANK: The position of the first occurrence of the same value