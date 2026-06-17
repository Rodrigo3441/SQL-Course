-- ===============================
-- first one: unused indexes
-- ===============================

-- List all indexes on a specific table

sp_helpindex 'Sales.DBCustomers';

-- Monitoring Index Usage

SELECT
	tbl.name AS tableName,
	idx.name AS indexName,
	idx.type_desc AS indexType,
	idx.is_primary_key AS isPrimaryKey,
	idx.is_unique AS isUnique,
	idx.is_disabled AS isDisabled,
	s.user_seeks AS userSeeks,
	s.user_scans AS userScans,
	s.user_lookups AS userLookups,
	s.user_updates AS userUpdates,
	COALESCE(s.last_user_seek, s.last_user_scan) AS lastUpdate
FROM sys.indexes AS idx
JOIN sys.tables tbl
ON idx.object_id = tbl.object_id
LEFT JOIN sys.dm_db_index_usage_stats s
ON s.object_id = idx.object_id 
AND s.index_id = idx.index_id
ORDER BY tbl.name, idx.name


SELECT * FROM sys.tables;

SELECT * FROM sys.dm_db_index_usage_stats;

-- ===============================
-- third one: duplicate indexes
-- ===============================

SELECT
	tbl.name AS tableName,
	col.name AS indexColumn,
	idx.name AS indexName,
	idx.type_desc AS indexType,
	COUNT(*) OVER(PARTITION BY tbl.name, col.name) columnCount
FROM sys.indexes idx
JOIN sys.tables tbl ON idx.object_id = tbl.object_id
JOIN sys.index_columns ic ON idx.object_id = ic.object_id AND idx.index_id = ic.index_column_id
JOIN sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
ORDER BY columnCount DESC

-- ===============================
-- fourth one: updated statistics
-- ===============================

SELECT
	SCHEMA_NAME(t.schema_id) AS schemaName,
	t.name AS tableName,
	s.name AS statisticsName,
	sp.last_updated AS lastUpdate,
	DATEDIFF(day, sp.last_updated, GETDATE()) AS lastUpdateDay,
	sp.rows AS 'Rows',
	sp.modification_counter AS modificationsSinceLastUpdate
FROM sys.stats AS s
JOIN sys.tables AS t
ON s.object_id = t.object_id
CROSS APPLY sys.dm_db_stats_properties(s.object_id, s.stats_id) AS sp
ORDER BY sp.modification_counter DESC;

UPDATE STATISTICS Sales.Customers -- table name

-- update the statistics for the entire database
EXEC sp_updatestats;

-- ===============================
-- fifth: monitoring fragmentation
-- ===============================

SELECT
	tbl.name tableName,
	idx.name indexName,
	s.avg_fragmentation_in_percent,
	s.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, 'LIMITED') AS s
INNER JOIN sys.tables tbl
ON s.object_id = tbl.object_id
INNER JOIN sys.indexes AS idx
ON idx.object_id = s.object_id
AND idx.index_id = s.index_id
ORDER BY s.avg_fragmentation_in_percent DESC

-- reorganizing the source data
ALTER INDEX idx_DBCustomers_CS_FirstName ON Sales.DBCustomers REORGANIZE

-- rebuilding the source data
ALTER INDEX idx_Customers_Country ON Sales.Customers REBUILD