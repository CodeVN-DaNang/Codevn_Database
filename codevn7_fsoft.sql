use f_soft_job;

create table room(
room_ID char(10) primary key,
room_type char(10),
room_number int,
room_cost double,
room_description char(20)
);
insert into room (room_ID, room_type,room_number,room_cost,room_description) values
('P0001','Loai 1','20','60000',''),
('P0002','Loai 1','25','80000',''),
('P0003','Loai 2','15','50000',''),
('P0004','Loai 3','20','50000','');
create table customers(
customers_ID varchar(10) primary key,
customers_name varchar(45),
customers_address varchar(45),
customers_phonenumbers varchar(45)
);
insert into customers (customers_ID,customers_name,customers_address,customers_phonenumbers) values
('KH0001','Nguyen Van A','Hoa xuan','1111111111'),
('KH0002','Nguyen Van B','Hoa hai','1111111112'),
('KH0003','Phan Van A','Cam le','1111111113'),
('KH0004','Phan Van B','Hoa xuan','1111111114');
create table services(
services_ID char(10) primary key,
services_name varchar(45),
services_unitcount varchar(45),
services_price int
);
insert into services (services_ID,services_name,services_unitcount,services_price) values
('DV001','Beer','lon',10000),
('DV002','Nuoc ngot','lon',8000),
('DV003','Trai cay','dia',35000),
('DV004','Khan uot','cai',2000);
create table book_room(
 book_ID char(10) primary key,
 book_roomID char(10),
 book_customersID char(10),
 book_date date,
 book_stat time,
 book_end time,
 book_deposit int,
 book_note varchar(20),
 book_status varchar(20),
 foreign key (book_roomID) references room (room_ID),
 foreign key (book_customersID) references customers (customers_ID )
);
insert into book_room (book_ID,book_roomID,book_customersID,book_date,book_stat,book_end,book_deposit,book_note,book_status) values
('DP0001','P0001','KH0002','2018-03-26','11:00','13:30',100000,' ','Da dat'),
('DP0002','P0001','KH0003','2018-03-27','17:15','19:15',50000,' ','Da huy'),
('DP0003','P0002','KH0002','2018-03-26','20:30','22:15',100000,' ','Da dat'),
('DP0004','P0003','KH0001','2018-04-01','19:30','21:15',200000,' ','Da dat');
create table services_detail(
 detail_book_roomID char(10),
 detail_services_ID char (10),
 detail_numbers int
);
alter table services_detail add primary key (detail_book_roomID,detail_services_ID);
insert into services_detail(detail_book_roomID,detail_services_ID,detail_numbers) values
('DP0001','DV001','20'),
('DP0001','DV003','3'),
('DP0001','DV002','10'),
('DP0002','DV002','10'),
('DP0002','DV003','1'),
('DP0003','DV003','2'),
('DP0003','DV004','10');









