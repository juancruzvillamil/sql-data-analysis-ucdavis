-- Query 02: Count states with cheese production over 100M in April 2023
-- Goal: Count distinct states where cheese production exceeded 100,000,000 in April 2023
-- Concepts used: COUNT, DISTINCT, WHERE, filtering, IS NOT NULL


SELECT COUNT(DISTINCT(c.state_ansi)) AS Number_of_states_with_cheese_production_greater_than100M_April2023
             FROM cheese_production AS c
             WHERE c.value > 100000000
             AND c.period = 'APR'
             AND c.domain = 'TOTAL'
             AND c.state_ansi is not NULL;
             