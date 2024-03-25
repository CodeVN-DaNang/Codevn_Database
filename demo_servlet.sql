use demo_servlet;

DROP TABLE student;

CREATE TABLE student(
    id int PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(45),
    age int,
    birthday date,
    country varchar(45),
    gender varchar(10)
);

INSERT INTO student (name, age, birthday, country, gender)
VALUES ('John Doe', 20, '2000-01-01', 'USA', 'Male'),
    ('Jane Smith', 22, '1998-05-15', 'Canada', 'Female'),
    ('Bob Johnson', 21, '1999-09-30', 'UK', 'Male'),
    ('Emily Davis', 23, '1997-03-10', 'Australia', 'Female'),
    ('Michael Brown', 19, '2002-11-25', 'Germany', 'Male'),
    ('Sophia Miller', 20, '2001-07-18', 'France', 'Female'),
    ('William Taylor', 22, '1998-12-05', 'Spain', 'Male'),
    ('Olivia Wilson', 21, '1999-04-02', 'Italy', 'Female'),
    ('James Anderson', 24, '1996-08-14', 'Japan', 'Male'),
    ('Emma Moore', 19, '2003-06-22', 'Brazil', 'Female'),
        ('Alex Johnson', 25, '1995-04-30', 'Mexico', 'Male');
