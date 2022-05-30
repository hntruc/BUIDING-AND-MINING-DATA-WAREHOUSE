-- B5. Cập nhật giá trị cho các trường updatedate vs createdate

USE QLBI_SOURCE
GO

UPDATE Accidents2011_2014 SET createdate = GETDATE();
UPDATE Accidents2011_2014 SET updatedate = NULL;

UPDATE Vehicles2011_2014 SET createdate = GETDATE();
UPDATE Vehicles2011_2014 SET updatedate = NULL;

UPDATE Casualties2011_2014 SET createdate = GETDATE();
UPDATE Casualties2011_2014 SET updatedate = NULL;

UPDATE UK_Area_Information SET createdate = GETDATE();
UPDATE UK_Area_Information SET updatedate = NULL;

UPDATE Postcodes SET createdate = GETDATE();
UPDATE Postcodes SET updatedate = NULL;

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


