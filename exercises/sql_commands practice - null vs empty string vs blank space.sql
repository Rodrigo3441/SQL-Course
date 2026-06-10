# using nulls and empty string
SELECT 
id,
TRIM(category) AS policy1
FROM (
SELECT 1 id, 'A' category UNION
SELECT 2,  NULL UNION
SELECT 3, '' UNION
SELECT 4, ' '
) AS sub;

# using only nulls
SELECT 
TRIM(category) AS policy1,
NULLIF(TRIM(category), '') AS policy2
FROM (
SELECT 1 id, 'A' category UNION
SELECT 2,  NULL UNION
SELECT 3, '' UNION
SELECT 4, ' '
) AS sub;

# using a default value
SELECT 
TRIM(category) AS policy1,
NULLIF(TRIM(category), '') AS policy2,
COALESCE(NULLIF(TRIM(category), ''), 'unknown') AS policy3
FROM (
SELECT 1 id, 'A' category UNION
SELECT 2,  NULL UNION
SELECT 3, '' UNION
SELECT 4, ' '
) AS sub;