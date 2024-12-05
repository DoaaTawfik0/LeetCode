/* Write your T-SQL query statement below */

WITH Numbers AS
(
  SELECT id, num, LAG(NUM) OVER(ORDER BY id) AS lagNumber, 
                  LEAD(NUM) OVER(ORDER BY id) AS leadNumber
  FROM Logs
)

SELECT DISTINCT(num) AS ConsecutiveNums
FROM Numbers
WHERE num = lagNumber AND num = leadNumber;

-- SELECT * FROM Numbers

   