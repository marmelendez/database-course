-- PRACTICE 7
-- Chapter 10: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_10

-- CLEAN UP DATA
-- Finding duplicates 
-- indentify the columns
-- use GROUP BY and HAVING to select that columns
  
-- We created a meat_pltry_egg_establishment database

-- USE GROUP BY AND HAVING
SELECT company, street, city, st, count(*) AS address_count
FROM meat_poultry_egg_establishments
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;

-- USE GROUP BY
SELECT st, count(*) AS st_count
FROM meat_poultry_egg_establishment
GROUP BY st
ORDER BY st; 

-- MISSING data
-- records with NULL values 
  
-- USING LENGHT AND COUNT
SELECT length(zip), count(*) AS length_count
FROM meat_poultry_egg_establishments
GROUP BY length(zip)
ORDER BY length(zip) ASC;

-- BACKUP DATA
-- Create table <table name> as select <>
CREATE TABLE meat_poultry_egg_establishments_backup AS
SELECT * FROM meat_poultry_egg_establishments;

-- CHALLEGE
-- Add a new colum meat_processing (boolean) set this column to true if the company has 'Meat Processing'
UPDATE meat_poultry_egg_establishments 
SET meat_processing = true
WHERE activities LIKE '%Meat Processing%';

-- DELETE DUPLICATES
-- Use an aggregate function to find out the values that you want to keep (max, min)   
DELETE FROM meat_poultry_egg_establishments
WHERE establishment_number not in (
  SELECT max(establishment_number)  
  FROM meat_poultry_egg_establishments
  GROUP BY company, street, city, st
);

-- TRANSACTIONS:
-- group db operations 
START TRANSACTION;
UPDATE meat_poultry_egg_establishments
SET company = 'AGRO Merchantss Oakland LLC'
WHERE company = 'AGRO Merchants Oakland, LLC';
