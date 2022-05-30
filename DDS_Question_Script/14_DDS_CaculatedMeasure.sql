USE master 
GO
IF DB_ID('QLBI_CalculatedMeasure_DDS') IS NOT NULL
	DROP DATABASE QLBI_CalculatedMeasure_DDS
GO
CREATE DATABASE QLBI_CalculatedMeasure_DDS
GO
USE QLBI_CalculatedMeasure_DDS
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
IF OBJECT_ID(N'dbo.Dim_Casualty_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualty_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Home_Area_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Home_Area_Type;
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
IF (OBJECT_ID('dbo.FK_Fact_Casualty_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Casualty_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Home_Area_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Home_Area_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END


/*
    Create table
*/

CREATE TABLE Dim_Casualty_Type (
  SKCasualty_Type INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Home_Area_Type (
  SKHome_Area_Type INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
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
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKHome_Area_Type INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
	SKCasualty_Type INTEGER NOT NULL,
	number_of_casualties INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Casualty_Type
FOREIGN KEY (SKCasualty_Type) REFERENCES Dim_Casualty_Type(SKCasualty_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Home_Area_Type
FOREIGN KEY (SKHome_Area_Type) REFERENCES Dim_Home_Area_Type(SKHome_Area_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

USE QLBI_METADATA
select *from Metadata_Table
update Metadata_Table set lset='1/1/1900',cet=null where id=20
Insert into Metadata_Table values('NDS_DDS_CalculatedMeasure','1/1/1900',null);