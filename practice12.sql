-- PRACTICE 12
-- Chapter 17: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_17

-- View
-- restrict access to certain information
  
-- Create a view
CREATE OR REPLACE VIEW nevada_counties_pop_2019 AS
SELECT county_name, state_fips, county_fips, pop_est_2019
FROM us_counties_pop_est_2019
WHERE state_name = 'Nevada';

-- MATERIALIZED VIEW
-- " persists the data returned from the view definition query and automatically gets updated as data changes in the underlying tables"
CREATE MATERIALIZED VIEW nevada_counties_pop_2019 AS
SELECT county_name, state_fips, county_fips, pop_est_2019
FROM us_counties_pop_est_2019
WHERE state_name = 'Nevada';
    
     
-- FUNCTIONS AND PROCEDURES

-- Function: 
CREATE OR REPLACE FUNCTION
percent_change(new_value numeric, old_value numeric, decimal_places integer DEFAULT 1)
RETURNS numeric AS
'SELECT round(
       ((new_value - old_value) / old_value) * 100, decimal_places);'
LANGUAGE SQL
IMMUTABLE
RETURNS NULL ON NULL INPUT;

-- Invoke function
SELECT percent_change(110, 108, 2);


-- Procedures
CREATE OR REPLACE PROCEDURE update_personal_days()
AS $$
BEGIN
    UPDATE teachers
    SET personal_days =
        CASE WHEN (now() - hire_date) >= '10 years'::interval
                  AND (now() - hire_date) < '15 years'::interval THEN 4
             WHEN (now() - hire_date) >= '15 years'::interval
                  AND (now() - hire_date) < '20 years'::interval THEN 5
             WHEN (now() - hire_date) >= '20 years'::interval
                  AND (now() - hire_date) < '25 years'::interval THEN 6
             WHEN (now() - hire_date) >= '25 years'::interval THEN 7
             ELSE 3
        END;
    RAISE NOTICE 'personal_days updated!';
END;
$$
LANGUAGE plpgsql;

-- Invoke the procedure:
CALL update_personal_days();
