USE master 
GO
IF DB_ID('QLBI_Ques7_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques7_DDS
GO
CREATE DATABASE QLBI_Ques7_DDS
GO
USE QLBI_Ques7_DDS
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
IF OBJECT_ID(N'dbo.Dim_Journey_Purpose', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Journey_Purpose;
	PRINT 'Delete Table Successfully';
END;
/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Vehicles_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Vehicles_Type
END
IF (OBJECT_ID('dbo.FK_Fact_Journey_Purpose', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Journey_Purpose
END

CREATE TABLE Dim_Vehicles_Type (
    SKVehicles_Type INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Dim_Journey_Purpose (
    SKDim_Journey_Purpose_Des INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL
);
CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKVehicles_Type INT NOT NULL,
    SKDim_Journey_Purpose_Des INT NOT NULL,
    Number_of_Accidents INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
);
ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Vehicles_Type
FOREIGN KEY (SKVehicles_Type) REFERENCES Dim_Vehicles_Type(SKVehicles_Type);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Journey_Purpose
FOREIGN KEY (SKDim_Journey_Purpose_Des) REFERENCES Dim_Journey_Purpose(SKDim_Journey_Purpose_Des);