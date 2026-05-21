-- Query 07: All states with cheese production in April 2023
-- Goal: Show every state and replace missing cheese production values with 0
-- Concepts used: LEFT JOIN, CASE, SUM, GROUP BY

SELECT 
    s.state,
    s.state_ansi,
    CASE
        WHEN SUM(c.value) IS NULL THEN 0
        ELSE SUM(c.value)
    END AS cheese_production_april_2023
FROM state_lookup AS s
LEFT JOIN cheese_production AS c
    ON s.state_ansi = c.state_ansi
   AND c.year = 2023
   AND c.period = 'APR'
   AND c.domain = 'TOTAL'
GROUP BY 
    s.state,
    s.state_ansi
ORDER BY 
    s.state;