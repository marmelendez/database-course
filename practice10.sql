-- PRACTICE 10
-- Chapter 15: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_15

-- EXTENSIONS
-- add capability to sql
-- Sintaxis
CREATE EXTENSION <extension name>;

CREATE EXTENSION postgis;
  
  
--CHALLENGE
--Instead of using the office as pivote column use the flavor.
SELECT *
FROM crosstab(
  'SELECT flavor, office, count(*)
  FROM ice_cream_survey
  GROUP BY flavor, office
  ORDER BY flavor',
  'SELECT office
  FROM ice_cream_survey
  GROUP BY office
  ORDER BY office')
AS (office text, Downtown bigint, Midtown bigint, Uptown bigint);
