DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.artist(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  artistic_name VARCHAR(60) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.plan(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(40) NOT NULL,
  price DOUBLE NOT NULL
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.`user`(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	full_name VARCHAR(90) NOT NULL,
  age SMALLINT(3) NOT NULL,
  subscription_date DATE NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.`follows`(
	artist_id INT NOT NULL,
	user_id INT NOT NULL,
  PRIMARY KEY (artist_id, user_id),
  FOREIGN KEY (artist_id) REFERENCES artist(id),
  FOREIGN KEY (user_id) REFERENCES `user`(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.album(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  title VARCHAR(60) NOT NULL,
  release_year YEAR(4) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.music(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	title VARCHAR(60) NOT NULL,
  seconds SMALLINT(3) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(id)
) engine = InnoDB;
  
CREATE TABLE SpotifyClone.played_history(
	played_date DATETIME NOT NULL,
  user_id INT NOT NULL,
  music_id INT NOT NULL,
  PRIMARY KEY (user_id, music_id),
  FOREIGN KEY (user_id) REFERENCES `user`(id),
  FOREIGN KEY (music_id) REFERENCES music(id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artist 
  (artistic_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
    
INSERT INTO SpotifyClone.plan 
  (`type`, price)
  VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.`user` 
  (full_name, age, plan_id, subscription_date)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');
    
INSERT INTO SpotifyClone. `follows`
  (artist_id, user_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (3, 2),
  (2, 3),
  (4, 4),
  (5, 5),
  (6, 5),
  (6, 6),
  (1, 6),
  (6, 7),
  (3, 9),
  (2, 10);
  
INSERT INTO SpotifyClone.album
  (title, release_year, artist_id)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);
  
INSERT INTO SpotifyClone.music
  (title, seconds, album_id)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGO’S GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Don’t Stop Me Now', 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bard’s Song', 244, 7),
  ('Feeling Good', 100, 8);
  
INSERT INTO SpotifyClone.played_history
  (played_date, user_id, music_id)
VALUES
  ('2022-02-28 10:45:55', 1, 8),
  ('2020-05-02 05:30:35', 1, 2),
  ('2020-03-06 11:22:33', 1, 10),
  ('2022-08-05 08:05:17', 2, 10),
  ('2020-01-02 07:40:33', 2, 7),
  ('2020-11-13 16:55:13', 3, 10),
  ('2020-12-05 18:38:30', 3, 2),
  ('2021-08-15 17:10:10', 4, 8),
  ('2022-01-09 01:44:33', 5, 8),
  ('2020-08-06 15:23:43', 5, 5),
  ('2017-01-24 00:31:17', 6, 7),
  ('2017-10-12 12:35:20', 6, 1),
  ('2011-12-15 22:30:49', 7, 4),
  ('2012-03-17 14:56:41', 8, 4),
  ('2022-02-24 21:14:22', 9, 9),
  ('2015-12-13 08:30:22', 10, 3);
 