USE master;

IF DB_ID('ChromeDragonDB') IS NOT NULL DROP DATABASE ChromeDragonDB;
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

CREATE DATABASE ChromeDragonDB;
GO

USE ChromeDragonDB;
GO

DROP TABLE IF EXISTS Score
GO
CREATE TABLE Score
(
	Id int IDENTITY(1,1) PRIMARY KEY,
	PlayerName nvarchar(101) NULL,
	Score int NULL,
)
GO

INSERT INTO Score (PlayerName, Score)
values	('Nastya', 45),
		('Lilia', 96)

SELECT * FROM Score
