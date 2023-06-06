
USE Zad3
GO
--DROP PROCEDURE Zamiana
CREATE PROCEDURE Zamiana
(	
	@data1 datetime,
	@data2 datetime
	
)
AS
BEGIN
	DECLARE @temp1 int;
	DECLARE @temp2 int;
	DECLARE @temp3 int;
	
	IF @data1>@data2
	BEGIN
		SET @temp1 = DATEDIFF (day, @data2, @data1)
		SET @temp2 = DATEDIFF (hour, @data2, @data1)
		SET @temp3 = DATEDIFF (second, @data2, @data1)
	END ELSE
	BEGIN
		SET @temp1 = DATEDIFF (day, @data1, @data2 )
		SET @temp2 = DATEDIFF (hour, @data1, @data2 )
		SET @temp3 = DATEDIFF (second, @data1, @data2 )
	END


	SELECT @temp1 AS Dni, @temp2 AS Godziny, @temp3 AS Sekundy
end
GO

exec Zamiana '1999-09-01 15:39:33','2012-11-18 18:13:15'

GO