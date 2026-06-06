#### December 15th


## What is date format

YYYY-MM-dd HH:mm:ss

These letters are format specifier.

### International Standard (iso 8601)

YYYY-MM-dd

### USA Standard

MM-dd-YYYY

### European Standard

dd-MM-YYYY

## Formatting and Casting

**Formatting:** changing the format of a value from one to another (FORMAT)

- MM/dd/yy -> 08/20/25
- MMM YYYY -> Aug 2025

### CONVERT

- 6 -> 20 Aug 25
- 112 -> 20250820
### FORMAT for numbers

1234567.89

- N-> 1,234,567.89
- C -> $1,234,567.89
- P -> 123,456,789.00%
### CASTING

Changing the data type from one to another

- String ‘123’ -> 123 number
- Date 2025-08-20 -> ‘2025-08-20’ String
- String ‘2025-08-20’ -> 2025-08-20 Date

Functions: **CAST** OR **CONVERT**


## FORMAT

Formats a date or time value

- **FORMAT(value, format \[,culture])**
- **FORMAT(OrderDate, ‘dd/MM/yyyy’)**
- **FORMAT(Orderdate, ‘dd/MM/yyyy’, ‘ja-JP’)**
- **FORMAT(1234.56, ‘D’, ‘fr-FR’)**

For MySQL, use **DATE_FORMAT** to treat dates

| ![](../images/Lecture%2016/image%2001%20-%20date_format.png) | ![](../images/Lecture%2016/image%2002%20-%20date_format%20result.png) |
| ------------------------------------- | ---------------------------------------------- |

| ![](../images/Lecture%2016/image%2003%20-%20date_format.png) | ![](../images/Lecture%2016/image%2004%20-%20date_format%20result%202.png) |
| ------------------------------------- | -------------------------------------------------- |

## MySQL DATE_FORMAT - All Formats for Date/Time

| Format | Description                                                               |
| ------ | ------------------------------------------------------------------------- |
| %a     | Abbreviated weekday (Sun to Sat)                                          |
| %b     | Abbreviated month name (Jan to Dec)                                       |
| %c     | Numeric month name (0-12)                                                 |
| %D     | Day of the month as a numeric value, followed by suffix (1st, 2nd, 3rd,…) |
| %d     | Day of the month as a numeric value (01-31)                               |
| %e     | Day of the month as a numeric value (0-31)                                |
| %f     | Microseconds (000000 to 999999)                                           |
| %H     | Hour (00 to 23)                                                           |
| %h     | Hour (00 to 12)                                                           |
| %I     | Hour (00 to 12)                                                           |
| %i     | Minutes (00 to 59)                                                        |
| %j     | Day of the year (001 to 366)                                              |
| %k     | Hour (00 to 23)                                                           |
| %l     | Hour (00 to 12)                                                           |
| %M     | Month name in full (January to December)                                  |
| %m     | Month name as a numeric value (00-12)                                     |
| %p     | AM or PM                                                                  |
| %r     | Time in 12 hour AM or PM format (hh:mm:ss AM/PM)                          |
| %S     | Seconds (00 to 59)                                                        |
| %s     | Seconds (00 to 59)                                                        |
| %T     | Time in 24 hour format (hh:mm:ss)                                         |
| %U     | Week where Sunday is the first day of the week (00 to 53)                 |
| %u     | Week where Monday is the first day of the week (00 to 53)                 |
| %V     | Week where Sunday is the first day of the week (00 to 53). Used with %X   |
| %v     | Week where Monday is the first day of the week (00 to 53). Used with %X   |
| %W     | Weekday name in full (Sunday to Saturday)                                 |
| %w     | Day of the week where Sunday = 0 and Saturday = 6                         |
| %X     | Year for the week where Sunday is the first day of the week. Used with %v |
| %x     | Year for the week where Monday is the first day of the week. Used with %v |
| %Y     | Year as a numeric, 4-digit value                                          |
| %y     | Year as a numeric, 2-digit value                                          |


| ![](image%2005%20-%20concat_ws.png) | ![](image%2006%20-%20concat_ws%20resultt.png) |
| ----------------------------------- | --------------------------------------------- |

## CONVERT

Converts a date or time value to a different data type and formats the value

- **CONVERT(data_type, value \[,style])**
- **CONVERT(INT, ‘124’)**
- **CONVERT(VARCHAR, orderdate, ‘34’)**

## CAST

Convert a value to a specified data type

- **CAST(value AS data_type)**
- **CAST(‘123’ AS INT)**
- **CAST(‘2025-08-20’ AS DATE)**

No format can be specified