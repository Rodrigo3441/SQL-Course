#### June 16th



## Unique Index

Ensure no duplicate values exist in specific column
### Benefits

- Enforce uniqueness
- Slightly increase query performance

### Performance

Writing to an unique index is slower than non-unique

Reading from an unique index is faster than non-unique

### Index Syntax

**CREATE UNIQUE \[CLUSTERED | NONCLUSTERED] \[COLUMNSTORE] INDEX Index_name ON table_name (columns)**

## Filtered Index

An index that includes only rows meeting the specified conditions

### Benefits

- Targeted Optimization
- Reduce storage: Less data in the index

### Filtered Index Syntax

**CREATE UNIQUE NONCLUSTERED \[COLUMNSTORE] INDEX Index_name
ON table_name (columns)
WHERE \[Condition]**

### Rules

- You cannot create a filtered index on a clustered index
- You cannot create a filtered index on a columnstore index