CREATE DATABASE prj_assignment;
use prj_assignment;

create TABLE customer(
    cus_id int PRIMARY KEY IDENTITY(1,1),
    cus_name nvarchar(45),
    cus_phone varchar(45),
    cus_email varchar(45),
    cus_idcard varchar(45),
    cus_address nvarchar(45)
);

CREATE TABLE position(
    pos_id int PRIMARY KEY IDENTITY(1,1),
    pos_name varchar(45)
);

create table employee(
    emp_id int PRIMARY KEY IDENTITY(1,1),
    emp_name nvarchar(45),
    emp_phone varchar(45),
    emp_email varchar(45),
    emp_address nvarchar(45),
    emp_idcard varchar(45),
    pos_id int,
    FOREIGN KEY (pos_id) REFERENCES POSITION(pos_id),
    username varchar(45),
    password varchar(45)
);

CREATE TABLE bill(
    cus_id int,
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    bill_id int PRIMARY KEY IDENTITY(1,1),
    total_money int,
    date_export DATETIME
);

CREATE TABLE warranty(
    cus_id int,
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    vhc_id int,
    FOREIGN KEY (vhc_id) REFERENCES 

);

