USE master 
GO
IF DB_ID('QLBI_Ques13_1_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques13_1_DDS
GO
CREATE DATABASE QLBI_Ques13_1_DDS
GO
USE QLBI_Ques13_1_DDS
GO

/*
	Check if table exists? Drop before creating : create: xóa bảng con trước --> xóa bảng cha
*/
IF OBJECT_ID(N'dbo.Fact_Table', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Fact_Table;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Vehicles_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Vehicles_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Postcode', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Postcode;
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
IF (OBJECT_ID('dbo.FK_Fact_Vehicles_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Vehicles_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Postcode', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Postcode
END
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END

CREATE TABLE Dim_Date (
    SKDate INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Year_ INT NOT NULL,
    Quarter_ INT NOT NULL,
    Month_ INT NOT NULL,
    Day_ DATE NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);
CREATE TABLE Dim_Vehicles_Type (
    SKVehicles_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Dim_Postcode (
    SKPostcode INTEGER PRIMARY KEY NOT NULL,
	city VARCHAR(512),
	county VARCHAR(512) NOT NULL,
	country_name VARCHAR(512) NOT NULL,
    region_name VARCHAR(512) NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKVehicles_Type INT NOT NULL,
    SKPostcode INT NOT NULL,
	SKDate INT NOT NULL,
    Number_Car_Accidents INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
);
ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Vehicles_Type
FOREIGN KEY (SKVehicles_Type) REFERENCES Dim_Vehicles_Type(SKVehicles_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Postcode
FOREIGN KEY (SKPostcode) REFERENCES Dim_Postcode(SKPostcode);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);