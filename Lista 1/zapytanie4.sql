USE Chinook;
SELECT album.Title
FROM album, artist
WHERE artist.Name = "Various Artists";