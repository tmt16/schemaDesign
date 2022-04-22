DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    region_id INTEGER REFERENCES region,
    username VARCHAR(15) UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE CASCADE,
    title TEXT NOT NULL,
    information TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL
);

-- INSERT INTO region (region_name)
-- VALUES ('Detroit'), 
-- ('Dallas-Forth Worth');

-- INSERT INTO users (region_id, username, first_name, last_name)
-- VALUES ('2', 'theresa_trev', 'Theresa', 'Trevino'),
-- ('2', 'Jimmo20', 'Jim', 'Ochoa'),
-- ('1', 'RolloTheCat', 'Rollo', 'Feind');

-- INSERT INTO posts (user_id, region_id, category_id, title, information, city) 
-- VALUES ('1', '2', '2', 'Car for Sale', '2400 miles Ford Fusion', 'Dallas'), 
-- ('2', '2', '3', 'Seeking Web Developer', 'Entry-Level Developer. Experience in Javascript, SQL, Python', 'Fort Worth'), 
-- ('3', '1', '1', 'House For Rent', '1500 sq ft 3-bedroom, 2-bathroom', 'Detroit');

-- INSERT INTO categories (category_name)
-- VALUES ('Housing'), 
-- ('For Sale'), 
-- ('Jobs');