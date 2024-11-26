WITH FirstLogin AS (
    SELECT 
        player_id, 
        MIN(event_date) AS first_event_date
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogins AS (
    SELECT DISTINCT 
        A.player_id
    FROM Activity A
    JOIN FirstLogin F
    ON A.player_id = F.player_id
    WHERE DATEDIFF(day, F.first_event_date, A.event_date) = 1
),
TotalPlayers AS (
    SELECT COUNT(DISTINCT player_id) AS total_players
    FROM Activity
)
SELECT 
    ROUND(CAST((SELECT COUNT(DISTINCT player_id) FROM ConsecutiveLogins) AS FLOAT) / 
          (SELECT total_players FROM TotalPlayers), 2) AS fraction;
