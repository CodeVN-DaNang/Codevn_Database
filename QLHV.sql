Create database QLHV

Create table KHOA
( MAKHOA varchar(4)primary key,
  TENKHOA varchar(40),
  NGTLAP smalldatetime,
  TRGKHOA char(4) )
--MONHOC
Create table MONHOC 
( MAMH varchar(10)primary key,
  TENMH varchar (40),
  TCLT tinyint,
  TCTH tinyint,
  MAKHOA varchar(4)references KHOA(MAKHOA) )
 --DIEUKIEN
Create table DIEUKIEN
( MAMH varchar(10)references MONHOC(MAMH),
  MAMH_TRUOC varchar(10),
  constraint KHOACHINH primary key (MAMH,MAMH_TRUOC) )
--giaovien
Create table GIAOVIEN
( MAGV char(4)primary key,
  HOTEN varchar(50),
  HOCVI varchar(10),
  HOCHAM varchar(10),
  GIOITINH varchar(3),
  NGSINH smalldatetime,
  NGVL smalldatetime,
  HESO numeric(4,2),
  MUCLUONG money,
  MAKHOA varchar(4) references KHOA(MAKHOA) ) 
  --lop
 Create table LOP
 ( MALOP char(3)primary key,
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4))
	---HOC vien
 Create table HOCVIEN 
 (	MAHV char(5) primary key,
	HO varchar(40),
	TEN varchar(20),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3) references LOP(MALOP))
---GIANG DAY
Create table GIANGDAY
( MALOP char(3)references LOP(MALOP),
  MAMH varchar (10) references MONHOC(MAMH),
  MAGV char(4)references GIAOVIEN(MAGV),
  HOCKY tinyint,
  NAM smallint,
  TUNGAY smalldatetime,
  DENNGAY smalldatetime,
  constraint KHOACC primary key (MALOP,MAMH))
---KET QUA THI
	Create table KETQUATHI 
	( MAHV char (5) references HOCVIEN(MAHV),
	 MAMH varchar(10) references MONHOC(MAMH),
	 LANTHI tinyint,
	 NGTHI smalldatetime,
	 DIEM numeric(4,2),
	 KQUA varchar(10),
	constraint KHOAKK primary key (MAHV,MAMH,LANTHI))

--khoa
insert into KHOA values ('KHMT',N'Khoa hoc may tinh ',7/6/2005,'GV01')
insert into KHOA values ('HTTT',N'He thong thong tin ',7/6/2005,'GV02')
insert into KHOA values ('CNPM',N'Cong nghe phan mem ',7/6/2005,'GV04')
insert into KHOA values ('MTT',N'Mang va truyen thong ',20/10/2005,'GV03')
insert into KHOA values ('KTMT',N'Ki thuat may tinh ',20/12/2005,null)
--mon 
insert into MONHOC values ('THDC',N'Tin hoc dai cuong ',4,1,'KHMT')
insert into MONHOC values ('CTRR',N'Cau truc roi rac ',5,0,'KHMT')
insert into MONHOC values ('CSDL',N'Co so du lieu ',3,1,'HTTT')
insert into MONHOC values ('CTDLGT',N'Cau truc du lieu va giai thuat ',3,1,'KHMT')
insert into MONHOC values ('PTTKTT',N'Phan tich thiet ke thuat toan ',3,0,'KHMT')
insert into MONHOC values ('DHMT',N'Do hoa may tinh ',3,1,'KHMT')
insert into MONHOC values ('KTMT',N'Kien truc may tinh ',3,0,'KTMT')
insert into MONHOC values ('TKCSDL',N'Thiet ke co so du lieu ',3,1,'HTTT')
insert into MONHOC values ('PTTKHTTT',N'Phan tich thiet ke he thong thong tin ',4,1,'HTTT')
insert into MONHOC values ('HDH',N'He dieu hanh ',4,0,'KTMT')
insert into MONHOC values ('NMCNPM',N'Nhap mon cong nghe pham mem ',3,0,'CNPM')
insert into MONHOC values ('LTCFW',N'Lap trinh C for Win ',3,1,'CNPM')
insert into MONHOC values ('LTHDT',N'Lap trinh huong doi tuong ',3,1,'CNPM')
--dieu kien
insert into DIEUKIEN values ('CSDL','CTRR')
insert into DIEUKIEN values ('CSDL','CTDLGT')
insert into DIEUKIEN values ('CTDLGT','THDC')
insert into DIEUKIEN values ('PTTKTT','THDC')
insert into DIEUKIEN values ('PTTKTT','CTDLGT')
insert into DIEUKIEN values ('DHMT','THDC')
insert into DIEUKIEN values ('LTHDT','THDC')
insert into DIEUKIEN values ('PTTKHTTT','CSDL')
--giao vien
insert into GIAOVIEN values ('GV01','Ho Than Son','PTS','GS','Nam',2/5/1950,11/1/2004,5.00,2250000,'KHMT')
insert into GIAOVIEN values ('GV02','Tran Tam Thanh','TS','PGS','Nam',17/12/1965,20/4/2004,4.50,2025000,'HTTT')
insert into GIAOVIEN values ('GV03','DO Nghiem Phung','TS','GS','Nu',1/8/1950,23/9/2004,4.00,1800000,'CNPM')
insert into GIAOVIEN values ('GV04','Tran Nam Son','TS','PGS','Nam',22/2/1961,12/1/2005,4.50,2025000,'KTMT')
insert into GIAOVIEN values ('GV05','Mai Thanh Danh','ThS','GV','Nam',12/03/1958,12/1/2005,3.00,1350000,'HTTT')
insert into GIAOVIEN values ('GV06','Tran Doan Hung','TS','GV','Nam',11/3/1953,12/1/2005,4.50,2025000,'KHMT')
insert into GIAOVIEN values ('GV07','Nguyen Minh Tien','ThS','GV','Nam',23/1/1971,1/3/2005,4.00,1800000,'KHMT')
insert into GIAOVIEN values ('GV08','Le Thi Tran','KS',Null,'Nu',26/3/1974,1/3/2005,1.69,760500,'KHMT')
insert into GIAOVIEN values ('GV09','Nguyen To Lan','ThS','GV','Nu',31/12/1966,1/3/2005,4.00,1800000,'HTTT')
insert into GIAOVIEN values ('GV10','Le Tran ANh Loan','KS',Null,'Nu',17/7/1972,1/3/2005,1.86,837000,'CNPM')
insert into GIAOVIEN values ('GV11','Ho Thanh Tung','CN','GV','Nam',12/1/1980,15/5/2005,2.67,1201500,'MTT')
insert into GIAOVIEN values ('GV12','Tran Van Anh','CN',Null,'Nu',29/3/1981,15/5/2005,1.69,760500,'CNPM')
insert into GIAOVIEN values ('GV13','Nguyen Lih Dan','CN',Null,'Nu',23/5/1980,15/5/2005,1.69,760500,'KTMT')
insert into GIAOVIEN values ('GV14','Truong Minh Chau','ThS','GV','Nu',30/11/1976,15/5/2005,3.00,1350000,'MTT')
insert into GIAOVIEN values ('GV15','Le Ha Thanh','ThS','GV','Nam',4/5/1978,15/5/2005,3.00,1350000,'KHMT')
--Giang d?y
insert into LOP values ('K11','Lop 1 khoa 1','K1108',11,'GV07')
insert into LOP values ('K12','Lop 2 khoa 1','K1205',11,'GV09')
insert into LOP values ('K13','Lop 3 khoa 1','K1305',11,'GV14')
--hoc vien
insert into HOCVIEN values ('K1101','Nguyen Van','A',1986/1/27,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1102','Tran Ngoc','Han',14/3/1986,'Nu','Kien Giang','K11')
insert into HOCVIEN values ('K1103','Ha Duy','Lap',18/4/1986,'Nam','Nghe An','K11')
insert into HOCVIEN values ('K1104','Tran Ngoc','Linh',30/3/1986,'Nu','Tay Ninh','K11')
insert into HOCVIEN values ('K1105','Tran Minh','Long',27/2/1986,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1106','Le Nhat','Minh',24/1/1986,'Nam','tpHCM','K11')
insert into HOCVIEN values ('K1107','Nguyen Nhu','Nhut',27/1/1986,'Nam','Ha Noi','K11')
insert into HOCVIEN values ('K1108','Nguyen Manh','Tam',27/2/1986,'Nam','Kien Giang','K11')
insert into HOCVIEN values ('K1109','PHan Thi Thanh','Tam',27/1/1986,'Nu','Vinh Long','K11')
insert into HOCVIEN values ('K1110','Le Hoai','Thuong',5/2/1986,'Nu','Can Tho','K11')
insert into HOCVIEN values ('K1111','Le Ha','Vinh',25/12/1986,'Nam','Vinh Long','K11')
insert into HOCVIEN values ('K1201','Nguyen Van ','B',11/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1202','Nguyen Thi Kim ','Duyen',18/1/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1203','Tran Thi Kim','Duyen',17/9/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1204','Truong My ','Hanh',19/5/1986,'Nu','Dong Nai','K12')
insert into HOCVIEN values ('K1205','Nguyen Thanh ','Nam',17/4/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1206','Nguyen Thi Truc ','Thanh',4/3/1986,'Nu','Kien Giang','K12')
insert into HOCVIEN values ('K1207','Tran Thi Bich ','Thuy',8/2/1986,'Nu','Nghe An','K12')
insert into HOCVIEN values ('K1208','Huynh Thi Kim','Trieu',8/4/1986,'Nu','Tay Ninh','K12')
insert into HOCVIEN values ('K1209','Phan Thanh  ','Trieu',23/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1210','Ngo Thanh ','Tuan',14/2/1986,'Nam','tpHCM','K12')
insert into HOCVIEN values ('K1211','Do Thi  ','Xuan',9/3/1986,'Nu','Ha Noi','K12')
insert into HOCVIEN values ('K1212','Le Thi Phi ','Yen',12/3/1986,'Nu','tpHCM','K12')
insert into HOCVIEN values ('K1301','Nguyen Thi Kim ','Cuc',9/6/1986,'Nu','Kien Giang','K13')
insert into HOCVIEN values ('K1302','Truong Thi My  ','Hien',18/3/1986,'Nu','Nghe An','K13')
insert into HOCVIEN values ('K1303','Le Duc ','Hien',21/3/1986,'Nam','Tay Ninh','K13')
insert into HOCVIEN values ('K1304','Le QUang ','Hien',18/4/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1305','Le Thi','Huong',27/3/1986,'Nu','tpHCM','K13')
insert into HOCVIEN values ('K1306','Nguyen Thai ','Huu',30/3/1986,'Nam','Ha Noi','K13')
insert into HOCVIEN values ('K1307','Tran Minh ','Man',28/5/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1308','Nguyen Hieu ','Nghia',8/4/1986,'Nam','Kien Giang','K13')
insert into HOCVIEN values ('K1309','Nguyen Trung ','Nghia',18/1/1986,'Nam','Nghe An','K13')
insert into HOCVIEN values ('K1310','Tran Thi Hong ','Tham',22/4/1986,'Nu','Tay Ninh','K13')
insert into HOCVIEN values ('K1311','Tran Minh  ','Thuc',4/4/1986,'Nam','tpHCM','K13')
insert into HOCVIEN values ('K1312','Nguyen Thi Kim ','Yen',7/9/1986,'Nu','tpHCM','K13')
----giang day
insert into GIANGDAY values ('K11','THDC','GV07',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K12','THDC','GV08',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K13','THDC','GV15',1,2006,2/1/2006,12/5/2006)
insert into GIANGDAY values ('K11','CTRR','GV02',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K12','CTRR','GV02',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K13','CTRR','GV08',1,2006,9/1/2006,17/5/2006)
insert into GIANGDAY values ('K11','CSDL','GV05',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K12','CSDL','GV09',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K13','CTDLGT','GV15',2,2006,1/6/2006,15/7/2006)
insert into GIANGDAY values ('K13','CSDL','GV05',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K13','DHMT','GV07',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K11','CTDLGT','GV15',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K12','CTDLGT','GV15',3,2006,1/8/2006,15/12/2006)
insert into GIANGDAY values ('K11','HDH','GV04',1,2007,2/1/2007,18/2/2007)
insert into GIANGDAY values ('K12','HDH','GV04',1,2007,2/1/2007,20/3/2007)
insert into GIANGDAY values ('K11','DHMT','GV07',1,2007,18/2/2007,20/3/2007)
---Ket qua thi
insert KETQUATHI values ('K1101','CSDL',1,20/7/2006,10,'Dat')
insert KETQUATHI values ('K1101','CTDLGT',1,28/12/2006,9,'Dat')
insert KETQUATHI values ('K1101','THDC',1,20/5/2006,9,'Dat')
insert KETQUATHI values ('K1101','CTRR',1,13/5/2006,9.50,'Dat')
insert KETQUATHI values ('K1102','CSDL',1,20/7/2006,4,'Khong Dat')
insert KETQUATHI values ('K1102','CSDL',2,27/7/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1102','CSDL',3,10/8/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',1,28/12/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',2,5/1/2006,4,'Khong Dat')
insert KETQUATHI values ('K1102','CTDLGT',3,15/1/2006,6,'Dat')
insert KETQUATHI values ('K1102','THDC',1,20/5/2006,5,'Dat')
insert KETQUATHI values ('K1102','CTRR',1,13/5/2006,7,'Dat')
insert KETQUATHI values ('K1103','CSDL',1,20/7/2006,3.50,'Khong Dat')
insert KETQUATHI values ('K1103','CSDL',2,27/7/2006,8.25,'Dat')
insert KETQUATHI values ('K1103','CTDLGT',1,28/12/2006,7,'Dat')
insert KETQUATHI values ('K1103','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1103','CTRR',1,13/5/2006,6.50,'Dat')
insert KETQUATHI values ('K1104','CSDL',1,27/7/2006,3.75,'KhongDat')
insert KETQUATHI values ('K1104','CTDLGT',1,28/12/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','THDC',1,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',1,13/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',2,20/5/2006,3.5,'Khong Dat')
insert KETQUATHI values ('K1104','CTRR',3,30/6/2006,4,'Khong Dat')
insert KETQUATHI values ('K1201','CSDL',1,20/7/2006,6,'Dat')
insert KETQUATHI values ('K1201','CTDLGT',1,28/12/2006,5,'Dat')
insert KETQUATHI values ('K1201','THDC',1,20/5/2006,8.5,'Dat')
insert KETQUATHI values ('K1201','CTRR',1,13/5/2006,9,'Dat')
insert KETQUATHI values ('K1202','CSDL',1,20/7/2006,8,'Dat')
insert KETQUATHI values ('K1202','CTDLGT',1,28/12/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTDLGT',2,5/1/2007,5,'Dat')
insert KETQUATHI values ('K1202','THDC',1,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','THDC',2,27/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',1,13/5/2006,3,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',2,20/5/2006,4,'Khong Dat')
insert KETQUATHI values ('K1202','CTRR',3,30/6/2006,6.25,'Dat')
insert KETQUATHI values ('K1203','CSDL',1,20/7/2006,9.25,'Dat')
insert KETQUATHI values ('K1203','CTDLGT',1,28/12/2006,9.50,'Dat')
insert KETQUATHI values ('K1203','THDC',1,20/5/2006,10,'Dat')
insert KETQUATHI values ('K1203','CTRR',1,13/5/2006,10,'Dat')
insert KETQUATHI values ('K1204','CSDL',1,20/7/2006,8.50,'Dat')
insert KETQUATHI values ('K1204','CTDLGT',1,28/12/2006,6.75,'Dat')
insert KETQUATHI values ('K1204','THDC',1,20/5/2006,4,' Khong Dat')
insert KETQUATHI values ('K1204','CTRR',1,13/5/2006,6,'Dat')
insert KETQUATHI values ('K1301','CSDL',1,20/12/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1301','CTDLGT',1,25/7/2006,8,'Dat')
insert KETQUATHI values ('K1301','THDC',1,20/5/2006,7.75,'Dat')
insert KETQUATHI values ('K1301','CTRR',1,13/5/2006,8,'Dat')
insert KETQUATHI values ('K1302','CSDL',1,20/12/2006,6.75,'Khong Dat')
insert KETQUATHI values ('K1302','CTDLGT',1,25/7/2006,5,'Dat')
insert KETQUATHI values ('K1302','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1302','CTRR',1,13/5/2006,8.5,'Dat')
insert KETQUATHI values ('K1303','CSDL',1,20/12/2006,4.00,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',1,25/7/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',2,7/8/2006,4,'Khong Dat')
insert KETQUATHI values ('K1303','CTDLGT',3,15/8/2006,4.25,'Khong Dat')
insert KETQUATHI values ('K1303','THDC',1,20/5/2006,4.50,'Khong Dat')
insert KETQUATHI values ('K1303','CTRR',1,13/5/2006,3.25,'Khong Dat')
insert KETQUATHI values ('K1303','CTRR',2,20/5/2006,5,'Dat')
insert KETQUATHI values ('K1304','CSDL',1,20/12/2006,7.75,'Dat')
insert KETQUATHI values ('K1304','CTDLGT',1,25/7/2006,9.75,'Dat')
insert KETQUATHI values ('K1304','THDC',1,20/5/2006,5.5,'Dat')
insert KETQUATHI values ('K1304','CTRR',1,13/5/2006,5 ,'Dat')
insert KETQUATHI values ('K1304','CSDL',1,20/12/2006,7.75,'Dat')
insert KETQUATHI values ('K1304','CTDLGT',1,25/7/2006,9.75,'Dat')
insert KETQUATHI values ('K1304','THDC',1,20/5/2006,5.5,'Dat')
insert KETQUATHI values ('K1304','CTRR',1,13/5/2006,5 ,'Dat')
insert KETQUATHI values ('K1305','CSDL',1,20/12/2006,9.25,'Dat')
insert KETQUATHI values ('K1305','CTDLGT',1,25/7/2006,10,'Dat')
insert KETQUATHI values ('K1305','THDC',1,20/5/2006,8,'Dat')
insert KETQUATHI values ('K1305','CTRR',1,13/5/2006,10,'Dat')
--1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) 
--lớp trưởng của các lớp.
SELECT HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN, HOCVIEN.NGSINH, HOCVIEN.MALOP
FROM HOCVIEN
INNER JOIN LOP ON HOCVIEN.MALOP = LOP.MALOP;
--2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số)
--môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT KETQUATHI.MAHV, HOCVIEN.HO, HOCVIEN.TEN, KETQUATHI.LANTHI, KETQUATHI.DIEM
FROM KETQUATHI
INNER JOIN HOCVIEN ON KETQUATHI.MAHV = HOCVIEN.MAHV
WHERE KETQUATHI.MAMH = 'CTRR' AND HOCVIEN.MALOP = 'K12'
ORDER BY HOCVIEN.HO, HOCVIEN.TEN;
--3. In ra danh sách những học viên (mã học viên, họ tên) và
--những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT HOCVIEN.MAHV, HOCVIEN.HO + ' ' + HOCVIEN.TEN AS 'Họ tên', MONHOC.MAMH, MONHOC.TENMH
FROM HOCVIEN
INNER JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
INNER JOIN MONHOC ON KETQUATHI.MAMH = MONHOC.MAMH
WHERE LANTHI = 1
--4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” 
--thi môn CTRR không đạt (ở lần thi 1).
SELECT KETQUATHI.MAHV, HOCVIEN.HO, HOCVIEN.TEN
FROM KETQUATHI
INNER JOIN HOCVIEN ON KETQUATHI.MAHV = HOCVIEN.MAHV
WHERE KETQUATHI.LANTHI = 1 AND KETQUATHI.KQUA != 'Dat' 
AND HOCVIEN.MALOP = 'K11' AND KETQUATHI.MAMH = 'CTRR';
--5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” 
--thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT  H.MAHV, H.HO + TEN AS HOTEN
FROM HOCVIEN H INNER JOIN KETQUATHI K ON H.MAHV = K.MAHV 
AND k.KQUA = 'Khong Dat' 
AND h.MALOP like 'K%'
AND MAMH = 'CTRR'
--6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” 
--dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT MONHOC.TENMH
FROM MONHOC
LEFT JOIN GIANGDAY ON MONHOC.MAMH = GIANGDAY.MAMH
LEFT JOIN GIAOVIEN ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE GIAOVIEN.HOTEN = 'Tran Tam Thanh' AND GIANGDAY.HOCKY = 1 
AND GIANGDAY.NAM = 2006;
--7. Tìm những môn học (mã môn học, tên môn học) mà 
--giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT MONHOC.MAMH, MONHOC.TENMH
FROM MONHOC
INNER JOIN GIANGDAY ON MONHOC.MAMH = GIANGDAY.MAMH
INNER JOIN LOP ON GIANGDAY.MALOP = LOP.MALOP
WHERE LOP.MALOP = 'K11' AND GIANGDAY.HOCKY = 1 AND GIANGDAY.NAM = 2006;
--8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên 
--“Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT HOCVIEN.HO, HOCVIEN.TEN
FROM HOCVIEN
INNER JOIN LOP ON HOCVIEN.MALOP = LOP.MALOP
INNER JOIN GIANGDAY ON LOP.MALOP = GIANGDAY.MALOP
INNER JOIN MONHOC ON GIANGDAY.MAMH = MONHOC.MAMH
INNER JOIN GIAOVIEN ON GIANGDAY.MAGV = GIAOVIEN.MAGV
WHERE MONHOC.TENMH = 'Co So Du Lieu' AND GIAOVIEN.HOTEN = 'Nguyen To Lan';
--9. In ra danh sách những môn học (mã môn học, tên môn học) 
--phải học liền trước môn “Co So Du Lieu”.
SELECT M1.MAMH, M1.TENMH
FROM MONHOC AS M1
INNER JOIN DIEUKIEN AS D ON M1.MAMH = D.MAMH
INNER JOIN MONHOC AS M2 ON D.MAMH_TRUOC = M2.MAMH
WHERE M2.TENMH = 'Co So Du Lieu';
--10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước 
--những môn học (mã môn học, tên môn học) nào.
SELECT M2.MAMH, M2.TENMH
FROM MONHOC AS M1
JOIN DIEUKIEN AS D ON M1.MAMH = D.MAMH
JOIN MONHOC AS M2 ON D.MAMH_TRUOC = M2.MAMH
WHERE M1.TENMH = 'Cau Truc Roi Rac';
--11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” 
--trong cùng học kỳ 1 năm 2006.
SELECT HOTEN
FROM GIAOVIEN
WHERE MAGV IN (
    SELECT MAGV
    FROM GIANGDAY
    WHERE MAMH = 'CTRR' AND MALOP IN ('K11', 'K12') AND HOCKY = 1 AND NAM = 2006
    GROUP BY MAGV
    HAVING COUNT (DISTINCT MALOP) = 2
)
--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL 
--ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT HOCVIEN.MAHV, HOCVIEN.HO + ' ' + HOCVIEN.TEN AS HO_TEN
FROM HOCVIEN
LEFT JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE KETQUATHI.MAMH = 'CSDL'
  AND KETQUATHI.LANTHI = 1
  AND KETQUATHI.KQUA <> 'Dat'
  AND HOCVIEN.MAHV NOT IN (
    SELECT KETQUATHI.MAHV
    FROM KETQUATHI
    WHERE KETQUATHI.MAMH = 'CSDL'
      AND KETQUATHI.LANTHI > 1
  );
--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy 
--bất kỳ môn học nào.
SELECT GIAOVIEN.MAGV, GIAOVIEN.HOTEN
FROM GIAOVIEN
WHERE GIAOVIEN.MAGV NOT IN (
  SELECT DISTINCT GIANGDAY.MAGV
  FROM GIANGDAY
);
--14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy 
--bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT GIAOVIEN.MAGV, GIAOVIEN.HOTEN
FROM GIAOVIEN
WHERE GIAOVIEN.MAGV NOT IN (
  SELECT DISTINCT GIANGDAY.MAGV
  FROM GIANGDAY
  INNER JOIN MONHOC ON GIANGDAY.MAMH = MONHOC.MAMH
  INNER JOIN KHOA ON MONHOC.MAKHOA = KHOA.MAKHOA
  WHERE KHOA.MAKHOA = GIAOVIEN.MAKHOA
);
--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 
--3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT HOCVIEN.MAHV, HOCVIEN.HO + ' ' + HOCVIEN.TEN AS HO_TEN
FROM HOCVIEN
WHERE HOCVIEN.MALOP = 'K11'
AND (
  (HOCVIEN.MAHV IN (
    SELECT KETQUATHI.MAHV
    FROM KETQUATHI
    WHERE KETQUATHI.LANTHI > 3
    AND KETQUATHI.KQUA = 'Khong dat'
  ))
  OR
  (HOCVIEN.MAHV IN (
    SELECT KETQUATHI.MAHV
    FROM KETQUATHI
    WHERE KETQUATHI.MAMH = 'CTRR'
    AND KETQUATHI.LANTHI = 2
    AND KETQUATHI.DIEM = 5
  ))
);
--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng 
--một học kỳ của một năm học.
SELECT GIAOVIEN.HOTEN
FROM GIAOVIEN
INNER JOIN GIANGDAY ON GIAOVIEN.MAGV = GIANGDAY.MAGV
WHERE GIANGDAY.MAMH = 'CTRR'
GROUP BY GIAOVIEN.HOTEN
HAVING COUNT(DISTINCT GIANGDAY.MALOP) >= 2;
--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HOCVIEN.MAHV, HOCVIEN.HO + ' ' + HOCVIEN.TEN AS HO_TEN, KETQUATHI.DIEM
FROM HOCVIEN
INNER JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE KETQUATHI.MAMH = 'CSDL'
AND KETQUATHI.LANTHI = (
  SELECT MAX(LANTHI)
  FROM KETQUATHI
  WHERE MAHV = HOCVIEN.MAHV
  AND MAMH = 'CSDL'
);
--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” 
--(chỉ lấy điểm cao nhất của các lần thi).
SELECT HOCVIEN.MAHV, HOCVIEN.HO + ' ' + HOCVIEN.TEN AS HO_TEN,
MAX(KETQUATHI.DIEM) AS HIGHEST_SCORE
FROM HOCVIEN
INNER JOIN KETQUATHI ON HOCVIEN.MAHV = KETQUATHI.MAHV
WHERE KETQUATHI.MAMH = 'CSDL'
GROUP BY HOCVIEN.MAHV, HOCVIEN.HO, HOCVIEN.TEN;
--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất. 
SELECT TOP 1 with ties KHOA.MAKHOA, KHOA.TENKHOA
FROM KHOA
ORDER BY KHOA.NGTLAP;
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(*) 
FROM GIAOVIEN 
WHERE HOCHAM IN ('GS', 'PGS');
--21. Thống kê có bao nhiêu giáo viên có học vị là 
--“CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT KHOA.MAKHOA, KHOA.TENKHOA, COUNT(GIAOVIEN.MAGV) AS TOTAL_TEACHERS
FROM KHOA
LEFT JOIN GIAOVIEN ON KHOA.MAKHOA = GIAOVIEN.MAKHOA
WHERE GIAOVIEN.HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
GROUP BY KHOA.MAKHOA, KHOA.TENKHOA;
--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT MONHOC.MAMH, MONHOC.TENMH, KETQUATHI.KQUA, COUNT(HOCVIEN.MAHV) AS TOTAL_STUDENTS
FROM MONHOC
INNER JOIN KETQUATHI ON MONHOC.MAMH = KETQUATHI.MAMH
INNER JOIN HOCVIEN ON KETQUATHI.MAHV = HOCVIEN.MAHV
GROUP BY MONHOC.MAMH, MONHOC.TENMH, KETQUATHI.KQUA;
--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, 
--đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT DISTINCT GIAOVIEN.MAGV, GIAOVIEN.HOTEN
FROM GIAOVIEN
INNER JOIN LOP ON GIAOVIEN.MAGV = LOP.MAGVCN
INNER JOIN GIANGDAY ON GIAOVIEN.MAGV = GIANGDAY.MAGV
WHERE LOP.MALOP = GIANGDAY.MALOP;
--24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
select HO+TEN as HOTEN
from HOCVIEN
where HOCVIEN.MAHV in (SELECT TRGLOP 
	FROM LOP  
	WHERE SISO = (SELECT MAX(SISO) 
				FROM LOP)) 
--25. * Tìm họ tên những LOPTRG thi không đạt quá 3 môn 
--(mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT TRGLOP 
FROM LOP 
WHERE MALOP IN (SELECT MALOP 
				FROM GIANGDAY 
				WHERE MAMH IN (SELECT MAMH 
								FROM KETQUATHI 
								GROUP BY MAMH 
								HAVING MIN(KQUA) = 'Khong dat') 
				GROUP BY MALOP 
				HAVING COUNT(DISTINCT MAMH) > 3)
--26. Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT k.MAHV, h.HO, h.TEN, COUNT(*) AS 'Số môn đạt điểm 9,10'
FROM HOCVIEN h
INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV AND k.DIEM >= 9
GROUP BY k.MAHV, h.HO, h.TEN
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM KETQUATHI
        WHERE DIEM >= 9
        GROUP BY MAHV
    ) t
);
--27. Trong từng lớp, tìm học viên (mã học viên, họ tên) 
--có số môn đạt điểm 9,10 nhiều nhất.
CREATE VIEW tkdiem910 AS
SELECT t.MAHV, t.HO, t.TEN
FROM (
    SELECT MALOP, h.MAHV, HO, TEN, COUNT(h.MAHV) as sodiem910
    FROM HOCVIEN h
    INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV
    WHERE k.DIEM >= 9
    GROUP BY MALOP, h.MAHV, HO, TEN
) AS t
WHERE t.sodiem910 = (
    SELECT MAX(sodiem910)
    FROM (
        SELECT MALOP, h.MAHV, HO, TEN, COUNT(h.MAHV) as sodiem910
        FROM HOCVIEN h
        INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV
        WHERE k.DIEM >= 9
        GROUP BY MALOP, h.MAHV, HO, TEN
    ) AS t1
    WHERE t1.MALOP = t.MALOP
);
--Không tạo view
select mahv, ho, ten
from (select malop, h.mahv, ho, ten, count(h.mahv) as sodiem910
	from HOCVIEN h, KETQUATHI k
	where h.MAHV = k.MAHV and DIEM >= 9
group by MALOP, h.MAHV, HO, TEN) as t 
where sodiem910 =(select max(sodiem910)
					from (select malop, h.mahv, ho, ten, count(h.mahv) as sodiem910
						from HOCVIEN h, KETQUATHI k
						where h.MAHV = k.MAHV and DIEM >= 9
						group by MALOP, h.MAHV, HO, TEN) as t1 
where t1.malop = t.malop)

--28. Trong từng học kỳ của từng năm, mỗi giáo viên 
--phân công dạy bao nhiêu môn học,bao nhiêu lớp.
SELECT gd.NAM, gd.HOCKY, gv.MAGV, gv.HOTEN, COUNT(DISTINCT gd.MAMH) AS 'Số môn học',
COUNT(DISTINCT gd.MALOP) AS 'Số lớp'
FROM GIANGDAY gd
INNER JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
GROUP BY gd.NAM, gd.HOCKY, gv.MAGV, gv.HOTEN;
--29. Trong từng học kỳ của từng năm, tìm giáo viên 
--(mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT gd.NAM, gd.HOCKY, gv.MAGV, gv.HOTEN, COUNT(DISTINCT gd.MAMH) AS 'Số môn học'
FROM GIANGDAY gd
INNER JOIN GIAOVIEN gv ON gd.MAGV = gv.MAGV
GROUP BY gd.NAM, gd.HOCKY, gv.MAGV, gv.HOTEN
HAVING COUNT(DISTINCT gd.MAMH) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(DISTINCT gd1.MAMH) AS cnt
        FROM GIANGDAY gd1
        WHERE gd1.NAM = gd.NAM AND gd1.HOCKY = gd.HOCKY
        GROUP BY gd1.MAGV
    ) t
);
--30. Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt 
--(ở lần thi thứ 1) nhất.
SELECT k.MAMH, mh.TENMH
FROM MONHOC mh
INNER JOIN KETQUATHI k ON mh.MAMH = k.MAMH
WHERE k.LANTHI = 1 AND k.DIEM < 5
GROUP BY k.MAMH, mh.TENMH
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM KETQUATHI
        WHERE LANTHI = 1 AND DIEM < 5
        GROUP BY MAMH
    ) t
);
--31. Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt 
--(chỉ xét lần thi thứ 1).
SELECT k.MAHV, h.HO, h.TEN
FROM HOCVIEN h
INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV AND k.LANTHI = 1 AND k.DIEM >= 5
GROUP BY k.MAHV, h.HO, h.TEN
HAVING COUNT(*) = (
    SELECT COUNT(DISTINCT MAMH)
    FROM KETQUATHI
    WHERE MAHV = k.MAHV AND LANTHI = 1 AND DIEM >= 5
);
--32. * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt 
--(chỉ xét lần thi sau cùng).
SELECT MAHV, HO  + TEN AS HOTEN 
FROM HOCVIEN 
WHERE MAHV NOT IN (SELECT MAHV
					FROM KETQUATHI 
					WHERE LANTHI IN (SELECT MAX(LANTHI) 
									FROM KETQUATHI 
									GROUP BY MAHV, MAMH) AND KQUA = 'Khong dat');
--33. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt 
--(chỉ xét lần thi thứ 1).
SELECT h.MAHV, h.HO, h.TEN
FROM HOCVIEN h
INNER JOIN (
    SELECT MAHV, COUNT(DISTINCT MAMH) AS cnt
    FROM KETQUATHI
    WHERE LANTHI = 1 AND DIEM >= 5
    GROUP BY MAHV
    HAVING COUNT(DISTINCT MAMH) = (
        SELECT COUNT(*) AS cnt
        FROM MONHOC
    )
) t ON h.MAHV = t.MAHV;
--34. * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt 
--(chỉ xét lần thi sau cùng).
SELECT h.MAHV, h.HO, h.TEN
FROM HOCVIEN h
INNER JOIN (
    SELECT MAHV, COUNT(DISTINCT MAMH) AS cnt
    FROM KETQUATHI
    WHERE LANTHI = (
        SELECT MAX(LANTHI)
        FROM KETQUATHI
    ) AND DIEM >= 5
    GROUP BY MAHV
    HAVING COUNT(DISTINCT MAMH) = (
        SELECT COUNT(*) AS cnt
        FROM MONHOC
    )
) t ON h.MAHV = t.MAHV;
--35. ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn 
--(lấy điểm ở lần thi sau cùng).
SELECT k.MAHV, h.HO, h.TEN, k.MAMH, mh.TENMH, k.DIEM
FROM KETQUATHI k
INNER JOIN HOCVIEN h ON k.MAHV = h.MAHV
INNER JOIN MONHOC mh ON k.MAMH = mh.MAMH
WHERE k.LANTHI = (
    SELECT MAX(LANTHI)
    FROM KETQUATHI
    WHERE MAHV = k.MAHV AND MAMH = k.MAMH
) AND k.DIEM = (
    SELECT MAX(DIEM)
    FROM KETQUATHI
    WHERE MAHV = k.MAHV AND MAMH = k.MAMH AND LANTHI = (
        SELECT MAX(LANTHI)
        FROM KETQUATHI
        WHERE MAHV = k.MAHV AND MAMH = k.MAMH
    )
);
--1.	In ra danh sách những học viên (mã học viên, họ tên) 
--và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT k.MAHV, h.HO, h.TEN, k.MAMH, mh.TENMH
FROM HOCVIEN h
INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV AND k.LANTHI = 1 AND k.DIEM >= 5
INNER JOIN MONHOC mh ON k.MAMH = mh.MAMH;
--2.	In ra danh sách những môn học (mã môn học, tên môn học) 
--phải học liền trước môn “Co So Du Lieu”.
SELECT mh1.MAMH, mh1.TENMH
FROM MONHOC mh1
INNER JOIN DIEUKIEN dk ON mh1.MAMH = dk.MAMH_TRUOC
INNER JOIN MONHOC mh2 ON dk.MAMH = mh2.MAMH
WHERE mh2.TENMH = 'Co so du lieu';
--3.	Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 
--nhưng chưa thi lại môn này.
SELECT k.MAHV, h.HO, h.TEN
FROM HOCVIEN h
INNER JOIN KETQUATHI k ON h.MAHV = k.MAHV AND k.LANTHI = 1 AND k.MAMH = 'CSDL' 
AND k.DIEM < 5
WHERE NOT EXISTS (
    SELECT *
    FROM KETQUATHI
    WHERE MAHV = k.MAHV AND MAMH = 'CSDL' AND LANTHI > 1
);
--4.	Cập nhật điểm của tất cả sinh viên học môn CSDL tăng lên 1 điểm 
--nhưng không quá 10 điểm
UPDATE KETQUATHI
SET DIEM = CASE
    WHEN DIEM + 1 <= 10 THEN DIEM + 1
    ELSE 10
  END
WHERE MAMH = 'MaMonHocCSDL';
--5.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” 
--trong mỗi khoa. (Pivottable)
select k.makhoa, tenkhoa, hocvi, COUNT(magv)
from khoa k, GIAOVIEN g
where k.MAKHOA = G.MAKHOA
group by k.makhoa, tenkhoa, hocvi 
--pivot tĩnh
select *
from (select k.makhoa, tenkhoa, hocvi, magv
		from khoa k, GIAOVIEN g
		where k.makhoa = g.makhoa) as tk
pivot(count(magv)
	for hocvi in([CN], [KS], [Ths], [TS], [PTS],[CD],[TC])
	)as pv
-- pivot động
declare 
@hocvi nvarchar(max) = '',
@caulenh nvarchar(max) = '';
select @hocvi += + QUOTENAME(hocvi) + ','
from giaovien
group by hocvi
set @hocvi = left(@hocvi, len(@hocvi)-1);
set @caulenh = 'select *
				from (select k.makhoa, tenkhoa, hocvi, magv
						from khoa k, GIAOVIEN g
						where k.makhoa = g.makhoa) as tk
				pivot(count(magv)
						for hocvi in('+ @hocvi +')
						)as pv'
exec(@caulenh);