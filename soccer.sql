DROP DATABASE IF EXISTS soccer; 

CREATE DATABASE soccer;

\c soccer; 


--soccer teams
CREATE TABLE teams ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255) NOT NULL
); 

--players 
CREATE TABLE player ( 
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255),
    goals_scored INT DEFAULT 0
    teams_id INT NOT NULL
); 


--referee info 
CREATE TABLE referee (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(255)
); 

--match between the teams 
CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    referee_id INT NOT NULL, --the referee that will be in the match
    home_team  INT NOT NULL, --team 1
    away_team INT NOT NULL, --team 2
    FOREIGN KEY (referee_id) REFERENCES referee(id), 
    FOREIGN KEY (home_team) REFERENCES teams(id),
    FOREIGN KEY (away_team) REFERENCES teams(id)  
);

--final score for match 
CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INT NOT NULL REFERENCES matches(id),
    player_id INT NOT NULL REFERENCES players(id),
    scoring_team_id INT NOT NULL REFERENCES teams(id),
);

--season date
CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);





