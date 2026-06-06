#### December 15th


## DATE_ADD

Adds or subtracts a specific time interval to/from a date.

You can use this function to do some calculations with parts of a date

- **DATE_ADD(part, interval, date)**
- **DATE_ADD(year, 2, orderdate)**
- **DATE_ADD(month, -4, orderdate)**
- **DATE_ADD(day, 5, orderdate)**

In MySQL

- **DATE_ADD(date, INTERVAL value addunit)**
- **DATE_ADD(creationtime, INTERVAL 10 YEAR) AS date_added**

## TIMESTAMPDIFF

Find the difference between the two dates

- **TIMESTAMPDIFF(part, date1, date2)**
- **TIMESTAMPDIFF(year, orderdate, shipdate)**

## ISDATE

Check if a value is a date and returns 1 if the string value is a valid date

**ISDATE(value)**

## MySQL Equivalency

**STR_TO_DATE(my_string, ‘%d/%m/%Y’) IS NOT NULL**

| ![](../images/Lecture%2017/image%2001%20-%20str_to_date.png) | ![](../images/Lecture%2017/image%2002%20-%20str_to_date%20result.png) |
| ------------------------------------- | ---------------------------------------------- |

## Summary about DATETIME Functions

### Part Extraction

- DAY | DAY
- MONTH | MONTH
- YEAR | YEAR
- DATEPART | EXTRACT
- DATENAME | DAYNAME | MONTHNAME
- DATETRUNC
- EOMONTH | LAST_DAY

### Format and Casting

- FORMAT | DATE_FORMAT
- CONVERT |  CONVERT
- CAST | CAST

### Calculations

- DATEADD | DATE_ADD
- DATEDIFF | TIMESTAMPDIFF

### Validation

- ISDATE | STR_TO_DATE('2025-08-20', '%Y-%m-%d') IS NOT NULL


##  General Syntax of all Functions

### Part Extraction


| Function                                                                          | Return                                                                                     |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **DAY(date)**                                                                     | Returns only the day from a date                                                           |
| **MONTH(date)**                                                                   | Return only the month from a date                                                          |
| **YEAR(date)**                                                                    | Return only the year from a date                                                           |
| **EXTRACT(DAY FROM date)<br>EXTRACT(MONTH FROM date)<br>EXTRACT(YEAR FROM date)** | Similar to the individual functions, you can specify what do you want retrieve of the date |
| **DAYNAME(date)<br>MONTHNAME(date)**                                              | Return the full name of the week (Sunday-Saturday) or full month name (January-December)   |
| **LAST_DAY(date)**                                                                | Return the date with the last day possible for that month                                  |

### Format and Casting

| Function                                           | Return                                                                                                                                   |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| **DATE_FORMAT(date, ‘format-expression’)**         | Used to format a date into a different string representation (%y, %Y, %D, there is a table about all placeholders above on the document) |
| **CONVERT(value, DATE)<br>CONVERT(value, type)**   | Convert a value to a DATE datatype, but can be use for converting a value into **others** datatypes                                      |
| **CAST(value AS DATE)<br>CAST(value AS datatype)** | Convert a value of any type into the specified datatype (it’s similar to convert, only the syntax has some difference)                   |

### Calculations

| Function                                        | Return                                                                                                                                                                                |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **DATE_ADD(date, INTERVAL value addunit)**      | Adds a time/date interval to a date and then returns the date. (date: what date will be added, value: how many of addunit will be added, addunit: month, day or year for calculation) |
| **TIMESTAMPDIFF(unit, oldestdate, newestdate)** | Calculates the difference between two dates and return some part of it, like month, day or year.                                                                                      |


### Validation

| Function                                              | Return                                                                                                        |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| **STR_TO_DATE('2025-08-20', '%Y-%m-%d') IS NOT NULL** | Function to verify if a date is valid or not on the default SQL date formats. Similar to SQL Server ISDATE(). |

