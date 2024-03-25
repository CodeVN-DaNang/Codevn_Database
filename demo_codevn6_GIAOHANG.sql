create database demo_codevn6_GIAOHANG;
use demo_codevn6_GIAOHANG;

create table DONHANG_GIAOHANG(
    madonhanggiaohang varchar(45) primary key,
    makhachhang varchar(45),
    foreign key (makhachhang) references KHACHANG(makhachhang),
    mathanhviengiaohang varchar(45),
    foreign key (mathanhviengiaohang) references THANHVIENGIAOHANG(mathanhviengiaohang),
    madichvu varchar(45),
    foreign key (madichvu) references DICHVU(madichvu),
    makhuvucgiaohang varchar(45),
    foreign key (makhuvucgiaohang) references KHUVUC(makhuvuc),
    tennguoinhan varchar(45),
    diachigiaohang varchar(50),
    soDTnguoinhan int,
    makhoangthoigiangiaohang varchar(45),
    foreign key (makhoangthoigiangiaohang) references KHOANGTHOIGIAN(makhoangthoigian),
    ngaygiaohang date,
    phuongthucthanhtoan varchar(45),
    trangthapheduyet varchar(45),
    trangthagiaohang varchar(45)
);
alter table donhang_giaohang
        modify phuongthucthanhtoan varchar(45);

    
create table KHACHANG(
	makhachhang varchar(45) primary key ,
    makhuvuc varchar(45),
    foreign key (makhuvuc) references KHUVUC(makhuvuc),
    tenkhachhang varchar(45),
    tencuahang varchar(45),
    soDTkhachhang int,
    diachiEmail varchar(45),
    diachinhanhang varchar (45)
);
create table KHUVUC( 
makhuvuc varchar(45) primary key ,
tenkhuvuc varchar(45)
);

create table KHOANGTHOIGIAN(
makhoangthoigian varchar(45) primary key ,
mota varchar(45)
);

-- alter table [ten_bang]
--         modify [tencot] varchar(45);


create table DICHVU(
madichvu varchar(45) primary key,
tendichvu varchar(45)
);

create table LOAIMATHANG(
maloaimathang varchar(45) primary key,
tenloaimathang varchar(45)
);
create table DANGKYGIAOHANG(
mathanhviengiaohang varchar(45),
foreign key (mathanhviengiaohang) references THANHVIENGIAOHANG(mathanhviengiaohang),
makhoangthoigiangiaohang varchar(45),
foreign key (makhoangthoigiangiaohang) references KHOANGTHOIGIAN(makhoangthoigian)
);



create table THANHVIENGIAOHANG(
mathanhviengiaohang varchar(45) primary key,
tenthanhviengiaohang varchar(45),
ngaysinh date,
gioitinh varchar(45),
soDTthanhvien int,
diahithanhvien varchar(45)
);

create table CHITIET_DONHANG(
madonhanggiaohang varchar(45),
tensanphamduocgiao varchar(45),
soluong int,
trongluong int,
maloaimathang varchar(45),
foreign key (maloaimathang) references LOAIMATHANG(maloaimathang),
tienthuho double
);

-- Chèn dữ liệu giả vào bảng 'khoangthoigian'
INSERT INTO khoangthoigian(makhoangthoigian, mota)
VALUES ('KTG001', '08:00:00'),
       ('KTG002', '09:00:00'),
       ('KTG003', '10:00:00'),
       ('KTG004', '11:00:00'),
       ('KTG005', '12:00:00');
-- done       

-- Chèn dữ liệu giả vào bảng 'khuvuc'
INSERT INTO khuvuc(makhuvuc, tenkhuvuc)
VALUES ('KV001', 'Khu vực 1'),
       ('KV002', 'Khu vực 2'),
       ('KV003', 'Khu vực 3'),
       ('KV004', 'Khu vực 4'),
       ('KV005', 'Khu vực 5');
       -- done
       
insert into loaimathang(maloaimathang, tenloaimathang)
values 	('MH001', 'quan ao'),
		('MH002', 'my pham'),
        ('MH003', 'do gia dung'),
        ('MH004', 'do dien tu');
        -- done
        
INSERT INTO dichvu(madichvu, tendichvu)
VALUES  ('DV001', 'giao hang nguoi nhan tra tien phi'),
		('DV002', 'giao hang nguoi gui tra tien phi'),
        ('DV003', 'giao hang cong ich(khong tinh phi)');
        
insert into DONHANG_GiAOHANG VALUES ('DH0001','KH001','TV001','DV001','KV001','Phan Van A','30 Hoang Van Thu','0905111111','KTG004','2016/10/10','Tien mat','Da phe duyet',' Da giao hang'),
('DH0002','KH001','TV002','DV001','KV005','Phan Van B','15 Le Dinh Ly','0905111112','KTG005','2016/4/8','Tien mat','Da phe duyet',' Chua giao hang'),
('DH0003','KH002','TV003','DV001','KV005','Phan Van C','23 Le Dinh Duong','0905111113','KTG005','2017/10/11','Tien mat','Da phe duyet',' Da giao hang'),
('DH0004','KH002','TV003','DV001','KV005','Phan Van D','23 Le Dinh Duong','0905111114','KTG001','2016/4/4','Chuyen khoan','Da phe duyet',' Da giao hang'),
('DH0005','KH003','TV005','DV003','KV003','Phan Van E','78 Hoang Dieu','0905111115','KTG001','2016/4/9','Chuyen khoan','Chua phe duyet',' Da giao hang');

INSERT INTO chitiet_donhang(madonhanggiaohang, tensanphamduocgiao, soluong, trongluong, maloaimathang, tienthuho )
VALUES	('DH0001', 'ao len', 2, 5, 'MH001', 200000.00),
		('DH0001', 'quan au', 1, 25, 'MH002', 350000.00),
        ('DH0002', 'ao thun', 1, 25, 'MH003', 1000000.00),
        ('DH0002', 'ao khoac', 3, 25, 'MH003', 2000000.00),
        ('DH0003', 'sua duong the', 2, 25, 'MH003', 780000.00),
        ('DH0003', 'kem tay da chet', 3, 5, 'MH004', 150000.00),
        ('DH0003', 'kem duong ban dem', 4, 25, 'MH004', 900000.00);

-- Inserting data into THANHVIENGIAOHANG table
INSERT INTO THANHVIENGIAOHANG (mathanhviengiaohang, tenthanhviengiaohang, ngaysinh, gioitinh, soDTthanhvien, diahithanhvien) VALUES ('TV001','Nguyen Van  A', '1995-11-20', 'Nam', 0905111111, '23 Ong Tich Khiem');
INSERT INTO THANHVIENGIAOHANG (mathanhviengiaohang, tenthanhviengiaohang, ngaysinh, gioitinh, soDTthanhvien, diahithanhvien) VALUES ('TV002','Nguyen Van  B', '1992-12-26', 'Nu', 0905111112,  '234 Ton Duc Thang');
INSERT INTO THANHVIENGIAOHANG (mathanhviengiaohang, tenthanhviengiaohang, ngaysinh, gioitinh, soDTthanhvien, diahithanhvien) VALUES ('TV003','Nguyen Van  C', '1990-11-30', 'Nu', 0905111113, '45 Hoang Dieu');
INSERT INTO THANHVIENGIAOHANG (mathanhviengiaohang, tenthanhviengiaohang, ngaysinh, gioitinh, soDTthanhvien, diahithanhvien) VALUES ('TV004','Nguyen Van  D', '1995-7-8', 'Nam', 0905111114, '23/33 Ngu Hanh Son');
INSERT INTO THANHVIENGIAOHANG (mathanhviengiaohang, tenthanhviengiaohang, ngaysinh, gioitinh, soDTthanhvien, diahithanhvien) VALUES ('TV005','Nguyen Van  E', '1991-2-4', 'Nam', 0905111115, '56 Dinh Thi Dieu');
-- done

-- Inserting data into DANGKYGIAOHANG table
INSERT INTO DANGKYGIAOHANG (mathanhviengiaohang, makhoangthoigiangiaohang) VALUES ('TV001','KTG004');
INSERT INTO DANGKYGIAOHANG (mathanhviengiaohang, makhoangthoigiangiaohang) VALUES ('TV002','KTG005');
INSERT INTO DANGKYGIAOHANG (mathanhviengiaohang, makhoangthoigiangiaohang) VALUES ('TV003','KTG001');
INSERT INTO DANGKYGIAOHANG (mathanhviengiaohang, makhoangthoigiangiaohang) VALUES ('TV003','KTG002');
INSERT INTO DANGKYGIAOHANG (mathanhviengiaohang, makhoangthoigiangiaohang) VALUES ('TV003','KTG003');
-- done

INSERT INTO KHACHANG (makhachhang, makhuvuc, tenkhachhang, tencuahang, soDTkhachhang, diachiEmail, diachinhanhang)
VALUES ('KH001', 'KV001', 'Le Thi A', 'Store1', 0905111111, 'alethi@email.com', 'Address1'),
       ('KH002', 'KV002', 'Nguyen Van B', 'Store2', 0905111112, 'bnguyenvan@email.com', 'Address2'),
       ('KH003', 'KV003', 'Nguyen Thi C', 'Store3', 0905111113, 'cnguyenthi@email.com', 'Address3'),
       ('KH004', 'KV004', 'Nguyen Van C', 'Store4', 0905111114, 'cnguyenvan@email.com', 'Address4'),
       ('KH005', 'KV005', 'Le Thi D', 'Store5', 0905111115, 'dlethi@email.com', 'Address5');
       -- done
       
       
