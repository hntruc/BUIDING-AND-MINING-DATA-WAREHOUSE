USE QLBI_NDS
GO 

/* Các bảng trong codebook */
/*
	Check if table exists? Drop before creating : create
*/
/*Related to Vehicle*/
IF OBJECT_ID(N'dbo.Vehicle_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Vehicle_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Was_Vehicle_Left_Hand_Drive', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Was_Vehicle_Left_Hand_Drive;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Journey_Purpose_of_Driver', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Journey_Purpose_of_Driver;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Gender', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Gender;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Age_Band', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Age_Band;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Home_Area_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Home_Area_Type;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE Vehicle_Type (
  SKVehicle_Type INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Vehicle_Type;
INSERT INTO Vehicle_Type VALUES(1,'Pedal cycle');
INSERT INTO Vehicle_Type(Code,Description) VALUES (2,'Motorcycle 50cc and under');
INSERT INTO Vehicle_Type(Code,Description) VALUES (3,'Motorcycle 125cc and under');
INSERT INTO Vehicle_Type(Code,Description) VALUES (4,'Motorcycle over 125cc and up to 500cc');
INSERT INTO Vehicle_Type(Code,Description) VALUES (5,'Motorcycle over 500cc');
INSERT INTO Vehicle_Type(Code,Description) VALUES (8,'Taxi/Private hire car');
INSERT INTO Vehicle_Type(Code,Description) VALUES (9,'Car');
INSERT INTO Vehicle_Type(Code,Description) VALUES (10,'Minibus (8 - 16 passenger seats)');
INSERT INTO Vehicle_Type(Code,Description) VALUES (11,'Bus or coach (17 or more pass seats)');
INSERT INTO Vehicle_Type(Code,Description) VALUES (16,'Ridden horse');
INSERT INTO Vehicle_Type(Code,Description) VALUES (17,'Agricultural vehicle');
INSERT INTO Vehicle_Type(Code,Description) VALUES (18,'Tram');
INSERT INTO Vehicle_Type(Code,Description) VALUES (19,'Van / Goods 3.5 tonnes mgw or under');
INSERT INTO Vehicle_Type(Code,Description) VALUES (20,'Goods over 3.5t. and under 7.5t');
INSERT INTO Vehicle_Type(Code,Description) VALUES (21,'Goods 7.5 tonnes mgw and over');
INSERT INTO Vehicle_Type(Code,Description) VALUES (22,'Mobility scooter');
INSERT INTO Vehicle_Type(Code,Description) VALUES (23,'Electric motorcycle');
INSERT INTO Vehicle_Type(Code,Description) VALUES (90,'Other vehicle');
INSERT INTO Vehicle_Type(Code,Description) VALUES (97,'Motorcycle - unknown cc');
INSERT INTO Vehicle_Type(Code,Description) VALUES (98,'Goods vehicle - unknown weight');
INSERT INTO Vehicle_Type(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Was_Vehicle_Left_Hand_Drive (
  SKWas_Vehicle_Left_Hand_Drive INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Was_Vehicle_Left_Hand_Drive;
INSERT INTO Was_Vehicle_Left_Hand_Drive VALUES(1,'No');
INSERT INTO Was_Vehicle_Left_Hand_Drive VALUES(2,'Yes');
INSERT INTO Was_Vehicle_Left_Hand_Drive VALUES(-1,'Data missing or out of range');

CREATE TABLE Journey_Purpose_of_Driver (
  SKJourney_Purpose_of_Driver INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Journey_Purpose_of_Driver;
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (1,'Journey as part of work');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (2,'Commuting to/from work');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (3,'Taking pupil to/from school');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (4,'Pupil riding to/from school');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (5,'Other');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (6,'Not known');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (15,'Other/Not known (2005-10)');
INSERT INTO Journey_Purpose_of_Driver(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Gender (
  SKGender INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Gender;
INSERT INTO Gender(Code,Description) VALUES (1,'Male');
INSERT INTO Gender(Code,Description) VALUES (2,'Female');
INSERT INTO Gender(Code,Description) VALUES (3,'Not known');
INSERT INTO Gender(Code,Description) VALUES (-1,'Data missing or out of range');


CREATE TABLE Age_Band (
  SKAge_Band INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Age_Band;
INSERT INTO Age_Band(Code,Description) VALUES (1,'0 - 5');
INSERT INTO Age_Band(Code,Description) VALUES (2,'6 - 10');
INSERT INTO Age_Band(Code,Description) VALUES (3,'11 - 15');
INSERT INTO Age_Band(Code,Description) VALUES (4,'16 - 20');
INSERT INTO Age_Band(Code,Description) VALUES (5,'21 - 25');
INSERT INTO Age_Band(Code,Description) VALUES (6,'26 - 35');
INSERT INTO Age_Band(Code,Description) VALUES (7,'36 - 45');
INSERT INTO Age_Band(Code,Description) VALUES (8,'46 - 55');
INSERT INTO Age_Band(Code,Description) VALUES (9,'56 - 65');
INSERT INTO Age_Band(Code,Description) VALUES (10,'66 - 75');
INSERT INTO Age_Band(Code,Description) VALUES (11,'Over 75');
INSERT INTO Age_Band(Code,Description) VALUES (-1,'Data missing or out of range');

DROP TABLE Home_Area_Type
CREATE TABLE Home_Area_Type (
  SKHome_Area_Type INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Home_Area_Type;
INSERT INTO Home_Area_Type(Code,Description) VALUES (1,'Urban area');
INSERT INTO Home_Area_Type(Code,Description) VALUES (2,'Small town');
INSERT INTO Home_Area_Type(Code,Description) VALUES (3,'Rural');
INSERT INTO Home_Area_Type(Code,Description) VALUES (-1,'Data missing or out of range');

select * from Home_Area_Type

-- Tạo khóa ngoại 
IF (OBJECT_ID('dbo.FK_Vehicle_VehicleType', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Vehicle_VehicleType
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Vehicle_VehicleType
FOREIGN KEY (Vehicle_Type) REFERENCES Vehicle_Type(SKVehicle_Type);

IF (OBJECT_ID('dbo.FK_Vehicle_Left_Hand_Drive', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Vehicle_Left_Hand_Drive
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Vehicle_Left_Hand_Drive
FOREIGN KEY (Was_Vehicle_Left_Hand_Drive) REFERENCES Was_Vehicle_Left_Hand_Drive(SKWas_Vehicle_Left_Hand_Drive);

IF (OBJECT_ID('dbo.FK_Journey_Purpose_of_Driver_Vehicle', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Journey_Purpose_of_Driver_Vehicle
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Journey_Purpose_of_Driver_Vehicle
FOREIGN KEY (Journey_Purpose_of_Driver) REFERENCES Journey_Purpose_of_Driver(SKJourney_Purpose_of_Driver);

IF (OBJECT_ID('dbo.FK_Gender_Vehicle', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Gender_Vehicle
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Gender_Vehicle
FOREIGN KEY (Sex_of_Driver) REFERENCES Gender(SKGender);

IF (OBJECT_ID('dbo.FK_Age_Band_of_Driver_Vehicle', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Age_Band_of_Driver_Vehicle
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Age_Band_of_Driver_Vehicle
FOREIGN KEY (Age_Band_of_Driver) REFERENCES Age_Band(SKAge_Band);

IF (OBJECT_ID('dbo.FK_Home_Area_Type_Vehicle', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Home_Area_Type_Vehicle
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Home_Area_Type_Vehicle
FOREIGN KEY (Driver_Home_Area_Type) REFERENCES Home_Area_Type(SKHome_Area_Type);