/* Write your T-SQL query statement below */
SELECT DISTINCT(V.customer_id) , COUNT(customer_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY customer_id;



