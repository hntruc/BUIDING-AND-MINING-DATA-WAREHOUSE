USE master 
GO
IF DB_ID('QLBI_10_3_DDS') IS NOT NULL
	DROP DATABASE QLBI_10_3_DDS
GO
CREATE DATABASE QLBI_10_3_DDS
GO
USE QLBI_10_3_DDS
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
IF OBJECT_ID(N'dbo.Dim_Pedestrian_Movement', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Pedestrian_Movement;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Pedestrian_Location', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Pedestrian_Location;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Home_Area_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Home_Area_Type;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Pedestrian_Movement', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Pedestrian_Movement
END

IF (OBJECT_ID('dbo.FK_Fact_Pedestrian_Location', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Pedestrian_Location
END
IF (OBJECT_ID('dbo.FK_Fact_Home_Area_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Home_Area_Type
END
/*
    Create table
*/
CREATE TABLE Dim_Pedestrian_Movement (
  SKPedestrian_Movement INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Pedestrian_Location (
  SKPedestrian_Location INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Home_Area_Type (
  SKHome_Area_Type INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);

CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKPedestrian_Movement INTEGER NOT NULL,
	SKPedestrian_Location INTEGER NOT NULL,
	SKHome_Area_Type INTEGER NOT NULL,
	number_of_casualties INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);


ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Pedestrian_Movement
FOREIGN KEY (SKPedestrian_Movement) REFERENCES Dim_Pedestrian_Movement(SKPedestrian_Movement);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Pedestrian_Location
FOREIGN KEY (SKPedestrian_Location) REFERENCES Dim_Pedestrian_Location(SKPedestrian_Location);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Home_Area_Type
FOREIGN KEY (SKHome_Area_Type) REFERENCES Dim_Home_Area_Type(SKHome_Area_Type);
