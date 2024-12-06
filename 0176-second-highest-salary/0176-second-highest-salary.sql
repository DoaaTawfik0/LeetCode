WITH T1 AS
(
   SELECT CASE WHEN DENSE_RANK() OVER (ORDER BY Salary DESC) = 2 THEN Salary END AS SecondHighestSalary
   FROM Employee
)
SELECT MAX(SecondHighestSalary) SecondHighestSalary
FROM T1
