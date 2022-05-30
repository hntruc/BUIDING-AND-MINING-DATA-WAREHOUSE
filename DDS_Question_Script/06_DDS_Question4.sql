USE master 
GO
IF DB_ID('QLBI_Ques4_DDS') IS NOT NULL
	DROP DATABASE QLBI_Ques4_DDS
GO
CREATE DATABASE QLBI_Ques4_DDS
GO
USE QLBI_Ques4_DDS
GO

--- Xóa bảng con trước r mới tới bảng cha
IF OBJECT_ID(N'dbo.Fact_Table', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Fact_Table;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Date', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Date;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Dim_Time_Of_Day', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Dim_Time_Of_Day;
	PRINT 'Delete Table Successfully';
END;

CREATE TABLE Fact_Table (
    SKFact INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
    SKAccident_Severity INT NOT NULL,
    SKDate INT NOT NULL ,
    SKTime_Of_Day INT NOT NULL,
    Number_of_Accidents INTEGER DEFAULT 0,
	create_date DATETIME,
	update_date DATETIME
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

CREATE TABLE Dim_Accident_Severity ( -- Age group khác age band :)
    SKAccident_Severity INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

CREATE TABLE Dim_Time_Of_Day ( -- Age group khác age band :)
    SKTime_Of_Day INTEGER PRIMARY KEY NOT NULL,
    Description VARCHAR(255) NOT NULL,
);

/*
    Check whether the foreign key exists?delete:create new one
*/
IF (OBJECT_ID('dbo.FK_Fact_Date', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Date
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Accident_Severity
END
IF (OBJECT_ID('dbo.FK_Fact_Accident_Time_Of_Day', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Fact_Table DROP CONSTRAINT FK_Fact_Accident_Time_Of_Day
END

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Date
FOREIGN KEY (SKDate) REFERENCES Dim_Date(SKDate);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Accident_Time_Of_Day
FOREIGN KEY (SKTime_Of_Day) REFERENCES Dim_Time_Of_Day(SKTime_Of_Day);

ALTER TABLE Fact_Table
ADD CONSTRAINT FK_Fact_Accident_Severity
FOREIGN KEY (SKAccident_Severity) REFERENCES Dim_Accident_Severity(SKAccident_Severity);

INSERT INTO Dim_Time_Of_Day VALUES(1,'Morning: 5am - 12pm');
INSERT INTO Dim_Time_Of_Day VALUES(2,'Afternoon: 12pm - 5pm');
INSERT INTO Dim_Time_Of_Day VALUES(3,'Evening: 5pm - 9pm');
INSERT INTO Dim_Time_Of_Day VALUES(4,'Midnight: 9pm - 5am');