
## Database

A container that stores data

## Why use Database

To ‘ask questions’ about the Data, and get the answer about the Data rapidly;
Databases can handle really huge amount of Data;
Databases are more secure than a simple CSV or Text file.

## SQL

It's the Language we use to ‘talk’ to the Database. SQL Means Structured Query Language

## Database Management System (DBMs)

It will manage all requests sent to the Database, the security, and other things.

## Server

A Database usually stay in a server (a big powerful computer that stay powered on 24/7, rarely goes offline)

## Types of Databases

### SQL

**Relation:** like spreadsheets, we have tables, columns and lines, and relationships between the tables

**- EXAMPLES:** Microsoft SQL SERVER, MYSQL, POSTGRESQL

### NOSQL

**Key-Value:** Has pairs of keys and values, where the key point to the value
**- EXAMPLES:** REDIS, AMAZON DYNAMDB

**Column-based:** group the data into columns
**- EXAMPLES:** APACHE CASSANDRA, AMAZON REDSHIFT

**Graph:** focus on relationships between objects
**- EXAMPLES:** NEOHJ

**Document:** The data is stored as entire documents. The structure of the data is not important, what is more important is to fit everything in one page

**- EXAMPLES:** MONGODB

## Database Structure

- Servers host Databases;
- Databases hold Schemas
- Schemas hold Tables and Relationships
- Tables store records

**Server:** A powerful computer that hosts the Database 24/7, all the time online.
**Database:** A container that stores data.
**Schemas:** The structure of the Database (Tables, Relationships, Attributes).
**Tables:** Organizes the data into column and lines.

### Table Example

| table_user |           |               |
| ---------- | --------- | ------------- |
| user_id    | user_name | user_password |
|            |           |               |

Every line is a Record, individual from all others,
Every column is a property of the item

## Primary Key

A unique identifier for each record in a table

## Data Types

What kind of Data we store into a table (each column)

### Examples of Data Types

#### Numeric
**Int:** 1, 2, 30
#### Text (string)
**Char:** 'A', '1'
**Varchar:** 'maria', 'johnny'
#### Date and Time
**Date:** '2025-12-25'
**Time:** '09:22:15'

## Types of SQL COMMANDS

Supposing you have an empty Database, and you want to create a table - you use the **DDL COMMANDS**

Then, you need to create a table - you need **DML COMMANDS**

Once the Data is into the Table, we can start asking questions with **DQL COMMANDS**

#### DDL (Data Definition Language)

CREATE, ALTER, DROP

#### DML (Data Manipulation Language)

INSERT, UPDATE, DELETE

#### DQL (Data Query Language)

SELECT

## Why learning SQL?

Most part of the companies stores their Data into databases and you need to talk for the Data, ask questions for the Data

### High Demand

Software Developer, Data Analyst, Data Engineer, Data Scientist, you need to have SQL Skills

### Industry Standards

Most modern Data applications use SQL Commands