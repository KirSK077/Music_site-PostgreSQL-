create table if not exists genres (
	id SERIAL primary key,
	genre_name VARCHAR(60) NOT NULL
);

create table if not exists performers (
	id SERIAL primary key,
	performer_name VARCHAR(100) NOT null
);

create table if not exists genres_performers (
	genre_id INTEGER REFERENCES genres(id),
	performer_id INTEGER REFERENCES performers(id),
	CONSTRAINT pk1 PRIMARY KEY (genre_id, performer_id)
);

create table if not exists albums (
	id SERIAL primary key,
	album_name VARCHAR(100) NOT null,
	release_date date
);

create table if not exists performers_albums (
	performer_id INTEGER REFERENCES performers(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk2 PRIMARY KEY (performer_id, album_id)
);

create table if not exists tracks (
	id SERIAL primary key,
	track_name VARCHAR(60) NOT null,
	duration interval minute to second,
	albums_id INTEGER not null references albums(id)
);

create table if not exists compilations (
	id SERIAL primary key,
	compilation_name VARCHAR(100) NOT null,
	release_date date
);

create table if not exists compilations_tracks (
	compilation_id INTEGER REFERENCES compilations(id),
	track_id INTEGER REFERENCES tracks(id),
	CONSTRAINT pk3 PRIMARY KEY (compilation_id, track_id)
);
