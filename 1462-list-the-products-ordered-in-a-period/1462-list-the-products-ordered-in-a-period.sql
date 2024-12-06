/* Write your T-SQL query statement below */

WITH FebProducts AS
(
    SELECT P.product_name, SUM(unit) AS unit 
    FROM Products P JOIN Orders O
    ON P.product_id = O.product_id
    WHERE LEFT(order_date, 7) = '2020-02'
    GROUP BY P.product_name
)

SELECT product_name, unit
FROM FebProducts
WHERE unit >= 100;
