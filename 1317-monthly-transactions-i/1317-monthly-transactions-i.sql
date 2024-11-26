/* Write your T-SQL query statement below */

SELECT FORMAT(trans_date, 'yyyy-MM') AS month,
       country,
       COUNT(state) trans_count,
       COUNT(CASE WHEN state = 'approved' THEN 1 END) approved_count,
       SUM(amount) trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount END) approved_total_amount

FROM Transactions
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country
ORDER BY FORMAT(trans_date, 'yyyy-MM')