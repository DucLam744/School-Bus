﻿USE [master]
GO

--Drop database if exists--
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'School_Bus')
BEGIN
	ALTER DATABASE [School_Bus] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [School_Bus] SET ONLINE;
	DROP DATABASE [School_Bus];
END
GO

CREATE DATABASE [School_Bus];
GO 

USE [School_Bus];
GO

--Drop constraints--
DECLARE @sql NVARCHAR(MAX)
SET @sql = N'';

SELECT @sql = @sql + N' ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
	+ N'.' + QUOTENAME(KCU1.TABLE_NAME) + N' DROP CONSTRAINT ' 
	+ QUOTENAME(RC.CONSTRAINT_NAME) + ';' + CHAR(13) + CHAR(10)
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG 
AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 
AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA

EXECUTE(@sql)

GO

--Drop tables--
DECLARE @sql2 NVARCHAR(MAX)
SET @sql2 =	N'';

SELECT @sql2 += N' DROP TABLE ' + QUOTENAME(TABLE_SCHEMA) + '.'
	+ QUOTENAME(TABLE_NAME) + ';'
FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'

EXEC Sp_executesql @sql2

GO

--Create tables--
CREATE TABLE [Buses] (
	[busId] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[busName] NVARCHAR(255) NOT NULL,
	[busStatus] NVARCHAR(255), --xe đang dừng hay đang đi 
)
GO

CREATE TABLE [Users] (
	[userId] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[userName] NVARCHAR(255) NOT NULL,
	[email] NVARCHAR(255) CHECK(Email LIKE '%@gmail.com') NOT NULL,
	[password] NVARCHAR(255) NOT NULL,
	[phoneNumber] VARCHAR(11) UNIQUE CHECK([phoneNumber] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
		OR [phoneNumber] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[location] NVARCHAR(255), --địa chỉ nhà
	[gender] nvarchar(255),
	[birthday] date,
	[role] NVARCHAR(255) NOT NULL,
	[busId] INT NOT NULL, --nếu user là tài xế hay người quản lí xe thì họ thuộc xe nào, nếu là phụ huynh hay admin thì NULL
	FOREIGN KEY ([busId]) REFERENCES [Buses]([busId]),
)
GO

CREATE TABLE [Students] (
	[studentId] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[studentName] NVARCHAR(255) NOT NULL,
	[gender] NVARCHAR(255),
	[birthday] DATE,
	[studentStatus] NVARCHAR(255), --đã lên xe/đã xuống xe/không sử dụng xe tuyến
	[userId] INT NOT NULL, --ID cua phu huynh
	FOREIGN KEY ([userId]) REFERENCES [Users]([userId]),
)
GO

CREATE TABLE [BusStatus] ( --bảng cho biết xe có tình trạng, sự cố gì
	[statusId] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[describe] NVARCHAR(255),
	[busId] INT NOT NULL,
	FOREIGN KEY ([busId]) REFERENCES [Buses]([busId]),
)
GO

CREATE TABLE [TravelHistory] ( 
	[historyId] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[pickUpPoint] NVARCHAR(255), --điểm đón học sinh
	[dropOffPoint] NVARCHAR(255), --điểm trả học sinh
	[BoardingTime] NVARCHAR(255), --giờ lên xe
    [AlightingTime] NVARCHAR(255), --giờ xuống xe 
	[studentId] INT NOT NULL,
	FOREIGN KEY ([studentId]) REFERENCES [Students]([studentId]),
	[busId] INT NOT NULL,
	FOREIGN KEY ([busId]) REFERENCES [Buses]([busId]),
)
GO



