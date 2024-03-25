create DATABASE prj301_assignment;
use prj301_assignment;

CREATE TABLE role(
    role_id int PRIMARY KEY IDENTITY(1,1),
    role_name VARCHAR(45)
);
INSERT INTO role(role_name) VALUES ('admin'), ('employee'), ('user');

-- create table customer
CREATE TABLE [user](
    user_id int PRIMARY KEY IDENTITY(1,1),
    fullname VARCHAR(45),
    user_phone VARCHAR(45),
    user_email VARCHAR(45),
    user_identity VARCHAR(45),
    user_address VARCHAR(45),
    username varchar(45),
    password varchar(45),
    role_id int,
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- Thêm dữ liệu cho vai trò admin
INSERT INTO [user] (fullname, user_phone, user_email, user_identity, user_address, username, password, role_id)
VALUES ('Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 'Admin', 1);

-- Thêm dữ liệu cho vai trò user
INSERT INTO [user] (fullname, user_phone, user_email, user_identity, user_address, username, password, role_id)
VALUES
('Phan Thi Tra My', '0856731274', 'mypttde170168@fpt.edu.vn', '123456789012', 'Viet Nam', 'tramy', 'Tramy12345@', 2),
		('Nguyen Thi Thu Nguyet', '0376994321', 'nguyetnttde170280@fpt.edu.vn', '123456789013', 'Trung Quoc', 'nguyet', 'Nguyet12345@', 2),
		('User1 no name', '1234567890', 'user1@gmail.com', '123456789014', 'Han Quoc', 'user1', 'User112345@', 2),
		('User2 no name', '0123456789', 'user2@gmail.com', '123456789015', 'Nhat Ban', 'user2', 'User212345@', 2),
        ('NNPLH', '1234567890', 'nhattvde170159@fpt.edu.vn', '123456789012', 'Viet Nam', 'nnplmh', 'Nnplmh123@', 3);

-- create table category
CREATE TABLE category(
    category_id int PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(45)
);
INSERT INTO category(category_name) VALUES ('Xe tay ga'), ('Xe so'), ('Xe dien'), ('Xe 50cc'), ('Xe phan khoi lon')
select * from category;

    -- create table product
CREATE TABLE [dbo].[Product]
(
    [id] [int] PRIMARY KEY IDENTITY(1,1),
    [name] [nvarchar](200) NULL,
    [image] [nvarchar](500) NULL,
    [price] [float] NULL,
    [title] [nvarchar](500) NULL,
    [description] [nvarchar](max) NULL,
    [cateID] [int] NOT NULL,
    FOREIGN KEY ([cateID]) REFERENCES [dbo].[Category]([category_id]),
    [sell_ID] [int] NOT NULL,
    [model] [nvarchar](50) NULL,
    [color] [nvarchar](50) NULL,
    [delivery] [nvarchar](50) NULL,
    [image2] [nvarchar](500) NULL,
    [image3] [nvarchar](500) NULL,
    [image4] [nvarchar](500) NULL
);

delete from [dbo].[Product] where id in (7,8,9,10,11,12,13,14,15,16,17,18,19);

--Bình thường 20                                                                                                                                                                                                                            --('Xe tay ga'), ('Xe so'), ('Xe dien'), ('Xe 50cc'), ('Xe phan khoi lon')
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('EXCITER 150', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Exciter-155-VVA-Black-Gold-ABS4.png', 55.000, 'EXCITER 155', '', 2, 0, 'YMH - 001', 'XANH - ĐEN - XÁM - TRẮNG', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Exciter-155-VVA-Cyan-ABS4.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Exciter-155-VVA-Grey-Mint-ABS4.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Exciter-155-VVA-White-ABS4.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('JUPITER FI', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/Jupiter-Mat-Black-004-1.png', 30.400, 'JUPITER FI', '', 2, 0, 'YMH - 002', 'TRẮNG - ĐEN - XÁM - ĐỎ', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/Jupiter-Mat-Grey-004-1.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/2022_T115FS-5LTD_MS1_VNM_004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/Jupiter-Dark-Red-Metallic-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('PG-1', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/PG1-Cyan-004.png', 30.200, 'PG1 - LẦN ĐẦU TIÊN CÓ MẶT TẠI VIỆT NAM', '', 2, 0, 'YMH - 003', 'XANH - XÁM - VÀNG - ĐỎ', 'Đà Nẵng', 'hhttps://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/PG1-yellow-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/PG1-milky-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/PG1-orange-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('JANUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/07/New-Janus-Mat-Blue-SMK-4.png', 32.400, 'JANUS PHIÊN BẢN ĐẶC BIỆT HOÀN TOÀN MỚI MÀU MỚI', '', 1, 0, 'YMH - 004', 'XANH - ĐEN - ĐỎ - TRẮNG', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/07/Janus-Premium-Red-Metallic4.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/07/New-Janus-Black-Metallic-SMK-4.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/New-Janus-Mat-White-SMK-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('NVX 155', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/NVX-Pearl-Blue-004-1.png', 55.000, 'NVX 155 VVA MÀU HOÀN TOÀN MỚI', '', 1, 0, 'YMH - 005', 'XANH - ĐEN - XÁM - TRẮNG', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/NVX-Black-Mat-Gray-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/NVX-Gray-Green-004-1.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/11/NVX-Red-Candy-Gold-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('YZF - R15', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/09/R15-GP-004.png', 78.000, 'YZF-R15 HOÀN TOÀN MỚI', '', 5, 0, 'YMH - 006', 'XANH - ĐEN - TRẮNG', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/09/R15-Black-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/09/R15M-Silver-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/09/R15M-Anni-60th-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('GRANDE', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/Grande-2023-Pink-Orange-004.png', 51.546, 'GRANDE PHIÊN BẢN GIỚI HẠN MÀU HOÀN TOÀN MỚI', '', 1, 0, '', 'HỒNG ĐEN - ĐEN - ĐEN HỒNG - XÁM ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/Grande-2023-Black-Metallic-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/Grande-2023-Mat-Black-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/Grande-2023-Mat-Grey-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('GRANDE', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/Grande-2023-Pre-Dark-Red-Metalic-004.png', 50.760, 'GRANDE PHIÊN BẢN ĐẶC BIỆT MÀU HOÀN TOÀN MỚI', '', 1, 0, '', 'ĐỎ ĐEN - TRẮNG ĐEN - ĐEN - XANH ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/New-Grande-Premium-Pearl-White-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/New-Grande-Premium-Black-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/10/New-Grande-Premium-Cyan-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('FREEGO S', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/12/FreeGo-Black-Red-SMK-004-2.png', 34.265, 'FREEGO S PHIÊN BẢN ABS MÀU HOÀN TOÀN MỚI', '', 1, 0, '', 'ĐEN ĐỎ - ĐEN - XANH ĐEN - XÁM ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/12/FreeGo-Black-Gold-SMK-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/12/FreeGo-Mat-Blue-SMK-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/12/FreeGo-Blue-Gray-SMK-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('FREEGO S', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/FreeGo-Mat-Red-SMK-004.png', 34.069, 'FREEGO S PHIÊN BẢN ĐẶC BIỆT MÀU HOÀN TOÀN MỚI', '', 1, 0, '', 'ĐỎ ĐEN - XÁM ĐEN - XANH ĐEN - XANH ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/FreeGo-Mat-Grey-SMK-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/FreeGo-Mat-Green-SMK-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/FreeGo-Mat-Blue-SMK-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('LATTE', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/05/Latte-Mat-Dark-Blue-004.png', 38.095, 'LATTE PHIÊN BẢN TIÊU CHUẨN', '', 1, 0, '', 'XANH - TRẮNG - ĐEN - ĐỎ', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/05/2022_LTS125-F_MYWP1_VNM_001.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/05/2022_LTS125-F_MBL2_VNM_001.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/05/2022_LTS125-F_DRMK_VNM_001.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('JUPITER FINN', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/07/Jupiter-Finn-Silver-Metallic-004.png', 28.178, 'JUPITER FINN HOÀN TOÀN MỚI PHIÊN BẢN CAO CẤP', '', 2, 0, '', 'BẠC - XANH - XÁM - VÀNG', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/07/Jupiter-Finn-Urban-Blue-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/07/Jupiter-Finn-Grey-Metallic-005-1.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/07/Jupiter-Finn-Gold-Metallic-004-e1698747580256.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SIRIUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/462d5adf889047415dabe0497d01aaee.png', 20.913, 'SIRIUS PHIÊN BẢN PHANH DĨA', '', 2, 0, '', 'ĐỎ ĐEN - TRẮNG XANH - XÁM ĐEN - ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/73ffc462df4aaf94b8c4e8656a1638ed.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/40ac77411dd0b112ab69b41d63546087.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/a5c4b8f155a58e62cb8f01f6d90c03f8.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SIRIUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/e20db099ac268221f76e4587d74cd453.png', 21.895, 'SIRIUS PHIÊN BẢN RC VÀNH ĐÚC', '', 2, 0, '', 'XANH XÁM - XÁM XANH - XÁM VÀNG - ĐEN BẠC', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/55f930934dc36ddcbeb5ea861fecd44f.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/ca0b5e5c317328c3c055b4e4237b78be.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/04/61d4664da9afdd87e0ace75cfaed7d40.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SIRIUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Hub-Black-Blue-004.png', 21.208, 'SIRIUS FI PHIÊN BẢN PHANH CƠ MÀU HOÀN TOÀN MỚI', '', 2, 0, '', 'ĐEN XÁM - XÁM - ĐỎ XÁM - TRẮNG ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Hub-Dark-Grey-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Hub-Dark-Red-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Hub-White-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SIRIUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Disk-Black-Blue-004.png', 22.386, 'SIRIUS FI PHIÊN BẢN PHANH ĐĨA MÀU HOÀN TOÀN MỚI', '', 2, 0, '', 'ĐEN XÁM - XÁM - ĐỎ XÁM - TRẮNG ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Disk-Dark-Grey-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Disk-Dark-Red-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-Disk-White-004.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SIRIUS', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-RC-Blue-004.png', 23.957, 'SIRIUS FI PHIÊN BẢN VÀNH ĐÚC MÀU HOÀN TOÀN MỚI', '', 2, 0, '', 'XANH BẠC - ĐEN - XÁM ĐEN - BẠC ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-RC-Mat-Black-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-RC-Mat-Grey-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/09/Sirius-Fi-RC-Mat-Silver-004-e1698747111365.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('NEOs', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/12/Neos-Black-Metallic-004.png', 49.091, 'NEOs', '', 3, 0, '', 'ĐEN - TRẮNG - XANH', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/12/Neos-White-Metallic-004.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/12/Neos-Cyan-Metallic-Metallic-004.png', '');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('XS155R', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/12/XSR-155-Silver-Mat-004.png', 77.000, 'XS155R', '', 5, 0, '', 'BẠC - ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/12/XSR-155-Black-Metallic-004.png', '', '');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('MT-03', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/03/2021_MTN320-A_PGD_USA_MT-03_Storm-Fluo_360_036-1.png', 129.000, 'MT-03', '', 5, 0, '', 'XÁM - XANH XÁM - ĐEN - XANH ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/03/2021_MTN320_DPBMC_THA_STU_001_03.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/03/44cab4b6e499dc53fcf46972c853e0b4.png', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2022/03/9bde67448ceb72a53fd91d70139adb3f.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('MT-15', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/06/MT-15-B8D9-xanh-den-goc-1.png', 69.000, 'MT-15', '', 5, 0, '', 'XANH ĐEN - ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/06/2-1.png', '', '');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SH350i', 'https://cdn.honda.com.vn/motorbike-versions/December2022/VlhEoBOm76qFSuONryD1.png', 150.990, 'SH350i', '', 1, 0, '', 'TRẮNG ĐEN - ĐEN - XÁM ĐEN - ĐỎ ĐEN', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/December2022/pxNbshmGP0Oz6VXFSZrb.png', 'https://cdn.honda.com.vn/motorbike-versions/December2022/P4lOHj5zGCSJx9REs9UE.png', 'https://cdn.honda.com.vn/motorbike-versions/December2022/AQRi0Spd16REq2TErCvH.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SH125i', 'https://cdn.honda.com.vn/motorbike-versions/August2023/dRxlGKvDbVFbdEyfzYVc.png', 81.775, 'SH125i', '', 1, 0, '', 'ĐỎ ĐEN - TRẮNG ĐEN - XÁM ĐEN - ĐEN', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/August2023/xuwZYLccMzRtQQ1Q1F6T.png', 'https://cdn.honda.com.vn/motorbike-versions/August2023/7voG190mBvn0pXoOjQab.png', 'https://cdn.honda.com.vn/motorbike-versions/August2023/h6SniFtV3NrVJMX8U2wo.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('SH mode 125', 'https://cdn.honda.com.vn/motorbike-versions/November2023/RI9HA03RctDKIEfIAtep.png', 62.139, 'SH mode 125', '', 1, 0, '', 'ĐỎ ĐEN - XANH ĐEN - ĐEN - BẠC ĐEN', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/November2023/WgsY2hZSxTBvDGkdAabm.png', 'https://cdn.honda.com.vn/motorbike-versions/November2023/RYMVL9RgWVLLp77xMuvG.png', 'https://cdn.honda.com.vn/motorbike-versions/November2023/4dd7eTtZBi28nEmMZioX.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('Air Blade 160', 'https://cdn.honda.com.vn/motorbike-versions/May2022/dHnhsdsKKiOZk6dOzySu.png', 57.890, 'Air Blade 160', '', 1, 0, '', 'XANH ĐEN - ĐEN XÁM - XANH XÁM - ĐỎ XÁM', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/May2022/af39Wkq7omien7taAe7l.png', 'https://cdn.honda.com.vn/motorbike-versions/May2022/HEw0HooI3tuxxgldLrO8.png', 'https://cdn.honda.com.vn/motorbike-versions/May2022/PEiUaPMsomi2Pec1K7Nc.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('Vision', 'https://cdn.honda.com.vn/motorbike-versions/September2023/HNtWMUQe1hSi8Nd1H2gU.png', 36.612, 'Vision phiên bản cổ điển', '', 1, 0, '', 'VÀNG ĐEN - XANH ĐEN', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/September2023/Z3DDcTichRiz8qvdRQF3.png', '', '');
--Lỏ 3
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('VARIO 160', 'https://cdn.honda.com.vn/motorbike-versions/December2022/9zVYrkyMgtcTsdthXVpi.png', 51.990, 'VARIO 160', '', 1, 0, '', 'XANH ĐEN - ĐỎ ĐEN - XÁM ĐEN - ĐEN BẠC', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/December2022/3NsTtbQnERXX3VDbaoks.png', 'https://cdn.honda.com.vn/motorbike-versions/December2022/Ufx6u07tHnZnivT1JHz7.png', 'https://cdn.honda.com.vn/motorbike-versions/December2022/GOm5BBZcpHe2Pu6RWNgh.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('LEAD 125', 'https://cdn.honda.com.vn/motorbike-versions/December2021/uL67srpcKiBCGkqAiy1T.png', 41.717, 'LEAD 125', '', 1, 0, '', 'ĐỎ - XANH - ĐEN - BẠC', 'Đà Nẵng', 'https://cdn.honda.com.vn/motorbike-versions/December2021/epNFnKrqwGBz8iJaWhpM.png', 'https://cdn.honda.com.vn/motorbike-versions/December2021/cjemdZcKqzQyG0jdM9rQ.png', 'https://cdn.honda.com.vn/motorbike-versions/December2021/mgvxKwELJOgXx3riDeWj.png');
insert into product(name, [image], price, title, [description], cateID, sell_ID, model, color, delivery, image2, image3, image4) VALUES ('YZF-R3', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/R3_GP-240-1.png', 132.000, 'YZF-R3', '', 5, 0, '', 'XANH - ĐEN', 'Đà Nẵng', 'https://yamaha-motor.com.vn/wp/wp-content/uploads/2023/03/R3_Black-120.png', '', '');

-- review
CREATE TABLE [dbo].[Review]
(
    [accountID] [int],
    FOREIGN KEY ([accountID]) REFERENCES [user](user_id),
    [productID] [int],
    FOREIGN KEY ([productID]) REFERENCES Product(id),
    [contentReview] [nvarchar](500) NULL,
    [dateReview] [date] NULL,
    [maReview] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [rating] [int]
);

-- hoa don
CREATE TABLE [dbo].[Invoice]
(
    [maHD] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [accountID] [int] NULL,
    [tongGia] [float] NULL,
    [ngayXuat] [datetime] NULL
);

-- hien thi phan thong tin cua shop
CREATE TABLE [dbo].[TongChiTieuBanHang](
	[userID] [int] NULL,
	[TongChiTieu] [float] NULL,
	[TongBanHang] [float] NULL
)
CREATE TABLE [dbo].[SoLuongDaBan](
	[productID] [int] NULL,
	[soLuongDaBan] [int] NULL
)





SELECT TOP 2 p.*, COUNT(r.productID) AS TotalReviews
FROM Product p
LEFT JOIN Review r ON p.id = r.productID
GROUP BY p.id, p.name, p.image, p.price, p.title, p.description, p.cateID, p.sell_ID, p.model, p.color, p.delivery, p.image2, p.image3, p.image4
ORDER BY TotalReviews DESC;


insert into [User] values ('',?,?,?,?,?,?,3);

