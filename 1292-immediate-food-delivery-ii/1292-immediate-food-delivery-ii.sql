/* Write your T-SQL query statement below */


WITH T1 AS
(
  SELECT X.*
  FROM Delivery X 
  WHERE X.order_date = (
       SELECT MIN(Y.order_date)
       FROM Delivery Y
       WHERE X.customer_id = Y.customer_id
    )
)

SELECT ROUND(
        CAST(SUM(IIF(order_date = customer_pref_delivery_date, 1, 0)) AS FLOAT) 
        * 100.0 / COUNT(order_date),
        2
    ) AS immediate_percentage
FROM T1