#### June 16th



## When to use Index

| Heap                                 | Clustered rowstore Index       | Columnstore index                    | Non-Clustered Index                | Filtered Index            | Unique index           |
| ------------------------------------ | ------------------------------ | ------------------------------------ | ---------------------------------- | ------------------------- | ---------------------- |
| Fast Inserts<br>(For Staging Tables) | (OLTP)<br>For Primary Keys<br> | (OLAP)<br>For analytical queries<br> | For non-PK column<br>              | Target subset of data<br> | Enforce uniqueness<br> |
|                                      | If not, then for date columns  | Reduce size of large table           | (Foreign keys, joins, and filters) | Reduce size of index      | Improve query speed    |
