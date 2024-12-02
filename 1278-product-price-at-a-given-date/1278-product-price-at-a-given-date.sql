-- /* Write your T-SQL query statement below */

WITH HelpToGetRepeatedProducts AS
(
    /*all products that their price changed many times pefore given-date*/
     SELECT *,
      ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS RN
     FROM Products
     WHERE change_date <= '2019-08-16'
), HelpToGetUniqueProducts AS
(
    /*product that its price changed only one time after given date*/
    SELECT product_id , MIN(change_date) as minDate , MAX(change_date) maxDate
    FROM Products 
    GROUP BY product_id

)

SELECT product_id, new_price as price
FROM HelpToGetRepeatedProducts
WHERE RN = 1

UNION

SELECT product_id , 10 as price
FROM HelpToGetUniqueProducts 
WHERE minDate > '2019-08-16' AND maxDate > '2019-08-16'



