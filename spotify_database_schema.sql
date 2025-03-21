
--User table
CREATE TABLE User (
  user_id INT PRIMARY KEY,
  username VARCHAR(20) NOT NULL UNIQUE,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  subscription_type ENUM('Free', 'Premium')
);

--Artist table
CREATE TABLE Artist (
  artist_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  genre VARCHAR(50) NOT NULL
);

--Album table
CREATE TABLE Album (
  album_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  release_date DATE,
  artist_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

--Song table
CREATE TABLE Song (
  song_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  duration INT,
  artist_id INT,
  album_id INT,
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

--Playlist table
CREATE TABLE Playlist (
  playlist_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

--Playlist_Song table (many-to-many relationship)
CREATE TABLE Playlist_Song (
  playlist_id INT,
  song_id INT,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
  FOREIGN KEY (song_id) REFERENCES Song(song_id)
);
