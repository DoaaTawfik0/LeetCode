
WITH T1 AS
(
    SELECT sell_date, product
    FROM Activities
    GROUP BY sell_date, product
)


SELECT
    sell_date,
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') AS products
FROM
    T1
GROUP BY
    sell_date;