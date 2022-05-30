USE master 
GO
IF DB_ID('QLBI_13_DDS') IS NOT NULL
	DROP DATABASE QLBI_13_DDS
GO
CREATE DATABASE QLBI_13_DDS
GO
USE QLBI_13_DDS
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
------------------- DIM----------------
IF OBJECT_ID(N'dbo.Dim_Postcode', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Postcode;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Local_Authority_Highway', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Local_Authority_Highway;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Local_Authority_District', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Local_Authority_District;
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
IF (OBJECT_ID('dbo.FK_Fact_Accident_Postcode', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Postcode
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Local_Authority_Highway', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Local_Authority_Highway
END
IF (OBJECT_ID('dbo.FK_Fact_Local_Authority_District', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Local_Authority_District
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Accident_Date
END


/*
    Create table
*/
CREATE TABLE Dim_Postcode (
    SKPostcodes INTEGER PRIMARY KEY NOT NULL,
	city VARCHAR(512),
	county VARCHAR(512),
	country_name VARCHAR(512),
	region_name VARCHAR(512),
	create_date DATETIME,
	update_date DATETIME,
);
CREATE TABLE Dim_Local_Authority_District (
  SKLocal_Authority_District INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Local_Authority_Highway (
  SKLocal_Authority_Highway INTEGER PRIMARY KEY NOT NULL,
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


CREATE TABLE Fact_Accidents (
    SKAccident INTEGER PRIMARY KEY NOT NULL,
	SKPostcodes INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
	SKLocal_Authority_District INTEGER NOT NULL,
	SKLocal_Authority_Highway INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Postcode
FOREIGN KEY (SKPostcodes) REFERENCES Dim_Postcode(SKPostcodes);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Local_Authority_District
FOREIGN KEY (SKLocal_Authority_District) REFERENCES Dim_Local_Authority_District(SKLocal_Authority_District);


ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Local_Authority_Highway
FOREIGN KEY (SKLocal_Authority_Highway) REFERENCES Dim_Local_Authority_Highway(SKLocal_Authority_Highway);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Accident_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

------------------------ CREATE METADATA FOR FLOW DDS_1236
USE QLBI_METADATA;

INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('NDS_To_DDS13','1900-01-01',NULL);

SELECT * FROM Metadata_Table