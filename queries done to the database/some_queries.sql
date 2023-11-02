-- Use a selected database
USE police_db;

-- Select information about a table
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='police_data';

-- Select everything from a table
SELECT * FROM police_data;

--Select everything from a table where stopped_by is 100
SELECT * FROM police_data where stopped_by = 100

--Select violation, driver_age and driver_ace where driver_race is Other
SELECT violation, driver_age, driver_race FROM police_data WHERE driver_race = 'Other'

--Count how many records each year contains 
--CONVERT(DATETIME, stop_date_and_time, 120) converts the stop_date_and_time VARCHAR column to the datetime data type in the 120 format to make the count easier by changing varchar value to datetime value where year goes first (YYYY-MM-DD HH:MI:SS).
--CONVERT(VARCHAR, ..., 120) reconverts this datetime back to a VARCHAR in the 120 format.
--LEFT(..., 4) extracts the first four characters.
--COUNT(*) counts occurrences of these first four characters.
--GROUP BY LEFT(..., 4) groups the results by the first four characters after conversion.
SELECT LEFT(CONVERT(VARCHAR, CONVERT(DATETIME, stop_date_and_time, 120), 120), 4) AS Extracted_year,
       COUNT(*) AS Stops_in_a_year
FROM police_data
GROUP BY LEFT(CONVERT(VARCHAR, CONVERT(DATETIME, stop_date_and_time, 120), 120), 4)

--Count records from 2014 year
--Converts the stop_date_and_time VARCHAR column to a datetime using the CONVERT function and then to the 120 style (YYYY-MM-DD HH:MI:SS).
--Extracts the first four characters of the converted datetime value using LEFT.
--Counts the occurrences where the first four characters of the converted value match '2014'.
SELECT LEFT(CONVERT(VARCHAR, CONVERT(DATETIME, stop_date_and_time, 120), 120), 4) AS Extracted_year,
       COUNT(*) AS Stops_in_a_year
FROM police_data
WHERE LEFT(CONVERT(VARCHAR, CONVERT(DATETIME, stop_date_and_time, 120), 120), 4) = '2014'
GROUP BY LEFT(CONVERT(VARCHAR, CONVERT(DATETIME, stop_date_and_time, 120), 120), 4)