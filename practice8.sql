-- PRACTICE 8

-- DATE AND TIME
-- Date : full date, ex Friday 10th 2022
SELECT make_date(2022, 2, 22);

-- Time 
SELECT make_time(18, 4, 30.3);

-- Timestamp with time zone
SELECT make_timestamptz(2022, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- EXTRACT
-- Using dart_part
SELECT date_part('year', '2022-12-01 18:37:12 EST'::timestamptz) AS year

-- Using extract
SELECT extract(year from '2022-12-01 18:37:12 EST'::timestamptz) AS year;


-- We created a nyc_yellow_taxi_trips database
 
-- CHALLENGE
-- Calculate the lenght of each ride. Sort the query from the longest to the shortest.
SELECT tpep_dropoff_datetime - tpep_pickup_datetime AS duration_time
FROM nyc_yellow_taxi_trips
ORDER BY duration_time DESC
