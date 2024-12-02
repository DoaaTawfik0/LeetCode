/* Write your T-SQL query statement below */

WITH T1 AS
(
    SELECT *, ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY primary_flag DESC) as RN
    FROM Employee            
)

SELECT employee_id, department_id
FROM T1
WHERE RN = 1;