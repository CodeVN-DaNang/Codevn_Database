create database exc3_codevn6;
use exc3_codevn6;

create table phim(
    maphim int primary key auto_increment,
    tenphim char(20),
    namsx date,
    thoiluong int,
    maxuong int,
    foreign key (maxuong) references xuongphim(maxuong)
);

create table xuongphim(
    maxuong int primary key auto_increment,
  tenxuong varchar(20),
  diachi varchar(50)
);

create table dienvien(
    madv int primary key auto_increment,
	tendv varchar(40),
    diachi varchar(50),
    gioitinh varchar(10),
    nsinh date
);

create table dienxuat(
	maphim int,
    foreign key (maphim) references phim(maphim),
    madv int,
    foreign key (madv) references dienvien(madv)
);

-- Insert 10 data entries into xuongphim table
INSERT INTO xuongphim (tenxuong, diachi) VALUES
('Xuong A', 'City X'),
('Xuong B', 'City Y'),
('Xuong C', 'City Z'),
('Xuong D', 'City W'),
('Xuong E', 'City V'),
('Xuong F', 'City U'),
('Xuong G', 'City T'),
('Xuong H', 'City S'),
('Xuong I', 'City R'),
('Xuong J', 'City Q');

-- Insert 10 data entries into dienvien table
INSERT INTO dienvien (tendv, diachi, gioitinh, nsinh) VALUES
('Actor 1', 'City A', 'Male', '1990-01-01'),
('Actress 2', 'City B', 'Female', '1995-02-02'),
('Actor 3', 'City C', 'Male', '1985-03-03'),
('Actress 4', 'City D', 'Female', '1992-04-04'),
('Actor 5', 'City E', 'Male', '1988-05-05'),
('Actress 6', 'City F', 'Female', '1997-06-06'),
('Actor 7', 'City G', 'Male', '1993-07-07'),
('Actress 8', 'City H', 'Female', '1989-08-08'),
('Actor 9', 'City I', 'Male', '1996-09-09'),
('Actress 10', 'City J', 'Female', '1991-10-10');

-- Insert 10 data entries into phim table
INSERT INTO phim (tenphim, namsx, thoiluong, maxuong) VALUES
('Phim 11', '2022-01-01', 120, 4),
('Phim 2', '2022-02-02', 150, 2),
('Phim 3', '2022-03-03', 180, 3),
('Phim 4', '2022-04-04', 135, 4),
('Phim 5', '2022-05-05', 160, 5),
('Phim 6', '2022-06-06', 110, 6),
('Phim 7', '2022-07-07', 145, 7),
('Phim 8', '2022-08-08', 170, 8),
('Phim 9', '2022-09-09', 125, 9),
('Phim 10', '2022-10-10', 155, 10);

-- Insert 10 data entries into dienxuat table
INSERT INTO dienxuat (maphim, madv) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9);

select phim.* from phim join xuongphim on phim.maxuong = xuongphim.maxuong where phim.namsx like '2022%' ;
select phim.* from phim order by (phim.thoiluong) desc limit 1;
select phim.tenphim, count(tenphim) as c from phim group by (tenphim) having c >0;

