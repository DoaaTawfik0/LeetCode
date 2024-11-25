/* Write your T-SQL query statement below */

SELECT st.student_id ,st.student_name ,sub.subject_name ,COUNT(ex.subject_name ) AS attended_exams
FROM Students st CROSS JOIN Subjects sub
LEFT JOIN Examinations ex
ON st.student_id = ex.student_id AND sub.subject_name = eX.subject_name   
GROUP BY st.student_id ,st.student_name ,sub.subject_name 
ORDER BY st.student_id , sub.subject_name;
