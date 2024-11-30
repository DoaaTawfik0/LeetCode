/* Write your T-SQL query statement below */

WITH T1 AS
(
   SELECT customer_id, COUNT(DISTINCT(product_key)) cnt1
   FROM Customer
   GROUP BY customer_id
)
SELECT customer_id 
FROM T1
WHERE cnt1 = ( SELECT COUNT(*) FROM Product)