/* Write your T-SQL query statement below */


WITH T1 AS
(
    SELECT p.project_id,COUNT(e.employee_id) employeeCount,sum(e.experience_years) yearsCount
    FROM Employee e JOIN Project p
    ON e.employee_id = p.employee_id
    GROUP BY p.project_id
)
SELECT project_id, 
       ROUND(CAST(yearsCount * 100 AS FLOAT) / employeeCount, 0) / 100 AS average_years
FROM T1
ORDER BY project_id;

