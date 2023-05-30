-- Collect all your queries here if you'd like!
-- Write the SQL to return all of the rows in the artists table
SELECT * FROM artists;

-- Write the SQL to return all of the rows in the artists table for artists who have the name "Black Sabbath"
SELECT * FROM artists WHERE name="Black Sabbath";

--Write the SQL to create a table named 'fans' with an autoincrementing ID that's a primary key and a name field of type text
CREATE TABLE IF NOT EXISTS fans (
    id INTEGER PRIMARY KEY,
    name TEXT
);

-- Write the SQL to add yourself as a fan of the black eyed peas? ArtistId 169
ALTER TABLE fans ADD COLUMN artist_id INTEGER;

--Write the SQL to add yourself as a fan of the Postal Service? ArtistId 174
INSERT INTO fans (name, artist_id) VALUES ("Ryan", 174);

-- Write the SQL to return fans that are not fans of the black eyed peas.
SELECT * FROM fans WHERE NOT artist_id=169;

-- Write the SQL to display an artists name next to their album title
SELECT * FROM artists INNER JOIN albums ON artists.id=albums.artist_id;

-- Write the SQL to display artist name, album name and number of tracks on that album
SELECT artists.name, albums.title, COUNT(tracks.id) FROM artists INNER JOIN albums ON artists.id=albums.artist_id INNER JOIN tracks ON albums.id=tracks.album_id GROUP BY albums.id;

-- Write the SQL to return the name of all of the artists in the 'Pop' Genre
SELECT artists.name FROM artists INNER JOIN albums ON artists.id=albums.artist_id INNER JOIN tracks ON albums.id=tracks.album_id INNER JOIN genres ON tracks.genre_id=genres.id WHERE genres.name="Pop";

-- I want to return the names of the artists and their number of rock tracks who play Rock music and have more than 30 tracks in order of the number of rock tracks that they have from greatest to least
SELECT artists.name, COUNT(tracks.id) 
FROM artists 
INNER JOIN albums 
    ON artists.id=albums.artist_id 
INNER JOIN tracks 
    ON albums.id=tracks.album_id 
INNER JOIN genres 
    ON tracks.genre_id=genres.id 
WHERE genres.name="Rock" 
GROUP BY artists.id 
HAVING COUNT(tracks.id) > 30 
ORDER BY COUNT(tracks.id) DESC;