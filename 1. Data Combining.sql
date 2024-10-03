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

--Importing File (Repeat this Process For Other Months’ Data)
COPY cyclistic_202408_divvy
FROM '202408-divvy-tripdata.csv'
WITH (FORMAT CSV, HEADER);

--Creating Additional Tables For Each Month
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


--Combining Tables
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
