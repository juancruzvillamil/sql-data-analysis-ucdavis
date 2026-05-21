-- Query 09: State product diversity coverage analysis
-- Goal: Analyze how many different agricultural products are reported by each state
       using the most recent available year for each product.
-- Concepts used: CREATE VIEW, UNION, INNER JOIN, subquery, GROUP BY, HAVING,
                CASE, COUNT DISTINCT, UPPER, TRIM, ORDER BY



CREATE VIEW v_annual_product_records AS

SELECT
    'Cheese' AS product,
    Year,
    State_ANSI
FROM cheese_production
WHERE Period = 'YEAR'
  AND State_ANSI IS NOT NULL

UNION

SELECT
    'Coffee' AS product,
    Year,
    State_ANSI
FROM coffee_production
WHERE Period = 'YEAR'
  AND State_ANSI IS NOT NULL

UNION

SELECT
    'Eggs' AS product,
    Year,
    State_ANSI
FROM egg_production
WHERE Period = 'YEAR'
  AND State_ANSI IS NOT NULL

UNION

SELECT
    'Honey' AS product,
    Year,
    State_ANSI
FROM honey_production
WHERE State_ANSI IS NOT NULL

UNION

SELECT
    'Milk' AS product,
    Year,
    State_ANSI
FROM milk_production
WHERE Period = 'YEAR'
  AND State_ANSI IS NOT NULL

UNION

SELECT
    'Yogurt' AS product,
    Year,
    State_ANSI
FROM yogurt_production
WHERE Period = 'YEAR'
  AND State_ANSI IS NOT NULL;

SELECT
    UPPER(TRIM(sl.State)) AS state_name,

    COUNT(DISTINCT p.product) AS products_reported,

    COUNT(*) AS total_records,

    CASE
        WHEN COUNT(DISTINCT p.product) >= 5 THEN 'High product diversity'
        WHEN COUNT(DISTINCT p.product) BETWEEN 3 AND 4 THEN 'Medium product diversity'
        ELSE 'Low product diversity'
    END AS coverage_category

FROM state_lookup AS sl

INNER JOIN v_annual_product_records AS p
    ON sl.State_ANSI = p.State_ANSI

WHERE p.Year = (
    SELECT MAX(p2.Year)
    FROM v_annual_product_records AS p2
    WHERE p2.product = p.product
)

GROUP BY
    sl.State,
    sl.State_ANSI

HAVING COUNT(DISTINCT p.product) >= 2

ORDER BY
    products_reported DESC,
    total_records DESC,
    state_name;