create database exc2_codevn6;
use exc2_codevn6;

create table NHANVIEN(
MaNV int primary key auto_increment,
TenNV varchar(30),
MaVT int,
foreign key(MaVT) references VITRI(MaVT),
MaPB int,
foreign key(MaPB) references PHONGBAN(MaPB),
Luong int,
foreign key(Luong) references MUCLUONG(MaML),
NgayVL date
);
create table PHONGBAN(
MaPB int primary key auto_increment,
TenPB varchar(10),
Diachi varchar(40),
NgayTL date,
MaTP int
);
create table VITRI(
MaVT int primary key auto_increment,
Mota varchar(30)
);
create table MUCLUONG(
MaML int primary key auto_increment,
Mucthap int,
Muccao int,
constraint kiemtraluong CHECK (Mucthap >= 500000 AND Muccao<= 1000000)
);

-- Insert data into VITRI table
INSERT INTO VITRI (Mota) VALUES
('Manager'),
('Supervisor'),
('Employee');

-- Insert data into MUCLUONG table
INSERT INTO MUCLUONG (Mucthap, Muccao) VALUES
(500000, 800000),
(600000, 900000),
(700000, 1000000);

-- Insert data into PHONGBAN table
INSERT INTO PHONGBAN (TenPB, Diachi, NgayTL, MaTP) VALUES
('HR', '123 Main Street', '2024-01-01', 1),
('Finance', '456 Oak Avenue', '2024-01-01', 2),
('IT', '789 Pine Road', '2024-01-01', 3);

-- Insert data into NHANVIEN table
INSERT INTO NHANVIEN (TenNV, MaVT, MaPB, Luong, NgayVL) VALUES
('John Tuan', 2, 3, 3, '2023-01-01'),
('Jane Doe', 2, 2, 2, '2023-01-02'),
('Bob Smith', 3, 3, 3, '2023-01-03'),
('John Doe', 1, 1, 1, '2023-01-01');



select MaNV,TenNV from NHANVIEN join PHONGBAN on NHANVIEN.MaPB = PHONGBAN.MaPB where TenPB like 'Finance';
select TenNV from NHANVIEN join VITRI on NHANVIEN.MaVT=VITRI.MaVT join PHONGBAN on NHANVIEN.MaPB = PHONGBAN.MaPB  where VITRI.Mota='Supervisor' and PHONGBAN.TenPB like 'IT';


-- Tìm tên phòng ban có 2 nhân viên có lương 600.000 tro len
select PHONGBAN.TenPB, count(MaNV) as c from PHONGBAN join NHANVIEN on PHONGBAN.MaPB = NHANVIEN.MaPB join MUCLUONG on NHANVIEN.luong = MUCLUONG.MaML where MUCLUONG.mucthap >= 600000 group by (TenPB) having c >= 2;


select * from NHANVIEN join PHONGBAN on NHANVIEN.MaPB = PHONGBAN.MaPB join VITRI on NHANVIEN.MaVT=VITRI.MaVT join MUCLUONG on NHANVIEN.luong = MUCLUONG.MaML;



