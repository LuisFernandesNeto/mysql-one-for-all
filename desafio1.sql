DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(50) NOT NULL,
    plan_price VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    sign_up_date VARCHAR(100) NOT NULL,
	plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id) 
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_artists(
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    release_year INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
    song_id INT PRIMARY KEY AUTO_INCREMENT,
    song VARCHAR(100) NOT NULL,
    duration_time_in_seconds INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.play_history(
    song_id INT NOT NULL,
    FOREIGN KEY (song_id) REFERENCES songs (song_id),
    play_date VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    PRIMARY KEY (song_id, user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan, plan_price)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.users (user, age, sign_up_date, plan_id)
VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 2),
  ('Martin Fowler', 46, '2017-01-17', 2),
  ('Sandi Metz', 58, '2018-04-29', 2),
  ('Paulo Freire', 19, '2018-02-14', 3),
  ('Bell Hooks', 26, '2018-01-05', 3),
  ('Christopher Alexander', 85, '2019-06-05', 4),
  ('Judith Butler', 45, '2020-05-13', 4),
  ('Jorge Amado', 58, '2017-02-17', 4);
  
INSERT INTO SpotifyClone.artists (artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
  
INSERT INTO SpotifyClone.following_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6), 
  (9, 3),
  (10, 2);
  
INSERT INTO SpotifyClone.albums (album, artist_id, release_year)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);
  
INSERT INTO SpotifyClone.songs (song, duration_time_in_seconds, artist_id, album_id)
VALUES
  ('Break my soul', 279, 1, 1),
  ('Virgo’s Groove', 369, 1, 1),
  ('Alien Superstar', 116, 1, 1),
  ('Don’t Stop Me Now', 203, 2, 2),
  ('Under Pressure', 152, 2, 2),
  ('Como Nossos Pais', 105, 3, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 3, 5),
  ('Samba em Paris', 267, 4, 6),
  ('The Bard’s Song', 244, 5, 7),
  ('Feeling Good', 100, 6, 8);
INSERT INTO SpotifyClone.play_history (song_id, play_date, user_id)
VALUES
  (8, '2022-02-28 10:45:55', 1),
  (2, '2020-05-02 05:30:35', 1),
  (10, '2020-03-06 11:22:33', 1),
  (10, '2022-08-05 08:05:17', 2),
  (7, '2020-01-02 07:40:33', 2),
  (10, '2020-11-13 16:55:13', 3),
  (2, '2020-12-05 18:38:30', 3),
  (8, '2021-08-15 17:10:10', 4),
  (8, '2022-01-09 01:44:33', 5),
  (5, '2020-08-06 15:23:43', 5),
  (7, '2017-01-24 00:31:17', 6),
  (1, '2017-10-12 12:35:20', 6),
  (4, '2011-12-15 22:30:49', 7),
  (4, '2012-03-17 14:56:41', 8),
  (9, '2022-02-24 21:14:22', 9),
  (3, '2015-12-13 08:30:22', 10);
