-- TẠO CSDL DDS CHO ĐỒ ÁN THỰC HÀNH CHO PHÂN TÍCH: 4,5,7
USE master 
GO
IF DB_ID('QLBI_457_DDS') IS NOT NULL
	DROP DATABASE QLBI_457_DDS
GO
CREATE DATABASE QLBI_457_DDS
GO
USE QLBI_457_DDS
GO

/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.Fact_Accidents', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Fact_Accidents;
	PRINT 'Delete Table Successfully';
END;

------------- Dim -------------------
IF OBJECT_ID(N'dbo.Dim_Time', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Time;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Vehicles', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Vehicles;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Date', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Date;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Urban_Or_Rural_Area', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Urban_Or_Rural_Area;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Road_Type', N'U') IS NOT NULL 
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Road_Type;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Accident_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Date
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Road_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Road_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Accident_Severity
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Time', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Time
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Urban_Or_Rural_Area', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Urban_Or_Rural_Area
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Vehicles', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Vehicles
END
/*
    Create table
*/
CREATE TABLE Dim_Vehicles (
    SKVehicle INTEGER PRIMARY KEY NOT NULL,
	Vehicle_Type_Des VARCHAR(255) NOT NULL,
    Journey_Purpose_Or_Driver_Des_Des VARCHAR(255) NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);

CREATE TABLE Dim_Date (
    SKDate INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Year_ INT NOT NULL,
    Quarter_ INT NOT NULL,
    Month_ INT NOT NULL,
    Day_ DATE NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);

CREATE TABLE Dim_Time (
    SKTime INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Time TIME NOT NULL,
    Time_Of_Day VARCHAR(255) NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);

CREATE TABLE Dim_Accident_Severity (
    SKAccident_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Urban_Or_Rural_Area (
    SKUrban_Or_Rural_Area INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Road_Type (
    SKRoad_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Fact_Accidents (
    SKAccident INTEGER PRIMARY KEY NOT NULL,
	SKAccident_Severity INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
    SKTime INTEGER NOT NULL,
    SKVehicle INTEGER NOT NULL,
    SKUrban_Or_Rural_Area INTEGER NOT NULL,
    SKRoad_Type INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Accident_Severity
FOREIGN KEY (SKAccident_Severity) REFERENCES Dim_Accident_Severity(SKAccident_Severity);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Time
FOREIGN KEY (SKTime) REFERENCES Dim_Time(SKTime);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Road_Type
FOREIGN KEY (SKRoad_Type) REFERENCES Dim_Road_Type(SKRoad_Type);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Vehicles
FOREIGN KEY (SKVehicle) REFERENCES Dim_Vehicles(SKVehicle);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Urban_Or_Rural_Area
FOREIGN KEY (SKUrban_Or_Rural_Area) REFERENCES Dim_Urban_Or_Rural_Area(SKUrban_Or_Rural_Area);

------------------------ CREATE METADATA FOR FLOW DDS_1236
USE QLBI_METADATA;

INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('NDS_To_DDS457','1900-01-01',NULL);

SELECT * FROM Metadata_Table

DROP TABLE IF EXISTS Fact_NumberofAccidents 
CREATE TABLE Fact_NumberofAccidents (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKAccident_Severity INTEGER NOT NULL,
	SKDate VARCHAR(255) NOT NULL,
    SKTime VARCHAR(255) NOT NULL,
	Number_Of_Accident INT DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
);
SELECT * FROM  Fact_NumberofAccidents
DELETE FROM Fact_NumberofAccidents
CREATE TABLE Dim_TestTime (
    SKTime INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	--- description: morning, evening, afternooon, night
	Description VARCHAR(255) NOT NULL
);

SELECT SUM(Number_of_Accident)
FROM Fact_NumberofAccidents
WHERE SKAccident_Severity = 2 and SKDate = 1; -- ra 17

--SELECT COUNT(*)
--FROM Accidents2011_2014_NDS 
--WHERE Date_ = '2011-01-01' AND Accident_Severity = 2 ==> ra 17