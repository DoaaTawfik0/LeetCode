WITH UniqueLocations AS (
  SELECT lon, lat
  FROM Insurance
  GROUP BY lon, lat
  HAVING COUNT(PID) = 1
),
Duplicate_2015 AS (
  SELECT tiv_2015  
  FROM Insurance
  GROUP BY tiv_2015
  HAVING COUNT(PID) > 1
)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance ins JOIN Duplicate_2015 dup
ON ins.tiv_2015 = dup.tiv_2015 
JOIN UniqueLocations uniq 
ON uniq.lon = ins.lon AND uniq.lat =ins.lat; 
