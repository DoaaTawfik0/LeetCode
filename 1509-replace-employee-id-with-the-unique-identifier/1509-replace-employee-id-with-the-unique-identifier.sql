/* Write your T-SQL query statement below */


SELECT EmpUni.unique_id , Emp.name
FROM Employees Emp LEFT OUTER JOIN EmployeeUNI EmpUni
ON Emp.id = EmpUni.id;
