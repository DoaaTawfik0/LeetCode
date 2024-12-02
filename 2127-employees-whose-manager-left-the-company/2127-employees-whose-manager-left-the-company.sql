/* Write your T-SQL query statement below */

SELECT T2.employee_id 
FROM Employees T2
WHERE T2.salary < 30000
  AND (
      T2.manager_id IS NOT NULL AND
      NOT EXISTS (
          SELECT 1
          FROM Employees T3
          WHERE T3.employee_id = T2.manager_id
      )
  )
ORDER BY T2.employee_id ;