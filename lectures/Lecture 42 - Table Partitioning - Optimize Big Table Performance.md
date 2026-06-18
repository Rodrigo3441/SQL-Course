#### June 17th



## What is SQL Partitioning?

Divides big table into smaller partitions, while still being treated as a single logical table 

## Building Partitions

### #1 Create Partition Function

Define the logic on how to divide your data into partitions, based on partition keys like (column, region) 

#### Syntax

``` bash
CREATE PARTITION FUNCTION PartitionByYear (DATE)
AS RANGE LEFT FOR VALUES ('2023-12-31', '2024-12-31', '2025-12-31')
```

### #2 Create Filegroups

Logical container of one or more data files to help organize partitions

#### Syntax

``` bash
ALTER DATABASE SalesDB ADD FILEGROUP FG_2023;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2024;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2025;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2026;
```

### #3 Create Data Files

Define data files for each file group where the data will be stored

#### Syntax

``` bash
ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2023, --logical name
	FILENAME = 'file_path'

) TO FILEGROUP FG_2023;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2024, --logical name
	FILENAME = 'file_path'

) TO FILEGROUP FG_2024;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2025, --logical name
	FILENAME = 'file_path'

) TO FILEGROUP FG_2025;

ALTER DATABASE SalesDB ADD FILE
(
	NAME = P_2026, --logical name
	FILENAME = 'file_path'

) TO FILEGROUP FG_2026;
```

### #4 Create Partition Scheme

Assign for each partition a file group

#### Syntax

``` bash
CREATE PARTITION SCHEME SchemePartitionByYear 
AS PARTITION PartitionByYear
TO (FG_2023, FG_2024, FG_2025, FG_2026)
```

**Note**

**Sort** the filegroups according to the result of the function's partitions
#### Summary

- The partition function will decide how to split your data
- The partition scheme will map the partitions to the file groups
- The file groups are like folders in order to organize the data
- And each file group may have one or more files in order to store physically the data

### #5 Create Partitioned Table

``` bash
CREATE TABLE Sales.Orders_Partitioned
(
	OrderID INT,
	OrderDate DATE,
	Sales INT
) ON SchemePartitionByYear (OrderDate);
```

Creating a table that is connect to the partition we created, splitted by the date

## Everything is Connected

- We have a table and then we specify that it's connected to a partition scheme.
- And in the partition scheme we have everything connected, it's linked to a specific partition function
- we have the partitions and at the same it's connected to file groups
- And the file groups are connected to data files


## Sys Schema Important Queries

#### sys.partition_functions

``` bash
SELECT
	name,
	function_id,
	type,
	type_desc,
	boundary_value_on_right
FROM sys.partition_functions;
```

**What it does:**  
Returns information about all partition functions defined in the database, including their name, type, ID, and whether boundary values belong to the left or right partition.

**Important use case:**  
Useful for inspecting and documenting table partitioning configurations, helping DBAs understand how large tables are split across partitions for better performance and maintenance.

**Example note:**

> Lists all partition functions in the database and shows how partition boundaries are configured. Commonly used to analyze or troubleshoot table partitioning strategies.


#### sys.filegroups + sys.master_files

```bash
SELECT
	fg.name fileGroupName,
	mf.name logicalFileName,
	mf.physical_name physicalFilePath,
	mf.size / 128 sizeInMB
FROM
	sys.filegroups fg
JOIN
	sys.master_files mf ON fg.data_space_id = mf.data_space_id
WHERE
	mf.database_id = DB_ID()
```

**What it does:**  
Lists all filegroups in the current database along with their logical file names, physical file paths, and sizes in MB.

**Important use case:**  
Useful for monitoring database storage, verifying filegroup configurations, and checking where database files are physically stored on disk.

**Example note:**

> Displays the filegroups and associated database files, including location and size. Commonly used for storage management, maintenance, and partitioning setups.


#### sys.partition_schemes + related system views

```bash
SELECT
	ps.name partitionSchemeName,
	pf.name partitionFunctionName,
	ds.destination_id partitionNumber,
	fg.name fileGroupName
FROM
	sys.partition_schemes ps
JOIN
	sys.partition_functions pf ON ps.function_id = pf.function_id
JOIN
	sys.destination_data_spaces ds ON ps.data_space_id = ds.partition_scheme_id
JOIN
	sys.filegroups fg ON ds.data_space_id = fg.data_space_id
```

**What it does:**  
Lists all partition schemes in the database, showing the partition function they use and the filegroup assigned to each partition.

**Important use case:**  
Useful for understanding how partitions are distributed across filegroups, which helps with performance tuning, storage management, and partition maintenance.

**Example note:**

> Displays partition schemes, their associated partition functions, and the filegroups used by each partition. Commonly used to analyze and verify partition storage layouts.


#### sys.partitions + related system views,

``` bash
SELECT
	p.partition_number partitionNumber,
	f.name partitionFileGroup,
	p.rows numberOfRows
FROM
	sys.partitions p
JOIN
	sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN
	sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE
	OBJECT_NAME(p.object_id) = 'Orders_Partitioned';
```

**What it does:**  
Shows each partition of the `Orders_Partitioned` table, including the partition number, the filegroup where it is stored, and the number of rows it contains.

**Important use case:**  
Useful for checking data distribution across partitions and verifying whether a partitioning strategy is working as expected.

**Example note:**

> Displays the partitions of a specific table, their associated filegroups, and row counts. Commonly used to monitor partition usage and validate data distribution.

