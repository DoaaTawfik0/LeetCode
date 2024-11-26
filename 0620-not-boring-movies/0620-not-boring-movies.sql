/* Write your T-SQL query statement below */

SELECT *
FROM Cinema
WHERE id%2 != 0 AND (description != 'boring' OR description IS NULL)
ORDER BY Rating DESC