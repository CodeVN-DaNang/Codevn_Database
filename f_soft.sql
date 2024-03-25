create database f_soft_job;
use f_soft_job;


create table datphong(
	madatphong int primary key auto_increment,
    ngaydat date,
    giobatdau datetime,
    gioketthuc datetime,
    tiendatcoc int(20),
    ghichu varchar(30),
    trangthaidat varchar(10),
    maphong int(10),
    foreign key (maphong) references phong(maphong),
    makh int,
    foreign key (makh) references khachhang(makh)
    
);

create table phong(
	maphong int(10) primary key,
    loaiphong varchar(10),
    sokhachtoida int(10),
    giaphong int(20),
    mota varchar(30)
);

create table khachhang(
	makh int primary key auto_increment,
    tenkh varchar(20),
    diachi varchar(30),
    sdt int(10)
);

create table dichvudikem(
	madv int(10) primary key auto_increment,
    tendv varchar(30),
    donvitinh varchar(20),
    dongia int(10)
);

create table sudungdv(
    madatphong int,
	foreign key (madatphong) references datphong(madatphong),
    madv int(10),
    foreign key (madv) references dichvudikem(madv),
    soluong int(10)
);

-- Insert sample data for phong table
INSERT INTO phong VALUES
(1, 'Standard', 2, 100, 'Standard'),
(2, 'Deluxe', 4, 200, 'Deluxe'),
(3, 'Suite', 6, 300, 'Suite'),
(4, 'Executive', 8, 400, 'Executive'),
(5, 'Single', 1, 80, 'Single'),
(6, 'Double', 2, 120, 'Double'),
(7, 'Family', 6, 250, 'Family'),
(8, 'Ocean', 2, 180, 'Ocean'),
(9, 'Penthouse', 4, 500, 'Penthouse'),
(10, 'Economy', 1, 70, 'Economy');

-- Insert sample data for khachhang table
INSERT INTO khachhang(tenkh, diachi, sdt) VALUES
('John Doe', '123 Main St', 123456789),
('Jane Smith', '456 Oak St', 987654321),
('Bob Johnson', '789 Pine St', 555123456),
('Alice Brown', '321 Maple St', 333999888),
( 'Charlie Davis', '654 Elm St', 444555666),
( 'Eva White', '876 Birch St', 777888999),
( 'Frank Miller', '987 Cedar St', 111222333),
( 'Grace Wilson', '234 Pine St', 666777888),
( 'Henry Jones', '543 Oak St', 888999000),
( 'Isabel Moore', '765 Maple St', 222333444);

-- Insert sample data for dichvudikem table
INSERT INTO dichvudikem VALUES
(1, 'WiFi', 'Hour', 10),
(2, 'Breakfast', 'Person', 20),
(3, 'Parking', 'Day', 15),
(4, 'Airport Shuttle', 'Trip', 25),
(5, 'Room Service', 'Request', 30),
(6, 'Laundry', 'Item', 12),
(7, 'Gym Access', 'Day', 18),
(8, 'Mini Bar', 'Item', 8),
(9, 'Late Checkout', 'Hour', 15),
(10, 'Spa Services', 'Session', 40);

-- Insert sample data for datphong table
INSERT INTO datphong VALUES
(11, '2024-01-11', '2024-01-12 10:00:00', '2024-01-14 12:00:00', 50, 'Early check-in requested', 'Reserved', 1, 1),
(12, '2024-01-12', '2024-01-15 12:00:00', '2024-01-17 10:00:00', 80, 'High floor preference', 'Confirmed', 2, 2),
(13, '2024-01-14', '2024-01-18 15:00:00', '2024-01-20 12:00:00', 100, 'Special occasion', 'Pending', 3, 3),
(4, '2024-01-16', '2024-01-20 14:00:00', '2024-01-22 11:00:00', 70, 'Late checkout requested', 'Reserved', 4, 4),
(5, '2024-01-18', '2024-01-22 16:00:00', '2024-01-24 10:00:00', 120, 'VIP guest', 'Confirmed', 5, 5),
(6, '2024-01-20', '2024-01-25 11:00:00', '2024-01-27 14:00:00', 90, 'Early check-out', 'Pending', 6, 6),
(7, '2024-01-22', '2024-01-27 12:00:00', '2024-01-29 10:00:00', 110, 'Additional room request', 'Confirmed', 7, 7),
(8, '2024-01-24', '2024-01-30 10:00:00', '2024-02-01 12:00:00', 60, 'Standard booking', 'Reserved', 8, 8),
(9, '2024-01-26', '2024-02-01 14:00:00', '2024-02-03 11:00:00', 150, 'Honeymoon suite', 'Confirmed', 9, 9),
(10, '2024-01-28', '2024-02-03 16:00:00', '2024-02-05 10:00:00', 110, 'Special diet requirements', 'Pending', 10, 10);

-- Insert sample data for sudungdv table
INSERT INTO sudungdv VALUES
(1, 1,  2),
(2, 2,  3),
(3, 3,  1),
(4, 4,  2),
(5, 5,  1),
(6, 6,  3),
(7, 7,  2),
(8, 8,  1),
(9, 9,  3),
(10, 10, 2);

select MaDatPhong, MaDV, SoLuong from sudungdv where soluong > 2 and soluong < 4;

set SQL_SAFE_UPDATES = 0;
update phong set giaphong = giaphong + 10 where sokhachtoida > 3;

delete from sudungdv where madatphong = 1 or madatphong = 4 or madatphong = 8; 
delete from datphong where madatphong = 1 or madatphong = 4 or madatphong = 8;


select tenkh from khachhang where tenkh like 'E%' or tenkh like'A%' or tenkh like'H%';

select distinct tenkh from khachhang;
select tenkh from khachhang group by (tenkh);

select * from dichvudikem where (donvitinh = 'item' and dongia > 6) or (donvitinh = 'day' and dongia > 8);


select * from datphong 
join sudungdv on datphong.madatphong = sudungdv.madatphong 
join dichvudikem on dichvudikem.madv = sudungdv.madv 
join phong on datphong.maphong = phong.maphong 
join khachhang on datphong.makh = khachhang.makh
where (datphong.ngaydat = '2024-01-18' or datphong.ngaydat = '2024-01-11')
and phong.giaphong > 100;

-- in ra tat ca thong tin cua datphong voi tong tien > 300 (Chatgpt is da best)
SELECT *
FROM datphong
WHERE (SELECT SUM(dv.dongia * sd.soluong) 
       FROM sudungdv sd
       JOIN dichvudikem dv ON sd.madv = dv.madv
       WHERE sd.madatphong = datphong.madatphong) < 300;




select datphong.madatphong, TongTienHat = Giaphong * (Gioketthuc - giobatdau), tongtiensudungdv = soluong*dongia, tongtienthanhtoan = tongtienhat + sum(tongtiendichvu)
from datphong 
join sudungdv on datphong.madatphong = sudungdv.madatphong 
join dichvudikem on dichvudikem.madv = sudungdv.madv 
join phong on datphong.maphong = phong.maphong 
join khachhang on datphong.makh = khachhang.makh
group by (madatphong); 


select * from khachhang 
join datphong on datphong.makh = khachhang.makh
join sudungdv on datphong.madatphong = sudungdv.madatphong 
join dichvudikem on dichvudikem.madv = sudungdv.madv 
where datphong.gioketthuc < '2024-02-27 10:00:00' and dichvudikem.tendv like 'Spa services' and diachi  like '%Maple st'; 


select distinct *  from phong
join (select datphong.maphong, count(maphong) as c from datphong group by(maphong) having c >= 2) as bla
on phong.maphong = bla.maphong
join (select datphong.maphong,datphong.trangthaidat from datphong where trangthaidat = 'Confirmed') as blabla
on phong.maphong = blabla.maphong;


18:23:16	select *, count(maphong) as c from phong join datphong on datphong.maphong = phong.maphong  group by (maphong) having c > 2 and trangthaidat = 'Confirmed' LIMIT 0, 1000	Error Code: 1052. Column 'maphong' in field list is ambiguous	0.0011 sec
18:25:52	select phong.maphong,datphong.trangthaidat, count(phong.maphong) as c from phong join datphong on datphong.maphong = phong.maphong  group by (phong.maphong) having c > 2 and trangthaidat = 'Confirmed' LIMIT 0, 1000	Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'f_soft_job.datphong.trangthaidat' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.0018 sec
18:29:59	select phong.maphong, count(phong.maphong) as c from phong join (select * from phong join datphong on phong.maphong = datphong.maphong) on datphong.maphong = phong.maphong  group by (phong.maphong) having c > 2 and datphong.trangthaidat = 'Confirmed' LIMIT 0, 1000	Error Code: 1248. Every derived table must have its own alias	0.00058 sec





