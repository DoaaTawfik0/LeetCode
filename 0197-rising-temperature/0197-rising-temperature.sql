/* Write your T-SQL query statement below */

SELECT Today.ID 
FROM Weather Today , Weather Yesterday
where DATEADD(day,-1,Today.recordDate) = Yesterday.recordDate
AND Today.temperature > Yesterday.temperature ;
