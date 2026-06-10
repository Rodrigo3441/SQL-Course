USE mydatabase;

/* concatenate first name and country into one column */
SELECT
CONCAT(first_name,' ', country) AS name_country,
first_name,
country
FROM customers AS c;

/* transform the customer's first name to lowercase */
SELECT
LOWER(first_name) AS low_name
FROM customers AS c;

/* transform the customer's first name to uppercase */
SELECT
UPPER(first_name) AS up_name
FROM customers AS c;

/* find customers whose first name contains leading or trailing spaces */
SELECT
first_name
FROM customers AS c
WHERE first_name != TRIM(first_name);

/* Remove dashes (-) from a phone number*/
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890', '-', '') AS clean_phone;

/* replace file extence from txt to csv */
SELECT
'report.txt' AS old_file_name,
REPLACE('report.txt', '.txt', '.csv') AS new_file;

/* calculate the length of each customer's first name */
SELECT
first_name,
LENGTH(first_name) AS name_length
FROM customers AS c;

/* retrieve the first and last two characters of each first name */
SELECT
first_name,
LEFT(TRIM(first_name), 2) AS first_characters,
RIGHT(first_name, 2) AS last_characters
FROM customers;

/* retrieve a list of customers' first names removing the first character */
SELECT
SUBSTRING(TRIM(first_name), 2, LENGTH(first_name)) AS sub_name
FROM customers;