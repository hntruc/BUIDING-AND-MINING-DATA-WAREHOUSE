-- TẠO CSDL DDS CHO ĐỒ ÁN THỰC HÀNH CHO PHÂN TÍCH: 1,2,3,6
USE master 
GO
IF DB_ID('QLBI_1236_DDS') IS NOT NULL
	DROP DATABASE QLBI_1236_DDS
GO
CREATE DATABASE QLBI_1236_DDS
GO
USE QLBI_1236_DDS
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
IF OBJECT_ID(N'dbo.Dim_Local_Authority_District', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Local_Authority_District;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Casualties', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualties;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Date', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Date;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Accident_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Date
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Local_Authority_District', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Local_Authority_District
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Accident_Severity
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Casualities', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Casualities
END
/*
    Create table
*/
CREATE TABLE Dim_Casualties (
    SKCasuality INTEGER PRIMARY KEY NOT NULL,
	Age_Group_Des VARCHAR(255) NOT NULL,
    Gender_Des VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Casualty_Type_Des VARCHAR(255) NOT NULL,
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

CREATE TABLE Dim_Accident_Severity (
    SKAccident_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Local_Authority_District (
    SKLocal_Authority_District INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Fact_Accidents (
    SKAccident INTEGER PRIMARY KEY NOT NULL,
	SKAccident_Severity INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
    SKLocal_Authority_District INTEGER NOT NULL,
    SKCasuality INTEGER NOT NULL,
    Number_of_Casualties INTEGER,
    Number_of_Vehicles INTEGER,
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
ADD CONSTRAINT FK_Fact_Accident_Local_Authority_District
FOREIGN KEY (SKLocal_Authority_District) REFERENCES Dim_Local_Authority_District(SKLocal_Authority_District);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT Fact_Accident_Casualities
FOREIGN KEY (SKCasuality) REFERENCES Dim_Casualties(SKCasuality);

------------------------ CREATE METADATA FOR FLOW DDS_1236
USE QLBI_METADATA;

INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('NDS_To_DDS1236','1900-01-01',NULL);

SELECT * FROM Metadata_Table