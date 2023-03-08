INSERT INTO 
	genres (id, genre_name)
values
	(1, 'Рок'),
	(2, 'Поп-музыка'),
	(3, 'Электронная музыка'),
	(4, 'Джаз'),
	(5, 'Классика'),
	(6, 'Рэп');
	
INSERT INTO 
	performers (id, performer_name)
values
	(1, 'Би-2'), -- 1
	(2, 'Смысловые Галлюцинации'), -- 1
	(3, 'Жуки'), -- 2
	(4, 'МакSим'), -- 2
	(5, 'Extra Terra'), -- 3
	(6, 'Daft Punk'), -- 3
	(7, 'Lindsey Stirling'), -- 2, 5
	(8, 'Till Brönner'), -- 4
	(9, 'Егор Крид'); -- 2, 6
	
INSERT INTO 
	categories (genre_id, performer_id)
values
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(2, 7),
	(2, 9),
	(3, 5),
	(3, 6),
	(4, 8),
	(5, 7),
	(6, 9);

INSERT INTO 
	albums (id, album_name, release_year)
values
	(1, 'Би-2', 2000),
	(2, '3000', 2000),
	(3, 'Батарейка', 1999),
	(4, 'Полигамность', 2018),
	(5, 'Convergence 2045', 2019),
	(6, 'Musique Vol 1', 2006),
	(7, 'Warmer In The Winter (Deluxe Edition)', 2018),
	(8, 'The Movie Album', 2014),
	(9, '58', 2020);
	
INSERT INTO 
	collections (performer_id, album_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 8),
	(8, 7),
	(9, 9);
	
INSERT INTO 
	tracks (id, track_name, duration, albums_id)
values
	(1, 'Полковнику никто не пишет', 292, 1), -- 1, 2
	(2, 'Серебро', 280, 1), -- 2, 7
	(3, 'Вечно молодой', 195, 2), -- 1, 2, 3
	(4, 'Звёзды 3000', 263, 2), -- 1, 2
	(5, 'Батарейка', 227, 3), -- 1
	(6, 'Птенчик мой', 144, 3), -- не входит в сборники
	(7, 'На двоих', 217, 4), -- 4
	(8, 'Штампы', 188, 4), -- 4
	(9, 'Chronology', 355, 5), -- 5
	(10, 'This Is Not The End', 148, 5), -- 5
	(11, 'Human After All', 319, 6), -- 5
	(12, 'Around The World', 239, 6), -- 5, 7
	(13, 'Warmer In The Winter', 174, 7), -- 6 
	(14, 'Carol Of The Bells', 166, 7), -- 6
	(15, 'My Heart Will Go On', 308, 8), -- 7
	(16, 'Мне всё Монро', 139, 9); -- 5, 8

INSERT INTO 
	compilations (id, compilation_name, release_year)
values
	(1, 'The Best of...', 2019),
	(2, 'Классика русского рока!', 2018),
	(3, 'Трудных времён песни', 2016),
	(4, 'Штампы', 2019),
	(5, 'Night Drive Music', 2022),
	(6, 'Hungover Christmas', 2020),
	(7, 'Top Hits', 2021),
	(8, 'Транзит', 2020);
	
INSERT INTO 
	compositions (compilation_id, track_id)
values
	(1, 1),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 4),
	(3, 3),
	(4, 7),
	(4, 8),
	(5, 9),
	(5, 10),
	(5, 11),
	(5, 12),
	(5, 16),
	(6, 13),
	(6, 14),
	(7, 12),
	(7, 15),
	(8, 16);
	
	
	
	
	
	
	
	
	
	
	
	