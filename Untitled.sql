-- tao database
create database bai1;

-- dung database
use bai1;

-- Họ tên, tuổi, giới tính(name, nữ, khác), địa chỉ.

-- tao bang
create table worker(
	name varchar(45),
    age int check (age > 0),
    -- check dung de kiem tra gia tri se them vao bang voi dieu kien sau check
    gender varchar(45) check (gender like "nam" or gender 
    like "nu" or gender like "khac"),
    address varchar(45),
    level int check (level > 0 and level < 10)
);

create table engineer(
	name varchar(45),
    age int check (age > 0),
    gender varchar(45) check (gender like "nam" or gender 
    like "nu" or gender like "khac"),
    address varchar(45),
    major varchar(45)
);

create table staff(
	name varchar(45),
    age int check (age > 0),
    gender varchar(45) check (gender like "nam" or gender 
    like "nu" or gender like "khac"),
    address varchar(45),
    job varchar(45)
);

-- cau lenh them vao bang engineer
-- insert into engineer(name, age, gender, address, major) values ("Do", 10, "nam", "Quang Nam", "IT");
-- insert into engineer(name, age, gender, address, major) values ("Yen", 10, "nu", "Quang Binh", "IT");
insert into engineer(name, age, gender, address, major) values ("Do", 10, "nam", "Quang Nam", "IT"), ("Yen", 10, "nu", "Quang Binh", "IT");

-- cau lenh tru van (Lay tat ca record trong bang engineer)
SELECT * FROM engineer;

-- tat che do an toan cua sql
Set SQL_SAFE_UPDATES=0;

-- xoa record trong bang engineer co name la Do
delete from engineer where name like "Do";

-- chinh sua bang engineer sua major thanh Da Nang o record co ten la "Yen"
update engineer set major = "Da Nang" where name like "Yen";





