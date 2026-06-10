USE salesdb;

-- testing dates
SELECT
orderid,
creationtime,
EXTRACT(YEAR FROM creationtime) AS year_extract,
EXTRACT(MONTH FROM creationtime) AS month_extract,
EXTRACT(DAY FROM creationtime) AS day_extract,
EXTRACT(HOUR FROM creationtime) AS hour_extract,
EXTRACT(MINUTE FROM creationtime) AS minute_extract,
EXTRACT(SECOND FROM creationtime) AS second_extract,
EXTRACT(QUARTER FROM creationtime) AS quarter_extract,
WEEKDAY(creationtime) + 1 AS week_day,
DAY(creationtime) AS day_creation,
MONTH(creationtime) AS month_creation,
YEAR(creationtime) AS year_creation
FROM orders;

-- using datename (monthname and dayname)
SELECT
orderid,
creationtime,
MONTHNAME(creationtime) AS month_name,
DAYNAME(creationtime) AS day_name
FROM orders;

-- using datatrunc
SELECT
orderid,
creationtime,
CONCAT(YEAR(creationtime), '-', MONTH(creationtime), '-', DAY(creationtime)) AS date_trunc
FROM orders;

SELECT
CONCAT(YEAR(creationtime), '-', MONTH(creationtime)) AS year_month_date,
COUNT(*)
FROM orders
GROUP BY year_month_date;

-- last_day
SELECT
LAST_DAY(creationtime)
FROM orders;

-- first day
SELECT
CONCAT(YEAR(creationtime), '-', LPAD(MONTH(creationtime), 2, '0'), '-', '01')
FROM orders;

/* how many orders were placed each year? */
SELECT
YEAR(orderdate) AS orders_year,
COUNT(*)
FROM orders
GROUP BY orders_year;

/* how many orders were placed each month? */
SELECT
MONTHNAME(orderdate) AS order_month,
COUNT(*)
FROM orders
GROUP BY MONTHNAME(orderdate);

/* Show all orders that were placed during the month of february */
SELECT *
FROM orders
WHERE MONTH(orderdate) = 2;

/* some format examples */
SELECT
orderid,
creationtime,
DATE_FORMAT(creationtime, '%m-%d-%Y') USA,
DATE_FORMAT(creationtime, '%d-%m-%Y') EURO,
DATE_FORMAT(creationtime, '%d') dd,
DATE_FORMAT(creationtime, '%a') ddd,
DATE_FORMAT(creationtime, '%A') dddd,
DATE_FORMAT(creationtime, '%m') mm,
DATE_FORMAT(creationtime, '%b') mmm,
DATE_FORMAT(creationtime, '%M') mmmm
FROM orders;


# show creationtime using the following format: Day Wed Jan Q1 2025 12:34:56 PM
SELECT
orderid,
creationtime,
CONCAT_WS(' ','Day',
DATE_FORMAT(creationtime, '%a'),
DATE_FORMAT(creationtime, '%b'),
CONCAT('Q', QUARTER(creationtime)),
DATE_FORMAT(creationtime, '%Y'),
DATE_FORMAT(creationtime, '%r')) AS customerformat
FROM orders;

# Some aggregations examples
SELECT
DATE_FORMAT(orderdate, '%b %y') AS period,
COUNT(*)
FROM orders
GROUP BY DATE_FORMAT(orderdate, '%b %y');

SELECT
CAST('123' AS SIGNED),
CAST(CURRENT_TIMESTAMP() AS DATE) AS converted_date,
CONVERT('2025-11-23', DATE),
CAST(creationtime AS DATE) AS order_date_converted,
DATE_FORMAT(creationtime, '%m-%d-%Y')
FROM orders;

# some cast examples
SELECT
CAST('123' AS SIGNED) AS str_to_int,
CAST(123 AS CHAR) AS int_to_str,
CAST('2025-08-20' AS DATE) str_to_date,
CAST('2025-08-20' AS DATETIME) str_to_datetime,
creationtime,
CAST(creationtime AS DATE) datetime_to_date
FROM orders;

# DATE_ADD
SELECT
orderid,
orderdate,
DATE_ADD(creationtime, INTERVAL -7 DAY) AS sevendayslater,
DATE_ADD(creationtime, INTERVAL 7 MONTH) AS sevenmonthslater,
DATE_ADD(creationtime, INTERVAL 7 YEAR) AS sevenyearslater
FROM orders;

/* calculate the age of employees*/
SELECT
*,
TIMESTAMPDIFF(YEAR, birthdate, CURRENT_DATE) AS employee_age
FROM employees;

# find the average shipping duration in days for each month
SELECT
MONTH(orderdate) AS order_month,
FORMAT(AVG(TIMESTAMPDIFF(DAY, orderdate, shipdate)), 2) AS ship_days_duration
FROM orders
GROUP BY MONTH(orderdate);

# Find the number of days between each order and previous order
SELECT
orderid,
orderdate currentorderdate,
LAG(orderdate)  OVER (ORDER BY orderdate) AS previousorderdate,
TIMESTAMPDIFF(DAY, LAG(orderdate)  OVER (ORDER BY orderdate), orderdate) AS date_diff
FROM orders;

# some examples about ISDATE
SELECT
STR_TO_DATE('2025-08-20', '%Y-%m-%d') IS NOT NULL AS is_valid_date;

# isdate use example

SELECT
#CAST(orderdate AS DATE) as order_date
CASE WHEN STR_TO_DATE(orderdate, '%Y-%m-%d') IS NOT NULL = 1
THEN CAST(orderdate AS DATE)
ELSE '9999-01-01'
END neworderdate

FROM 
(
SELECT '2025-08-20' AS orderdate UNION
SELECT '2025-08-21' UNION
SELECT '2025-08-23' UNION
SELECT '2025-08'
)t

