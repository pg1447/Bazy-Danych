SELECT ar1.Name AS firstArtistName, ar2.Name AS secondArtistname, al1.Title AS SameAlbumTitle
FROM album as al1 INNER JOIN artist ar1 ON al1.ArtistId=ar1.ArtistId
INNER JOIN album AS al2 ON al1.Title=al2.Title
INNER JOIN artist ar2 ON al2.ArtistId=ar2.ArtistId
WHERE al1.ArtistId>al2.ArtistId;