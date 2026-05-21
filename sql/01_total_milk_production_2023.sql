-- Query 01: Total milk production in 2023
-- Goal: Calculate total milk production across all states for 2023
-- Concepts used: SUM, WHERE, filtering


SELECT SUM(m.value) AS total_milk_production_2023
FROM milk_production AS m
WHERE m.year = 2023
AND domain = 'TOTAL'
AND geo_level = 'STATE'
AND commodity_id = 5;