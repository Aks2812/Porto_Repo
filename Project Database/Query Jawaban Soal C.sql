/* c.Create query using DML syntax to fill the tables in database systems with data based on the 
following conditions: 
 - Master table must be filled with more than or equals 15 data.
 - Transaction table must be filled with more than or equals 15 data.
 - Transaction detail table must be filled with more than or equals 25 data.*/
------------------------------------------------------------------------------------------------
USE We_Klean
------------------------------------------------------------------------------------------------
INSERT INTO Employee (employeeID, employeeName, employeeGender, employeeEmail, employeeAddress, employeePhoneNumber) VALUES 
('EM001','Jeffery Galvan','Male','Jgv@gmail.com','Jl Letjen South Parman 83-86, Dki Jakarta','+62875243808593'),
('EM002','Enoch Davey','Male','Edv@gmail.com','Jl Klipang Sendang Mulyo 001/03, Jawa Tengah','+628815142832'),
('EM003','Kaiser Talley','Female','Kte@gmail.com','Jl Pogung Lor D/112, Jawa Tengah','+62893643967015'),
('EM004','Amalie Quinn','Female','Aqn@gmail.com','JL. Andi Makasau No.34, Parepare','+628267725988'),
('EM005','Kush Clark','Male','Kcr@gmail.com','Kompl Green Garden Kedoya Utr, Dki Jakarta','+62872111787'),
('EM006','Muhamed Salah','Male','Msl@gmail.com','Jl Mugas Brt IV/9, Jawa Tengah','+6281896622768'),
('EM007','Rukhsar Tanner','Male','Rtn@gmail.com',' Jl Dr Sam Ratulangi 9-15, Dki Jakarta','+62885475592419'),
('EM008','Georgia Mcdermott','Male','Gmd@gmail.com','JL. Dr. Ratulangi No. 92, Makassar','+62816461588994'),
('EM009','Michele Macdonald','Female','Mmd@gmail.com','Jl Danau Agung II 18-20, Dki Jakarta','+62867150293'),
('EM010','Nadia Osborne','Female','Nob@gmail.com','Jl Jend Basuki Rachmad 106, Jawa Timur','+6281683484039'),
('EM011','Jedd Rosa','Female','Jrs@gmail.com','Jl Gombe Permai X/254, Jawa Tengah','+62855198419'),
('EM012','Nabila Broadhurst','Female','Nba@gmail.com','Jl Jend Urip Sumoharjo 64, Jawa Tengah','+62884783707'),
('EM013','April Zamora','Female','Azm@gmail.com','Jl Kerajinan 19, Dki Jakarta','+628930790569'),
('EM014','Faizan Elliott','Male','Feo@gmail.com','Jl Kramat Sentiong Mesjid, Dki Jakarta','+62825939819'),
('EM015','Mikey Hutton','Male','Mht@gmail.com','Jl Surya Kencana 24 Dki Jakarta','+628302140137')


INSERT INTO Customer (customerID,customerName,customerGender,customerEmail,customerAddress,customerPhoneNumber) VALUES
('CU001','Gasti Yuliarti','Female','Gasti31@gmail.com','Ds. S. Parman No. 211, Maluku','+628040759396'),
('CU002','Kariman Manullang','Male','Manullang62@gmail.com','Ds. Bakin No. 912, KalBar','+626455558045'),
('CU003','Tirta Samosir','Male','Samosir18@gmail.com','Kpg. Hasanuddin No. 345, Gorontalo','+626458104734'),
('CU004','Muhammad Sirait','Male','Sirait78@gmail.com','Jln. Gegerkalong Hilir No. 465, KalBar','+623185373146'),
('CU005','Ratih Puspita','Female','Ratih12@gmail.com','Jr. Moch. Yamin No. 154, KalTim','+622731696531'),
('CU006','Malima Yuniar','Female','Yuniar67@gmail.com','Jln. Sentot Alibasa No. 395, MalUt','+622391942746'),
('CU007','Wadi Uwais','Male','Uwais60@gmail.com','Jln. Sentot Alibasa No. 400, Maluku','+622391942746'),
('CU008','Anastasia Hassanah','Female','Anas32@gmail.com','Ki. Cut Nyak Dien No. 860, KalTeng','+628682299100'),
('CU009','Patricia Nasyiah','Female','Patricia17@gmail.com','Dk. Perintis Kemerdekaan No. 880, JaTim','+624563490580'),
('CU010','Emas Megantara ','Male','Megan54@gmail.com','Jr. Gedebage Selatan No. 826, KalTim','+62164712245'),
('CU011','Manana Winarno','Male','Xan11@gmail.com','Gg. Uluwatu No. 183, Bengkulu','+62833767182'),
('CU012','Fathonah Zulaika','Female','Zulaika80@gmail.com','Gg. Monginsidi No. 158, JaTim','+620781003321'),
('CU013','Yunita Puspita','Female','Yunita77@gmail.com','Ds. Otto No. 527, Banten','+62146708647'),
('CU014','Mulyono Sihombing','Male','Dodo10@gmail.com','Kpg. Salak No. 238, PapBar','+6266432483081'),
('CU015','Rahayu Andriani','Female','Andriani46@gmail.com','Psr. Achmad Yani No. 799, SumBar','+623243517418')


INSERT INTO Supplier (supplierID,supplierName,supplierGender,supplierEmail,supplierAddress,supplierPhoneNumber) VALUES
('SU001','Kani Mardhiyah','Female','Kani@gmail.com','Ds. Wora Wari No. 54, Papua','+6223390086478'),
('SU002','Vega Ardianto','Male','Vega@gmail.com','Jln. Yogyakarta No. 455, KalTim','+627478673672'),
('SU003','Heryanto Zulkarnain ','Male','Zulkarnain@gmail.com','Ki. Elang No. 23, Papua','+623465663031'),
('SU004','Hana Mandasari ','Female','Hana@gmail.com','Ki. Yosodipuro No. 959, SulUt','+62107571379'),
('SU005','Jaeman Marait','Male','Marait@gmail.com','Jr. Setia Budi No. 281, NTT','+62291962754'),
('SU006','Cawuk Maheswara','Male','Mahesware@gmail.com','Jr. Bara Tambar No. 354, SumUt','+6275495024'),
('SU007','Siti Rahmawati','Female','Siti@gmail.com','Psr. Babah No. 546, Banten','+628839075409'),
('SU008','Mario Napitupulu','Male','Mario@gmail.com','Psr. Bank Dagang Negara No. 225, Jambi','+62587971052'),
('SU009','Salimah Kusmawati','Female','Salimah@gmail.com','Ki. Abdul No. 180, NTB','+62146562265'),
('SU010','Ajimat Pratama','Male','Ajimat@gmail.com','Gg. Supono No. 578, JaTeng','+625227266890'),
('SU011','Vivi Purnawati','Female','Vivi@gmail.com','Psr. Sukajadi No. 443, Maluku','+6283385420260'),
('SU012','Asirwada Irawan','Male','Asirwada@gmail.com','Dk. Pasirkoja No. 633, KalTim','+6273445189839'),
('SU013','Hafshah Hastuti','Female','Hafshah@gmail.com','Psr. Otista No. 312, Maluku','+627224682815'),
('SU014','Budi Winarno','Male','Budi@gmail.com','Kpg. Raden Saleh No. 981, Papua','+62976735159'),
('SU015','Laksana Najmudin','Male','Laksana@gmail.com','Psr. Baya Kali Bungur No. 511, Makassar','+6241410479279')


INSERT INTO Product (productID,productName,productPrice,productWeight) VALUES
('PR001', 'Kispray Kitchen Spray 500ml', 15000,500),
('PR002', 'Mr. Muscle Kitchen Spray 500ml', 15000,500),
('PR003', 'Biosol Floor Cleaner Lavender Scent 1000ml', 30000,1000),
('PR004', 'Saniter Disinfectant Spray 650ml', 60000,650),
('PR005', 'SOS Disinfectant Spray 900ml', 30000,900),
('PR006', 'Antis Disinfectant Spray 540ml', 15000,540),
('PR007', 'Lifeboy Soap 1000ml', 40000,1000),
('PR008', 'Garnier Soap 720ml', 75000,720),
('PR009', 'WD40 Rust Spray 500ml', 45000,500),
('PR010', 'Rust Cleaner Spray 750ml', 65000,750),
('PR011', 'Waxco Cleaner Spray 840ml', 35000,840),
('PR012', 'Autosol Cleaner Spray 500ml', 70000,500),
('PR013', 'Dettol Pembersih Lantai 550ml', 39000,550),
('PR014', 'Sapu Ijuk Merk Dragon', 37000,700),
('PR015', 'Pel Merk Dragon', 15000,850)


INSERT INTO Purchase_Header (purchaseID,employeeID,supplierID,purchaseDate) VALUES 
('PU001', 'EM004', 'SU007', '2022-04-15'),
('PU002', 'EM011', 'SU001', '2022-07-03'),
('PU003', 'EM001', 'SU003', '2022-11-10'),
('PU004', 'EM010', 'SU012', '2022-01-13'),
('PU005', 'EM002', 'SU005', '2022-05-07'),
('PU006', 'EM005', 'SU008', '2021-12-24'),
('PU007', 'EM006', 'SU011', '2021-10-09'),
('PU008', 'EM009', 'SU013', '2021-04-09'),
('PU009', 'EM001', 'SU001', '2020-03-14'),
('PU010', 'EM012', 'SU009', '2020-06-15'),
('PU011', 'EM005', 'SU007', '2020-06-18'),
('PU012', 'EM003', 'SU001', '2020-07-26'),
('PU013', 'EM015', 'SU008', '2022-02-14'),
('PU014', 'EM006', 'SU003', '2022-09-20'),
('PU015', 'EM003', 'SU013', '2020-05-28')


INSERT INTO Sales_Header (salesID,employeeID,customerID,transactionDate) VALUES 
('TR001', 'EM005', 'CU008', '2022-04-20'),
('TR002', 'EM012', 'CU002', '2022-07-05'),
('TR003', 'EM002', 'CU004', '2022-11-15'),
('TR004', 'EM011', 'CU013', '2022-01-18'),
('TR005', 'EM003', 'CU006', '2022-05-17'),
('TR006', 'EM005', 'CU008', '2021-12-26'),
('TR007', 'EM007', 'CU013', '2021-10-10'),
('TR008', 'EM010', 'CU015', '2021-04-13'),
('TR009', 'EM002', 'CU005', '2020-03-20'),
('TR010', 'EM013', 'CU010', '2020-06-24'),
('TR011', 'EM008', 'CU009', '2020-06-29'),
('TR012', 'EM004', 'CU001', '2020-07-20'),
('TR013', 'EM006', 'CU007', '2022-02-10'),
('TR014', 'EM006', 'CU003', '2022-09-11'),
('TR015', 'EM009', 'CU011', '2020-08-22')


INSERT INTO Sales_Detail (salesID,productID,quantityProductSold) VALUES
('TR001','PR002',12),
('TR001','PR010',7),
('TR002','PR004',6),
('TR002','PR001',10),
('TR003','PR012',30),
('TR003','PR005',8),
('TR004','PR010',12),
('TR004','PR001',14),
('TR005','PR011',19),
('TR005','PR015',14),
('TR006','PR014',18),
('TR006','PR007',7),
('TR007','PR015',26),
('TR007','PR002',15),
('TR008','PR003',6),
('TR008','PR008',15),
('TR009','PR013',8),
('TR009','PR011',13),
('TR010','PR014',6),
('TR010','PR001',27),
('TR011','PR015',6),
('TR011','PR005',18),
('TR012','PR008',12),
('TR012','PR006',25),
('TR013','PR009',17),
('TR013','PR004',6),
('TR014','PR001',9),
('TR014','PR010',10),
('TR015','PR012',22),
('TR015','PR015',5)


INSERT INTO Purchase_Detail (purchaseID,productID,quantityProductPurchased) VALUES 
('PU001','PR003',20),
('PU001','PR011',27),
('PU002','PR005',16),
('PU002','PR002',23),
('PU003','PR013',13),
('PU003','PR006',17),
('PU004','PR011',7),
('PU004','PR002',10),
('PU005','PR012',14),
('PU005','PR001',11),
('PU006','PR015',12),
('PU006','PR008',12),
('PU007','PR001',4),
('PU007','PR003',9),
('PU008','PR004',7),
('PU008','PR009',6),
('PU009','PR014',9),
('PU009','PR012',4),
('PU010','PR015',7),
('PU010','PR002',3),
('PU011','PR001',7),
('PU011','PR006',5),
('PU012','PR009',4),
('PU012','PR007',6),
('PU013','PR010',4),
('PU013','PR005',7),
('PU014','PR002',10),
('PU014','PR011',6),
('PU015','PR013',3),
('PU015','PR001',2)
------------------------------------------------------------------------------------------------