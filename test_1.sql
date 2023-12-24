create database codevn5_bai1;

use codevn5_bai1;

create table nhanvien(
	manv int primary key auto_increment,
    tennv varchar(45),
    mavt int,
    constraint fk_vt_nv foreign key (mavt) references vitri(mavt),
    mapb int,
    constraint fk_pb_nv foreign key (mapb) references phongban(mapb),
    luong int,
    ngayvl date
);

create table phongban(
	mapb int primary key auto_increment,
    tenpb varchar(45),
    diachi varchar(45) check (diachi in ('DANANG', 'HANOI', 'TPHCM', 'CANTHO')),
    ngaytl date
);

create table vitri(
	mavt int primary key auto_increment,
    mota varchar(45),
    maml int,
    constraint fk_vt_ml foreign key (maml) references mucluong(maml)
);

create table mucluong(
	maml int primary key auto_increment,
    mucthap int,
    muccao int
);

insert into mucluong(mucthap, muccao) values (10, 1000), (20, 2000), (30, 3000);
insert into phongban(tenpb, diachi, ngaytl) values ('IT', 'DANANG', '2023/10/19'), ('MARKETING', 'CANTHO','2023/8/19'), ('HR', 'HANOI', '2022/4/10');
insert into vitri(mota, maml) values ('CEO', 2), ('ENGINEER', 3), ('MANAGER', 1);
insert into nhanvien(tennv, mavt, mapb, luong, ngayvl) values ('Yen', 1, 1, 10000, '2023-09-09'), ('Thy', 2, 2, 8000, '2023-10-09'), ('Do', 3, 3, 1000, '2022-04-09');

-- cau 1
select * from nhanvien where luong > 3000;

-- cau 2
select phongban.mapb, tenpb, count(phongban.mapb) as 'so_luong_nhan_vien' 
from phongban 
join nhanvien
where nhanvien.mapb = phongban.mapb
group by phongban.mapb 
having count(phongban.mapb) > 1;

-- cau 3
select * from nhanvien join vitri, mucluong where nhanvien.mavt = vitri.mavt and vitri.maml = mucluong.maml;








