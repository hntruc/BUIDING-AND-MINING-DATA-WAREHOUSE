USE master 
GO
IF DB_ID('QLBI_Ques3_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques3_DDS
GO
CREATE DATABASE QLBI_Ques3_DDS
GO
USE QLBI_Ques3_DDS
GO

/*
	Check if table exists? Drop before creating : create
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
IF OBJECT_ID(N'dbo.Dim_Casualty_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualty_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Age_Band', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Age_Band;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Gender', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Gender;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Casualties_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualties_Severity;
	PRINT 'Delete Table Successfully';
END;
/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END
IF (OBJECT_ID('dbo.FK_Gender', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Gender
END
IF (OBJECT_ID('dbo.FK_Age_Band', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Age_Band
END
IF (OBJECT_ID('dbo.FK_Casualty_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Casualty_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Casualties_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Casualties_Severity
END

CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKCasualty_Type INT NOT NULL,
    SKDate INT NOT NULL,
    SKGender INTEGER NOT NULL,
    SKAge_Band INTEGER NOT NULL,
	SKCasualty_Severity INT NOT NULL,
    Number_of_Casualties INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
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

CREATE TABLE Dim_Age_Band (
    SKAge_Band INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Casualties_Severity (
    SKCasualty_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Gender (
    SKGender INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Casualty_Type (
    SKCasualty_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Casualties_Severity
FOREIGN KEY (SKCasualty_Severity) REFERENCES Dim_Casualties_Severity(SKCasualty_Severity);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Gender
FOREIGN KEY (SKGender) REFERENCES Dim_Gender(SKGender);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Age_Band
FOREIGN KEY (SKAge_Band) REFERENCES Dim_Age_Band(SKAge_Band);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Casualty_Type
FOREIGN KEY (SKCasualty_Type) REFERENCES Dim_Casualty_Type(SKCasualty_Type);