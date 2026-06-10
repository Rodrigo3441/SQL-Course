USE mydatabase;

-- adding new customers
INSERT INTO customers (id, first_name, country, score)
VALUES 
(6, 'Anna', 'USA', NULL),
(7, 'Sam', NULL, 100);

-- select for testing
SELECT * FROM customers;

-- adding just two columns
INSERT INTO customers (id, first_name)
VALUES 
(10, 'Sahra');

-- copy data from 'customers' table into 'persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT
id,
first_name,
NULL,
'Unknown'
FROM customers;


SELECT * FROM persons;

-- Change the score of customer 6 to 0
SELECT *
FROM customers;

UPDATE customers
SET score = 0
WHERE id = 6;


-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
SELECT *
FROM customers
WHERE id = 10;

UPDATE customers
SET
score = 0,
country = 'UK'
WHERE id = 10;

-- Update all customers with a NULL score by setting their score to 0
SELECT *
FROM customers;

UPDATE customers
SET score = 0
WHERE score IS NULL
LIMIT 50;

-- Delete all customers with an ID greater than 5
SELECT *
FROM  customers;

DELETE FROM customers
WHERE id > 5;

-- Delete all data from the persons table
TRUNCATE TABLE persons;




