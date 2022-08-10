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

