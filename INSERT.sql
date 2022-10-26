-- Добавляем жанры
INSERT INTO genre(name)
VALUES
('Pop'),
('Rock'),
('Indie'),
('Rap'),
('House');

-- Добавляем исполнителей
INSERT INTO performer(alias)
VALUES
('Kanye West'),
('Adele'),
('Bring Me the Horizon'),
('Paul McCartney'),
('Bon Jovi'),
('DJ Koze'),
('Porches'),
('Imagine Dragons');

-- Добавляем жанры исполнителям
INSERT INTO performance_genres
VALUES
('1', '2'),
('1', '5'),
('1', '8'),
('2', '3'),
('2', '4'),
('2', '5'),
('2', '8'),
('3', '8'),
('4', '1'),
('4', '8'),
('5', '6'),
('5', '7');

--Добавляем альбомы
INSERT INTO album (name, date)
VALUES
('Jesus Is King', '2019'),
('Ye', '2020'),
('30', '2021'),
('Music to Listen To...', '2019'),
('Egypt Station', '2018'),
('Crush', '2000'),
('Knock Knock', '2018'),
('All Day Gentle Hold', '2021'),
('Origins', '2018');

--Добавляем дискографию
INSERT INTO discography
VALUES
('1', '1'),
('2', '1'),
('3', '2'),
('4', '3'),
('5', '4'),
('6', '5'),
('7', '6'),
('8', '7'),
('9', '8');

--Добавляем треки
INSERT INTO track (name, duration, album)
VALUES
('Hands on', 203, '1'),
('Wouldn’t leave', 206, '2'),
('My little love', 390, '3'),
('Oh my god', 243, '3'),
('Steal something', 612, '4'),
('A devastating liberation', 342, '4'),
('I don’t know', 156, '5'),
('Dominoes', 306, '5'),
('It`s my life', 267,  '6'),
('Mystery train', 256, '6'),
('Music on my teeth', 257, '7'),
('Bonfire', 156, '7'),
('Back3school', 187, '8'),
('Zero', 198, '9'),
('Stuck', 210, '9'),
('Hands off', 156, '1'),
('Track', 203, '1');


--Добавляем сборники
INSERT INTO collection (name, date)
VALUES
('1st', '2017'),
('2nd', '2020'),
('3rd', '2018'),
('4th', '2019'),
('5th', '2021'),
('6th', '2018'),
('7th', '2020'),
('8th', '2022');

--Заполняем сборники треками
INSERT INTO completed_collection 
VALUES
('1', '1'),
('1', '2'),
('2', '3'),
('2', '4'),
('3', '5'),
('3', '6'),
('4', '7'),
('4', '8'),
('5', '9'),
('5', '10'),
('6', '11'),
('6', '12'),
('7', '13'),
('7', '14'),
('3', '1'),
('8', '15');

