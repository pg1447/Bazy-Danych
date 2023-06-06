SELECT track.Name
FROM track
WHERE track.AlbumId IN (
	SELECT DISTINCT al.AlbumId
	FROM track AS tr JOIN album AS al ON tr.AlbumId=al.AlbumId
	WHERE al.Title LIKE "%Battlestar Galactica%"
);
