USE master;

IF DB_ID('Hotel') IS NOT NULL DROP DATABASE Hotel;
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

CREATE DATABASE Hotel;
GO

USE Hotel;
GO

DROP TABLE IF EXISTS CustomerName
GO
CREATE TABLE CustomerName
(
	CustomerId int NOT NULL,
	LastName nvarchar(101) NULL,
	Firstname nvarchar(101) NULL,
 CONSTRAINT PK_CustomerId PRIMARY KEY CLUSTERED (CustomerId ASC)
)
GO

DROP TABLE IF exists CustomerDetails
GO
CREATE TABLE CustomerDetails
( CustomerDetailsId int not null,
  PhoneNumber numeric null,
  Email nvarchar(101) null,
  CONSTRAINT PK_CustomerDetailsId PRIMARY KEY (CustomerDetailsId),
  CONSTRAINT FK_CustumerDetailsId FOREIGN KEY (CustomerDetailsId) REFERENCES CustomerName (CustomerId)
)

DROP TABLE IF exists Rooms
GO
CREATE TABLE Rooms
( RoomId int not null,
  RoomNumber int null,
  Category nvarchar(101) null,
  Price decimal(10,2) null,
  CONSTRAINT PK_RoomID PRIMARY KEY (RoomId)
)

DROP TABLE IF exists RoomDTable
GO
CREATE TABLE RoomDTable
( CustomerId int not null,
  RoomId int not null,
  CONSTRAINT FK_RoomCustomerId FOREIGN KEY (CustomerId) REFERENCES CustomerName (CustomerId),
  CONSTRAINT FK_RoomId FOREIGN KEY (CustomerId) REFERENCES Rooms (RoomId)
)


DROP TABLE IF exists RoomServices
GO
CREATE TABLE RoomServices
( ServiceId int not null,
  ServiceName nvarchar(101) null,
  Breakfast nvarchar(101) null,
  Lunch nvarchar(101) null,
  Supper nvarchar(101) null,
  Cleaning nvarchar(101) null,
  CONSTRAINT PK_ServiceId PRIMARY KEY (ServiceId)
)

DROP TABLE IF exists DistributionTable
GO
CREATE TABLE DistributionTable
( CustomerId int not null,
  ServiceId int not null,
  RegDate datetime NULL,
  CONSTRAINT FK_CustomerId FOREIGN KEY (CustomerId) REFERENCES CustomerName (CustomerId),
  CONSTRAINT FK_ServiceId FOREIGN KEY (ServiceId) REFERENCES RoomServices (ServiceId)
)

INSERT INTO CustomerName (CustomerId, LastName, Firstname)
values	(1, 'Lukyanchuk', 'Nastya'),
		(2, 'Savchuk', 'Lilia'),
		(3, 'Datsuk', 'Katya'),
		(4, 'Herasymchuk', 'Sophia'),
		(5, 'Lototska', 'Nadiya'),
		(6, 'Gnid', 'Oleh'),
		(7, 'Julia', 'Lemkiv'),
		(8, 'Shevchuk', 'Veronika'),
		(9, 'Kavaleridze', 'Valeria'),
		(10, 'Repa', 'Iryna')

INSERT INTO CustomerDetails (CustomerDetailsId, PhoneNumber, Email)
values	(1, 38066474523, 'Lukyanchuk-Nastya@mail.com'),
		(2, 38017514718, 'Savchuk-Lilia@mail.com'),
		(3, 38061751451, 'Datsuk-Katya@mail.com'),
		(4, 38071540512, 'Herasymchuk-Sophia@mail.com'),
		(5, 38008870205, 'Lototska-Nadiya@mail.com'),
		(6, 38054045058, 'Gnid-Oleh@mail.com'),
		(7, 38008228288, 'Julia-Lemkiv@mail.com'),
		(8, 38085850854, 'Shevchuk-Veronika@mail.com'),
		(9, 38041425585, 'Kavaleridze-Valeria@mail.com'),
		(10, 38087545057, 'Repa-Iryna@mail.com')

INSERT INTO RoomServices
(ServiceId, ServiceName, Breakfast, Lunch, Supper, Cleaning)
values	(1, 'Cleaning', null, null, null, 'Повна чистка кімнати'),
		(2, 'Сніданок', 'Чай, Яєчня з 2-х яєць', null, null, null),
		(3, 'Обід', null, 'Голубці зі сметаною, Суп з овочами', null, null),
		(4, 'Вечеря', null, null, 'Смажена картопля з часником, Огірки мариновані', null),
		(5, 'Все включено', 'Чай, Яєчня з 2-х яєць', 'Голубці зі сметаною, Суп з овочами', 'Смажена картопля з часником, Огірки мариновані', 'Повна чистка кімнати')

INSERT INTO Rooms (RoomId, RoomNumber, Category, Price)
values	(1, 101, 'Економ', 500),
		(2, 102, 'Економ', 550),
		(3, 103, 'Економ', 480),
		(4, 201, 'Стандарт', 1100),
		(5, 202, 'Стандарт', 1000),
		(6, 203, 'Стандарт', 1150),
		(7, 301, 'Люкс', 2100),
		(8, 302, 'Люкс', 2600)

INSERT INTO RoomDTable (CustomerId, RoomId)
values	(1, 1),
		(2, 3),
		(3, 2),
		(4, 4),
		(5, 5),
		(6, 8),
		(4, 7)

INSERT INTO DistributionTable (CustomerId, ServiceId)
values	(1, 1),
		(2, 3),
		(3, 2),
		(4, 4),
		(5, 5),
		(6, 2)



SELECT * FROM CustomerName
ORDER BY (LastName) desc

SELECT * FROM CustomerDetails

SELECT RoomNumber
FROM Rooms
ORDER BY RoomNumber desc

SELECT * FROM CustomerDetails

SELECT RoomId, COUNT(*)
FROM Rooms
WHERE Category like 'Ек%'
GROUP BY RoomId
HAVING COUNT(*)>= 1

SELECT Category, sum(Price) as Sum
FROM Rooms
GROUP BY Category


CREATE NONCLUSTERED INDEX Idx_Names
ON [Hotel].[dbo].[CustomerName] (Firstname, LastName)

CREATE NONCLUSTERED INDEX Idx_RoomNumber_Category_Price
ON [Hotel].[dbo].[Rooms] (RoomNumber, Category, Price)

CREATE NONCLUSTERED INDEX Idx_RoomDTable_Ids
ON [Hotel].[dbo].[RoomDTable] (CustomerId, RoomId)

CREATE NONCLUSTERED INDEX Idx_RoomDTable_RoomId
ON [Hotel].[dbo].[RoomDTable] (RoomId)

CREATE NONCLUSTERED INDEX Idx_RoomDTable_CustomerId
ON [Hotel].[dbo].[RoomDTable] (CustomerId)

SELECT *
FROM CustomerName c
JOIN CustomerDetails d
  ON c.CustomerId = d.CustomerDetailsId



  select * from CustomerDetails

  select * from rooms

  select * from RoomDTable

SELECT *
FROM CustomerName c
INNER JOIN CustomerDetails d
  ON c.CustomerId = d.CustomerDetailsId


SELECT *
FROM CustomerName c
INNER JOIN RoomDTable d
  ON c.CustomerId = d.CustomerId

SELECT *
FROM RoomDTable c
INNER JOIN Rooms d
  ON c.RoomId = d.RoomId


SELECT Firstname, LastName, RoomNumber, Category, Price
from CustomerName a
JOIN RoomDTable b ON a.CustomerId = b.CustomerId
RIGHT JOIN Rooms c ON b.RoomId = c.RoomId

SELECT *
FROM CustomerName c
LEFT JOIN RoomDTable d
  ON c.CustomerId = d.CustomerId

SELECT *
FROM CustomerName c
RIGHT JOIN RoomDTable d
  ON c.CustomerId = d.CustomerId