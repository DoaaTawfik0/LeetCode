/* Write your T-SQL query statement below */

SELECT X.machine_id , ROUND(SUM(Y.timestamp-X.timestamp)/COUNT(X.process_id), 3) AS processing_time
FROM Activity X INNER JOIN Activity Y
ON X.machine_id = Y.machine_id AND X.process_id = Y.process_id AND Y.timestamp-X.timestamp > 0
GROUP BY  X.machine_id ;
