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

--количество исполнителей в каждом жанре;
SELECT name, COUNT(performer_id) FROM performance_genres pg
LEFT JOIN genre g ON g.id = pg.genre_id
GROUP BY name 
ORDER BY name

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT date d, COUNT(t.name) FROM track t 
LEFT JOIN album a ON a.id = t.album 
WHERE date BETWEEN 2019 AND 2020
GROUP BY d
ORDER BY d

--средняя продолжительность треков по каждому альбому;
SELECT a.name, AVG(duration) FROM track t 
LEFT JOIN album a ON a.id = t.album 
GROUP BY a.name
ORDER BY a.name

--все исполнители, которые не выпустили альбомы в 2020 году;
SELECT alias a, date FROM discography di 
LEFT JOIN album al ON di.album_id = al.id 
LEFT JOIN performer p ON di.performer_id = p.id
WHERE performer_id NOT IN (
	SELECT di2.performer_id FROM discography di2
	LEFT JOIN album al2 ON di2.album_id = al2.id
	WHERE date = 2020
	)
ORDER BY a

--названия сборников, в которых присутствует конкретный исполнитель (Kanye West);
SELECT DISTINCT alias, c.name FROM collection c 
LEFT JOIN completed_collection cc ON c.id = cc.collection_id 
LEFT JOIN track t ON cc.track_id = t.id 
LEFT JOIN album a ON t.album  = a.id 
LEFT JOIN discography d ON a.id = d.album_id 
LEFT JOIN performer p ON d.performer_id = p.id
WHERE alias = 'Kanye West'

--название альбомов, в которых присутствуют исполнители более 1 жанра
SELECT al.name, COUNT(pg.performer_id) FROM album al
LEFT JOIN discography d ON al.id = d.album_id 
LEFT JOIN performer p ON d.performer_id = p.id 
LEFT JOIN performance_genres pg ON p.id = pg.performer_id 
GROUP BY al.name
HAVING COUNT(pg.performer_id) > 1

--наименование треков, которые не входят в сборники;
SELECT name FROM track t 
LEFT JOIN completed_collection cc ON t.id = cc.track_id 
WHERE cc.track_id IS NULL 

--исполнителя(-ей) написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT p.alias, t.name, t.id  FROM performer p 
LEFT JOIN discography d ON d.performer_id  = p.id 
LEFT JOIN album a ON d.album_id = a.id 
LEFT JOIN track t ON t.album = a.id 
WHERE duration = (SELECT MIN(duration) FROM track)

--название альбомов, содержащих наименьшее количество треков.
SELECT a.name, a.id, COUNT(t.album) FROM track t
LEFT JOIN album a ON t.album = a.id 
GROUP BY a.name, a.id
HAVING COUNT(t.id) = (
	SELECT COUNT(t2.album) FROM track t2
	LEFT JOIN album a2 ON t2.album = a2.id
	GROUP BY a2.id
	ORDER BY COUNT(t2.album)
	LIMIT 1
	)