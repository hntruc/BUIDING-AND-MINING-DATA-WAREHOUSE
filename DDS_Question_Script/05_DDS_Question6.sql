USE master 
GO
IF DB_ID('QLBI_Ques6_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques6_DDS
GO
CREATE DATABASE QLBI_Ques6_DDS
GO
USE QLBI_Ques6_DDS
GO

--- Xóa bảng con trước r mới tới bảng cha
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
IF OBJECT_ID(N'dbo.Dim_Age_Group', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Age_Group;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Casualties_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualties_Severity;
	PRINT 'Delete Table Successfully';
END;

CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKCasualty_Severity INT NOT NULL,
    SKCasualty_Type INT NOT NULL,
    SKDate INT NOT NULL,
    SKAge_Group INTEGER NOT NULL,
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

CREATE TABLE Dim_Age_Group ( -- Age group khác age band :)
    SKAge_Group INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Casualty_Type (
    SKCasualty_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Casualties_Severity (
    SKCasualty_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END
IF (OBJECT_ID('dbo.FK_Age_Group', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Age_Group
END
IF (OBJECT_ID('dbo.FK_Casualty_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Casualty_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Casualties_Severity_DDS6', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Casualties_Severity_DDS6
END


ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Age_Group
FOREIGN KEY (SKAge_Group) REFERENCES Dim_Age_Group(SKAge_Group);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Casualty_Type
FOREIGN KEY (SKCasualty_Type) REFERENCES Dim_Casualty_Type(SKCasualty_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Casualties_Severity_DDS6
FOREIGN KEY (SKCasualty_Severity) REFERENCES Dim_Casualties_Severity(SKCasualty_Severity);

DELETE FROM Dim_Age_Group

INSERT INTO Dim_Age_Group VALUES(1, 'Children: 0 - 15');
INSERT INTO Dim_Age_Group VALUES(2, 'Young adult: 15 - 17');
INSERT INTO Dim_Age_Group VALUES(3, 'Adult: 15 - 59');
INSERT INTO Dim_Age_Group VALUES(4, '60 and over: 60 - ...');

SELECT * FROM Dim_Age_Group

