/* Write your T-SQL query statement below */

WITH T1 AS
(
   SELECT num, COUNT(*) AS cnt
   FROM MyNumbers
   GROUP BY num
)
SELECT MAX(num) AS num
FROM T1
WHERE cnt = 1;
