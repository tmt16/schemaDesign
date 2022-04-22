DROP DATABASE soccerleague_db;
CREATE DATABASE soccerleague_db;
\c soccerleague_db;

CREATE TABLE RESULTS (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams ON DELETE CASCADE,
    match_id INTEGER NOT NULL REFERENCES matches ON DELETE CASCADE,
    result TEXT
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    teamname VARCHAR(3) UNIQUE NOT NULL,
    ranking INTEGER
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 VARCHAR(3) UNIQUE NOT NULL,
    team2 VARCHAR(3) UNIQUE NOT NULL,
    referee_id INTEGER REFERENCES referees ON DELETE CASCADE,
    season_id INTEGER REFERENCES season ON DELETE CASCADE,
    date DATE
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    name TEXT
);

