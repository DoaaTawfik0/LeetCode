/* Write your T-SQL query statement below */

SELECT name
FROM
(SELECT COUNT(Y.id) as counting, Y.name , Y.id
FROM Employee X Join Employee Y
ON Y.id = X.managerId
GROUP BY Y.name , Y.id) AS T1
WHERE counting >= 5;
