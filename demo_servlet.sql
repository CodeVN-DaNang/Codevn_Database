use demo_servlet;

CREATE TABLE student(
    id int PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(45),
    age int,
    birthday date,
    country varchar(45),
    gender varchar(10)
);

insert into student(name, age, birthday, country, gender) 
VALUES ('Yen', 21, '2003-1-1', 'Quang Binh', 'female'),
('Do', 21, '2003-2-2', 'Quang Nam', 'male'),
('Thy', 21, '2003/3/3', 'Konstum', 'female')