USE QLBI_NDS
GO 

/* Các bảng trong codebook */
/*
	Check if table exists? Drop before creating : create
*/
/*Related to Casualities*/
IF OBJECT_ID(N'dbo.Casualty_Class', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Casualty_Class;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Casualty_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Casualty_Severity;
	PRINT 'Delete Table Successfully';
END;

IF OBJECT_ID(N'dbo.Pedestrian_Location', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Pedestrian_Location;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Pedestrian_Movement', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Pedestrian_Movement;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Car_Passenger', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Car_Passenger;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Bus_or_Coach_Passenger', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Bus_or_Coach_Passenger;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Casualty_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Casualty_Type;
	PRINT 'Delete Table Successfully';
END;


/* Create new table */
CREATE TABLE Casualty_Class (
  SKCasualty_Class INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Casualty_Class;
INSERT INTO Casualty_Class VALUES(1,'Driver or rider');
INSERT INTO Casualty_Class(Code,Description) VALUES (2,'Passenger');
INSERT INTO Casualty_Class(Code,Description) VALUES (3,'Pedestrian');

CREATE TABLE Casualty_Severity (
  SKCasualty_Severity INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Casualty_Severity;
INSERT INTO Casualty_Severity VALUES(1,'Fatal');
INSERT INTO Casualty_Severity(Code,Description) VALUES (2,'Serious');
INSERT INTO Casualty_Severity(Code,Description) VALUES (3,'Slight');


CREATE TABLE Pedestrian_Location (
  SKPedestrian_Location INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Pedestrian_Location;
INSERT INTO Pedestrian_Location(Code,Description) VALUES (0,'Not a Pedestrian');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (1,'Crossing on pedestrian crossing facility');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (2,'Crossing in zig-zag approach lines');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (3,'Crossing in zig-zag exit lines');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (4,'Crossing elsewhere within 50m. of pedestrian crossing');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (5,'In carriageway, crossing elsewhere');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (6,'On footway or verge');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (7,'On refuge, central island or central reservation');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (8,'In centre of carriageway - not on refuge, island or central reservation');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (9,'In carriageway, not crossing');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (10,'Unknown or other');
INSERT INTO Pedestrian_Location(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Pedestrian_Movement (
  SKPedestrian_Movement INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Pedestrian_Movement;
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (0,'Not a Pedestrian');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (1,'Crossing from driver''s nearside');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (2,'Crossing from nearside - masked by parked or stationary vehicle');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (3,'Crossing from driver''s offside');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (4,'Crossing from offside - masked by  parked or stationary vehicle');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (5,'In carriageway, stationary - not crossing  (standing or playing)');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (6,'In carriageway, stationary - not crossing  (standing or playing) - masked by parked or stationary vehicle');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (7,'Walking along in carriageway, facing traffic');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (8,'Walking along in carriageway, back to traffic');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (9,'Unknown or other');
INSERT INTO Pedestrian_Movement(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Car_Passenger (
  SKCar_Passenger INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Car_Passenger;
INSERT INTO Car_Passenger(Code,Description) VALUES (0,'Not car passenger');
INSERT INTO Car_Passenger(Code,Description) VALUES (1,'Front seat passenger');
INSERT INTO Car_Passenger(Code,Description) VALUES (2,'Rear seat passenger');
INSERT INTO Car_Passenger(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Bus_or_Coach_Passenger (
  SKBus_or_Coach_Passenger INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Bus_or_Coach_Passenger;
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (0,'Not a bus or coach passenger');
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (1,'Boarding');
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (2,'Alighting');
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (3,'Standing passenger');
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (4,'Seated passenger');
INSERT INTO Bus_or_Coach_Passenger(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Casualty_Type (
  SKCasualty_Type INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Casualty_Type;
INSERT INTO Casualty_Type(Code,Description) VALUES (0,'Pedestrian');
INSERT INTO Casualty_Type(Code,Description) VALUES (1,'Cyclist');
INSERT INTO Casualty_Type(Code,Description) VALUES (2,'Motorcycle 50cc and under rider or passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (3,'Motorcycle 125cc and under rider or passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (4,'Motorcycle over 125cc and up to 500cc rider or  passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (5,'Motorcycle over 500cc rider or passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (8,'Taxi/Private hire car occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (9,'Car occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (10,'Minibus (8 - 16 passenger seats) occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (11,'Bus or coach occupant (17 or more pass seats)');
INSERT INTO Casualty_Type(Code,Description) VALUES (16,'Horse rider');
INSERT INTO Casualty_Type(Code,Description) VALUES (17,'Agricultural vehicle occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (18,'Tram occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (19,'Van / Goods vehicle (3.5 tonnes mgw or under) occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (20,'Goods vehicle (over 3.5t. and under 7.5t.) occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (21,'Goods vehicle (7.5 tonnes mgw and over) occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (22,'Mobility scooter rider');
INSERT INTO Casualty_Type(Code,Description) VALUES (23,'Electric motorcycle rider or passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (90,'Other vehicle occupant');
INSERT INTO Casualty_Type(Code,Description) VALUES (97,'Motorcycle - unknown cc rider or passenger');
INSERT INTO Casualty_Type(Code,Description) VALUES (98,'Goods vehicle (unknown weight) occupant');


/* Foreign key */
IF (OBJECT_ID('dbo.FK_Gender_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Gender_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Gender_Casualty
FOREIGN KEY (Sex_of_Casualty) REFERENCES Gender(SKGender);

IF (OBJECT_ID('dbo.FK_Age_Band_of_Driver_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Age_Band_of_Driver_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Age_Band_of_Driver_Casualty
FOREIGN KEY (Age_Band_of_Casualty) REFERENCES Age_Band(SKAge_Band);

IF (OBJECT_ID('dbo.FK_Home_Area_Type_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Home_Area_Type_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Home_Area_Type_Casualty
FOREIGN KEY (Casualty_Home_Area_Type) REFERENCES Home_Area_Type(SKHome_Area_Type);

IF (OBJECT_ID('dbo.FK_Casualty_Type_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casualty_Type_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casualty_Type_Casualty
FOREIGN KEY (Casualty_Type) REFERENCES Casualty_Type(SKCasualty_Type);

IF (OBJECT_ID('dbo.FK_Bus_or_Coach_Passenger_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Bus_or_Coach_Passenger_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Bus_or_Coach_Passenger_Casualty
FOREIGN KEY (Bus_or_Coach_Passenger) REFERENCES Bus_or_Coach_Passenger(SKBus_or_Coach_Passenger);

IF (OBJECT_ID('dbo.FK_Car_Passenger_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Car_Passenger_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Car_Passenger_Casualty
FOREIGN KEY (Car_Passenger) REFERENCES Car_Passenger(SKCar_Passenger);

IF (OBJECT_ID('dbo.FK_Pedestrian_Movement_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Pedestrian_Movement_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Pedestrian_Movement_Casualty
FOREIGN KEY (Pedestrian_Movement) REFERENCES Pedestrian_Movement(SKPedestrian_Movement);

IF (OBJECT_ID('dbo.FK_Pedestrian_Location_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Pedestrian_Location_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Pedestrian_Location_Casualty
FOREIGN KEY (Pedestrian_Location) REFERENCES Pedestrian_Location(SKPedestrian_Location);

IF (OBJECT_ID('dbo.FK_Casualty_Severity_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casualty_Severity_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casualty_Severity_Casualty
FOREIGN KEY (Casualty_Severity) REFERENCES Casualty_Severity(SKCasualty_Severity);

IF (OBJECT_ID('dbo.FK_Casualty_Class_Casualty', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casualty_Class_Casualty
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casualty_Class_Casualty
FOREIGN KEY (Casualty_Class) REFERENCES Casualty_Class(SKCasualty_Class);