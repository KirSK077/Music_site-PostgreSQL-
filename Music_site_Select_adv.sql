-- Количество исполнителей в каждом жанре.
  select g.genre_name, count(p.id) performer_quantity
  	from genres g  
    	 join categories c 
    	 on g.id = c.genre_id 
    	 join performers p 
    	 on c.performer_id = p.id 
group by g.id
order by g.id;  


-- Количество треков, вошедших в альбомы 2019–2020 годов. (вариант №1: присоединение таблиц)
select count(t.track_name) 
  from tracks t 
  	   join albums a 
  	   on t.albums_id = a.id 
 where a.release_year between 2019 and 2020;
-- (вариант №2: подзапросы)
select count(t.track_name) 
  from tracks t 
 where t.albums_id in 
 	   (select id 
	      from albums a 
	     where a.release_year between 2019 and 2020);

	    
-- Средняя продолжительность треков по каждому альбому.
  select a.album_name, avg(t.duration) 
    from albums a 
		 join tracks t 
		 on t.albums_id = a.id 
group by a.id  
order by a.id;


-- Все исполнители, которые не выпустили альбомы в 2020 году. (вариант №1: присоединение таблиц)
select p.performer_name
  from performers p 
  	   join collections c 
  	   on c.performer_id = p.id 
  	   join albums a 
  	   on a.id = c.album_id 
 where a.release_year != 2020;
-- (вариант №2: подзапросы)
select p.performer_name
  from performers p
 where p.id in 
  	   (select performer_id 
  	      from collections c
  		 where c.album_id in 
  			   (select id 
  			      from albums a
  				 where a.release_year != 2020));

  				
 -- Названия сборников, в которых присутствует конкретный исполнитель (Егор Крид).
select distinct (com.compilation_name) 
  from compilations com 
  	   join compositions cs 
  	   on cs.compilation_id = com.id  
  	   join tracks t 
  	   on t.id = cs.track_id  
  	   join albums a 
  	   on a.id = t.albums_id 
  	   join collections coll 
  	   on coll.performer_id = a.id 
  	   join performers p 
  	   on p.id = coll.performer_id 
 where p.performer_name = 'Егор Крид';
 

 -- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select a.album_name 
  from albums a 
	   join collections coll 
	   on coll.performer_id = a.id
	   join performers p 
	   on p.id = coll.performer_id
	   join categories cat 
	   on cat.performer_id = p.id
 group by a.id  
having count(distinct(cat.genre_id)) > 1;


-- Наименования треков, которые не входят в сборники.
select t.track_name 
  from tracks t 
	   left join compositions c
	   on c.track_id = t.id
 where c.compilation_id is null;


-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек. (вариант №1: присоединение таблиц)
select p.performer_name 
  from performers p
	   join collections c 
	   on c.performer_id = p.id 
	   join albums a 
	   on a.id = c.album_id  
	   join tracks t 
	   on t.albums_id = a.id
 where t.duration = 
	   (select min(duration) 
	  	  from tracks);
-- (вариант №2: подзапросы)
select p.performer_name 
  from performers p
 where p.id in 
 	   (select performer_id 
 	   	  from collections c
 	   	 where c.album_id in 
 	   	 	   (select id 
 	   	 	      from albums a
 	   	 	     where a.id in
 	   	 	     	   (select albums_id 
 	   	 	     	   	  from tracks t
 	   	 	     	   	 where t.duration = 
 	   	 	     	   		   (select min(duration) 
 	   	 	     	   		  	  from tracks))));


-- Названия альбомов, содержащих наименьшее количество треков.
select a.album_name 
  from albums a 
 where id in
	   (select albums_id 
	      from tracks t
	     group by albums_id 
	    having count(*) in 
	   		   (select count(*) 
	   		      from tracks t
	   		     group by albums_id 
	   		     order by count limit 1));
 
