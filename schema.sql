CREATE DATABASE whatsthat;

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  title VARCHAR(300),
  body TEXT,
  image_url TEXT,
  user_id INTEGER
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body TEXT,
  picture_id INTEGER,
  user_id INTEGER
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(300),
  email VARCHAR(300),
  password_digest VARCHAR(400)
);

ALTER TABLE pictures ADD COLUMN date TEXT;
ALTER TABLE comments ADD COLUMN date TEXT;
ALTER TABLE pictures ADD COLUMN solved INTEGER;
ALTER TABLE pictures ADD COLUMN image_file TEXT;
ALTER TABLE pictures ADD COLUMN reported INTEGER;

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  comment_id INTEGER
)