-- PRACTICE 11
-- Chapter 14: https://github.com/mpalomera/practical-sql-2/tree/master/Chapter_14

-- MINING TEXT
-- plain text
-- regular expression 

-- TEXT
-- Case formatting
SELECT upper('Neal7');
-- Also lower(), initcap()

-- Character info
SELECT char_length(' Pat ');
-- Also length(), position()

-- Removing characters with trim()
SELECT trim('s' from 'socks');

-- Extracting and replacing characters
SELECT left('703-555-1212', 3);
-- Also right(),replace()


-- REGULAR EXPRESSIONS
-- "is a sequence of characters that specifies a search pattern in text"

-- EXAMPLES
-- One or more word characters followed by any character at the end.
SELECT substring('The game starts at 7 p.m. on May 2, 2024.' from '\w+.$');

-- May followed by a space, digit, comma, space, and four digits.
SELECT substring('The game starts at 7 p.m. on May 2, 2024.' from 'May \d, \d{4}');

-- Use regex in WHERE
SELECT county_name
FROM us_counties_pop_est_2019
WHERE county_name ~* '(lade|lare)'
ORDER BY county_name;

-- Use regex to replace and split
SELECT regexp_replace('05/12/2024', '\d{4}', '2023');
SELECT regexp_split_to_table('Four,score,and,seven,years,ago', ',');
