USE Chinook;
SELECT album.ArtistID, artist.Name, album.Title
FROM artist, album
WHERE album.ArtistID = artist.ArtistID
ORDER BY ArtistID;