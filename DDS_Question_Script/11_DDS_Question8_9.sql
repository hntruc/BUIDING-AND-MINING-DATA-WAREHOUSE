USE master 
GO
IF DB_ID('QLBI_8_9_DDS') IS NOT NULL
	DROP DATABASE QLBI_8_9_DDS
GO
CREATE DATABASE QLBI_8_9_DDS
GO
USE QLBI_8_9_DDS
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
IF OBJECT_ID(N'dbo.Dim_Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_BuiltUp_Road', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_BuiltUp_Road;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Vehicle_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Vehicle_Type;
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
IF (OBJECT_ID('dbo.FK_Fact_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Accident_Severity
END
IF (OBJECT_ID('dbo.FK_Fact_BuiltUp_Road', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_BuiltUp_Road
END
IF (OBJECT_ID('dbo.FK_Fact_Vehicle_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Vehicle_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END


/*
    Create table
*/

CREATE TABLE Dim_Accident_Severity (
  SKAccident_Severity INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_BuiltUp_Road (
  SKBuiltUp_Road INTEGER PRIMARY KEY NOT NULL,
  Description VARCHAR(255)
);
CREATE TABLE Dim_Vehicle_Type (
  SKVehicle_Type INTEGER PRIMARY KEY NOT NULL,
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
	SKVehicle_Type INTEGER NOT NULL,
	SKDate INTEGER NOT NULL,
	SKBuiltUp_Road INTEGER NOT NULL,
	SKAccident_Severity INTEGER NOT NULL,
	number_of_accidents INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Accident_Severity
FOREIGN KEY (SKAccident_Severity) REFERENCES Dim_Accident_Severity(SKAccident_Severity);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_BuiltUp_Road
FOREIGN KEY (SKBuiltUp_Road) REFERENCES Dim_BuiltUp_Road(SKBuiltUp_Road);


ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Vehicle_Type
FOREIGN KEY (SKVehicle_Type) REFERENCES Dim_Vehicle_Type(SKVehicle_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);
insert into Dim_BuiltUp_Road values (1,'Below 50'),(2,'Above 50');