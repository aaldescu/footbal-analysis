-- Create Teams table
CREATE TABLE Teams (
    team_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team_name TEXT NOT NULL,
    coach_name TEXT,
    home_stadium TEXT,
    foundation_year INTEGER
);

-- Create Players table
CREATE TABLE Players (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_name TEXT,
    team_id INTEGER,
    position TEXT,
    age INTEGER,
    nationality TEXT,
    height_cm REAL,
    weight_kg REAL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Create Matches table
CREATE TABLE Matches (
    match_id INTEGER PRIMARY KEY AUTOINCREMENT,
    team1_id INTEGER,
    team2_id INTEGER,
    match_date TEXT,
    team1_score INTEGER,
    team2_score INTEGER,
    stadium TEXT,
    referee TEXT,
    attendance INTEGER,
    FOREIGN KEY (team1_id) REFERENCES Teams(team_id),
    FOREIGN KEY (team2_id) REFERENCES Teams(team_id)
);

-- Create Player_Stats table
CREATE TABLE Player_Stats (
    player_stat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER,
    player_id INTEGER,
    goals_scored INTEGER,
    assists INTEGER,
    minutes_played INTEGER,
    passes_completed INTEGER,
    passes_attempted INTEGER,
    tackles_won INTEGER,
    tackles_attempted INTEGER,
    yellow_cards INTEGER,
    red_cards INTEGER,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Create Team_Stats table
CREATE TABLE Team_Stats (
    team_stat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER,
    team_id INTEGER,
    possession_percentage REAL,
    shots_on_target INTEGER,
    shots_off_target INTEGER,
    corners INTEGER,
    fouls_committed INTEGER,
    offsides INTEGER,
    passes_completed INTEGER,
    passes_attempted INTEGER,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Insert synthetic data into Teams table
INSERT INTO Teams (team_name, coach_name, home_stadium, foundation_year)
VALUES
('Team A', 'Coach A', 'Stadium A', 1905),
('Team B', 'Coach B', 'Stadium B', 1923),
('Team C', 'Coach C', 'Stadium C', 1909),
('Team D', 'Coach D', 'Stadium D', 1930),
('Team E', 'Coach E', 'Stadium E', 1915),
('Team F', 'Coach F', 'Stadium F', 1920),
('Team G', 'Coach G', 'Stadium G', 1940),
('Team H', 'Coach H', 'Stadium H', 1950),
('Team I', 'Coach I', 'Stadium I', 1960),
('Team J', 'Coach J', 'Stadium J', 1970);

-- Insert synthetic data into Players table
-- (Repeat similar inserts for players of all teams)
INSERT INTO Players (player_name, team_id, position, age, nationality, height_cm, weight_kg) VALUES
('Player A1', 1, 'Forward', 25, 'Country X', 180.0, 75.0),
('Player A2', 1, 'Midfielder', 27, 'Country X', 175.5, 70.0),
('Player A3', 1, 'Defender', 28, 'Country X', 177.0, 68.0),
('Player A4', 1, 'Forward', 24, 'Country X', 180.0, 75.0),
('Player A5', 1, 'Midfielder', 30, 'Country X', 179.0, 76.0),
('Player A6', 1, 'Defender', 22, 'Country X', 183.0, 78.0),
('Player A7', 1, 'Goalkeeper', 29, 'Country X', 190.0, 83.0),
('Player A8', 1, 'Defender', 26, 'Country X', 182.0, 79.0),
('Player A9', 1, 'Midfielder', 23, 'Country X', 178.5, 74.0),
('Player A10', 1, 'Forward', 28, 'Country X', 177.5, 72.0),
('Player A11', 1, 'Defender', 27, 'Country X', 175.0, 71.0),

('Player B1', 2, 'Forward', 29, 'Country Y', 182.0, 78.0),
('Player B2', 2, 'Midfielder', 30, 'Country Y', 180.0, 76.0),
('Player B3', 2, 'Defender', 22, 'Country Y', 185.0, 80.0),
('Player B4', 2, 'Goalkeeper', 31, 'Country Y', 195.0, 85.0),
('Player B5', 2, 'Defender', 25, 'Country Y', 183.0, 79.0),
('Player B6', 2, 'Midfielder', 26, 'Country Y', 178.0, 72.0),
('Player B7', 2, 'Forward', 27, 'Country Y', 179.0, 76.0),
('Player B8', 2, 'Defender', 24, 'Country Y', 182.0, 77.0),
('Player B9', 2, 'Midfielder', 23, 'Country Y', 180.0, 74.0),
('Player B10', 2, 'Defender', 28, 'Country Y', 176.0, 70.0),
('Player B11', 2, 'Forward', 29, 'Country Y', 181.0, 73.0);

-- Add Players for Teams C to J in similar fashion

-- Insert synthetic data into Matches table
INSERT INTO Matches (team1_id, team2_id, match_date, team1_score, team2_score, stadium, referee, attendance) VALUES
(1, 2, '2023-10-01', 2, 1, 'Stadium A', 'Referee X', 5000),
(3, 4, '2023-10-02', 3, 2, 'Stadium C', 'Referee Y', 5200),
(5, 6, '2023-10-03', 1, 0, 'Stadium E', 'Referee Z', 5300),
(7, 8, '2023-10-04', 1, 2, 'Stadium G', 'Referee W', 5400),
(9, 10, '2023-10-05', 3, 3, 'Stadium I', 'Referee V', 5500),
-- Quarter-Finals
(1, 3, '2023-10-10', 1, 1, 'Stadium A', 'Referee X', 5000),
(5, 8, '2023-10-11', 2, 1, 'Stadium E', 'Referee Y', 5200),
(9, 1, '2023-10-12', 0, 2, 'Stadium I', 'Referee W', 5300),
-- Semi-Finals
(1, 5, '2023-10-15', 1, 0, 'Stadium A', 'Referee X', 5500),
(8, 1, '2023-10-16', 1, 2, 'Stadium G', 'Referee Z', 5600),
-- Final
(1, 8, '2023-10-20', 2, 1, 'Stadium A', 'Referee XYZ', 10000);

-- Insert synthetic data into Player_Stats table
INSERT INTO Player_Stats (match_id, player_id, goals_scored, assists, minutes_played, passes_completed, passes_attempted, tackles_won, tackles_attempted, yellow_cards, red_cards) VALUES
-- Round 1
(1, 1, 1, 0, 90, 30, 40, 5, 6, 1, 0),
(1, 2, 1, 0, 85, 50, 60, 4, 5, 0, 0),
(1, 12, 0, 1, 90, 30, 50, 2, 3, 1, 0),
(2, 23, 2, 0, 90, 25, 35, 4, 5, 1, 0),
(3, 30, 1, 0, 90, 20, 25, 3, 4, 0, 0),
(4, 47, 1, 0, 85, 40, 45, 4, 5, 0, 0),
(5, 52, 2, 0, 65, 35, 40, 2, 3, 1, 0),
(5, 53, 1, 1, 90, 45, 50, 3, 4, 0, 0),

-- Quarter-Finals
(6, 1, 1, 0, 90, 30, 40, 5, 6, 1, 0),
(6, 2, 1, 0, 85, 50, 60, 4, 5, 0, 0),
(6, 23, 1, 0, 85, 40, 50, 3, 4, 0, 0),
(7, 30, 2, 0, 90, 20, 25, 3, 4, 2, 0),
(7, 30, 1, 1, 90, 25, 30, 4, 6, 4, 0),

-- Semi-Finals
(9, 1, 1, 0, 90, 30, 40, 5, 6, 0, 0),
(9, 2, 1, 0, 85, 50, 60, 4, 5, 0, 0),
(10, 5, 1, 0, 85, 40, 45, 4, 6, 0, 0),

-- Final
(11, 1, 1, 0, 90, 30, 40, 5, 6, 0, 0),
(11, 47, 1, 0, 90, 45, 50, 4, 5, 0, 0);

-- Insert synthetic data into Team_Stats table
INSERT INTO Team_Stats (match_id, team_id, possession_percentage, shots_on_target, shots_off_target, corners, fouls_committed, offsides, passes_completed, passes_attempted) VALUES
-- Round 1
(1, 1, 55.5, 5, 7, 6, 12, 3, 400, 450),
(1, 2, 44.5, 4, 6, 5, 14, 2, 350, 400),
(2, 3, 60.0, 10, 3, 8, 9, 4, 320, 400),
(2, 4, 40.0, 6, 5, 7, 8, 5, 315, 430),
(3, 5, 55.0, 5, 9, 9, 11, 5, 300, 400),
(3, 6, 45.0, 4, 6, 5, 12, 6, 270, 380),
(4, 7, 60.0, 10, 8, 4, 11, 3, 290, 350),
(4, 8, 40.0, 5, 9, 7, 9, 6, 310, 380),
(5, 9, 57.0, 5, 6, 8, 7, 4, 300, 450),
(5, 10, 43.0, 7, 9, 9, 8, 5, 310, 430),

-- Quarter-Finals
(6, 1, 46.0, 6, 9, 8, 11, 3, 340, 380),
(6, 3, 54.0, 5, 4, 6, 12, 2, 300, 420),
(7, 5, 55.0, 10, 3, 4, 9, 5, 350, 410),
(7, 8, 45.0, 6, 7, 8, 9, 4, 300, 390),
(8, 9, 60.0, 8, 9, 6, 5, 2, 310, 420),
(8, 10, 40.0, 10, 8, 9, 10, 5, 310, 390),

-- Semi-Finals
(9, 1, 49.0, 3, 5, 7, 8, 3, 280, 500),
(9, 5, 51.0, 4, 7, 9, 7, 5, 300, 516),
(10, 1, 51.0, 2, 6, 8, 9, 3, 1833, 620),
(10, 8, 49.0, 3, 4, 9, 8, 3, 330, 370),

-- Final
(11, 1, 55.0, 7, 6, 6, 8, 3, 360, 400),
(12, 1, 45.0, 4, 9, 9, 9, 4, 300, 280);