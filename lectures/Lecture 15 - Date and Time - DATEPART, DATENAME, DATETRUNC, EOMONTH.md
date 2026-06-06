#### December 9th


## What is Date and Time

**Date** is a representation of Year, Month and Day (YYYY-MM-DD)
**Time** is a specific hour of a day (HH-MM-SS)

Date + Time = Timestamp / Datetime

Order: YYYY-MM-DD + HH:MM:SS

## Values

There are three different sources in order to query the date

- Date column from a table
- Hardcoded constant string value
- GETDATE() Function

## GETDATE (or CURRENT_TIMESTAMP in MySQL)

Returns the current date and time at the moment when the query is executed


## Function Overview

With functions you can

- Extract a part of the date, like only year, month, day
- Change the format
- Make calculation with dates, like add, diff
- Make validations

## Date and Time functions grouped

### Part Extraction

- DAY
- MONTH
- YEAR
- DATEPART | EXTRACT
- DATENAME
- DATETRUNC
- EOMONTH
### Format and Casting

- FORMAT
- CONVERT
- CAST
### Calculations

- DATEADD
- DATEDIF
### Validation

- ISDATE

## DAY | MONTH | YEAR

Return respectively the day, month and the year from a date

![](../images/Lecture%2015/image%2001%20-%20day%20month%20year.png)

![](../images/Lecture%2015/image%2002%20-%20day%20month%20year%20result.png)

## DATEPART | EXTRACT in MySQL

Returns a specific part of a date as a number

![](../images/Lecture%2015/image%2003%20-%20extract%20week.png)
![](../images/Lecture%2015/image%2004%20-%20extract%20quarter.png)

![](../images/Lecture%2015/image%2005%20-%20extract%20examples.png)

## DATENAME | (MONTHNAME | DAYNAME in MySQL)

Returns the name of a specific part of a date (specially month and day)

![344](../images/Lecture%2015/image%2006%20-%20datename%20monthname%20dayname.png)

## DATETRUNC

Truncates the date to the specific part

**DATETRUNC(hour):** remove all information after hour (removes minutes and seconds)
**DATETRUNC(day):** keep year, month, day and remove all information about the time


## EOMONTH | LAST_DAY in MySQL

Returns the last day of a month

![](../images/Lecture%2015/image%2007%20-%20eomonth%20last_day.png)

