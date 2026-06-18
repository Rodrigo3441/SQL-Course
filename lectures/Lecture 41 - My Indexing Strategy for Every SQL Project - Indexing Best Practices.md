#### June 17th



## The Golden Rule

Avoid over indexing, "Less is more"

Indexes slow down write performance, because when data is inserted, updated or deleted, database has to update indexes

Too many indexes can confuse execution plan, because increase planning time

## Indexing Strategy

### #1 Initial Strategy

What is the main goal of our indexing strategy

| OLAP (Online Analytical Processing) | OLTP (Online transaction Processing) |
| ----------------------------------- | ------------------------------------ |
| Data Warehouse                      | Applications                         |
| Optimize Read performance           | Optimize Write performance           |
| Columnstore Index for Fact Tables   | Clustered Index PK                   |

### #2 Usage Patterns

1. Identify frequently used tables and columns
2. Choose right index,
3. Test index

#### Prompt Example

Analyze the following SQL queries and generate a report on table and column usage statistics. For each table, provide:
- The total number of times the table is used across all queries
- A breakdown of each column in the table, showing
- The number of times each column appears
The primary purpose of the column's usage (e.g., filtering, joining, grouping, aggregating).
Sort the tables in descending order based on their total usage

### #3 Scenario-Based Indexing

1. Identify slow queries
2. Check execution plan
3. Choose right index
4. (test) compare execution plans

### #4 Monitoring and Maintenance

1. Monitor index usage
2. Monitor missing indexes
3. Monitor duplicate indexes
4. Update statistics
5. Monitor fragmentations

## Summary 

![](../images/Lecture%2041/image%2001%20-%20indexes%20strategy.PNG)