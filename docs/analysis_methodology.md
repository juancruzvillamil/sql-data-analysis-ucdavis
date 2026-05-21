# Analysis Methodology

## Project objective

The objective of this project is to apply SQL concepts from the UC Davis SQL for Data Science course to analyze agricultural production data across products, years, and U.S. states

## General approach

The analysis follows these steps:

1. Explore each raw dataset individually.
2. Filter records to keep annual data when the table includes a `Period` column.
3. Remove records without a valid `State_ANSI` when the analysis requires state-level comparison.
4. Join production tables with `state_lookup` to make the results easier to interpret.
5. Use aggregate functions to summarize production by product, year, and state.
6. Use `UNION` to combine comparable records from different product tables.
7. Export selected query results into the `results/` folder.

## SQL concepts applied

- SELECT and FROM
- WHERE filtering
- ORDER BY
- GROUP BY
- Aggregate functions: COUNT, SUM, AVG, MIN, MAX
- JOINs
- UNION
- Views
- Data profiling
