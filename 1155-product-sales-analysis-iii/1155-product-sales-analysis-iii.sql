/* Write your T-SQL query statement below */

WITH GetFirstYear AS
(
    SELECT product_id , MIN(year) as first_year
    FROM Sales
    GROUP BY product_id
)
SELECT t1.product_id, t2.first_year, t1.quantity, t1.price 
FROM Sales t1 JOIN GetFirstYear t2
ON t1.year = t2.first_year AND t1.product_id = t2.product_id
