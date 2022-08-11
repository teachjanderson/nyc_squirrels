Create Table sqbehave (
	long DECIMAL(9,6),
	lat DECIMAL(8,6),
	unique_squirrel_id VARCHAR,
	hectare VARCHAR,
	shift VARCHAR,
	dates DATE,
	hectare_squirrel_number NUMERIC,
	age VARCHAR,
	primary_fur_color VARCHAR,
	locations VARCHAR,
	running NUMERIC,
	chasing NUMERIC,
	climbing NUMERIC,
	eating NUMERIC,
	foraging NUMERIC,
	kuks NUMERIC,
	quaas NUMERIC,
	moans NUMERIC,
	tail_flags NUMERIC,
	tail_twitches NUMERIC,
	approaches NUMERIC,
	indifferent NUMERIC,
	runs_from NUMERIC
);

--Cinmon Sq Approachability 
Select age as Age, primary_fur_color AS Color,
	SUM(approaches) AS APPROACHES, 
	SUM(indifferent) AS Indifferent,
	SUM(runs_from) AS "Runs From"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Cinmon'
GROUP BY age, primary_fur_color
ORDER BY 1

--Black Sq Approachability 
Select age as Age, primary_fur_color AS Color,
	SUM(approaches) AS APPROACHES, 
	SUM(indifferent) AS Indifferent,
	SUM(runs_from) AS "Runs From"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Black'
GROUP BY age, primary_fur_color
ORDER BY 1

--Gray Sq Approachability 
Select age as Age, primary_fur_color AS Color,
	SUM(approaches) AS APPROACHES, 
	SUM(indifferent) AS Indifferent,
	SUM(runs_from) AS "Runs From"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Gray'
GROUP BY age, primary_fur_color
ORDER BY 1



--Cinmon Squirrel Attitude
Select age as Age, primary_fur_color AS Color,
	SUM(kuks) AS Kukking, 
	SUM(quaas) AS Quaaing,
	SUM(moans) AS Moaning,
	SUM(tail_flags) AS "Tail Flagging",
	SUM(tail_twitches) AS "Tail Twithing"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Cinmon'
GROUP BY age, primary_fur_color
ORDER BY 1

--Black Squirrel Attitude
Select age as Age, primary_fur_color AS Color,
	SUM(kuks) AS Kukking, 
	SUM(quaas) AS Quaaing,
	SUM(moans) AS Moaning,
	SUM(tail_flags) AS "Tail Flagging",
	SUM(tail_twitches) AS "Tail Twithing"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Black'
GROUP BY age, primary_fur_color
ORDER BY 1

--Gray Squirrel Attitude
Select age as Age, primary_fur_color AS Color,
	SUM(kuks) AS Kukking, 
	SUM(quaas) AS Quaaing,
	SUM(moans) AS Moaning,
	SUM(tail_flags) AS "Tail Flagging",
	SUM(tail_twitches) AS "Tail Twithing"
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Gray'
GROUP BY age, primary_fur_color
ORDER BY 1



--Cinmon Squirrel Behavior Traits
Select age as Age, primary_fur_color AS Color,
	SUM(running) AS Running, 
	SUM(chasing) AS Chasing,
	SUM(climbing) AS Climbing,
	SUM(eating) AS Eating,
	SUM(foraging) AS Foraging
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Cinmon'
GROUP BY age, primary_fur_color
ORDER BY 1

--Black Squirrel Behavior Traits
Select age as Age, primary_fur_color AS Color,
	SUM(running) AS Running, 
	SUM(chasing) AS Chasing,
	SUM(climbing) AS Climbing,
	SUM(eating) AS Eating,
	SUM(foraging) AS Foraging
From sqbehave
WHERE AGE IS NOT NULL AND primary_fur_color='Black'
GROUP BY age, primary_fur_color
ORDER BY 1

--Gray Squirrel Behavior Traits
Select age as Age, primary_fur_color AS Color,
	SUM(running) AS Running, 
	SUM(chasing) AS Chasing,
	SUM(climbing) AS Climbing,
	SUM(eating) AS Eating,
	SUM(foraging) AS Foraging
From sqbehave
WHERE AGE IS NOT NUll AND primary_fur_color='Gray'
GROUP BY age, primary_fur_color
ORDER BY 1

--Identify location by fur color
SELECT primary_fur_color, locations, Count(locations)
FROM sqbehave
WHERE primary_fur_color IS NOT null AND locations IS NOT null
GROUP BY 2, 1
ORDER BY primary_fur_color, locations