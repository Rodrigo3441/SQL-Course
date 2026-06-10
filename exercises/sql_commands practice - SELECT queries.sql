-- Using the database
USE mydatabase;

-- Retrieve All Customer Data
SELECT *
FROM customers;

-- Retrieve All Order Data
SELECT *
FROM orders;

-- Retrieve each customer's name, country and score
SELECT
	first_name,
    country,
    score
FROM customers;

-- Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;

-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany';

-- Retrieve all customers and sort the results by the lowest score first
SELECT *
FROM customers
ORDER BY score DESC;

-- Retrueve akk customers and sort the results by the country and then by the highest score
SELECT *
FROM customers
ORDER BY country ASC, score DESC;

-- Find the total score for each country
SELECT
	country,
    SUM(score) AS total_score
FROM customers
GROUP BY country;

-- Find the average score for each country considering only customers with a score not equal to 0
-- And return only those countries with an average score greater than 430
SELECT
	country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

-- Return unique list of all countries
SELECT DISTINCT id
FROM customers;

-- Retrieve the Top 3 customers with the highest scores
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;




