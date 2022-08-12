DROP TABLE squirrels

Create Table squirrels (
	long DECIMAL(9,6),
	lat DECIMAL(8,6),
	unique_squirrel_id VARCHAR,
	hectare VARCHAR,
	shift VARCHAR,
	dates DATE,
	hectare_squirrel_number NUMERIC,
	age VARCHAR,
	primary_fur_color VARCHAR,
	highlight_fur_color VARCHAR,
	combination_of_primary_and_highlight_color VARCHAR,
	color_notes VARCHAR,
	locations VARCHAR,
	above_ground_sighter_measurement VARCHAR,
	specific_location VARCHAR,
	running NUMERIC,
	chasing NUMERIC,
	climbing NUMERIC,
	eating NUMERIC,
	foraging NUMERIC,
	other_activities VARCHAR,
	kuks NUMERIC,
	quaas NUMERIC,
	moans NUMERIC,
	tail_flags NUMERIC,
	tail_twitches NUMERIC,
	approaches NUMERIC,
	indifferent NUMERIC,
	runs_from NUMERIC,
	other_interactions VARCHAR
);

-- Identify duplicates in the table
SELECT UNIQUE_SQUIRREL_ID, COUNT(UNIQUE_SQUIRREL_ID)
FROM squirrels
GROUP BY UNIQUE_SQUIRREL_ID
HAVING COUNT(*) > 1

-- Drop Duplicate Rows
DELETE FROM squirrels a USING (
      SELECT MIN(ctid) as ctid, unique_squirrel_id
        FROM squirrels 
        GROUP BY unique_squirrel_id HAVING COUNT(*) > 1
      ) b
      WHERE a.unique_squirrel_id = b.unique_squirrel_id 
      AND a.ctid <> b.ctid

-- Initial inquiry with basic questions
SELECT * FROM squirrels;

-- How many unique squirrels were identified? 3018 squirrels
SELECT COUNT(DISTINCT UNIQUE_SQUIRREL_ID) AS "Unique Squirrels"
FROM squirrels;

--What is the date range for this collection? 14 days in Range
Select MIN(dates), MAX(dates) from squirrels;

--How many distinct days? 11 Days
SELECT COUNT(DISTINCT DATES) AS "Collection Days"
FROM squirrels;

--HOW MANY SQUIRRELS ARE SEEN EACH DAY? 
SELECT COUNT(DISTINCT UNIQUE_SQUIRREL_ID) AS "Unique Squirrels Each Day", dates
FROM squirrels
GROUP BY dates

-- Squirrel Behavior
SELECT (COUNT(approaches)/COUNT(DISTINCT UNIQUE_SQUIRREL_ID))*100

-- WHAT PERCENT OF SQUIRRELS APPROACH BY ?/SHIFT? 5.89%
SELECT SUM(approaches) AS "Approaches", COUNT(unique_squirrel_id), ROUND(((SUM(approaches)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels

SELECT shift, SUM(approaches), ROUND(((SUM(approaches)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels
GROUP BY shift

-- WHAT PERCENT OF SQUIRRELS RUN AWAY BY ?/SHIFT? 22.43%
SELECT SUM(runs_from) AS "Runs Away", COUNT(unique_squirrel_id), ROUND(((SUM(runs_from)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels

SELECT shift, SUM(runs_from), ROUND(((SUM(runs_from)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels
GROUP BY shift

-- WHAT PERCENT OF SQUIRRELS ARE INDIFFERENT BY ?/SHIFT? 48.10% **43-53% Not afraid of humans
SELECT SUM(indifferent) AS "Indifferent", COUNT(unique_squirrel_id), ROUND(((SUM(indifferent)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels

SELECT shift, SUM(indifferent), ROUND(((SUM(indifferent)/COUNT(unique_squirrel_id)))*100, 2)
FROM squirrels
GROUP BY shift

-- Information on Squirrel appearance and behavior. 
SELECT primary_fur_color FROM squirrels
SELECT DISTINCT(primary_fur_color) FROM squirrels
WHERE primary_fur_color IS NOT NULL

SELECT primary_fur_color, COUNT(primary_fur_color) FROM squirrels --PRIMARY COLOR IS GRAY
WHERE primary_fur_color IS NOT NULL
GROUP BY primary_fur_color


