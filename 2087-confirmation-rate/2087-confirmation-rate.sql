/* Write your T-SQL query statement below */

SELECT user_id ,
CASE 
    WHEN allConfirmed = 0 THEN 0 
    ELSE ROUND(CAST(confirmed AS FLOAT) / allConfirmed , 2)
    END AS confirmation_rate
FROM
(SELECT S.user_id AS user_id, COUNT(CASE WHEN C.action = 'Confirmed' THEN 1 END) as confirmed,
COUNT (C.action) as allConfirmed
FROM Confirmations C RIGHT JOIN Signups S
ON C.user_id = S.user_id
GROUP BY S.user_id) AS T1


