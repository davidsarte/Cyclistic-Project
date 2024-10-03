ALTER TABLE  cyclistic_combined cyclistic_combined ADD COLUMN ride_length INTERVAL; 

UPDATE cyclistic_combined SET ride_length = ended_at - started_at;

ALTER TABLE cyclistic_combined ADD COLUMN month VARCHAR(2);

UPDATE cyclistic_combined
SET month = TO_CHAR(started_at, 'MM');

ALTER TABLE cyclistic_combined
ADD COLUMN day_of_week VARCHAR(9);

UPDATE cyclistic_combined
SET day_of_week = TRIM(TO_CHAR(started_at, 'Day'));
SELECT DISTINCT day_of_week
FROM cyclistic_combined
ORDER BY day_of_week;


--Export
COPY cyclistic_combined
TO '/Users/david/Desktop/Google Data Analytics /Capstone/Bike/cyclistic_combined.csv'
WITH(FORMAT CSV, HEADER);
