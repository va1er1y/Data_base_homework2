CREATE TABLE IF NOT EXISTS Genre (
	PRIMARY key (id),
	id          SERIAL,
	name        VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Execuant (
	PRIMARY KEY (id),
	id          SERIAL,  
	name        VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Execuant_Genre (
    genre_id   	iNTEGER REFERENCES  Genre(id),
    execuant_id iNTEGER REFERENCES Execuant(id),
                CONSTRAINT pk PRIMARY KEY (genre_id, execuant_id)
);

CREATE TABLE IF NOT EXISTS Album(
    PRIMARY KEY   (id),
	id            SERIAL,
	name          VARCHAR(40) NOT NULL,
	year_of_ussue INTEGER     NOT NULL,
	              CHECK	(year_of_ussue BETWEEN 0 AND 9999)
);

CREATE TABLE IF NOT EXISTS Album_Execuant(
    execuant_id   iNTEGER REFERENCES Execuant(id),
    album_id      iNTEGER REFERENCES  Album(id),
                  CONSTRAINT key_album_execuant PRIMARY KEY (execuant_id, album_id)
);

CREATE TABLE IF NOT EXISTS Song(
    PRIMARY KEY   (id),
	id            SERIAL,
    name          VARCHAR(40) NOT NULL,
	duration      VARCHAR(10) NOT null,
	album_id      iNTEGER     REFERENCES  Album(id)	
);

CREATE TABLE IF NOT EXISTS Assembly (
    PRIMARY KEY    (id),
	id             SERIAL,
	name           VARCHAR(80) NOT NULL,
	year_of_ussue INTEGER     NOT NULL,
	              CHECK	(year_of_ussue BETWEEN 0 AND 9999)
);

CREATE TABLE IF NOT EXISTS Assembly_Song(
    assembly_id   iNTEGER REFERENCES Assembly(id),
    song_id       iNTEGER REFERENCES  Song(id),
                  CONSTRAINT key_assembly_song PRIMARY KEY (assembly_id, song_id)
);
