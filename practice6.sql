-- PRACTICE 6
-- Chapter 8: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_08

-- INDEXES
-- Sintaxis

CREATE INDEX index_name
ON table_name (column1, column2)

-- Example
CREATE INDEX company_idx ON meat_poultry_egg_establishments (company);
