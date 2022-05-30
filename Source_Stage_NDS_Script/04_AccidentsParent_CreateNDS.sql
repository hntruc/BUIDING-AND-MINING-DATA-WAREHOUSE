USE QLBI_NDS
GO 

/* Các bảng trong codebook */
/*
	Check if table exists? Drop before creating : create
*/
/*Related to Accidents*/
IF OBJECT_ID(N'dbo.Accident_Severity', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Accident_Severity;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Day_of_Week ', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Day_of_Week ;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Local_Authority_District', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Local_Authority_District;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Local_Authority_Highway', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Local_Authority_Highway;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Road_Type', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Road_Type;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Light_Conditions', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Light_Conditions;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Urban_or_Rural_Area', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Urban_or_Rural_Area;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Road_Surface_Conditions', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Road_Surface_Conditions;
	PRINT 'Delete Table Successfully';
END;
IF OBJECT_ID(N'dbo.Weather_Conditions', N'U') IS NOT NULL
BEGIN
    PRINT 'Table Exists';
	DROP TABLE dbo.Weather_Conditions;
	PRINT 'Delete Table Successfully';
END;

/* Create new table */
CREATE TABLE Accident_Severity (
  SKAccident_Severity INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Accident_Severity ;
INSERT INTO Accident_Severity  VALUES(1,'Fatal');
INSERT INTO Accident_Severity  VALUES(2,'Serious');
INSERT INTO Accident_Severity  VALUES(3,'Slight');

CREATE TABLE Local_Authority_District (
  SKLocal_Authority_District INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Local_Authority_District;
INSERT INTO Local_Authority_District(Code,Description) VALUES (1,'Westminster');
INSERT INTO Local_Authority_District(Code,Description) VALUES (2,'Camden');
INSERT INTO Local_Authority_District(Code,Description) VALUES (3,'Islington');
INSERT INTO Local_Authority_District(Code,Description) VALUES (4,'Hackney');
INSERT INTO Local_Authority_District(Code,Description) VALUES (5,'Tower Hamlets');
INSERT INTO Local_Authority_District(Code,Description) VALUES (6,'Greenwich');
INSERT INTO Local_Authority_District(Code,Description) VALUES (7,'Lewisham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (8,'Southwark');
INSERT INTO Local_Authority_District(Code,Description) VALUES (9,'Lambeth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (10,'Wandsworth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (11,'Hammersmith and Fulham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (12,'Kensington and Chelsea');
INSERT INTO Local_Authority_District(Code,Description) VALUES (13,'Waltham Forest');
INSERT INTO Local_Authority_District(Code,Description) VALUES (14,'Redbridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (15,'Havering');
INSERT INTO Local_Authority_District(Code,Description) VALUES (16,'Barking and Dagenham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (17,'Newham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (18,'Bexley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (19,'Bromley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (20,'Croydon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (21,'Sutton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (22,'Merton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (23,'Kingston upon Thames');
INSERT INTO Local_Authority_District(Code,Description) VALUES (24,'Richmond upon Thames');
INSERT INTO Local_Authority_District(Code,Description) VALUES (25,'Hounslow');
INSERT INTO Local_Authority_District(Code,Description) VALUES (26,'Hillingdon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (27,'Ealing');
INSERT INTO Local_Authority_District(Code,Description) VALUES (28,'Brent');
INSERT INTO Local_Authority_District(Code,Description) VALUES (29,'Harrow');
INSERT INTO Local_Authority_District(Code,Description) VALUES (30,'Barnet');
INSERT INTO Local_Authority_District(Code,Description) VALUES (31,'Haringey');
INSERT INTO Local_Authority_District(Code,Description) VALUES (32,'Enfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (33,'Hertsmere');
INSERT INTO Local_Authority_District(Code,Description) VALUES (38,'Epsom and Ewell');
INSERT INTO Local_Authority_District(Code,Description) VALUES (40,'Spelthorne');
INSERT INTO Local_Authority_District(Code,Description) VALUES (57,'London Airport (Heathrow)');
INSERT INTO Local_Authority_District(Code,Description) VALUES (60,'Allerdale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (61,'Barrow-in-Furness');
INSERT INTO Local_Authority_District(Code,Description) VALUES (62,'Carlisle');
INSERT INTO Local_Authority_District(Code,Description) VALUES (63,'Copeland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (64,'Eden');
INSERT INTO Local_Authority_District(Code,Description) VALUES (65,'South Lakeland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (70,'Blackburn with Darwen');
INSERT INTO Local_Authority_District(Code,Description) VALUES (71,'Blackpool');
INSERT INTO Local_Authority_District(Code,Description) VALUES (72,'Burnley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (73,'Chorley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (74,'Fylde');
INSERT INTO Local_Authority_District(Code,Description) VALUES (75,'Hyndburn');
INSERT INTO Local_Authority_District(Code,Description) VALUES (76,'Lancaster');
INSERT INTO Local_Authority_District(Code,Description) VALUES (77,'Pendle');
INSERT INTO Local_Authority_District(Code,Description) VALUES (79,'Preston');
INSERT INTO Local_Authority_District(Code,Description) VALUES (80,'Ribble Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (82,'Rossendale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (83,'South Ribble');
INSERT INTO Local_Authority_District(Code,Description) VALUES (84,'West Lancashire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (85,'Wyre');
INSERT INTO Local_Authority_District(Code,Description) VALUES (90,'Knowsley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (91,'Liverpool');
INSERT INTO Local_Authority_District(Code,Description) VALUES (92,'St. Helens');
INSERT INTO Local_Authority_District(Code,Description) VALUES (93,'Sefton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (95,'Wirral');
INSERT INTO Local_Authority_District(Code,Description) VALUES (100,'Bolton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (101,'Bury');
INSERT INTO Local_Authority_District(Code,Description) VALUES (102,'Manchester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (104,'Oldham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (106,'Rochdale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (107,'Salford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (109,'Stockport');
INSERT INTO Local_Authority_District(Code,Description) VALUES (110,'Tameside');
INSERT INTO Local_Authority_District(Code,Description) VALUES (112,'Trafford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (114,'Wigan');
INSERT INTO Local_Authority_District(Code,Description) VALUES (120,'Chester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (121,'Congleton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (122,'Crewe and Nantwich');
INSERT INTO Local_Authority_District(Code,Description) VALUES (123,'Ellesmere Port and Neston');
INSERT INTO Local_Authority_District(Code,Description) VALUES (124,'Halton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (126,'Macclesfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (127,'Vale Royal');
INSERT INTO Local_Authority_District(Code,Description) VALUES (128,'Warrington');
INSERT INTO Local_Authority_District(Code,Description) VALUES (129,'Cheshire East');
INSERT INTO Local_Authority_District(Code,Description) VALUES (130,'Cheshire West and Chester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (139,'Northumberland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (140,'Alnwick');
INSERT INTO Local_Authority_District(Code,Description) VALUES (141,'Berwick-upon-Tweed');
INSERT INTO Local_Authority_District(Code,Description) VALUES (142,'Blyth Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (143,'Castle Morpeth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (144,'Tynedale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (145,'Wansbeck');
INSERT INTO Local_Authority_District(Code,Description) VALUES (146,'Gateshead');
INSERT INTO Local_Authority_District(Code,Description) VALUES (147,'Newcastle upon Tyne');
INSERT INTO Local_Authority_District(Code,Description) VALUES (148,'North Tyneside');
INSERT INTO Local_Authority_District(Code,Description) VALUES (149,'South Tyneside');
INSERT INTO Local_Authority_District(Code,Description) VALUES (150,'Sunderland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (160,'Chester-le-Street');
INSERT INTO Local_Authority_District(Code,Description) VALUES (161,'Darlington');
INSERT INTO Local_Authority_District(Code,Description) VALUES (162,'Derwentside');
INSERT INTO Local_Authority_District(Code,Description) VALUES (163,'Durham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (164,'Easington');
INSERT INTO Local_Authority_District(Code,Description) VALUES (165,'Sedgefield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (166,'Teesdale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (168,'Wear Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (169,'County Durham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (180,'Craven');
INSERT INTO Local_Authority_District(Code,Description) VALUES (181,'Hambleton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (182,'Harrogate');
INSERT INTO Local_Authority_District(Code,Description) VALUES (184,'Richmondshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (185,'Ryedale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (186,'Scarborough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (187,'Selby');
INSERT INTO Local_Authority_District(Code,Description) VALUES (189,'York');
INSERT INTO Local_Authority_District(Code,Description) VALUES (200,'Bradford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (202,'Calderdale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (203,'Kirklees');
INSERT INTO Local_Authority_District(Code,Description) VALUES (204,'Leeds');
INSERT INTO Local_Authority_District(Code,Description) VALUES (206,'Wakefield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (210,'Barnsley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (211,'Doncaster');
INSERT INTO Local_Authority_District(Code,Description) VALUES (213,'Rotherham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (215,'Sheffield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (228,'Kingston upon Hull, City of');
INSERT INTO Local_Authority_District(Code,Description) VALUES (231,'East Riding of Yorkshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (232,'North Lincolnshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (233,'North East Lincolnshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (240,'Hartlepool');
INSERT INTO Local_Authority_District(Code,Description) VALUES (241,'Redcar and Cleveland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (243,'Middlesbrough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (245,'Stockton-on-Tees');
INSERT INTO Local_Authority_District(Code,Description) VALUES (250,'Cannock Chase');
INSERT INTO Local_Authority_District(Code,Description) VALUES (251,'East Staffordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (252,'Lichfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (253,'Newcastle-under-Lyme');
INSERT INTO Local_Authority_District(Code,Description) VALUES (254,'South Staffordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (255,'Stafford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (256,'Staffordshire Moorlands');
INSERT INTO Local_Authority_District(Code,Description) VALUES (257,'Stoke-on-Trent');
INSERT INTO Local_Authority_District(Code,Description) VALUES (258,'Tamworth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (270,'Bromsgrove');
INSERT INTO Local_Authority_District(Code,Description) VALUES (273,'Malvern Hills');
INSERT INTO Local_Authority_District(Code,Description) VALUES (274,'Redditch');
INSERT INTO Local_Authority_District(Code,Description) VALUES (276,'Worcester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (277,'Wychavon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (278,'Wyre Forest');
INSERT INTO Local_Authority_District(Code,Description) VALUES (279,'Bridgnorth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (280,'North Shropshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (281,'Oswestry');
INSERT INTO Local_Authority_District(Code,Description) VALUES (282,'Shrewsbury and Atcham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (283,'South Shropshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (284,'Telford and Wrekin');
INSERT INTO Local_Authority_District(Code,Description) VALUES (285,'Herefordshire, County of');
INSERT INTO Local_Authority_District(Code,Description) VALUES (286,'Shropshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (290,'North Warwickshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (291,'Nuneaton and Bedworth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (292,'Rugby');
INSERT INTO Local_Authority_District(Code,Description) VALUES (293,'Stratford-upon-Avon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (294,'Warwick');
INSERT INTO Local_Authority_District(Code,Description) VALUES (300,'Birmingham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (302,'Coventry');
INSERT INTO Local_Authority_District(Code,Description) VALUES (303,'Dudley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (305,'Sandwell');
INSERT INTO Local_Authority_District(Code,Description) VALUES (306,'Solihull');
INSERT INTO Local_Authority_District(Code,Description) VALUES (307,'Walsall');
INSERT INTO Local_Authority_District(Code,Description) VALUES (309,'Wolverhampton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (320,'Amber Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (321,'Bolsover');
INSERT INTO Local_Authority_District(Code,Description) VALUES (322,'Chesterfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (323,'Derby');
INSERT INTO Local_Authority_District(Code,Description) VALUES (324,'Erewash');
INSERT INTO Local_Authority_District(Code,Description) VALUES (325,'High Peak');
INSERT INTO Local_Authority_District(Code,Description) VALUES (327,'North East Derbyshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (328,'South Derbyshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (329,'Derbyshire Dales');
INSERT INTO Local_Authority_District(Code,Description) VALUES (340,'Ashfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (341,'Bassetlaw');
INSERT INTO Local_Authority_District(Code,Description) VALUES (342,'Broxtowe');
INSERT INTO Local_Authority_District(Code,Description) VALUES (343,'Gedling');
INSERT INTO Local_Authority_District(Code,Description) VALUES (344,'Mansfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (345,'Newark and Sherwood');
INSERT INTO Local_Authority_District(Code,Description) VALUES (346,'Nottingham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (347,'Rushcliffe');
INSERT INTO Local_Authority_District(Code,Description) VALUES (350,'Boston');
INSERT INTO Local_Authority_District(Code,Description) VALUES (351,'East Lindsey');
INSERT INTO Local_Authority_District(Code,Description) VALUES (352,'Lincoln');
INSERT INTO Local_Authority_District(Code,Description) VALUES (353,'North Kesteven');
INSERT INTO Local_Authority_District(Code,Description) VALUES (354,'South Holland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (355,'South Kesteven');
INSERT INTO Local_Authority_District(Code,Description) VALUES (356,'West Lindsey');
INSERT INTO Local_Authority_District(Code,Description) VALUES (360,'Blaby');
INSERT INTO Local_Authority_District(Code,Description) VALUES (361,'Hinckley and Bosworth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (362,'Charnwood');
INSERT INTO Local_Authority_District(Code,Description) VALUES (363,'Harborough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (364,'Leicester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (365,'Melton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (366,'North West Leicestershire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (367,'Oadby and Wigston');
INSERT INTO Local_Authority_District(Code,Description) VALUES (368,'Rutland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (380,'Corby');
INSERT INTO Local_Authority_District(Code,Description) VALUES (381,'Daventry');
INSERT INTO Local_Authority_District(Code,Description) VALUES (382,'East Northamptonshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (383,'Kettering');
INSERT INTO Local_Authority_District(Code,Description) VALUES (384,'Northampton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (385,'South Northamptonshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (386,'Wellingborough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (390,'Cambridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (391,'East Cambridgeshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (392,'Fenland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (393,'Huntingdonshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (394,'Peterborough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (395,'South Cambridgeshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (400,'Breckland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (401,'Broadland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (402,'Great Yarmouth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (404,'Norwich');
INSERT INTO Local_Authority_District(Code,Description) VALUES (405,'North Norfolk');
INSERT INTO Local_Authority_District(Code,Description) VALUES (406,'South Norfolk');
INSERT INTO Local_Authority_District(Code,Description) VALUES (407,'King''s Lynn and West Norfolk');
INSERT INTO Local_Authority_District(Code,Description) VALUES (410,'Babergh');
INSERT INTO Local_Authority_District(Code,Description) VALUES (411,'Forest Heath');
INSERT INTO Local_Authority_District(Code,Description) VALUES (412,'Ipswich');
INSERT INTO Local_Authority_District(Code,Description) VALUES (413,'Mid Suffolk');
INSERT INTO Local_Authority_District(Code,Description) VALUES (414,'St. Edmundsbury');
INSERT INTO Local_Authority_District(Code,Description) VALUES (415,'Suffolk Coastal');
INSERT INTO Local_Authority_District(Code,Description) VALUES (416,'Waveney');
INSERT INTO Local_Authority_District(Code,Description) VALUES (420,'Bedford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (421,'Luton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (422,'Mid Bedfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (423,'South Bedfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (424,'Central Bedfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (430,'Broxbourne');
INSERT INTO Local_Authority_District(Code,Description) VALUES (431,'Dacorum');
INSERT INTO Local_Authority_District(Code,Description) VALUES (432,'East Hertfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (433,'North Hertfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (434,'St. Albans');
INSERT INTO Local_Authority_District(Code,Description) VALUES (435,'Stevenage');
INSERT INTO Local_Authority_District(Code,Description) VALUES (436,'Three Rivers');
INSERT INTO Local_Authority_District(Code,Description) VALUES (437,'Watford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (438,'Welwyn Hatfield');
INSERT INTO Local_Authority_District(Code,Description) VALUES (450,'Basildon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (451,'Braintree');
INSERT INTO Local_Authority_District(Code,Description) VALUES (452,'Brentwood');
INSERT INTO Local_Authority_District(Code,Description) VALUES (453,'Castle Point');
INSERT INTO Local_Authority_District(Code,Description) VALUES (454,'Chelmsford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (455,'Colchester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (456,'Epping Forest');
INSERT INTO Local_Authority_District(Code,Description) VALUES (457,'Harlow');
INSERT INTO Local_Authority_District(Code,Description) VALUES (458,'Maldon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (459,'Rochford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (460,'Southend-on-Sea');
INSERT INTO Local_Authority_District(Code,Description) VALUES (461,'Tendring');
INSERT INTO Local_Authority_District(Code,Description) VALUES (462,'Thurrock');
INSERT INTO Local_Authority_District(Code,Description) VALUES (463,'Uttlesford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (470,'Bracknell Forest');
INSERT INTO Local_Authority_District(Code,Description) VALUES (471,'West Berkshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (472,'Reading');
INSERT INTO Local_Authority_District(Code,Description) VALUES (473,'Slough');
INSERT INTO Local_Authority_District(Code,Description) VALUES (474,'Windsor and Maidenhead');
INSERT INTO Local_Authority_District(Code,Description) VALUES (475,'Wokingham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (476,'Aylesbury Vale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (477,'South Bucks');
INSERT INTO Local_Authority_District(Code,Description) VALUES (478,'Chiltern');
INSERT INTO Local_Authority_District(Code,Description) VALUES (479,'Milton Keynes');
INSERT INTO Local_Authority_District(Code,Description) VALUES (480,'Wycombe');
INSERT INTO Local_Authority_District(Code,Description) VALUES (481,'Cherwell');
INSERT INTO Local_Authority_District(Code,Description) VALUES (482,'Oxford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (483,'Vale of White Horse');
INSERT INTO Local_Authority_District(Code,Description) VALUES (484,'South Oxfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (485,'West Oxfordshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (490,'Basingstoke and Deane');
INSERT INTO Local_Authority_District(Code,Description) VALUES (491,'Eastleigh');
INSERT INTO Local_Authority_District(Code,Description) VALUES (492,'Fareham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (493,'Gosport');
INSERT INTO Local_Authority_District(Code,Description) VALUES (494,'Hart');
INSERT INTO Local_Authority_District(Code,Description) VALUES (495,'Havant');
INSERT INTO Local_Authority_District(Code,Description) VALUES (496,'New Forest');
INSERT INTO Local_Authority_District(Code,Description) VALUES (497,'East Hampshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (498,'Portsmouth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (499,'Rushmoor');
INSERT INTO Local_Authority_District(Code,Description) VALUES (500,'Southampton');
INSERT INTO Local_Authority_District(Code,Description) VALUES (501,'Test Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (502,'Winchester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (505,'Isle of Wight');
INSERT INTO Local_Authority_District(Code,Description) VALUES (510,'Elmbridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (511,'Guildford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (512,'Mole Valley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (513,'Reigate and Banstead');
INSERT INTO Local_Authority_District(Code,Description) VALUES (514,'Runnymede');
INSERT INTO Local_Authority_District(Code,Description) VALUES (515,'Surrey Heath');
INSERT INTO Local_Authority_District(Code,Description) VALUES (516,'Tandridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (517,'Waverley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (518,'Woking');
INSERT INTO Local_Authority_District(Code,Description) VALUES (530,'Ashford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (531,'Canterbury');
INSERT INTO Local_Authority_District(Code,Description) VALUES (532,'Dartford');
INSERT INTO Local_Authority_District(Code,Description) VALUES (533,'Dover');
INSERT INTO Local_Authority_District(Code,Description) VALUES (535,'Gravesham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (536,'Maidstone');
INSERT INTO Local_Authority_District(Code,Description) VALUES (538,'Sevenoaks');
INSERT INTO Local_Authority_District(Code,Description) VALUES (539,'Shepway');
INSERT INTO Local_Authority_District(Code,Description) VALUES (540,'Swale');
INSERT INTO Local_Authority_District(Code,Description) VALUES (541,'Thanet');
INSERT INTO Local_Authority_District(Code,Description) VALUES (542,'Tonbridge and Malling');
INSERT INTO Local_Authority_District(Code,Description) VALUES (543,'Tunbridge Wells');
INSERT INTO Local_Authority_District(Code,Description) VALUES (544,'Medway');
INSERT INTO Local_Authority_District(Code,Description) VALUES (551,'Eastbourne');
INSERT INTO Local_Authority_District(Code,Description) VALUES (552,'Hastings');
INSERT INTO Local_Authority_District(Code,Description) VALUES (554,'Lewes');
INSERT INTO Local_Authority_District(Code,Description) VALUES (555,'Rother');
INSERT INTO Local_Authority_District(Code,Description) VALUES (556,'Wealden');
INSERT INTO Local_Authority_District(Code,Description) VALUES (557,'Adur');
INSERT INTO Local_Authority_District(Code,Description) VALUES (558,'Arun');
INSERT INTO Local_Authority_District(Code,Description) VALUES (559,'Chichester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (560,'Crawley');
INSERT INTO Local_Authority_District(Code,Description) VALUES (562,'Horsham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (563,'Mid Sussex');
INSERT INTO Local_Authority_District(Code,Description) VALUES (564,'Worthing');
INSERT INTO Local_Authority_District(Code,Description) VALUES (565,'Brighton and Hove');
INSERT INTO Local_Authority_District(Code,Description) VALUES (570,'City of London');
INSERT INTO Local_Authority_District(Code,Description) VALUES (580,'East Devon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (581,'Exeter');
INSERT INTO Local_Authority_District(Code,Description) VALUES (582,'North Devon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (583,'Plymouth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (584,'South Hams');
INSERT INTO Local_Authority_District(Code,Description) VALUES (585,'Teignbridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (586,'Mid Devon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (587,'Torbay');
INSERT INTO Local_Authority_District(Code,Description) VALUES (588,'Torridge');
INSERT INTO Local_Authority_District(Code,Description) VALUES (589,'West Devon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (590,'Caradon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (591,'Carrick');
INSERT INTO Local_Authority_District(Code,Description) VALUES (592,'Kerrier');
INSERT INTO Local_Authority_District(Code,Description) VALUES (593,'North Cornwall');
INSERT INTO Local_Authority_District(Code,Description) VALUES (594,'Penwith');
INSERT INTO Local_Authority_District(Code,Description) VALUES (595,'Restormel');
INSERT INTO Local_Authority_District(Code,Description) VALUES (596,'Cornwall');
INSERT INTO Local_Authority_District(Code,Description) VALUES (601,'Bristol, City of');
INSERT INTO Local_Authority_District(Code,Description) VALUES (605,'North Somerset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (606,'Mendip');
INSERT INTO Local_Authority_District(Code,Description) VALUES (607,'Sedgemoor');
INSERT INTO Local_Authority_District(Code,Description) VALUES (608,'Taunton Deane');
INSERT INTO Local_Authority_District(Code,Description) VALUES (609,'West Somerset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (610,'South Somerset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (611,'Bath and North East Somerset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (612,'South Gloucestershire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (620,'Cheltenham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (621,'Cotswold');
INSERT INTO Local_Authority_District(Code,Description) VALUES (622,'Forest of Dean');
INSERT INTO Local_Authority_District(Code,Description) VALUES (623,'Gloucester');
INSERT INTO Local_Authority_District(Code,Description) VALUES (624,'Stroud');
INSERT INTO Local_Authority_District(Code,Description) VALUES (625,'Tewkesbury');
INSERT INTO Local_Authority_District(Code,Description) VALUES (630,'Kennet');
INSERT INTO Local_Authority_District(Code,Description) VALUES (631,'North Wiltshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (632,'Salisbury');
INSERT INTO Local_Authority_District(Code,Description) VALUES (633,'Swindon');
INSERT INTO Local_Authority_District(Code,Description) VALUES (634,'West Wiltshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (635,'Wiltshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (640,'Bournemouth');
INSERT INTO Local_Authority_District(Code,Description) VALUES (641,'Christchurch');
INSERT INTO Local_Authority_District(Code,Description) VALUES (642,'North Dorset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (643,'Poole');
INSERT INTO Local_Authority_District(Code,Description) VALUES (644,'Purbeck');
INSERT INTO Local_Authority_District(Code,Description) VALUES (645,'West Dorset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (646,'Weymouth and Portland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (647,'East Dorset');
INSERT INTO Local_Authority_District(Code,Description) VALUES (720,'Isle of Anglesey');
INSERT INTO Local_Authority_District(Code,Description) VALUES (721,'Conwy');
INSERT INTO Local_Authority_District(Code,Description) VALUES (722,'Gwynedd');
INSERT INTO Local_Authority_District(Code,Description) VALUES (723,'Denbighshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (724,'Flintshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (725,'Wrexham');
INSERT INTO Local_Authority_District(Code,Description) VALUES (730,'Blaenau Gwent');
INSERT INTO Local_Authority_District(Code,Description) VALUES (731,'Caerphilly');
INSERT INTO Local_Authority_District(Code,Description) VALUES (732,'Monmouthshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (733,'Newport');
INSERT INTO Local_Authority_District(Code,Description) VALUES (734,'Torfaen');
INSERT INTO Local_Authority_District(Code,Description) VALUES (740,'Bridgend');
INSERT INTO Local_Authority_District(Code,Description) VALUES (741,'Cardiff');
INSERT INTO Local_Authority_District(Code,Description) VALUES (742,'Merthyr Tydfil');
INSERT INTO Local_Authority_District(Code,Description) VALUES (743,'Neath Port Talbot');
INSERT INTO Local_Authority_District(Code,Description) VALUES (744,'Rhondda, Cynon, Taff');
INSERT INTO Local_Authority_District(Code,Description) VALUES (745,'Swansea');
INSERT INTO Local_Authority_District(Code,Description) VALUES (746,'The Vale of Glamorgan');
INSERT INTO Local_Authority_District(Code,Description) VALUES (750,'Ceredigion');
INSERT INTO Local_Authority_District(Code,Description) VALUES (751,'Carmarthenshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (752,'Pembrokeshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (753,'Powys');
INSERT INTO Local_Authority_District(Code,Description) VALUES (910,'Aberdeen City');
INSERT INTO Local_Authority_District(Code,Description) VALUES (911,'Aberdeenshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (912,'Angus');
INSERT INTO Local_Authority_District(Code,Description) VALUES (913,'Argyll and Bute');
INSERT INTO Local_Authority_District(Code,Description) VALUES (914,'Scottish Borders');
INSERT INTO Local_Authority_District(Code,Description) VALUES (915,'Clackmannanshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (916,'West Dunbartonshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (917,'Dumfries and Galloway');
INSERT INTO Local_Authority_District(Code,Description) VALUES (918,'Dundee City');
INSERT INTO Local_Authority_District(Code,Description) VALUES (919,'East Ayrshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (920,'East Dunbartonshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (921,'East Lothian');
INSERT INTO Local_Authority_District(Code,Description) VALUES (922,'East Renfrewshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (923,'Edinburgh, City of');
INSERT INTO Local_Authority_District(Code,Description) VALUES (924,'Falkirk');
INSERT INTO Local_Authority_District(Code,Description) VALUES (925,'Fife');
INSERT INTO Local_Authority_District(Code,Description) VALUES (926,'Glasgow City');
INSERT INTO Local_Authority_District(Code,Description) VALUES (927,'Highland');
INSERT INTO Local_Authority_District(Code,Description) VALUES (928,'Inverclyde');
INSERT INTO Local_Authority_District(Code,Description) VALUES (929,'Midlothian');
INSERT INTO Local_Authority_District(Code,Description) VALUES (930,'Moray');
INSERT INTO Local_Authority_District(Code,Description) VALUES (931,'North Ayrshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (932,'North Lanarkshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (933,'Orkney Islands');
INSERT INTO Local_Authority_District(Code,Description) VALUES (934,'Perth and Kinross');
INSERT INTO Local_Authority_District(Code,Description) VALUES (935,'Renfrewshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (936,'Shetland Islands');
INSERT INTO Local_Authority_District(Code,Description) VALUES (937,'South Ayrshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (938,'South Lanarkshire');
INSERT INTO Local_Authority_District(Code,Description) VALUES (939,'Stirling');
INSERT INTO Local_Authority_District(Code,Description) VALUES (940,'West Lothian');
INSERT INTO Local_Authority_District(Code,Description) VALUES (941,'Western Isles');

CREATE TABLE Local_Authority_Highway (
  SKLocal_Authority_Highway INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code VARCHAR(255),
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Local_Authority_Highway;
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000033','Aberdeen City');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000034','Aberdeenshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000041','Angus');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000035','Argyll & Bute');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000002','Barking and Dagenham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000003','Barnet');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000016','Barnsley');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000022','Bath and North East Somerset');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000055','Bedford');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000004','Bexley');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000025','Birmingham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000008','Blackburn with Darwen');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000009','Blackpool');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000019','Blaenau Gwent');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000001','Bolton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000028','Bournemouth');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000036','Bracknell Forest');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000032','Bradford');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000005','Brent');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000013','Bridgend');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000043','Brighton and Hove');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000023','Bristol, City of');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000006','Bromley');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000002','Buckinghamshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000002','Bury');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000018','Caerphilly');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000033','Calderdale');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000003','Cambridgeshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000007','Camden');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000015','Cardiff');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000010','Carmarthenshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000056','Central Bedfordshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000008','Ceredigion');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000049','Cheshire East');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000050','Cheshire West and Chester');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000001','City of London');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000005','Clackmannanshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000003','Conwy');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000052','Cornwall');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000047','County Durham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000026','Coventry');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000008','Croydon');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000006','Cumbria');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000005','Darlington');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000004','Denbighshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000015','Derby');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000007','Derbyshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000008','Devon');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000017','Doncaster');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000009','Dorset');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000027','Dudley');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000006','Dumfries & Galloway');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000042','Dundee City');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000009','Ealing');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000008','East Ayrshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000009','East Dunbartonshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000010','East Lothian');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000011','East Renfrewshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000011','East Riding of Yorkshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000011','East Sussex');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000036','Edinburgh, City of');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000010','Enfield');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000012','Essex');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000014','Falkirk');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000015','Fife');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000005','Flintshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000020','Gateshead');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000043','Glasgow City');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000013','Gloucestershire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000011','Greenwich');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000002','Gwynedd');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000012','Hackney');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000006','Halton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000013','Hammersmith and Fulham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000014','Hampshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000014','Haringey');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000015','Harrow');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000001','Hartlepool');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000016','Havering');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000019','Herefordshire, County of');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000015','Hertfordshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000017','Highland');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000017','Hillingdon');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000018','Hounslow');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000018','Inverclyde');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000001','Isle of Anglesey');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000046','Isle of Wight');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000053','Isles of Scilly');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000019','Islington');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000020','Kensington and Chelsea');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000016','Kent');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000010','Kingston upon Hull, City of');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000021','Kingston upon Thames');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000034','Kirklees');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000011','Knowsley');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000022','Lambeth');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000017','Lancashire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000035','Leeds');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000016','Leicester');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000018','Leicestershire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000023','Lewisham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000019','Lincolnshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000012','Liverpool');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('EHEATHROW','London Airport (Heathrow)');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000032','Luton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000003','Manchester');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000035','Medway');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000024','Merthyr Tydfil');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000024','Merton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000002','Middlesbrough');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000019','Midlothian');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000042','Milton Keynes');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000021','Monmouthshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000020','Moray');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000013','Na h-Eileanan an Iar (Western Isles)');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000012','Neath Port Talbot');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000021','Newcastle upon Tyne');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000025','Newham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000022','Newport');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000020','Norfolk');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000021','North Ayrshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000012','North East Lincolnshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000044','North Lanarkshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000013','North Lincolnshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000024','North Somerset');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000022','North Tyneside');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000023','North Yorkshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000021','Northamptonshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000048','Northumberland');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000018','Nottingham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000024','Nottinghamshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000004','Oldham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000023','Orkney Islands');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000025','Oxfordshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000009','Pembrokeshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000024','Perth and Kinross');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000031','Peterborough');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000026','Plymouth');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000029','Poole');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000044','Portsmouth');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000023','Powys');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000038','Reading');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000026','Redbridge');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000003','Redcar and Cleveland');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000038','Renfrewshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000016','Rhondda, Cynon, Taff');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000027','Richmond upon Thames');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000005','Rochdale');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000018','Rotherham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000017','Rutland');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000006','Salford');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000028','Sandwell');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000026','Scottish Borders');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000014','Sefton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000019','Sheffield');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000027','Shetland Islands');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000051','Shropshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000039','Slough');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000029','Solihull');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000027','Somerset');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000028','South Ayrshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000025','South Gloucestershire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000029','South Lanarkshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000023','South Tyneside');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000045','Southampton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000033','Southend-on-Sea');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000028','Southwark');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000013','St. Helens');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000028','Staffordshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000030','Stirling');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000007','Stockport');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000004','Stockton-on-Tees');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000021','Stoke-on-Trent');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000029','Suffolk');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000024','Sunderland');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000030','Surrey');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000029','Sutton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000011','Swansea');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000030','Swindon');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000008','Tameside');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000020','Telford and Wrekin');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000014','The Vale of Glamorgan');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000034','Thurrock');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000027','Torbay');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000020','Torfaen');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000030','Tower Hamlets');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000009','Trafford');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000036','Wakefield');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000030','Walsall');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000031','Waltham Forest');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000032','Wandsworth');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000007','Warrington');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000031','Warwickshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000037','West Berkshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000039','West Dunbartonshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('S12000040','West Lothian');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000032','West Sussex');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E09000033','Westminster');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000010','Wigan');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000054','Wiltshire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000040','Windsor and Maidenhead');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000015','Wirral');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000041','Wokingham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E08000031','Wolverhampton');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E10000034','Worcestershire');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('W06000006','Wrexham');
INSERT INTO Local_Authority_Highway(Code,Description) VALUES ('E06000014','York');

CREATE TABLE Road_Type (
  SKRoad_Type INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Road_Type;
INSERT INTO Road_Type(Code,Description) VALUES (1,'Roundabout');
INSERT INTO Road_Type(Code,Description) VALUES (2,'One way street');
INSERT INTO Road_Type(Code,Description) VALUES (3,'Dual carriageway');
INSERT INTO Road_Type(Code,Description) VALUES (6,'Single carriageway');
INSERT INTO Road_Type(Code,Description) VALUES (7,'Slip road');
INSERT INTO Road_Type(Code,Description) VALUES (9,'Unknown');
INSERT INTO Road_Type(Code,Description) VALUES (12,'One way street_Slip road');
INSERT INTO Road_Type(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Light_Conditions (
  SKLight_Conditions INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Light_Conditions;
INSERT INTO Light_Conditions(Code,Description) VALUES (1,'Daylight');
INSERT INTO Light_Conditions(Code,Description) VALUES (4,'Darkness - lights lit');
INSERT INTO Light_Conditions(Code,Description) VALUES (5,'Darkness - lights unlit');
INSERT INTO Light_Conditions(Code,Description) VALUES (6,'Darkness - no lighting');
INSERT INTO Light_Conditions(Code,Description) VALUES (7,'Darkness - lighting unknown');
INSERT INTO Light_Conditions(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Day_of_Week (
  SKDay_of_Week INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Day_of_Week;
INSERT INTO Day_of_Week(Code,Description) VALUES (1,'Sunday');
INSERT INTO Day_of_Week(Code,Description) VALUES (2,'Monday');
INSERT INTO Day_of_Week(Code,Description) VALUES (3,'Tuesday');
INSERT INTO Day_of_Week(Code,Description) VALUES (4,'Wednesday');
INSERT INTO Day_of_Week(Code,Description) VALUES (5,'Thursday');
INSERT INTO Day_of_Week(Code,Description) VALUES (6,'Friday');
INSERT INTO Day_of_Week(Code,Description) VALUES (7,'Saturday');

CREATE TABLE Weather_Conditions (
  SKWeather_Conditions INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Weather_Conditions;
INSERT INTO Weather_Conditions(Code,Description) VALUES (1,'Fine no high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (2,'Raining no high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (3,'Snowing no high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (4,'Fine + high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (5,'Raining + high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (6,'Snowing + high winds');
INSERT INTO Weather_Conditions(Code,Description) VALUES (7,'Fog or mist');
INSERT INTO Weather_Conditions(Code,Description) VALUES (8,'Other');
INSERT INTO Weather_Conditions(Code,Description) VALUES (9,'Unknown');
INSERT INTO Weather_Conditions(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Road_Surface_Conditions (
  SKRoad_Surface_Conditions INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Road_Surface_Conditions;
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (1,'Dry');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (2,'Wet or damp');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (3,'Snow');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (4,'Frost or ice');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (5,'Flood over 3cm. deep');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (6,'Oil or diesel');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (7,'Mud');
INSERT INTO Road_Surface_Conditions(Code,Description) VALUES (-1,'Data missing or out of range');

CREATE TABLE Urban_or_Rural_Area (
  SKUrban_or_Rural_Area INTEGER IDENTITY(1,1) PRIMARY KEY NOT NULL,
  Code INTEGER,
  Description VARCHAR(255)
  --[NgayTao] [datetime],
  --[NgayCapNhat] [datetime]
);
DELETE FROM Urban_or_Rural_Area;
INSERT INTO Urban_or_Rural_Area(Code,Description) VALUES (1,'Urban');
INSERT INTO Urban_or_Rural_Area(Code,Description) VALUES (2,'Rural');
INSERT INTO Urban_or_Rural_Area(Code,Description) VALUES (3,'Unallocated');

------------------- Khóa ngoại
IF (OBJECT_ID('dbo.FK_Accident_Urban_or_Rural_Area', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Urban_or_Rural_Area
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Urban_or_Rural_Area
FOREIGN KEY (Urban_or_Rural_Area) REFERENCES Urban_or_Rural_Area(SKUrban_or_Rural_Area);

IF (OBJECT_ID('dbo.FK_Accident_Weather_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Weather_Conditions
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Weather_Conditions
FOREIGN KEY (Weather_Conditions) REFERENCES Weather_Conditions(SKWeather_Conditions);

IF (OBJECT_ID('dbo.FK_Accident_Road_Surface_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Road_Surface_Conditions
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Road_Surface_Conditions
FOREIGN KEY (Road_Surface_Conditions) REFERENCES Road_Surface_Conditions(SKRoad_Surface_Conditions);

IF (OBJECT_ID('dbo.FK_Accident_Day_of_Week', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Day_of_Week
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Day_of_Week
FOREIGN KEY (Day_of_Week) REFERENCES Day_of_Week(SKDay_of_Week)

IF (OBJECT_ID('dbo.FK_Accident_Light_Conditions', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Light_Conditions
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Light_Conditions
FOREIGN KEY (Light_Conditions) REFERENCES Light_Conditions(SKLight_Conditions)

IF (OBJECT_ID('dbo.FK_Accident_Road_Type', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Road_Type
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Road_Type
FOREIGN KEY (Road_Type) REFERENCES Road_Type(SKRoad_Type)

IF (OBJECT_ID('dbo.FK_Accident_Local_Authority_Highway', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Local_Authority_Highway
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Local_Authority_Highway
FOREIGN KEY (Local_Authority_Highway) REFERENCES Local_Authority_Highway(SKLocal_Authority_Highway)

IF (OBJECT_ID('dbo.FK_Accident_Local_Authority_District', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Local_Authority_District
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Local_Authority_District
FOREIGN KEY (Local_Authority_District) REFERENCES Local_Authority_District(SKLocal_Authority_District)

IF (OBJECT_ID('dbo.FK_Accident_Accident_Severity', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE dbo.Accidents2011_2014_NDS DROP CONSTRAINT FK_Accident_Accident_Severity
END
ALTER TABLE Accidents2011_2014_NDS
ADD CONSTRAINT FK_Accident_Accident_Severity
FOREIGN KEY (Accident_Severity) REFERENCES Accident_Severity(SKAccident_Severity)