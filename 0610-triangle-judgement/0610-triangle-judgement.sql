/* Write your T-SQL query statement below */

SELECT *, 
       CASE 
          WHEN (X+Y > Z) AND (X+Z > Y) AND (Y+Z > X) THEN 'Yes'
          ELSE  'No'
       END AS triangle
FROM Triangle;       





-- SELECT *
-- FROM Triangle
-- WHERE (X+Y > Z) AND
--       (X+Z > Y) AND
--       (Y+Z > X);