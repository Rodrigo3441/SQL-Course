#### June 15th



## What is an index

Data structure that provides quick access to data, optimizing the speed of your queries

It's kind of like a guide for  your database to speed up the process of searching for data

## Index Types

| Structure                              | Storage                             | Functions                      |
| -------------------------------------- | ----------------------------------- | ------------------------------ |
| Clustered Index<br>Non-Clustered Index | Rowstore Index<br>Columnstore Index | Unique Index<br>Filtered Index |

### Trade-off

Some indexes are better for reading, others for writing performance

## Heap Structure

Before anything, let's understand what happens to the database if you don't use any indexes

When you create a new table in the database, like customers table

| ID  | Name |
| --- | ---- |
| 1   | Bob  |
| 2   | Anna |
| ... | ...  |
| 20  | Jane |

What you are going to see at the client side is like spreadsheets, like a table with columns and rows
But behind the scenes the database stores it a bit different

The database stores in a data file (.mdf) on the disk and inside this file the data is going to be store inside blocks called **Pages**

### Page

The smallest unit of data storage in a database (fix size of 8kb). It stores anything (Data, Metadata, Indexes, etc.)

**Types:**
- Data page
- Index page

#### Data Page - Structure

| Header | 1:150             | Header Structure | FileID, UniquePageNumber                                                            |
| ------ | ----------------- | ---------------- | ----------------------------------------------------------------------------------- |
| Row1   | 1,Bob,USA         | Records          | Records                                                                             |
| Row2   | 2,Anna,Germany    | Records          | Records                                                                             |
| Row3   | 3,Lisa,Italy      | Records          | Records                                                                             |
| ...    | ...               | ...              | ...                                                                                 |
| Offset | \[140]\[118]\[96] | **Offset Array** | A quick index for the rows stored inside this page<br>It says where each row begins |

### What happens if you don't use any indexes

The data will be stored without following any order

![](../images/Lecture%2035/image%2001%20-%20heap%20data%20file%20structure.png)

#### Heap

A table without clustered index. That means that the rows are stored randomly without any particular order.

Slow Read, Fast Write

### Table Full Scan

Scans the entire table page by page and row by row, searching for data

## Structure Indexes

### Clustered

Determines the physical order of rows in a database table

You can create only one Clustered index on a table

#### B-Tree (Balance Tree)

Hierarchical Structure storing data at leaves, to help quickly locate data

![](../images/Lecture%2035/image%2002%20-%20b-tree.png)

the leaves at the b-tree contain the actual data. The data is stored at the leaf level

#### Index Page

It stores key values (pointers) to another page. It doesn't store the actual rows

#### Database B-Tree Big Picture (Clustered Index)

![](../images/Lecture%2035/image%2003%20-%20balance%20tree%20on%20the%20database.png)


### Non-Clustered Index

it's like an index in the back of a textbook. It is a **separated** structure from the actual table data that contains a sorted list of specific columns, along with "pointers" (or row locators)

A non-clustered index won't reorganize or change anything on the data page, it'll be kept as it is

Index page will have a row identifier that points to the page that contains that record

You can create as many non-clustered index as you want
#### RowID Structure

**1:102:96**

**1:** FileId<br>
**102:** PageNumber<br>
**96:** RowOffsetM<br>

#### Database B-Tree Big Picture (Non-Clustered Index)

![](../images/Lecture%2035/image%2004%20-%20balance%20tree%20on%20the%20database%20non-clustered.png)

## Clustered Index vs Non-Clustered Index

|                    | Clustered Index                                                                    | Non-Clustered Index                                                          |
| ------------------ | ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Definition         | Physically sorts and stores rows                                                   | Separate structure with pointers to the data                                 |
| Number of indexes  | One index per table                                                                | Multiple indexes are allowed                                                 |
| Read performance   | Faster                                                                             | Slower                                                                       |
| Write performance  | Slower, due to potential data row reordering                                       | Faster, since physical data order is unaffected                              |
| Storage Efficiency | More storage-efficient                                                             | Requires additional storage space                                            |
| Use Case           | Unique Column<br>Not frequently modified Column<br>Improve range query performance | Column frequently used in search conditions and joins<br>exact match queries |

## How to create index - Syntax

**CREATE \[CLUSTERED | NONCLUSTERED] INDEX index_name
ON table_name (column1, column2)**

**CREATE CLUSTERED INDEX IX_customers_id ON Customers (ID)**

**CREATE NONCLUSTERED INDEX IX_Customers_city ON Customers (City)**

**CREATE INDEX IX_Customers_Name ON Customers (LastName ASC, FirstName DESC) (NONCLUSTERED)**

### Composite Indexes

**CREATE INDEX idx_DBCustomers_CountryScore**
**ON Sales.DBCustomers (Country, Score)**

#### Leftmost Prefix Rule

Indexes works only if your query filters start from the first column in the index and follow its order