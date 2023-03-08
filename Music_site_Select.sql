select album_name, release_year 
  from albums
 where release_year = 2018

select track_name, duration 
  from tracks
 where duration = (
	select max(duration) 
	  from tracks
);

select track_name 
  from tracks
 where duration >= 210

select compilation_name 
  from compilations
 where release_year between 2018 and 2020

select performer_name 
  from performers
 where performer_name not SIMILAR TO '%( |-)%'

select track_name 
  from tracks
 where lower(track_name) like any ('{%мой%, %my%}')
