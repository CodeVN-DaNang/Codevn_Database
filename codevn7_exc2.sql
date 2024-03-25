create database codevn7_exc2;
use codevn7_exc2;

create table employees (
  employees_ID int primary key,
  employees_name varchar (30) ,
  employees_positionsID int,
  foreign key ( employees_positionsID ) references positions(positions_ID),
  employees_departmentsID int,
  foreign key ( employees_departmentsID) references departments(departments_ID),
  salary int,
  employees_datejoin date
);

create table departments (
  departments_ID int primary key,
  departments_name char(10) ,
  departments_addrees varchar(40),
  departments_date date,
  departments_empID int
  );

create table positions (
  positions_ID int primary key,
  positions_describe varchar(30)
);

create table salary (
  salary_id int primary key,
  salary_min int,
  salary_max int,
  constraint check_max_min check (salary_max - salary_min > 500 and salary_max - salary_min < 1000)
);

alter table salary add constraint check_max_min check (salary_max - salary_min > 500 and salary_max - salary_min < 1000);

INSERT INTO employees (employees_ID, employees_name, employees_positionsID, employees_departmentsID, salary, employees_datejoin)
VALUES 
(1, 'John Doe', 1, 2, 6000, '2023-11-21'),
(2, 'Jane Smith', 2, 1, 7000, '2024-01-05'),
(3, 'John Smith', 2, 2, 1000, '2023-11-21'),
(4, 'John Wick', 1, 2, 2000, '2023-11-21'),
(5, 'John Terry', 2, 2, 3000, '2023-11-21'),
(6, 'John Herderson', 1, 2, 4000, '2023-11-21'),
(7, 'John Nguyen', 2, 2, 5000, '2023-11-21'),
(8, 'Jane Wilson', 2, 1, 8000, '2024-01-05'),
(9, 'John Stone', 1, 1, 6000, '2023-11-21'),
(10, 'Jane Hana', 2, 1, 4000, '2024-01-05'),
(11, 'John Doe', 1, 1, 5000, '2023-11-21'),
(12, 'Jane Smith', 2, 1, 3000, '2024-01-05')
;

INSERT INTO departments (departments_ID, departments_name, departments_addrees, departments_date, departments_empID)
VALUES
(1, 'IT', '123 Main St', '2023-10-01', 1),
(2, 'Sales', '456 Elm St', '2023-11-15', 7)
;
update departments set departments_empID = 7 where departments_ID = 2;


INSERT INTO positions (positions_ID, positions_describe)
VALUES
(1, 'Software Engineer'),
(2, 'Sales Manager')
;
INSERT INTO salary (salary_id, salary_min, salary_max)
VALUES
(1, 4000, 4800),
(2, 5000, 5600);

-- a. In ra danh sách các nhân viên (Manv, Hoten) của phòng 'SALES'. (1.5 đ)
select * from employees where employees_departmentsid = 2;

-- b. Tìm họ tên nhân viên có vị trí là 'Truong Phong" (Mota) của phòng 'KT' (Maphg). (1.5 d)
select * from departments join employees on departments.departments_empID = employees.employees_id where departments_name = 'sales';

-- c. Tìm tên phòng ban có 4 nhân viên có lương 4000 trở lên. (1.5 đ)
select * from departments 
join (select departments_id, count(employees_id) as c 
from employees 
join departments on employees.employees_departmentsID = departments.departments_id 
where employees.salary > 4000 
group by (departments_id) 
having c >= 4) as list
on departments.departments_id = list.departments_id;





