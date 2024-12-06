/* Write your T-SQL query statement below */

SELECT *
FROM Users
WHERE LEFT(mail,1) LIKE '[A-Z]'  AND
      mail LIKE '%@leetcode.com' AND
      mail NOT LIKE '%[/\?&$%<>=+|^#(){},*!~`;"]%' AND
      mail NOT LIKE '%@%@%';

