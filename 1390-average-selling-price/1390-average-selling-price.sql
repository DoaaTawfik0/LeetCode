/* Write your T-SQL query statement below */
SELECT 
    product_id, 
    ROUND(CAST(COALESCE(totalsalary, 0) AS FLOAT) / COALESCE(units, 1), 2) AS average_price
FROM
(
    SELECT 
        product_id,
        SUM(units) AS units, 
        SUM(product) AS totalsalary
    FROM
    (
        SELECT 
            P.product_id, 
            U.units, 
            P.price, 
            U.units * P.price AS product
        FROM Prices P 
        LEFT JOIN UnitsSold U 
            ON P.product_id = U.product_id
        WHERE DATEDIFF(day, U.purchase_date, P.end_date) >= 0 
            AND DATEDIFF(day, U.purchase_date, P.start_date) <= 0 
            OR U.purchase_date IS NULL
    ) AS T1
    GROUP BY product_id
) AS T2;
