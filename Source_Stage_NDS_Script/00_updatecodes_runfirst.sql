-- B1. TẠO CSDL CHO DB NGUỒN CHO CÁC FILE SOURCE CSV VÀ TỪ THỜI ĐIỂM NÀY TA SẼ LÀM TRÊN SOURCE DB NÀY
USE master 
GO
IF DB_ID('QLBI_SOURCE') IS NOT NULL
	DROP DATABASE QLBI_SOURCE
GO
CREATE DATABASE QLBI_SOURCE
GO
USE QLBI_SOURCE
GO

DROP TABLE Accidents2011_2014 IF EXISTS Accidents2011_2014;
DROP TABLE Casualties2011_2014 IF EXISTS Casualties2011_2014;
DROP TABLE Vehicles2011_2014 IF EXISTS Vehicles2011_2014;

/* B3. Tạo và thêm dữ liệu vào bằng cách chọn csdl QLBI_SOURCE --> Task --> Import flat file tương ứng --> đặt tên new table cho từng source
tương ứng vs các tên ở dưới đây --> next cho tới bước cuối cùng --> in process ---> done (tick màu xanh lá) là coi như đã thành công
Xem thêm : https://www.sqlshack.com/importing-and-working-with-csv-files-in-sql-server/
*/ 
-- B4. Thêm vào các bảng 2 cột: createdate vs updatedate VÀ trạng thái
--ALTER TABLE Postcodes
--ADD createdate DATETIME;

--ALTER TABLE Postcodes
--ADD updatedate DATETIME;

--ALTER TABLE Postcodes
--ADD TrangThai BIT;

--ALTER TABLE UK_Area_Information
--ADD createdate DATETIME;

--ALTER TABLE UK_Area_Information
--ADD updatedate DATETIME;

--ALTER TABLE UK_Area_Information
--ADD TrangThai VARCHAR(512);


ALTER TABLE Casualties2011_2014
ADD createdate DATETIME;

ALTER TABLE Casualties2011_2014
ADD updatedate DATETIME;

ALTER TABLE Casualties2011_2014
ADD TrangThai VARCHAR(512);


ALTER TABLE Vehicles2011_2014
ADD createdate DATETIME;

ALTER TABLE Vehicles2011_2014
ADD updatedate DATETIME;

ALTER TABLE Vehicles2011_2014
ADD TrangThai VARCHAR(512);

ALTER TABLE Accidents2011_2014
ADD createdate DATETIME;

ALTER TABLE Accidents2011_2014
ADD updatedate DATETIME;

ALTER TABLE Accidents2011_2014
ADD TrangThai VARCHAR(512);


--UPDATE Postcodes
--SET TrangThai = 0;

UPDATE Accidents2011_2014
SET TrangThai = 'False';
UPDATE Accidents2011_2014 SET createdate = GETDATE();
UPDATE Accidents2011_2014 SET updatedate = NULL;

UPDATE Vehicles2011_2014
SET TrangThai = 'False';
UPDATE Vehicles2011_2014 SET createdate = GETDATE();
UPDATE Vehicles2011_2014 SET updatedate = NULL;

UPDATE Casualties2011_2014
SET TrangThai = 'False';
UPDATE Casualties2011_2014 SET createdate = GETDATE();
UPDATE Casualties2011_2014 SET updatedate = NULL;

--UPDATE UK_Area_Information
--SET TrangThai = 'False';


--USE QLBI_STAGE;
--GO
--ALTER TABLE UK_Area_Information_Stage
--ADD TrangThai VARCHAR(512);

-- B6. Format lại giá trị cho cột Date của Accidents2011_2014 do nếu sử dụng tính năng của SQL thì cột Date mặc định ban đầu là varchar
UPDATE dbo.Accidents2011_2014
SET Date = CONVERT(date,dbo.Accidents2011_2014.Date,104);
/*
SELECT Date
FROM dbo.Accidents2011_2014;
*/
--- B7. Thay đổi data type của dbo.Accidents2011_2014 từ varchar thành date
ALTER TABLE dbo.Accidents2011_2014
ALTER COLUMN Date date;

----- B8. DELETE COLUMNS
--- FOR VEHICLES
SELECT * FROM Vehicles2011_2014_Stage;
ALTER TABLE Vehicles2011_2014
DROP COLUMN Towing_and_Articulation;

ALTER TABLE Vehicles2011_2014
DROP COLUMN Vehicle_Manoeuvre;

ALTER TABLE Vehicles2011_2014
DROP COLUMN Vehicle_Location_Restricted_Lane

ALTER TABLE Vehicles2011_2014
DROP COLUMN Junction_Location

ALTER TABLE Vehicles2011_2014
DROP COLUMN Skidding_and_Overturning

ALTER TABLE Vehicles2011_2014
DROP COLUMN Hit_Object_in_Carriageway

ALTER TABLE Vehicles2011_2014
DROP COLUMN Hit_Object_off_Carriageway

ALTER TABLE Vehicles2011_2014
DROP COLUMN Vehicle_Leaving_Carriageway

ALTER TABLE Vehicles2011_2014
DROP COLUMN _1st_Point_of_Impact

ALTER TABLE Vehicles2011_2014
DROP COLUMN Engine_Capacity_CC

ALTER TABLE Vehicles2011_2014
DROP COLUMN Propulsion_Code

ALTER TABLE Vehicles2011_2014
DROP COLUMN Driver_IMD_Decile

ALTER TABLE Vehicles2011_2014
DROP COLUMN Age_of_Vehicle

-- FOR ACCIDENTS
select count(*) from Accidents2011_2014;
ALTER TABLE Accidents2011_2014
DROP COLUMN Location_Easting_OSGR;

ALTER TABLE Accidents2011_2014
DROP COLUMN Location_Northing_OSGR;

ALTER TABLE Accidents2011_2014
DROP COLUMN Police_Force;

ALTER TABLE Accidents2011_2014
DROP COLUMN _1st_Road_Class

ALTER TABLE Accidents2011_2014
DROP COLUMN _1st_Road_Number

ALTER TABLE Accidents2011_2014
DROP COLUMN Junction_Detail

ALTER TABLE Accidents2011_2014
DROP COLUMN Junction_Control

ALTER TABLE Accidents2011_2014
DROP COLUMN _2nd_Road_Class

ALTER TABLE Accidents2011_2014
DROP COLUMN _2nd_Road_Number

ALTER TABLE Accidents2011_2014
DROP COLUMN Pedestrian_Crossing_Human_Control;

ALTER TABLE Accidents2011_2014
DROP COLUMN Pedestrian_Crossing_Physical_Facilities

ALTER TABLE Accidents2011_2014
DROP COLUMN Special_Conditions_at_Site

ALTER TABLE Accidents2011_2014
DROP COLUMN Carriageway_Hazards

ALTER TABLE Accidents2011_2014
DROP COLUMN Did_Police_Officer_Attend_Scene_of_Accident

ALTER TABLE Accidents2011_2014
DROP COLUMN Did_Police_Officer_Attend_Scene_of_Accident

-- FOR CASUALTIES
ALTER TABLE Casualties2011_2014
DROP COLUMN Pedestrian_Road_Maintenance_Worker