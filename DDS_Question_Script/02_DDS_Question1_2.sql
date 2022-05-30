USE master 
GO
IF DB_ID('QLBI_Ques1_2_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques1_2_DDS
GO
CREATE DATABASE QLBI_Ques1_2_DDS
GO
USE QLBI_Ques1_2_DDS
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
IF OBJECT_ID(N'dbo.Dim_Local_Authority_District', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Local_Authority_District;
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
IF (OBJECT_ID('dbo.FK_Fact_LA_District', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_LA_District
END
IF (OBJECT_ID('dbo.FK_Fact_Casualties_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Casualties_Severity
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
CREATE TABLE Dim_Casualties_Severity (
    SKCasualty_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);

CREATE TABLE Dim_Local_Authority_District (
    SKLocal_Authority_District INTEGER PRIMARY KEY NOT NULL,
	Code VARCHAR(512) NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKCasualty_Severity INT NOT NULL,
    SKDate INT NOT NULL,
    SKLocal_Authority_District INTEGER NOT NULL,
    Number_of_Casualities INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
);
ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Casualties_Severity
FOREIGN KEY (SKCasualty_Severity) REFERENCES Dim_Casualties_Severity(SKCasualty_Severity);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_LA_District
FOREIGN KEY (SKLocal_Authority_District) REFERENCES Dim_Local_Authority_District(SKLocal_Authority_District);