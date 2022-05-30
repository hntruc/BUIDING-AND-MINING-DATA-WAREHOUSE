USE master 
GO
IF DB_ID('QLBI_Ques5_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques5_DDS
GO
CREATE DATABASE QLBI_Ques5_DDS
GO
USE QLBI_Ques5_DDS
GO

/*
	Check if table exists? Drop before creating : create: xóa bảng con trước --> xóa bảng cha
*/
IF OBJECT_ID(N'dbo.Fact_Table', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Fact_Table;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Date', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Date;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Road_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Road_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Urban_Or_Rural_Area', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Urban_Or_Rural_Area;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END
IF (OBJECT_ID('dbo.FK_Fact_Road_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Road_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Accident_Severity
END
IF (OBJECT_ID('dbo.FK_Fact_Urban_Or_Rural_Area', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Urban_Or_Rural_Area
END


CREATE TABLE Dim_Date (
    SKDate INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Year_ INT NOT NULL,
    Quarter_ INT NOT NULL,
    Month_ INT NOT NULL,
    Day_ DATE NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);
CREATE TABLE Dim_Accident_Severity (
    SKAccident_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Dim_Road_Type (
    SKRoad_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Dim_Urban_Or_Rural_Area (
    SKUrban_Or_Rural_Area INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKAccident_Severity INT NOT NULL,
    SKDate INT NOT NULL,
    SKUrban_Or_Rural_Area INTEGER NOT NULL,
	SKRoad_Type INTEGER NOT NULL,
    Number_of_Accidents INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
);
ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Accident_Severity
FOREIGN KEY (SKAccident_Severity) REFERENCES Dim_Accident_Severity(SKAccident_Severity);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Road_Type
FOREIGN KEY (SKRoad_Type) REFERENCES Dim_Road_Type(SKRoad_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Urban_Or_Rural_Area
FOREIGN KEY (SKUrban_Or_Rural_Area) REFERENCES Dim_Urban_Or_Rural_Area(SKUrban_Or_Rural_Area);