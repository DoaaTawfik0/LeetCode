/* Write your T-SQL query statement below */

SELECT user_id, UPPER(SUBSTRING(NAME,1,1)) + LOWER(SUBSTRING(NAME,2,1000)) AS name
FROM Users
ORDER BY user_id