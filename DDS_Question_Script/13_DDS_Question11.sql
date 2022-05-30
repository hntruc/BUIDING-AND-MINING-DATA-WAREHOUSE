USE QLBI_METADATA
insert into Metadata_Table values ('NDS_DDS_Question11','1/1/1900',null);
USE master 
GO
IF DB_ID('QLBI_11_DDS') IS NOT NULL
	DROP DATABASE QLBI_11_DDS
GO
CREATE DATABASE QLBI_11_DDS
GO
USE QLBI_11_DDS
GO

/*
	Check if table exists? Drop before creating : create
*/

IF OBJECT_ID(N'dbo.Variance', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Variance;
	PRINT 'Delete Table Successfully';
END;
------------------- DIM----------------

IF OBJECT_ID(N'dbo.Dim_Date', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Date;
	PRINT 'Delete Table Successfully';
END;

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Variance_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Variance DROP CONSTRAINT FK_Fact_Date
END

/*
    Create table
*/

CREATE TABLE Dim_Date (
    SKDate INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Year_ INT NOT NULL,
    Quarter_ INT NOT NULL,
    Month_ INT NOT NULL,
    Day_ DATE NOT NULL,
	create_date DATETIME,
	update_date DATETIME,
);
CREATE TABLE Variance (
    SKVariance INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
	SKDate INTEGER NOT NULL,
	Number_of_Car_Accidents INTEGER NOT NULL,
	create_date DATETIME,
	update_date DATETIME
);
ALTER TABLE Variance
ADD CONSTRAINT FK_Fact_Variance_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);
