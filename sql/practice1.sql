-- create and use database

CREATE TABLE practice1
USE practice1


-- Create tables for a gaming website

CREATE TABLE game (
  game_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(100) NOT NULL,
  developer VARCHAR(255) DEFAULT NULL,
  publisher VARCHAR(255) DEFAULT NULL,
  release_date DATE,
  platform VARCHAR(100) NOT NULL,
  description TEXT,
  image_url VARCHAR(255) DEFAULT NULL
);

CREATE TABLE user (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  bio TEXT
);

CREATE TABLE review (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  game_id INT NOT NULL,
  review_text TEXT NOT NULL,
  rating INT  NOT NULL,
  review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (game_id) REFERENCES game(game_id)
);

ALTER TABLE game
ADD COLUMN cost DECIMAL(10,2) DEFAULT 0;


CREATE TABLE purchase (
  purchase_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  game_id INT NOT NULL,
  purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (game_id) REFERENCES game(game_id)
);


alter table review
modify column location INT CHECK (rating >= 1 AND rating <= 5) DEFAULT 0;

select * from game

INSERT INTO user (username, email, password, first_name, last_name, bio)
VALUES ("vishal", "vishal@email.com", "vishalstrongpassword", "Vishal", "Woz", "This is my bio :)"), 
("vaibhav", "vaibhav@email.com", "vaibhavsweakpassword", "Vaibhav", "Wiz", "This is my bio 2:)");


INSERT INTO game (title, genre, developer, publisher, release_date, platform, description)
VALUES ("Grand Theft Auto V", "Action-adventure", "Rockstar North", "Rockstar Games", "2013-09-17", "PS3, Xbox 360, PC", "An open world action-adventure game about crime and heists."),
("The Witcher 3: Wild Hunt", "Action RPG", "CD Projekt Red", "CD Projekt", "2015-05-18", "PC, PlayStation 4, Xbox One", "An open world action RPG set in a fantasy world with a rich story and deep character development."),
("Hollow Knight", "Metroidvania", "Team Cherry", "Team Cherry", "2017-02-24", "PC, Nintendo Switch, PlayStation 4, Xbox One", "A challenging and atmospheric 2D metroidvania with beautiful hand-drawn art and a hauntingly beautiful soundtrack."),
("Hades", "Action roguelike", "Supergiant Games", "Supergiant Games", "2020-09-17", "PC, macOS, Nintendo Switch", "A fast-paced action roguelike with a compelling story and permanent upgrades that keep you coming back for more."),
("Stardew Valley", "Simulation RPG", "ConcernedApe", "Chucklefish Games", "2016-02-24", "PC, macOS, Linux, PlayStation 4, Xbox One, Nintendo Switch, Mobile", "A relaxing and charming farm simulation game where you build your dream farm, raise animals, and befriend the townspeople.");


select * from review

INSERT INTO review (user_id, game_id, review_text, rating)
VALUES (1, 2, "This game is fantastic! The story is gripping, the characters are memorable, and the gameplay is addictive.", 5),
(2, 1, "A classic open-world experience. A bit dated now, but still a lot of fun to explore and cause chaos.", 4),
(2, 4, "A beautiful and challenging metroidvania. The exploration is top-notch, and the boss fights are epic.", 3),
(1, 3, "Fast-paced and action-packed! I love the variety of weapons and the permanent upgrades keep me coming back for more runs.", 4),
(2, 5, "A relaxing and heartwarming experience. Perfect for winding down after a long day. I love building my farm and interacting with the townspeople.", 5);


INSERT INTO purchase (user_id, game_id, price)
VALUES (1, 2, 19.99),
(2, 3, 24.99),
(1, 5, 14.99);


UPDATE user
SET email = 'wizal@example.com'
WHERE user_id = 1;

select *  from game;

UPDATE game
SET cost = 12.99
WHERE game_id = 4

SELECT * 
FROM game
WHERE cost > 10;

DELETE FROM game
WHERE cost > 100;

SELECT game_id, SUM(cost) AS total_games_cost
FROM game
GROUP BY game_id;

SELECT * 
FROM review 
WHERE rating > 4;


SELECT * FROM game
WHERE release_date >= CURDATE() - INTERVAL 1 YEAR
AND release_date <= CURDATE();


select user_id from review
UNION
select user_id from purchase

SELECT * 
FROM review 
WHERE rating IN (1, 5);


SELECT * 
FROM user
WHERE username LIKE 'v%';


select * from user

SELECT developer, AVG(cost) AS average_cost
FROM game
GROUP BY developer

SELECT game_id, AVG(rating) AS average_rating
FROM review
GROUP BY game_id
HAVING AVG(rating)>4;