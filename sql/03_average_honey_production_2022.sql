-- Query 03: Average honey production in 2022
-- Goal: Calculate the average honey production across states for 2022
-- Concepts used: AVG, ROUND, WHERE, filtering


SELECT 
    ROUND(AVG(h.value)) AS average_honey_production_2022
FROM honey_production AS h
WHERE year = 2022
  AND h.geo_level = 'STATE'
  AND h.state_ansi IS NOT NULL;