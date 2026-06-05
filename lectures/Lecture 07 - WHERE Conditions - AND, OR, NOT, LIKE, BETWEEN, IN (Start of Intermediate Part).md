#### December 1st


## WHERE Operators

| **Comparison Operators** | =, <>, !=, >, >=, <, <= |
| ------------------------ | ----------------------- |
| **Logical Operators**    | AND, OR, NOT            |
| **Range Operator**       | BETWEEN                 |
| **Membership Operator**  | IN, NOT IN              |
| **Search Operator**      | LIKE                    |

## Comparison Operators

Compare two things, like:

Column1 = Column2
Column1 = value
Function = value
Expression = value
Subquery = value

| Operator              | Description                                                 |
| --------------------- | ----------------------------------------------------------- |
| !=, <> (not equal)    | Checks if two values are not equal                          |
| > (greater)           | Checks if a value is greater than another value             |
| >= (greater or equal) | Checks if a value is greater than or equal to another value |
| < (less)              | Checks if a value is less than another value                |
| <= (less or equal)    | Checks if a value is less than or equal to another value    |
| = (equal)             | Checks if two values are equal                              |

## Logical Operators

| Operator | Description                         |
| -------- | ----------------------------------- |
| AND      | All conditions must be true         |
| OR       | At least one condition must be true |
| NOT      | (reverse) Exclude matching values   |

## Range Operator

Checks if a value is within a range

![697](../images/Lecture%2007/image%2001%20-%20Range%20operator.png)

## Membership Operators

**IN:** Checks if a value exists in a list
**NOT IN:** Checks if a value NOT exists in a list

![489](../images/Lecture%2007/image%2002%20-%20Membership%20operator.png)

Use In instead of OR for multiple values in the same column to simplify SQL

## Search Operator

**LIKE:** Search for a pattern in text

You can use two placeholders for it: ‘**%**’ and ‘_’ (percent sign and underscore, respectively)

**‘%’:** used to symbolize the characters in that position don’t matter. (It can be zero, one, many chars).
**‘\_’:** used to symbolize exactly one char position (Exact one char).

### Examples

**M%**

First position must be an M, and the remaining characters can be zero, one or more (anything)

| Test  | Result                    |
| ----- | ------------------------- |
| Maria | matches the pattern       |
| Ma    | matches the pattern       |
| M     | matches the pattern       |
| Emma  | doesn’t match the pattern |

**%in**

Anything at the start, but the last two characters must be in.

| Test    | Result                    |
| ------- | ------------------------- |
| Martin  | matches the pattern       |
| Vin     | matches the pattern       |
| in      | matches the pattern       |
| Jasmine | doesn’t match the pattern |

**%r%**

Can have anything at the start and end, but must contain an r somewhere.

| Test  | Result                    |
| ----- | ------------------------- |
| Maria | matches the pattern       |
| Peter | matches the pattern       |
| Rayn  | matches the pattern       |
| R     | matches the pattern       |
| Alice | doesn’t match the pattern |

**_ \_b%**

The first two letters must exist, the third character must be ‘b’, and the remaining characters can be anything

| Test   | Result                    |
| ------ | ------------------------- |
| Albert | matches the pattern       |
| Rob    | matches the pattern       |
| Abel   | doesn’t match the pattern |
| An     | doesn’t match the pattern |


## OFFSET CLAUSE

Usually used with LIMIT. It can be used to skip a certain number of rows on the data retrieved

### Example

**LIMIT 1 OFFSET 1:** Limits the search in one row, and jump one row from the start (if the table is alphabetically ordered, then returns the second alphabetically)