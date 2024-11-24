/* Write your T-SQL query statement below */

SELECT P.ID 
FROM Weather c , Weather p
where DATEADD(day,-1,p.recordDate) = c.recordDate
AND p.temperature-c.temperature > 0;
