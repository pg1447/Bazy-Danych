SELECT A.nam
FROM (
	SELECT AVG(tr.Milliseconds) AS avgmil , ar.Name AS nam ,COUNT(ar.ArtistId) AS cnt
	FROM track AS tr JOIN genre AS ge ON tr.GenreId=ge.GenreId
	JOIN album AS al ON tr.AlbumId=al.AlbumId
	JOIN artist AS ar ON ar.ArtistId=al.ArtistId
	WHERE ge.Name LIKE "Rock" 
	GROUP BY (ar.ArtistID)
	ORDER BY avgmil DESC
) AS A
WHERE A.cnt>12;