USE master 
GO
IF DB_ID('QLBI_10_DDS') IS NOT NULL
	DROP DATABASE QLBI_10_DDS
GO
CREATE DATABASE QLBI_10_DDS
GO
USE QLBI_10_DDS
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
IF OBJECT_ID(N'dbo.Dim_Light_Condition', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Light_Condition;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Vehicles', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Vehicles;
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

IF OBJECT_ID(N'dbo.Dim_Casualties', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Casualties;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Light_Condition', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Light_Condition
END
IF (OBJECT_ID('dbo.FK_Fact_Vehicles', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Vehicles
END
IF (OBJECT_ID('dbo.FK_Fact_Weather_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Weather_Conditions
END
IF (OBJECT_ID('dbo.FK_Fact_Road_Surface_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Road_Surface_Conditions
END
IF (OBJECT_ID('dbo.FK_Fact_Casualties', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Accidents DROP CONSTRAINT FK_Fact_Casualties
END


/*
    Create table
*/
CREATE TABLE Dim_Vehicles (
    SKVehicle INTEGER PRIMARY KEY NOT NULL,
	Gender_Des VARCHAR(512)NOT NULL,
	Age_Band_Des VARCHAR(512)NOT NULL,
	Was_Vehicle_Left_Hand_Drive_Des VARCHAR(512) NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);
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
CREATE TABLE Dim_Casualties (
    SKCasuality INTEGER PRIMARY KEY NOT NULL,
	Pedestrian_Location_Des VARCHAR(255) NOT NULL,
	Pedestrian_Movement_Des VARCHAR(255) NOT NULL,
	Home_Area_Type_Des VARCHAR(255) NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);
CREATE TABLE Fact_Accidents (
    SKAccident INTEGER PRIMARY KEY NOT NULL,
	SKVehicle INTEGER NOT NULL,
	SKCasuality INTEGER NOT NULL,
	SKLight_Condition INTEGER NOT NULL,
	SKWeather_Condition INTEGER NOT NULL,
	SKRoad_Surface_Conditions INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);


ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Light_Condition
FOREIGN KEY (SKLight_Condition) REFERENCES Dim_Light_Condition(SKLight_Condition);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Vehicles
FOREIGN KEY (SKVehicle) REFERENCES Dim_Vehicles(SKVehicle);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Weather_Conditions
FOREIGN KEY (SKWeather_Condition) REFERENCES Dim_Weather_Conditions(SKWeather_Condition);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Road_Surface_Conditions
FOREIGN KEY (SKRoad_Surface_Conditions) REFERENCES Dim_Road_Surface_Conditions(SKRoad_Surface_Conditions);

ALTER TABLE Fact_Accidents
ADD CONSTRAINT FK_Fact_Casualties
FOREIGN KEY (SKCasuality) REFERENCES Dim_Casualties(SKCasuality);

------------------------ CREATE METADATA FOR FLOW DDS_1236
USE QLBI_METADATA;

INSERT INTO Metadata_Table(Name_DataFlow,LSET,CET) VALUES ('NDS_To_DDS10','1900-01-01',NULL);

SELECT * FROM Metadata_Table