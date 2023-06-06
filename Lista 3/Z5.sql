CREATE DATABASE Zad5

USE Zad5
Go

CREATE TABLE odleglosc(
	A varchar(40),
	B varchar(40),
	Dystans INT
)
--DROP table odleglosc
INSERT odleglosc (A,B,Dystans) Values
	('1','2',2),
	('2','3',3),
	('3','4',4),
	('4','1',4),
	('4','5',2),
	('4','3',3),
	('3','4',4)
GO



WITH  odleglosc_tr (A, B, Dystans, licznik)
AS(
    SELECT A, B, Dystans, 0 AS licznik
    FROM (SELECT A,B,Dystans FROM odleglosc UNION SELECT B,A,Dystans FROM odleglosc) as x
	UNION ALL
	SELECT R1.A, R2.B, R1.Dystans+R2.Dystans, (licznik+1) AS licznik
    FROM odleglosc_tr AS R1, odleglosc AS R2
	WHERE R1.A!=R2.B AND R1.B=R2.A AND licznik<5
)
SELECT A, B, MIN(Dystans) AS Dystans
FROM odleglosc_tr
GROUP BY A, B
ORDER BY A,B, MIN(Dystans)
