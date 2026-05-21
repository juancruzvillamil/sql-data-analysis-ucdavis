-- Query 06: States without milk production in 2023
-- Goal: Identify states from the lookup table that do not appear in milk production records for 2023
-- Concepts used: NOT IN, subquery, DISTINCT, ORDER BY


SELECT 
    s.state,
    s.state_ansi
FROM state_lookup AS s
WHERE s.state_ansi NOT IN (
    SELECT DISTINCT m.state_ansi
    FROM milk_production AS m
    WHERE m.year = 2023
      AND m.state_ansi IS NOT NULL
)
ORDER BY s.state;