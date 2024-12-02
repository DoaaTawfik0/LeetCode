/* Write your T-SQL query statement below */

-- WITH GetPrimaryDep AS
-- (
--     SELECT employee_id, department_id
--     FROM Employee
--     WHERE primary_flag = 'Y'
-- ), GetOnlyDep AS
-- (
--      SELECT employee_id, department_id
--      FROM (SELECT COUNT(employee_id) AS cnt FROM Employee GROUP BY employee_id)
--      WHERE cnt = 1
    
-- )

WITH T1 AS
(
   SELECT employee_id
   FROM Employee  
   GROUP BY employee_id
   HAVING COUNT(employee_id) = 1
),GetPrimaryDep AS
(
    SELECT employee_id, department_id
    FROM Employee
    WHERE primary_flag = 'Y'
),GetOnlyDep AS
(
    SELECT E.employee_id , E.department_id
    FROM Employee E JOIN T1
    ON T1.employee_id = E.employee_id
)

SELECT * FROM GetPrimaryDep
UNION 
SELECT * FROM GetOnlyDep
