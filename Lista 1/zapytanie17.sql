SELECT ar.Name , COUNT(al.AlbumId) AS Tracks
FROM track AS tr JOIN genre AS ge ON tr.GenreId=ge.GenreId
JOIN album AS al ON tr.AlbumId=al.AlbumId
JOIN artist AS ar ON ar.ArtistId=al.ArtistId
WHERE ge.Name LIKE "Heavy Metal" OR ge.Name LIKE "Metal"
GROUP BY (ar.ArtistId)
ORDER BY Tracks DESC
LIMIT 1;