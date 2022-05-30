-- TẠO CSDL CHO DB Error
USE master 
GO
IF DB_ID('QLBI_Error') IS NOT NULL
	DROP DATABASE QLBI_Error
GO
CREATE DATABASE QLBI_Error
GO
USE QLBI_Error
GO

/*
    
*/
/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.Casualties2011_2014_Error', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Casualties2011_2014_Error;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Vehicles2011_2014_Error', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Vehicles2011_2014_Error;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Accidents2011_2014_Error', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Accidents2011_2014_Error;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.UK_Area_Information_Error', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.UK_Area_Information_Error;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Postcodes_Error', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Postcodes_Error;
	PRINT 'Delete Table Successfully';
END;


/* Create new no match table */
CREATE TABLE Postcodes_Error (
    SKPostcodes INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	postcode VARCHAR(512) NOT NULL,
	latitude VARCHAR(512) NOT NULL,
	longitude VARCHAR(512) NOT NULL,
	city VARCHAR(512),
	county VARCHAR(512),
	country_code VARCHAR(512),
	country_name VARCHAR(512),
	region_code VARCHAR(512),
	region_name VARCHAR(512),
	create_date VARCHAR(512),
	update_date VARCHAR(512),
	trangthai VARCHAR(512),
    [source_sys_code] int,
    Error_Code int,
    Error_Column int
);

CREATE TABLE UK_Area_Information_Error (
    SKUK_Area INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pcd7 VARCHAR(512) NOT NULL,
	pcd8 VARCHAR(512) NOT NULL,
	oa11cd VARCHAR(512),
	lsoa11cd VARCHAR(512),
	msoa11cd VARCHAR(512),
	ladcd VARCHAR(512),
	lsoa11nm VARCHAR(512),
	msoa11nm VARCHAR(512),
	ladnm VARCHAR(512),
	ladnmw VARCHAR(512),
	create_date VARCHAR(512),
	update_date VARCHAR(512),
	trangthai VARCHAR(512),
    [source_sys_code] int,
    Error_Code int,
    Error_Column int
);

CREATE TABLE Casualties2011_2014_Error (
    SKCasuality INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Accident_Index VARCHAR(512) NOT NULL,
	Vehicle_Reference INTEGER,
	Casualty_Reference INTEGER,
	Casualty_Class INTEGER,
	Sex_of_Casualty INTEGER,
	Age_of_Casualty INTEGER,
	Age_Band_of_Casualty INTEGER,
	Casualty_Severity INTEGER,
	Pedestrian_Location INTEGER,
	Pedestrian_Movement INTEGER,
	Car_Passenger INTEGER,
	Bus_or_Coach_Passenger INTEGER,
	Casualty_Type INTEGER,
	Casualty_Home_Area_Type INTEGER,
	create_date VARCHAR(512),
	update_date VARCHAR(512),
	trangthai VARCHAR(512),
    [source_sys_code] int,
    Error_Code int,
    Error_Column int
);

CREATE TABLE Vehicles2011_2014_Error (
    SKVehicle INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Accident_Index VARCHAR(512) NOT NULL,
	Vehicle_Reference INTEGER,
	Vehicle_Type INTEGER,
	Was_Vehicle_Left_Hand_Drive INTEGER,
	Journey_Purpose_of_Driver INTEGER,
	Sex_of_Driver INTEGER,
	Age_of_Driver INTEGER,
	Age_Band_of_Driver INTEGER,
	Driver_Home_Area_Type INTEGER,
	create_date VARCHAR(512),
	update_date VARCHAR(512),
	trangthai VARCHAR(512),
    [source_sys_code] int,
    Error_Code int,
    Error_Column int
);

CREATE TABLE Accidents2011_2014_Error (
    SKAccident INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Accident_Index VARCHAR(512) NOT NULL,
	Longitude VARCHAR(512),
	Latitude VARCHAR(512),
	Accident_Severity INTEGER,
	Number_of_Vehicles INTEGER,
	Number_of_Casualties INTEGER,
	Date_ DATE,
	Day_of_Week INTEGER,
	Time_ TIME,
	Local_Authority_District INTEGER,
	Local_Authority_Highway VARCHAR(512),
	Road_Type INTEGER,
	Speed_limit INTEGER,
	Light_Conditions INTEGER,
	Weather_Conditions INTEGER,
	Road_Surface_Conditions INTEGER,
	Urban_or_Rural_Area INTEGER,
	LSOA_of_Accident_Location VARCHAR(512),
	create_date VARCHAR(512),
	update_date VARCHAR(512),
	trangthai VARCHAR(512),
    [source_sys_code] int,
    Error_Code int,
    Error_Column int
);

-- CREATE TABLE Country_Error (
--     SKCountry INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
-- 	country_code VARCHAR(512),
-- 	country_name VARCHAR(512),
-- 	create_date DATETIME,
-- 	update_date DATETIME,
-- 	trangthai VARCHAR(512),
--     [source_sys_code] int,
--     Error_Code int,
--     Error_Column int
-- );

-- CREATE TABLE Region_Error (
--     SKRegion INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
-- 	region_code VARCHAR(512),
-- 	region_name VARCHAR(512),
-- 	create_date DATETIME,
-- 	update_date DATETIME,
-- 	trangthai VARCHAR(512),
--     [source_sys_code] int,
--     Error_Code int,
--     Error_Column int
-- );