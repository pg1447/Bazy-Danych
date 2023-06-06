SELECT tr.Name AS Title, tr.UnitPrice AS Price
FROM track AS tr JOIN genre AS ge ON tr.GenreId=ge.GenreId
WHERE ge.Name LIKE "Science Fiction" OR ge.Name LIKE "Sci Fi & Fantasy";