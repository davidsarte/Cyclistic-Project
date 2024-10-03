--Checking # Of Blank Rows
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

