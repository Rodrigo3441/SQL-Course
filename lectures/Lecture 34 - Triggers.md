#### June 14th




## What is SQL trigger

Special stored procedure (set of statements) that automatically runs in response to a specific event on a table or view 

Triggers can be attached to an event, like a insertion, deletion or update. It can do a lot of things, like inserting data in another table, or sending a warning.

Based on a event in a table, a trigger will be executed

## Trigger Types

| DML Triggers               | DDL Triggers            | Loggon |
| -------------------------- | ----------------------- | ------ |
| INSERT<br>UPDATE<br>DELETE | CREATE<br>ALTER<br>DROP |        |

### DML Triggers Types

#### AFTER 

Runs after the event

#### INSTEAD OF

Runs during event

## Triggers Use Cases

### Logging

You can track and save like a report that can be used by auditors in order to know when something changed, who made the changes, where the changes were made.

Let's say a new user just created their account in a food delivery system and someone inside the database administration decided to "edit" their informations. With logs it's possible to figure out who made the changes


## Trigger Syntax

**CREATE TRIGGER trigger_name ON table_name**<br>
**| AFTER/INSTEAD OF(WHEN)| |INSERT, UPDATE, DELETE(OPERATION)|**<br>
**BEGIN**<br>
	**-- SQL STATEMENTS GO HERE<br>**
**END**<br>

#### INSERTED

Virtual table that holds a copy of the rows that are being inserted into the target table


