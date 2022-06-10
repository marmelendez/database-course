-- PRACTICE 9

-- SUBQUERY
-- "query that appears inside another query statement"
-- use subqueries in the WHERE condition,WHERE EXISTS, FROM, or a JOIN
-- also, as part of the main select as a calculated column

-- WHERE
SELECT county_name, state_name, pop_est_2019
FROM us_counties_pop_est_2019
WHERE pop_est_2019 >= (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY pop_est_2019)
    FROM us_counties_pop_est_2019)
ORDER BY pop_est_2019 DESC;

-- WHERE EXISTIS
SELECT first_name, last_name
FROM employees
WHERE EXISTS (
    SELECT id
    FROM retirees
    WHERE id = employees.emp_id);
    
-- FROM
SELECT round(calcs.average, 0) as average, calcs.median, round(calcs.average - calcs.median, 0) AS median_average_diff
FROM (
     SELECT avg(pop_est_2019) AS average, percentile_cont(.5)
     WITHIN GROUP (ORDER BY pop_est_2019)::numeric AS median
     FROM us_counties_pop_est_2019)
AS calcs;

-- JOIN
SELECT census.state_name AS st, census.pop_est_2018, est.establishment_count, round((est.establishment_count/census.pop_est_2018::numeric) * 1000, 1) AS estabs_per_thousand
FROM (
  SELECT st, sum(establishments) AS establishment_count
  FROM cbp_naics_72_establishments
  GROUP BY st)
AS est
JOIN
  (
  SELECT state_name, sum(pop_est_2018) AS pop_est_2018
  FROM us_counties_pop_est_2019
  GROUP BY state_name)
AS census
ON est.st = census.state_name
ORDER BY estabs_per_thousand DESC;
