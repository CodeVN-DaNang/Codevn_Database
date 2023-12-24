create database codevn_5;

use codevn_5;

create table student(
	id int primary key auto_increment,
    name varchar(45),
    age int
);

insert into student(name, age) values ("Yen", 20), ("Thy", 20), ("Do", 20);
select * from student;
delete from student where id = 3;
SET SQL_SAFE_UPDATES = 0;
update student set name = "Khanh", age = 21 where student.name like "Tuan";
SET SQL_SAFE_UPDATES = 1;

use demo;

create table hung(
	id int,
    gender varchar(45) check (gender in ("male", "female"))
);

insert into hung(id, gender) values (1, "other");