
## Data Warehouse

A special database that collects and integrates data from different sources to enable analytics and support decision-making

## Simplified Database Architecture

![](../images/Lecture%2026/image%2001%20-%20database%20architecture.png)

## Database Engine

It is the brain of the database, executing multiple operations such as storing, retrieving, and managing data within the database

## Disk Storage

- Long-term memory, where data is stored permanently
- +capacity: can hold a large amount of data
- -speed: slow to read and to write

## Cache

- Fast short-term memory, where data is stored temporarily
- +speed: extremely fast to read and to write
- -capacity: can hold smaller amount of data

## User Data Storage

It’s the main content of the database. This is where the actual data that users care about is stored

## System Catalog

Database’s internal storage for its own information. A blueprint that keeps track of everything about the database itself, not the user data. It holds the Metadata information about the database

## Metadata

Data about Data

### Example of Metadata

**Customers Table (actual data)**

| **customerid** | **firstname** | **lastname** | **country** | **score** |
| -------------- | ------------- | ------------ | ----------- | --------- |
| 1              | Jossef        | Goldberg     | Germany     | 350       |
| 2              | Kevin         | Brown        | USA         | 900       |
| 3              | Mary          |              | USA         | 750       |
| 4              | Mark          | Schwarz      | Germany     | 500       |

**Metadata of Customers table (data about data)**

| **table name** | **column name** | **data type** | **length** | **is nullable** |
| -------------- | --------------- | ------------- | ---------- | --------------- |
| Customers      | customerid      | int           |            | no              |
| Customers      | firstname       | varchar       | 50         | yes             |
| Customers      | lastname        | varchar       | 50         | yes             |
| Customers      | country         | varchar       | 50         | yes             |
| Customers      | score           | int           |            | yes             |

## Information Schema

A system-defined schema with built-in views that provide info about the database, like table and columns

## Temp Data Storage

Temporary space used by the database for short-term tasks, like processing queries or sorting data, once these tasks are done, the storage is cleared


## Importance of the five SQL techniques for optimizing queries

### Challenges without those techniques

- Redundancy
- Performance issues
- Complexity
- Hard to maintain
- DB Stress
- Security

### Solutions

- Subquery
- CTE (Common Table Expression)
- Views
- Temp Tables
- CTAS (Create Table As Select)

