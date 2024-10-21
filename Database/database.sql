USE [master]
GO

--Drop database if exists--
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'school_bus')
BEGIN
	ALTER DATABASE [school_bus] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [school_bus] SET ONLINE;
	DROP DATABASE [school_bus];
END
GO

CREATE DATABASE [school_bus];
GO 

USE [school_bus];
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
CREATE TABLE [buses] (
	[bus_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[bus_name] NVARCHAR(255) NOT NULL,
	[bus_status] NVARCHAR(255), --xe đang dừng hay đang đi 
)
GO

CREATE TABLE [users] (
	[user_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[user_name] NVARCHAR(255) NOT NULL,
	[email] NVARCHAR(255) CHECK(Email LIKE '%@gmail.com') NOT NULL,
	[password] NVARCHAR(255) NOT NULL,
	[phone_number] VARCHAR(11) UNIQUE CHECK([phone_number] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' 
		OR [phone_number] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	[location] NVARCHAR(255), --địa chỉ nhà
	[gender] nvarchar(255),
	[birthday] date,
	[role] NVARCHAR(255) NOT NULL,
	[bus_id] INT, --nếu user là tài xế hay người quản lí xe thì họ thuộc xe nào, nếu là phụ huynh hay admin thì NULL
	FOREIGN KEY ([bus_id]) REFERENCES [buses]([bus_id]),
)
GO

CREATE TABLE [students] (
	[student_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[student_name] NVARCHAR(255) NOT NULL,
	[gender] NVARCHAR(255),
	[birthday] DATE,
	[student_status] NVARCHAR(255), --đã lên xe/đã xuống xe/không sử dụng xe tuyến
	[parent_id] INT, --ID cua phu huynh
	FOREIGN KEY ([parent_id]) REFERENCES [users]([user_id]),
)
GO

CREATE TABLE [bus_status] ( --bảng cho biết xe có tình trạng, sự cố gì
	[status_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[describe] NVARCHAR(255),
	[bus_id] INT,
	FOREIGN KEY ([bus_id]) REFERENCES [buses]([bus_id]),
)
GO

CREATE TABLE [travel_history] ( 
	[history_id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[pick_up_point] NVARCHAR(255), --điểm đón học sinh
	[drop_off_point] NVARCHAR(255), --điểm trả học sinh
	[boarding_time] NVARCHAR(255), --giờ lên xe
    [alighting_time] NVARCHAR(255), --giờ xuống xe 
	[student_id] INT,
	FOREIGN KEY ([student_id]) REFERENCES [students]([student_id]),
	[bus_id] INT,
	FOREIGN KEY ([bus_id]) REFERENCES [buses]([bus_id]),
)
GO



