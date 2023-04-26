CREATE TABLE author (
  id SERIAL,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE label(
  id SERIAL,
  title varchar(150),
  color varchar(150),
  PRIMARY KEY (id)
);


CREATE TABLE item (
  id SERIAL,
  genre INT REFERENCES genre(id) NOT NULL,
  author INT REFERENCES author(id) NOT NULL,
  label INT REFERENCES label(id) NOT NULL,
  publish_date date,
  archived boolean,
  PRIMARY KEY (id)
);

CREATE TABLE game (
  id INT REFERENCES item(id) NOT NULL,
  multiplayer BOOLEAN,
  last_played_at DATE
);

CREATE TABLE book (
  id INT REFERENCES item(id) NOT NULL,
  publisher varchar(150),
  cover_state varchar(150)
);
