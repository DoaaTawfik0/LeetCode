/* Write your T-SQL query statement below */

SELECT contest_id ,
       ROUND(COUNT(r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY contest_id
ORDER BY percentage Desc , contest_id