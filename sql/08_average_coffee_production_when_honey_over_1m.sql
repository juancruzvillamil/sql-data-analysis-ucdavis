-- Query 08: Average coffee production when honey production exceeded 1M
-- Goal: Calculate average coffee production for years where total honey production was greater than 1,000,000
-- Concepts used: subquery, HAVING, AVG, GROUP BY, filtering


SELECT 
    ROUND(AVG(c.value), 2) AS average_coffee_production_for_all_years_where_the_honey_production_exceeded__1M
FROM coffee_production AS c
WHERE c.period = 'YEAR'
  AND c.geo_level = 'STATE'
  AND c.commodity_id = 1
  AND c.state_ansi IS NOT NULL
  AND c.year IN (
      SELECT 
          h.year
      FROM honey_production AS h
      WHERE h.geo_level = 'STATE'
        AND h.state_ansi IS NOT NULL
      GROUP BY h.year
      HAVING SUM(h.value) > 1000000
  );