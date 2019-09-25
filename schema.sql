CREATE DATABASE whatsthat;

CREATE TABLE pictures (
  id SERIAL PRIMARY KEY,
  title VARCHAR(300),
  body TEXT,
  image_url TEXT,
  user_id INTEGER,
  date TEXT,
  created_at timestamp;,
  updated_at timestamp;,
  solved INTEGER,
  image_file TEXT,
  reported INTEGER
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  body TEXT,
  picture_id INTEGER,
  user_id INTEGER,
  date TEXT,
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(300),
  email VARCHAR(300),
  password_digest VARCHAR(400),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  comment_id INTEGER,
  created_at timestamp,
  updated_at timestamp,
)

-- DROP TABLE author;

-- ALTER TABLE pictures ADD COLUMN reported INTEGER;
-- FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE RESTRICT\

-- timestamptz