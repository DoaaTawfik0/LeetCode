WITH CumulativeWeights AS (
  SELECT
    person_name,
    SUM(weight) OVER (ORDER BY turn) AS cumulative_sum
  FROM
    Queue
)
SELECT
  TOP(1) person_name
FROM
  CumulativeWeights
WHERE
  cumulative_sum <= 1000
ORDER BY
  cumulative_sum DESC
