--Creating Table
CREATE TABLE cyclistic_202408_divvy(
        ride_id VARCHAR(255),
        rideable_type TEXT,
        started_at TIMESTAMP,
        ended_at TIMESTAMP,
        start_station_name TEXT,
        start_station_id TEXT,
        end_station_name TEXT,
        end_station_id TEXT,
        start_lat DOUBLE PRECISION,
        start_lng DOUBLE PRECISION,
        end_lat DOUBLE PRECISION,
        end_lng DOUBLE PRECISION,
        member_casual TEXT
);


--Importing File
COPY cyclistic_202408_divvy
FROM '/Users/david/Desktop/Google Data Analytics /Capstone/Bike/SQL/202408-divvy-tripdata.csv'
WITH (FORMAT CSV, HEADER);


--Creating Other Tables
CREATE TABLE cyclistic_202407_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202406_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202405_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202404_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202403_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202402_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202401_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202312_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202311_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202310_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);
CREATE TABLE cyclistic_202309_divvy (LIKE cyclistic_202408_divvy INCLUDING ALL);


--Importing Other Data--
COPY cyclistic_202309_divvy
FROM '/Users/david/Desktop/Google Data Analytics /Capstone/Bike/SQL/202309-divvy-tripdata.csv'
WITH (FORMAT CSV, HEADER);


--Combing Tables
CREATE TABLE IF NOT EXISTS cyclistic_combined AS
SELECT * FROM cyclistic_202408_divvy
UNION ALL
SELECT * FROM cyclistic_202407_divvy
UNION ALL
SELECT * FROM cyclistic_202406_divvy
UNION ALL
SELECT * FROM cyclistic_202405_divvy
UNION ALL
SELECT * FROM cyclistic_202404_divvy
UNION ALL
SELECT * FROM cyclistic_202403_divvy
UNION ALL
SELECT * FROM cyclistic_202402_divvy
UNION ALL
SELECT * FROM cyclistic_202401_divvy
UNION ALL
SELECT * FROM cyclistic_202312_divvy
UNION ALL
SELECT * FROM cyclistic_202311_divvy
UNION ALL
SELECT * FROM cyclistic_202310_divvy
UNION ALL
SELECT * FROM cyclistic_202309_divvy;


--Check # of Rows
SELECT COUNT(*)
FROM cyclistic_combined;


--# Of Blanks
SELECT COUNT(*)
FROM cyclistic_combined
WHERE ride_id IS NULL OR ride_id = ''
   OR started_at IS NULL
   OR ended_at IS NULL
   OR start_station_name IS NULL OR start_station_name = ''
   OR start_station_id IS NULL OR start_station_id = ''
   OR end_station_name IS NULL OR end_station_name = ''
   OR end_station_id IS NULL OR end_station_id = ''
   OR start_lat IS NULL
   OR start_lng IS NULL
   OR end_lat IS NULL
   OR end_lng IS NULL
   OR member_casual IS NULL OR member_casual = '';


--Deleting Blanks
DELETE FROM cyclistic_combined
WHERE ride_id IS NULL OR ride_id = ''
   OR started_at IS NULL
   OR ended_at IS NULL
   OR start_station_name IS NULL OR start_station_name = ''
   OR start_station_id IS NULL OR start_station_id = ''
   OR end_station_name IS NULL OR end_station_name = ''
   OR end_station_id IS NULL OR end_station_id = ''
   OR start_lat IS NULL
   OR start_lng IS NULL
   OR end_lat IS NULL
   OR end_lng IS NULL
   OR member_casual IS NULL OR member_casual = '';


--Checking For Invalid Values
SELECT COUNT(*) AS longer_than_a_day
FROM cyclistic_combined
WHERE ended_at - started_at >= INTERVAL '1 day';


SELECT COUNT(*) AS less_than_a_minute
FROM cyclistic_combined
WHERE ended_at - started_at <= INTERVAL '1 minute';


DELETE FROM cyclistic_combined
WHERE ended_at - started_at >= INTERVAL '1 day' 
OR ended_at - started_at <= INTERVAL '1 minute';