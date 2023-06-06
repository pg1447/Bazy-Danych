

USE Zad3
GO


CREATE TABLE lista(
	tabela varchar (40),
	kolumna varchar (40),
	maximum varchar (30) 
)
GO

CREATE TABLE test1(
	kolumna1 varchar (100),
	kolumna2 int,
	kolumna3 money 
)
GO

INSERT INTO lista (tabela, kolumna) values ('test1', 'kolumna1')
INSERT INTO lista (tabela, kolumna) values ('test1', 'kolumna2')
INSERT INTO lista (tabela, kolumna) values ('test1', 'kolumna3')
GO
CREATE PROCEDURE szukaj
AS
BEGIN	
	UPDATE lista
	SET maximum = COLUMNPROPERTY( OBJECT_ID(x.tabela),x.kolumna,'PRECISION')
	FROM lista AS x
	
END
GO
exec szukaj
GO
SELECT * 
FROM lista
GO
--DROP TABLE lista
--DROP TABLE test1
--DROP PROCEDURE szukaj



