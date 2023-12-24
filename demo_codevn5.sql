use demo_codevn5;

CREATE TABLE student(
    code int PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(45)
)

INSERT into student(name) VALUES ('Yen'), ('Thy'), ('Dollar')

SELECT * from student;

select * from student where code = 2022-11-12