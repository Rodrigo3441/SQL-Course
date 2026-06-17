#### June 16th



## Index Management

- Monitor Index Usage
- Monitor Missing Indexes
- Monitor Duplicate Indexes
- Update Statistics
- Monitor Fragmentations

## Monitor Index Usage

"What we really using the index we've created?"

it can save storage and improve write speed

### sp_helpindex 'tableName'

it's kind of like a store procedure that lists all indexes for a database table together some descriptions about them

### 'Sys' System Schema

Contains metadata about database tables, views, index... etc

### Dynamic Management View (DMV)

Provides real-time insights into Database performance and system health

## Monitor Missing Indexes

**SELECT**
**\***
**FROM sys.dm_db_missing_index_details;**

this schema will retrieve a table with all missing indexes suggestions

## Monitor Duplicate Indexes

Check if there's more than one index per column in a table

## Update Statistics

1. Weekly job to update statistics on weekends
2. After migrating data

## Monitoring Fragmentation

Unused spaces in data pages, data pages are out of order

### Fragmentation methods

#### Reorganize

- Defragments leaf nodes to keep them sorted
- "Light" Operation

#### Rebuild

- Recreates index from scratch
- "Heavy" Operation

#### avg_fragmentation_in_percent

Indicate how out-of-order pages are within the index

### When to Defragment

| Percentage   | Action           |
| ------------ | ---------------- |
| **< 10%**    | No Action Needed |
| **10 - 30%** | Reorganize       |
| **> 30%**    | Rebuild          |
