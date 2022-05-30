use QLBI_STAGE
go

-- truncate table Postcodes_Stage;
select count(*) from Postcodes_Stage;
select count(*) from UK_Area_Information_Stage;
select * from Accidents2011_2014_Stage;
SELECT * FROM Casualties2011_2014_Stage

use QLBI_METADATA
GO

SELECT * FROM Metadata_Table

UPDATE Metadata_Table
SET CET = NULL
WHERE Name_DataFlow = 'Postcodes';

--UPDATE Metadata_Table
--SET CET = CAST(GETDATE() AS VARCHAR)
--WHERE Name_DataFlow = 'Postcodes';

UPDATE Metadata_Table
SET LSET = '1900-01-01'
WHERE Name_DataFlow = 'Postcodes';

SELECT LSET, CET 
FROM Metadata_Table
WHERE Name_DataFlow = 'Postcodes';

use QLBI_SOURCE
GO

SELECT * FROM Postcodes

--- Đếm các trường LSOA là null
SELECT COUNT(*) FROM Accidents2011_2014
WHERE LSOA_of_Accident_Location IS NULL;

SELECT *
FROM Accidents2011_2014
WHERE Accident_Index = '2.01E+12';
JOIN UK_Area_Information
ON lsoa11cd = LSOA_of_Accident_Location

SELECT LSOA_of_Accident_Location, Accidents2011_2014.*
FROM Accidents2011_2014 WHERE LSOA_of_Accident_Location = 'E01023667'

SELECT TOP 5 *
FROM UK_Area_Information
WHERE lsoa11cd = 'E01023667';

select b.*
from Postcodes as a
JOIN Accidents2011_2014 as b
ON a.latitude = b.Latitude
AND a.longitude = b.Longitude
WHERE LSOA_of_Accident_Location = 'E01023667';



SELECT * FROM UK_Area_Information
WHERE pcd7 LIKE '%CO1%';
SELECT * FROM Postcodes where postcode = 'CO1';
SELECT DISTINCT b.*, a.Casualty_Class, a.Casualty_Severity 
FROM Vehicles2011_2014 as b
INNER JOIN Casualties2011_2014 as a
ON a.Vehicle_Reference = b.Vehicle_Reference 
AND a.Accident_Index = b.Accident_Index
WHERE a.Vehicle_Reference = 1 AND a.Accident_Index = '201101BS70005';
SELECT * FROM Vehicles2011_2014 WHERE Accident_Index = '2.01E+12';
--SELECT * FROM Accidents2011_2014 as a WHERE Accident_Index IS NULL
SELECT COUNT(*) FROM Accidents2011_2014;
SELECT * FROM Accidents2011_2014 -- as a WHERE Accident_Index = '2.01E+12';
JOIN UK_Area_Information
ON ladcd = Local_Authority_Highway -- nếu LSOA_of_Accident_Location thì có thể tìm địa điểm thông qua ldacd, nhưng cũng k để làm gì nhiều ngoại trừ biết được lsoa11nm, msoa11nm, ladnm
WHERE LSOA_of_Accident_Location IS NULL AND Local_Authority_Highway LIKE '%E0%';

SELECT * FROM Casualties2011_2014 as a WHERE a.Vehicle_Reference = 2 AND a.Accident_Index = '201101BS70005';
SELECT * FROM UK_Area_Information
WHERE ladcd  = 'E06000056';

--- nếu LSOA_of_Accident_Location is null / có giá trị thì sau khi so LSOA_of_Accident_Location xong vs lsoa của uk_area so tiếp giá trị Local_Authority_Highway có khớp vs giá trị nào của cột ladcd của bảng uk_area không 
---> thỏa đk khớp cả 2 --> insert vào nds, không thì dòng dl này sẽ bị đẩy ra bảng nomatch
-- LSOA_of_Accident_Location (FK) là khóa ngoại, ref tới lsoa của bảng UK
-- flow của vehicles: tìm xem có dòng nào tồn tại cặp (accident_index, vehicle_ref) trong vehicles_nds không, nếu có thì tiếp tục xem xem accident_index có tồn tại trong accidents không, nếu có thì lấy skaccident đưa qua cái trường khóa ngoại

SELECT COUNT(*) FROM Accidents2011_2014
WHERE LSOA_of_Accident_Location IS NULL;

DELETE Postcodes WHERE postcode = 'S18127022';

INSERT INTO Postcodes(postcode,latitude,longitude,city,county,country_code,country_name,region_code,region_name,createdate)
VALUES('S18127022','test','test','test','test','test','test','test','test','2021-10-23 09:42:39.040');

--'2021-10-23 09:41:39.040','2021-10-23 09:46:42.833'

USE QLBI_TEMP;


SELECT * FROM Postcodes_Temp
SELECT * FROM UK_Area_Information_Temp
SELECT * FROM Vehicles2011_2014_Temp
SELECT * FROM Casualties2011_2014_Temp
SELECT * FROM Accidents2011_2014_Temp


SELECT * FROM Postcodes_Temp
WHERE (create_date >= CAST( '1900-01-01' AS VARCHAR)
AND create_date < CAST(getdate() AS VARCHAR) )
 OR (update_date >= CAST( '1900-01-01' AS VARCHAR) AND update_date < CAST(getdate() AS VARCHAR)) AND trangthai = 'FALSE'

USE QLBI_STAGE;

SELECT COUNT(*) FROM Postcodes_Stage
SELECT * FROM Postcodes_Stage ORDER BY postcode

TRUNCATE TABLE Postcodes_Temp
TRUNCATE TABLE Accidents2011_2014_Temp


SELECT GETDATE();

USE QLBI_SOURCE
GO

WITH metadata1 AS (
	SELECT *,SUBSTRING(pcd8,0,CHARINDEX(' ',pcd8)) as pstcode
	FROM UK_Area_Information
	WHERE pcd8 LIKE '%AL4%'
)
SELECT DISTINCT pstcode,ladnm,lsoa11cd,lsoa11nm,ladnm,msoa11nm -- bo distinct se co gia tri nhieu trung, bo du lieu > 1000 row, co distinct: 29 row
FROM metadata1
-- WHERE lsoa11cd = 'E01023584' AND pstcode = 'AL4' -- co distinct: 1 row, k co distinct: 4 row cung 1 ket qua
-- WHERE lsoa11cd IS NULL
-- GROUP BY pstcode,ladnm,lsoa11cd,lsoa11nm,ladnm,msoa11nm

SELECT * FROM Postcodes WHERE postcode = 'AL4'

SELECT * FROM Postcodes
S70

SELECT LSOA_of_Accident_Location, Accident_Index FROM Accidents2011_2014
JOIN UK_Area_Information
ON LSOA_of_Accident_Location  = lsoa11cd
WHERE LSOA_of_Accident_Location = 'W01001395'
GROUP BY LSOA_of_Accident_Location, Accident_Index

DROP TABLE IF EXISTS Vehicles2011_2014_Test;
CREATE TABLE Vehicles2011_2014_Test (
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
	trangthai VARCHAR(512)
);

TRUNCATE TABLE Vehicles2011_2014_Test;
DROP TABLE IF EXISTS Vehicles2011_2014_Test;
SELECT * INTO Vehicles2011_2014_Test
FROM Vehicles2011_2014
WHERE Accident_Index NOT LIKE '%E+%';

SELECT * FROM Vehicles2011_2014_Test WHERE Accident_Index LIKE '%E+%';

USE QLBI_NDS
GO

DELETE FROM Postcodes_NDS;
SELECT SKMaTrangThai, TenTrangThai
FROM TrangThaiXoa;

DELETE FROM UK_Area_Information_NDS
SELECT * FROM UK_Area_Information_NDS
WHERE lsoa11cd = 'E01023584';

SELECT pcd8
FROM UK_Area_Information_NDS

SELECT SKPostcodes, postcode FROM Postcodes_NDS
/*
UPDATE Postcodes_NDS
SET update_date = GETDATE(),latitude=?, longitude = ?, city = ? , county = ?, country_code = ? , country_name = ?, region_code = ?, region_name = ? , status_code = ?
WHERE source_sys_code = ? AND postcode = ?
*/
UPDATE UK_Area_Information_NDS
SET update_date = GETDATE(), oa11cd = ? , lsoa11cd = ? , msoa11cd = ? , ladcd = ?, lsoa11nm = ?, msoa11nm = ? , ladnm = ? , ladnmw = ?, status_code = ? , postcode_ref = ?
WHERE source_sys_code = ? AND pcd8 = ?

Use QLBI_NoMatch

--TRUNCATE TABLE UK_Area_Information_No_Match
SELECT * FROM UK_Area_Information_No_Match
