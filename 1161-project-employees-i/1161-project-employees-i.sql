/* Write your T-SQL query statement below */




SELECT p.project_id,
       ROUND(AVG(CAST(experience_years AS DECIMAL(10,2))), 2) AS average_years
FROM Employee e JOIN Project p
ON e.employee_id = p.employee_id
GROUP BY p.project_id
ORDER BY P.project_id






