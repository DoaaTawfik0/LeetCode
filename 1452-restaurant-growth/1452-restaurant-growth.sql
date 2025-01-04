WITH DailyIncome AS
(
    SELECT visited_on, SUM(amount) AS DailyIncome
    FROM Customer
    GROUP BY visited_on 
),
averageAmount AS
(
    SELECT visited_on,
    SUM(DailyIncome) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS IncomeIn7Days,
    ROW_NUMBER() OVER(ORDER BY visited_on) AS row_num
    FROM DailyIncome
)

SELECT visited_on,IncomeIn7Days AS amount,ROUND(IncomeIn7Days*1.0/7,2) AS average_amount
FROM averageAmount
WHERE row_num >= 7