WITH MaxId AS (
    SELECT MAX(id) AS max_id
    FROM Seat
)
SELECT 
    CASE 
        WHEN id % 2 = 0 THEN id - 1
        WHEN (max_id % 2 != 0) AND id = max_id THEN id 
        ELSE id+1
    END AS id,
    student
FROM Seat, MaxId
ORDER BY id;


