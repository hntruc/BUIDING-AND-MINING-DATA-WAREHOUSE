USE master 
GO
IF DB_ID('QLBI_10_2_DDS') IS NOT NULL
	DROP DATABASE QLBI_10_2_DDS
GO
CREATE DATABASE QLBI_10_2_DDS
GO
USE QLBI_10_2_DDS
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
IF OBJECT_ID(N'dbo.Dim_Light_Condition', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Light_Condition;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Weather_Conditions', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Weather_Conditions;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Road_Surface_Conditions', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Road_Surface_Conditions;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Light_Condition', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Light_Condition
END

IF (OBJECT_ID('dbo.FK_Fact_Weather_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Weather_Conditions
END
IF (OBJECT_ID('dbo.FK_Fact_Road_Surface_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Road_Surface_Conditions
END
/*
    Create table
*/
CREATE TABLE Dim_Road_Surface_Conditions (
  SKRoad_Surface_Conditions INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Light_Condition (
  SKLight_Condition INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Weather_Conditions (
  SKWeather_Condition INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);

CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKRoad_Surface_Conditions INTEGER NOT NULL,
	SKLight_Condition INTEGER NOT NULL,
	SKWeather_Condition INTEGER NOT NULL,
	number_of_accidents INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);


ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Light_Condition
FOREIGN KEY (SKLight_Condition) REFERENCES Dim_Light_Condition(SKLight_Condition);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Weather_Conditions
FOREIGN KEY (SKWeather_Condition) REFERENCES Dim_Weather_Conditions(SKWeather_Condition);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Road_Surface_Conditions
FOREIGN KEY (SKRoad_Surface_Conditions) REFERENCES Dim_Road_Surface_Conditions(SKRoad_Surface_Conditions);
