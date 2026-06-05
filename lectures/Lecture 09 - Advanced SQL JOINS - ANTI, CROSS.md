#### December 3rd

## LEFT ANTI JOIN


![259](image%2001%20-%20left%20anti%20join.png)

Returns row from LEFT table that has NO MATCH in RIGHT table

Only data source is primary (A)

**SELECT * FROM A LEFT JOIN B ON A.key = B.key WHERE B.key IS NULL**

With the WHERE clause, SQL will retrieve only non-matching rows (B.key IS NULL)

![450](image%2009%20-%20left%20anti%20join%20example.png)

## RIGHT ANTI JOIN

![245](image%2002%20-%20right%20anti%20join.png)

Returns row from RIGHT table that has NO MATCH in LEFT table

Only data source is primary (B)

**SELECT * FROM A RIGHT JOIN B ON A.key = B.key WHERE A.key IS NULL**

With the WHERE clause, SQL will retrieve only non-matching rows (B.key IS NULL)

## FULL ANTI JOIN

Returns only rows that don’t match in either table

ONLY UNMATCHING DATA

**SELECT * FROM A FULL JOIN B ON A.key = B.key WHERE B.key IS NULL OR A.key IS NULL**

### MYSQL WARN

MySQL does not have FULL JOIN and FULL ANTI JOIN, then it’s necessary to combine LEFT JOIN and RIGHT JOIN using UNION, see the example for each one

#### FULL JOIN

![554](image%2004%20-%20full%20join%20code.png)

![563](image%2005%20-%20full%20join%20code%20result.png)

FULL JOIN retrieves everything, even orders that don’t have a customer and customers that have ordered nothing as well.

#### FULL ANTI JOIN
![528](image%2006%20-%20full%20anti%20join%20code.png)

![621](image%2007%20-%20full%20anti%20join%20code%20result.png)

LEFT JOIN retrieves customers on the LEFT and RIGHT JOIN retrieves orders on the RIGHT. It just happens for orders that don’t have a customer and for customers that ordered nothing.

## CROSS JOIN

![289](image%2008%20-%20cross%20join.png)

Combines every row from LEFT with every row from RIGHT

All possible combinations – Cartesian Join

**SELECT * FROM A CROSS JOIN B**