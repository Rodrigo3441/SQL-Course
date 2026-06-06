#### December 22nd


## NULL

Means nothing, unknown!

## Empty String

String value has no chars

## Blank Space

String value has one or more space characters

|                | NULL           | Empty String       | Blank Space                  |
| -------------- | -------------- | ------------------ | ---------------------------- |
| Representation | NULL           | ''                 | '   '                        |
| Meaning        | Unkown         | Known, empty value | Known, space value           |
| Data Type      | Special Marker | String(0)          | String(1 or more)            |
| Storage        | Very Minimal   | Occupies memory    | Occupies memory (each space) |
| Performance    | Best           | Fast               | Slow                         |
| Comparison     | IS NULL        | =''                | ='    '                      |

## Data Policies

Set of rules that defines how data should be handled

### \#1 Data Policy

Only use NULLs and empty strings, but avoid blank spaces.

| ![](../images/Lecture%2019/image%2001%20-%20nulls%20and%20empty%20strings.png) | ![230](../images/Lecture%2019/image%2002%20-%20nulls%20and%20empty%20strings%20result.png) |
| ------------------------------------------------------- | ------------------------------------------------------------------- |

### \#2 Data Policy

Only use NULLs and avoid using empty strings and blank spaces

| ![](../images/Lecture%2019/image%2003%20-%20nulls.png) | ![190](../images/Lecture%2019/image%2004%20-%20nulls%20result.png) |
| ------------------------------- | ------------------------------------------- |

#### \#2 Data Policy - Use Case before inserting into a database

Replacing empty strings and blanks with NULL during data preparation before inserting into a database to optimize storage and performance.

### \#3 Data Policy

Use the default value ‘unknown’ and avoid using nulls, empty strings, and blank spaces

| ![](../images/Lecture%2019/image%2005%20-%20unknown.png) | ![234](../images/Lecture%2019/image%2006%20-%20unknown%20result.png) |
| --------------------------------- | --------------------------------------------- |

#### \#3 Data Policy - Ue Case before showing it in a report

Replacing empty strings, blanks, NULL with default value during data preparation before using it in reporting to improve readibility


## Summary (NULLs vs Empty String vs Blank Spaces)

- NULLs special markers means missing value
- Using NULLs can optimize storage and performance

### NULL Functions

- COALESCE | IFNULL (NULL -> 30)
- NULLIF (30 -> NULL)
- IS NULL | IS OT NULL (TRUE || FALSE)

### Use Cases

- Handle NULLs – Data aggregation
- Handle NULLs – mathematical operations
- Handle NULLs – Joining Tables
- Handle NULLs – Sorting data
- Finding unmatched data – LEFT ANTI JOIN
- Data Policies (NULLs | Default Value)