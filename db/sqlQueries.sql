/* one id item */
CREATE TABLE IF NOT EXISTS cd (
	id SERIAL PRIMARY KEY,
	coverArt VARCHAR(100) NOT NULL,
	artist VARCHAR(150) NOT NULL,
	title VARCHAR(100) NOT NULL UNIQUE
);

/* expand cd table */
ALTER TABLE cd
ADD COLUMN IF NOT EXISTS releaseDate SMALLINT NOT NULL,
ADD COLUMN IF NOT EXISTS genre VARCHAR(15) NOT NULL,
ADD COLUMN IF NOT EXISTS review TEXT NOT NULL,
ADD COLUMN IF NOT EXISTS sleeve VARCHAR(20),
ADD COLUMN IF NOT EXISTS acquired SMALLINT,
ADD COLUMN IF NOT EXISTS rating VARCHAR(2);

/* rename coverArt to cover */
ALTER TABLE cd RENAME COLUMN coverArt TO cover;

/* all of the cds */
CREATE TABLE IF NOT EXISTS cds (
	id SERIAL PRIMARY KEY,
	cdid SERIAL,
	CONSTRAINT fkey_cd_cds FOREIGN KEY(cdid) REFERENCES cd(id) 
);
/* drop table */
DROP TABLE cds;

/* artist */
CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	CONSTRAINT fkey_cd_artist FOREIGN KEY(id) REFERENCES cd(id)
);

/* tracks */
CREATE TABLE IF NOT EXISTS tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    artist SERIAL NOT NULL,
    album INT NOT NULL,
    duration INT NOT NULL,
    CONSTRAINT fkey_artist_tracks FOREIGN KEY(artist) REFERENCES artist(id),
    CONSTRAINT fkey_cd_tracks FOREIGN KEY(album) REFERENCES cd(id)
);
