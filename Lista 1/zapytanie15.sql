SELECT NAME, TitleOfAlbum , tracks, totalPrice
FROM (
	SELECT album.Title AS TitleOfALbum , COUNT(album.AlbumID) AS tracks, SUM(track.UnitPrice) AS totalPrice , album.AlbumId, album.ArtistId
	From track JOIN album ON track.AlbumID=album.AlbumId
	GROUP BY AlbumID
) AS A
INNER JOIN artist ON artist.ArtistId=A.ArtistID
ORDER BY totalPrice DESC
LIMIT 5;