USE master 
GO
IF DB_ID('QLBI_10_1_DDS') IS NOT NULL
	DROP DATABASE QLBI_10_1_DDS
GO
CREATE DATABASE QLBI_10_1_DDS
GO
USE QLBI_10_1_DDS
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
------------------- DIM----------------

IF OBJECT_ID(N'dbo.Dim_Age_Band', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Age_Band;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Was_Vehicle_Left_Hand_Drive', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Was_Vehicle_Left_Hand_Drive;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Gender', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Gender;
	PRINT 'Delete Table Successfully';
END;
/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Age_Band', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Age_Band
END
IF (OBJECT_ID('dbo.FK_Fact_Was_Vehicle_Left_Hand_Drive', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Was_Vehicle_Left_Hand_Drive
END
IF (OBJECT_ID('dbo.FK_Fact_Gender', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Gender
END

/*
    Create table
*/
CREATE TABLE Dim_Age_Band (
  SKAge_Band INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Was_Vehicle_Left_Hand_Drive (
  SKWas_Vehicle_Left_Hand_Drive INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Gender (
  SKGender INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKGender INTEGER NOT NULL,
	SKAge_Band INTEGER NOT NULL,
	SKWas_Vehicle_Left_Hand_Drive INTEGER NOT NULL,
	number_of_drivers INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Age_Band
FOREIGN KEY (SKAge_Band) REFERENCES Dim_Age_Band(SKAge_Band);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Was_Vehicle_Left_Hand_Drive
FOREIGN KEY (SKWas_Vehicle_Left_Hand_Drive) REFERENCES Dim_Was_Vehicle_Left_Hand_Drive(SKWas_Vehicle_Left_Hand_Drive);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Gender
FOREIGN KEY (SKGender) REFERENCES Dim_Gender(SKGender);
