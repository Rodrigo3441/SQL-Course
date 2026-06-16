#### June 15th



## What is Columnstore and Rowstore Index

![](../images/Lecture%2036/Image%2001%20-%20Columnstore%20vs%20Rowstore.png)

### Rowstore Index

The table will be splitted into multiple rows and stored in data pages, all the column for each row will be stored together

### Columnstore Index

The table will be splitted into multiple column and stored in data page

## How SQL Builds Columnstore - The Process

![](../images/Lecture%2036/image%2002%20-%20Columnstore%20process.png)

### 1st step - Row Groups

Spli the source data into small groups in order to improve the performance through the process (parallel processing)

### 2nd step - Column segment

Split the data by the column

### 3rd step - Compression

Use techniques in order to optimize performance and save storage as well

Example

Let's say one column named "Status" contains the status of an employee

| Status   |
| -------- |
| Active   |
| Inactive |
| Active   |
| Inactive |

Instead of storing the entire table as "Active" and "Inactive", you can create something like a dictionary that translate these two words into numbers, example

| Value    | Translated into Number |
| -------- | ---------------------- |
| Active   | 1                      |
| Inactive | 2                      |

So this technique will improve the performance of the database and as well, save storage

| Before   | After |
| -------- | ----- |
| Status   | X     |
| Active   | 1     |
| Inactive | 2     |
| Active   | 1     |
| Inactive | 2     |

### 4rd step - Store

The database will start storing the data in LOB Pages (Large Object Pages)

### **Columnstore vs Rowstore**

**Columnstore Structure**

**LOB Page**

| Header                                                                         | 1:200                                       |
| ------------------------------------------------------------------------------ | ------------------------------------------- |
| Segment Header<br>SegmentID = 1<br>RowgroupID = 20<br>DictionaryID = 1:050<br> | DictionaryID<br>1:050<br>'A' = 1<br>'B' = 2 |
| Data Stream<br>\[1,1,2,2,1,2,1]                                                |                                             |

**Data Page**

| Header | 1:150             |
| ------ | ----------------- |
| Row1   | 1,Bob,USA         |
| Row2   | 2,Anna,Germany    |
| Row3   | 3,Lisa,Italy      |
| ...    | ...               |
| Offset | \[140]\[118]\[96] |


## Rowstore Index vs Columnstore Index

|                             | Rowstore Index                                                                     | Columnstore Index                                                                                      |
| --------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| **definition**              | Organizes and stores data row by row                                               | Organizes and stores data column by column                                                             |
| **Storage efficiency**      | Less eficient in storage                                                           | Highly efficient with compression                                                                      |
| **Read/Write Optimization** | Fair speed for read and write operations                                           | Fast read performance<br>Slow write performance                                                        |
| **I/O<br>Efficiency**       | Higher (retrieves all columns)                                                     | Lower (retrieves specific column)                                                                      |
| **Best for...**             | **OLTP (Transactional)**<br>commerce, banking, financial systems, order processing | **OLAP (Online Analytical Processing)**<br>data warehouse, business intelligence, reporting, analytics |
| **Use Case**                | High-frenquently transaction applications<br>Quick access to complete records      | Big Data Analytics<br>Scanning of large datasets<br>Fast aggregation                                   |

## How to Create Columnstore Index

**CREATE \[CLUSTERED | NONCLUSTERED ] \[COLUMNSTORE] INDEX index_name ON table_name (column1, column2)**


| Rowstore        | CREATE NONCLUSTERED INDEX IX_Customers_Country<br>ON Customers (Country)          |
| --------------- | --------------------------------------------------------------------------------- |
|                 | **CREATE CLUSTERED INDEX IX_Customers_ID<br>ON Customers (ID)**                   |
| **Columnstore** | **CREATE NONCLUSTERED COLUMNSTORE IX_Customers_Country<br>ON Customers (Country** |
|                 | **CREATE CLUSTERED COLUMNSTORE INDEX IX_Customers<br>ON Customers**               |
#### Rules

You can't specify columns in Clustered index Columnstore