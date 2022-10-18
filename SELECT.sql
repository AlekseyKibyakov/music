SELECT name, date FROM album 
WHERE date = 2018;

SELECT name, duration FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT name FROM track 
WHERE duration >= 210;

SELECT name FROM collection
WHERE date BETWEEN 2018 AND 2020;

SELECT alias FROM performer
WHERE alias NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%my%' OR name LIKE '%мой%' OR name LIKE '%My%' OR name LIKE '%Мой%';


					