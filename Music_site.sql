create table if not exists genres (
	id SERIAL primary key,
	genre_name VARCHAR(30) NOT null,
			   unique(genre_name)
);

create table if not exists performers (
	id SERIAL primary key,
	performer_name VARCHAR(30) NOT null
);

create table if not exists categories (
	genre_id INTEGER REFERENCES genres(id),
	performer_id INTEGER REFERENCES performers(id),
	CONSTRAINT categoriy PRIMARY KEY (genre_id, performer_id)
);

create table if not exists albums (
	id SERIAL primary key,
	album_name VARCHAR(60) NOT null,
	release_year integer NOT null,
				 check(release_year BETWEEN 1950 and 2022)
);

create table if not exists collections (
	performer_id INTEGER REFERENCES performers(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT collection PRIMARY KEY (performer_id, album_id)
);

create table if not exists tracks (
	id SERIAL primary key,
	track_name VARCHAR(60) NOT null,
	duration INTEGER not null,
			 CHECK (duration BETWEEN 15 AND 750),
	albums_id INTEGER not null references albums(id)
);

create table if not exists compilations (
	id SERIAL primary key,
	compilation_name VARCHAR(60) NOT null,
	release_year integer NOT null,
				 check(release_year between 1950 and 2022)
);

create table if not exists compositions (
	compilation_id INTEGER REFERENCES compilations(id),
	track_id INTEGER REFERENCES tracks(id),
	CONSTRAINT composition PRIMARY KEY (compilation_id, track_id)
);
