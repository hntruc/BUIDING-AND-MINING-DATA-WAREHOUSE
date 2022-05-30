-- TẠO CSDL CHO DB NDS
USE master 
GO
IF DB_ID('QLBI_NDS') IS NOT NULL
	DROP DATABASE QLBI_NDS
GO
CREATE DATABASE QLBI_NDS
GO
USE QLBI_NDS
GO

/*
    THIS IS NDS TABLE WHERE ACCIDENT_INDEX OF EACH TABLE NOT LIKE (not include) '%E+%';
*/
/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.Casualties2011_2014_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Casualties2011_2014_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Vehicles2011_2014_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Vehicles2011_2014_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Accidents2011_2014_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Accidents2011_2014_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.UK_Area_Information_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.UK_Area_Information_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Postcodes_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Postcodes_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Country_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Country_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Region_NDS', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Region_NDS;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.TrangThaiXoa', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.TrangThaiXoa;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.TrangThai', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.TrangThai;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE TrangThaiXoa (
  SKMaTrangThai INTEGER PRIMARY KEY NOT NULL,
  TenTrangThai VARCHAR(255),
  MoTaTrangThai VARCHAR(255),
  [NgayTao] [datetime],
  [NgayCapNhat] [datetime]
);

INSERT INTO TrangThaiXoa VALUES(1,'False','The record has not been soft-deleted',GETDATE(),GETDATE());
INSERT INTO TrangThaiXoa VALUES(2,'True','The record has been soft-deleted',GETDATE(),GETDATE());

IF OBJECT_ID(N'dbo.NguonDuLieu', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.NguonDuLieu;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE NguonDuLieu (
  SKMaNguon INTEGER PRIMARY KEY NOT NULL,
  TenNguon VARCHAR(255),
  [NgayTao] [datetime],
  [NgayCapNhat] [datetime]
);

TRUNCATE TABLE NguonDuLieu;

INSERT INTO NguonDuLieu VALUES(1,'kaggle.com',GETDATE(),GETDATE());
INSERT INTO NguonDuLieu VALUES(2,'geoportal.statistics.gov.uk',GETDATE(),GETDATE());
INSERT INTO NguonDuLieu VALUES(3,'academe/UK-Postcodes',GETDATE(),GETDATE());

SELECT * FROM NguonDuLieu;

/* Create new table */
DROP TABLE Postcodes_NDS
CREATE TABLE Postcodes_NDS (
    SKPostcodes INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	postcode VARCHAR(512) NOT NULL, -- Natural Key
	latitude VARCHAR(512) NOT NULL,
	longitude VARCHAR(512) NOT NULL,
	city VARCHAR(512),
	county VARCHAR(512),
	create_date DATETIME,
	update_date DATETIME,
	country INT NOT NULL,
	region INT NOT NULL,
	[status_code] int,
    [source_sys_code] int
);

CREATE TABLE Country_NDS (
    SKCountry INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	country_code VARCHAR(512),
	country_name VARCHAR(512),
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int
);

CREATE TABLE Region_NDS (
    SKRegion INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	region_code VARCHAR(512),
	region_name VARCHAR(512),
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int
);

CREATE TABLE UK_Area_Information_NDS (
    SKUK_Area INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	pcd8 VARCHAR(512) NOT NULL, -- Natural Key
	oa11cd VARCHAR(512),
	lsoa11cd VARCHAR(512),
	msoa11cd VARCHAR(512),
	ladcd VARCHAR(512),
	lsoa11nm VARCHAR(512),
	msoa11nm VARCHAR(512),
	ladnm VARCHAR(512),
	ladnmw VARCHAR(512),
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int,
    postcode_ref INT
);

CREATE TABLE Casualties2011_2014_NDS (
    SKCasuality INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Casualty_Reference INTEGER, -- Natural Key
	Casualty_Class INTEGER, -- Natural Key
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
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int,
    VehicleRef_AccidentInd_Ref int -- -- Natural Key/ref for both values of Accident_Index and Vehicle_Reference in Vehicles table
);

CREATE TABLE Vehicles2011_2014_NDS (
    SKVehicle INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Vehicle_Reference INTEGER, -- Natural Key
	Vehicle_Type INTEGER,
	Was_Vehicle_Left_Hand_Drive INTEGER,
	Journey_Purpose_of_Driver INTEGER,
	Sex_of_Driver INTEGER,
	Age_of_Driver INTEGER,
	Age_Band_of_Driver INTEGER,
	Driver_Home_Area_Type INTEGER,
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int,
    Accident_Index VARCHAR(512) NOT NULL, -- Natural Key
    Accident_Index_Ref INT
);

CREATE TABLE Accidents2011_2014_NDS (
    SKAccident INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Accident_Index VARCHAR(512) NOT NULL, -- Natural Key
	Longitude VARCHAR(512),
	Latitude VARCHAR(512),
	Accident_Severity INTEGER,
	Number_of_Vehicles INTEGER,
	Number_of_Casualties INTEGER,
	Date_ DATE,
	Day_of_Week INTEGER,
	Time_ TIME,
	Local_Authority_District INTEGER,
	Local_Authority_Highway INTEGER,
	Road_Type INTEGER,
	Speed_limit INTEGER,
	Light_Conditions INTEGER,
	Weather_Conditions INTEGER,
	Road_Surface_Conditions INTEGER,
	Urban_or_Rural_Area INTEGER,
	create_date DATETIME,
	update_date DATETIME,
	[status_code] int,
    [source_sys_code] int,
    LSOA_of_Accident_Location INT DEFAULT NULL
);
--USE QLBI_NDS;
--ALTER TABLE Accidents2011_2014_NDS
--ALTER COLUMN Local_Authority_Highway INTEGER;
---- Tao khoa ngoai cho cac bang
IF (OBJECT_ID('dbo.FK_Postcodes_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Postcodes_NDS  DROP CONSTRAINT FK_Postcodes_TrangThai
END
ALTER TABLE Postcodes_NDS 
ADD CONSTRAINT FK_Postcodes_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Postcodes_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Postcodes_NDS  DROP CONSTRAINT FK_Postcodes_Nguondl
END
ALTER TABLE Postcodes_NDS 
ADD CONSTRAINT FK_Postcodes_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);

-----------------------------------------------------------------------
IF (OBJECT_ID('dbo.FK_UKArea_Postcodes', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.UK_Area_Information_NDS DROP CONSTRAINT FK_UKArea_Postcodes
END
ALTER TABLE UK_Area_Information_NDS
ADD CONSTRAINT FK_UKArea_Postcodes
FOREIGN KEY (postcode_ref) REFERENCES Postcodes_NDS(SKPostcodes);

IF (OBJECT_ID('dbo.FK_UKArea_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.UK_Area_Information_NDS DROP CONSTRAINT FK_UKArea_TrangThai
END
ALTER TABLE UK_Area_Information_NDS
ADD CONSTRAINT FK_UKArea_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_UKArea_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.UK_Area_Information_NDS DROP CONSTRAINT FK_UKArea_Nguondl
END
ALTER TABLE UK_Area_Information_NDS
ADD CONSTRAINT FK_UKArea_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);

------------------------------------------------


IF (OBJECT_ID('dbo.FK_Accident_UK_Area_Information_NDS', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_UK_Area_Information_NDS
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_UK_Area_Information_NDS
FOREIGN KEY (LSOA_of_Accident_Location) REFERENCES UK_Area_Information_NDS(SKUK_Area);

IF (OBJECT_ID('dbo.FK_Accident_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_TrangThai
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Accident_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Nguondl
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);


---------------------------------------------------

IF (OBJECT_ID('dbo.FK_Vehicles_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Vehicles_TrangThai
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Vehicles_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Vehicles_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Vehicles_Nguondl
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Vehicles_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);


IF (OBJECT_ID('dbo.FK_Vehicles_Accidents', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Vehicles2011_2014_NDS DROP CONSTRAINT FK_Vehicles_Accidents
END
ALTER TABLE Vehicles2011_2014_NDS
ADD CONSTRAINT FK_Vehicles_Accidents
FOREIGN KEY (Accident_Index_Ref) REFERENCES Accidents2011_2014_NDS(SKAccident);
-----------------------------------------------------
IF (OBJECT_ID('dbo.FK_Casualties_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casualties_TrangThai
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casualties_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Casualities_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casualities_Nguondl
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casualities_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);

IF (OBJECT_ID('dbo.FK_Casuality_Vehicles', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Casualties2011_2014_NDS DROP CONSTRAINT FK_Casuality_Vehicles
END
ALTER TABLE Casualties2011_2014_NDS
ADD CONSTRAINT FK_Casuality_Vehicles
FOREIGN KEY (VehicleRef_AccidentInd_Ref) REFERENCES Vehicles2011_2014_NDS(SKVehicle);

---- flow cua casuality: them cot nguon 
--> so sánh cả 2 giá trị Vehicle_Reference vs Accident_Index với Vehicle_Reference vs Accident_Index_Ref của Vehicles
--> but Accident_Index_Ref thay = 1 con số --> viết script task để lấy ra được Accident_Index của Accident tương ứng Accident_Index_Ref của Vehicles = cách join 2 bảng vs nhau

------------------------- Country
IF (OBJECT_ID('dbo.FK_Country_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Country_NDS DROP CONSTRAINT FK_Country_TrangThai
END
ALTER TABLE dbo.Country_NDS
ADD CONSTRAINT FK_Country_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Country_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Country_NDS DROP CONSTRAINT FK_Country_Nguondl
END
ALTER TABLE dbo.Country_NDS
ADD CONSTRAINT FK_Country_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);

IF (OBJECT_ID('dbo.FK_Postcode_Country', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Postcodes_NDS DROP CONSTRAINT FK_Postcode_Country
END
ALTER TABLE dbo.Postcodes_NDS
ADD CONSTRAINT FK_Postcode_Country
FOREIGN KEY (country) REFERENCES Country_NDS(SKCountry);
------------------------------ Region 

IF (OBJECT_ID('dbo.FK_Postcode_Region', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Postcodes_NDS DROP CONSTRAINT FK_Postcode_Region
END
ALTER TABLE dbo.Postcodes_NDS
ADD CONSTRAINT FK_Postcode_Region
FOREIGN KEY (region) REFERENCES Region_NDS(SKRegion);

IF (OBJECT_ID('dbo.FK_Region_TrangThai', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Region_NDS DROP CONSTRAINT FK_Region_TrangThai
END
ALTER TABLE dbo.Region_NDS
ADD CONSTRAINT FK_Region_TrangThai
FOREIGN KEY (status_code) REFERENCES TrangThaiXoa(SKMaTrangThai);

IF (OBJECT_ID('dbo.FK_Region_Nguondl', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Region_NDS DROP CONSTRAINT FK_Region_Nguondl
END
ALTER TABLE dbo.Region_NDS
ADD CONSTRAINT FK_Region_Nguondl
FOREIGN KEY (source_sys_code) REFERENCES NguonDuLieu(SKMaNguon);

--DELETE FROM UK_Area_Information_NDS
--DELETE FROM Accidents2011_2014_NDS
--DELETE FROM Vehicles2011_2014_NDS
--DELETE FROM Casualties2011_2014_NDS


--SELECT country_code, country_name
--FROM Postcodes_Stage