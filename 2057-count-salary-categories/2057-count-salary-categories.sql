/* Write your T-SQL query statement below */

WITH T1 AS
(
    SELECT 'Low Salary' AS  category,ISNULL(COUNT(income), 0) accounts_count
    FROM Accounts
    WHERE income < 20000
), T2 AS
(
    SELECT 'Average Salary' AS  category, ISNULL(COUNT(income), 0) accounts_count
    FROM Accounts
    WHERE income >= 20000 AND income <= 50000
), T3 AS
(
    SELECT 'High Salary' AS  category, ISNULL(COUNT(income) ,0) accounts_count
    FROM Accounts
    WHERE income > 50000
)

SELECT * FROM T1
UNION ALL
SELECT * FROM T2
UNION ALL
SELECT * FROM T3