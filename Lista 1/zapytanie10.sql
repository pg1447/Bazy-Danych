SELECT NAME, cnt
FROM(
	SELECT COUNT(AlbumID) AS cnt , ArtistID
	FROM album
	GROUP BY ArtistID
	) number
JOIN artist ON number.ArtistID=artist.ArtistID;