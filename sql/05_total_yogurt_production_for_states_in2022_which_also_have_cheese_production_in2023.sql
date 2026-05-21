-- Query 05: Total yogurt production for states in 2022 which also have cheese production in 2023
-- Goal: Calculate total yogurt production in 2022 for states that also reported cheese production in 2023
-- Concepts used: SUM, WHERE, IN, subquery, DISTINCT, filtering


SELECT 
    SUM(y.value) AS total_yogurt_production_for_states_in2022_which_also_have_cheese_production_in2023
FROM yogurt_production AS y
WHERE y.year = 2022
  AND y.period = 'YEAR'
  AND y.domain = 'TOTAL'
  AND y.state_ansi IS NOT NULL
  AND y.state_ansi IN (
      SELECT DISTINCT c.state_ansi
      FROM cheese_production AS c
      WHERE c.year = 2023
        AND c.domain = 'TOTAL'
        AND c.state_ansi IS NOT NULL
  );