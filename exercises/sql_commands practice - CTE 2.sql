
-- anchor query
WITH RECURSIVE series AS 
(
SELECT
1 AS my_number
UNION ALL

-- recursive query
SELECT
my_number + 1
FROM series
WHERE my_number < 20
)

-- main query
SELECT *
FROM series


