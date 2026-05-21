-- Query 04: States with cheese production in April 2023
-- Goal: List all states and match each one with its total cheese production in April 2023
-- Concepts used: LEFT JOIN, subquery, SUM, GROUP BY, ORDER BY

SELECT 
    s.state,
    s.state_ansi,
    CASE
        WHEN c.total_cheese_production IS NULL THEN 0
        ELSE c.total_cheese_production
    END AS cheese_production_april_2023
FROM state_lookup AS s
LEFT JOIN (
    SELECT 
        state_ansi,
        SUM(value) AS total_cheese_production
    FROM cheese_production
    WHERE year = 2023
      AND period = 'APR'
      AND domain = 'TOTAL'
      AND state_ansi IS NOT NULL
    GROUP BY state_ansi
) AS c
    ON s.state_ansi = c.state_ansi
ORDER BY s.state;