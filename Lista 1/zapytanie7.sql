SELECT tr.Name AS TrackName, al.Title AS AlbumTitle, ar.Name AS ArtistName, ge.Name AS GenreType
FROM track tr INNER JOIN album al ON al.AlbumId=tr.TrackId
INNER JOIN artist AS ar ON ar.ArtistId=al.ArtistId
INNER JOIN genre AS ge ON ge.GenreId=tr.GenreId
INNER JOIN playlisttrack AS pltr ON pltr.TrackId=tr.TrackId
INNER JOIN playlist AS pl ON pl.PlaylistId=pltr.PlaylistId
WHERE pl.Name LIKE "90’s Music";