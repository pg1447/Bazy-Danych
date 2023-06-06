CREATE DATABASE L3Z4GOUSE L3Z4GOCREATE TABLE [odlegloœæ](	A varchar(40),	B varchar(40),	Dystans INT)GOINSERT [odlegloœæ] (A,B,Dystans) Values
	('1','2',2),
	('2','3',3),
	('3','4',4),
	('4','1',4),
	('4','5',2),
	('4','3',3),
	('3','4',4)
GO



CREATE PROCEDURE procedura
AS
BEGIN
	CREATE TABLE #t(	A varchar(40),	B varchar(40),	Dystans INT	)
	
	SELECT * INTO #temp FROM #t
	SELECT * INTO #temp1 FROM #t
	SELECT * INTO #temp2 FROM #t
	--DROP TABLE #t

	INSERT #temp SELECT * FROM [odlegloœæ]
	INSERT #temp1 SELECT x.A, x.B ,x.Dystans  FROM (SELECT A, B, Dystans FROM #temp UNION SELECT B, A, Dystans FROM #temp) AS x
	DELETE #temp 
	INSERT #temp2 SELECT A,B, MIN(Dystans) FROM #temp1 GROUP BY A,B
	DELETE #temp1
	DECLARE @ilosc INT = (SELECT COUNT(*) FROM #temp2)
	DECLARE @i INT = 0;
	WHILE @i<@ilosc BEGIN --polaczenie kazdego miasta z kazdym
		INSERT #temp SELECT * FROM #temp2
		INSERT #temp SELECT x.A, y.B, (x.Dystans+y.Dystans) AS Dystans FROM #temp2 AS x, #temp2 AS y WHERE x.B=y.A AND x.A!=y.B--przejscie do nastepnego miasta
		DELETE #temp2
		INSERT #temp1 SELECT * FROM (SELECT A, B, Dystans FROM #temp UNION SELECT B, A, Dystans FROM #temp) AS x--przechodne
		DELETE #temp
		INSERT #temp2 SELECT A,B, MIN(Dystans) FROM #temp1 GROUP BY A,B
		DELETE #temp1
		SET @i=@i+1
	END
	SELECT * INTO [odleg³oœæ_tr] FROM #temp2
	DROP TABLE #temp, #temp1, #temp2
END
GO

EXEC procedura
SELECT * FROM [odleg³oœæ_tr] ORDER BY A,B
GO
DROP PROCEDURE procedura
DROP TABLE [odlegloœæ], [odleg³oœæ_tr]

