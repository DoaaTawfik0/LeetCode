/* Write your T-SQL query statement below */

WITH T1 AS
(
    SELECT  class, COUNT(student) AS cnt
    FROM Courses
    GROUP BY class
)

SELECT class
FROM T1
WHERE cnt >= 5;