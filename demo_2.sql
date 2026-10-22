create database demo_sql;

use demo_sql;

create table students(
id int primary key auto_increment,
name varchar(10) not null,
city varchar(10),
marks int not null,
age int not null
);

alter table students 
rename column id to s_id;

insert into students(name,city,marks,age) 
values
('Asha', 'Pune', 78, 20),
('Rohan', 'Mumbai', 65, 21),
('Sneha', 'Pune', 92, 19),
('Akash', 'Nashik', 45, 22),
('Priya', 'Mumbai', 85, 20),
('Rahul', 'Pune', 55, 21),
('Neha', 'Delhi', 88, 20),
('Karan', 'Nashik', 72, 23),
('Pooja', 'Pune', 60, 19),
('Amit', 'Mumbai', 95, 22);

create table courses(
c_id int primary key auto_increment,
c_name varchar(20) not null,
s_id int, foreign key(s_id) references students(s_id)
);

alter table courses
rename column id to s_id;

INSERT INTO courses (c_name, s_id)
VALUES
('Python', 1),
('SQL', 2),
('Java', 3),
('Web Development', 5),
('Cloud Computing', 6),
('Python', 7),
('SQL', 8),
('Java', 10);

-- to show/chk table 
desc students;
desc courses;

-- 1. Display the names of students who scored more than 70 marks and are younger than 21.
select name from students
where marks > 70 and age < 21;

-- Find the highest and lowest marks among all students in the students table.
select max(marks) as max_marks, 
min(marks) as min_marks 
from students;

-- students with name and min and max marks
select name,marks
from students
where marks = (select max(marks) from students)
or marks = (select min(marks) from students);

-- Display the names of students whose city is either Pune or Mumbai, ordered alphabetically by name.
select name , city
from students
where city = 'pune' or city = 'mumbai'
order by name desc;

-- Count how many students belong to each city.
select count(*), city
from students
group by city;

-- Display each student's name along with their corresponding course name. Include only students who have enrolled in a course.
select s.name as stu_name,
c.c_name as course_name
from students s
inner join courses c
on s.s_id = c.s_id;

-- Find the average marks of students whose age is greater than 20.
select avg(marks) as avg_marks
from students
where age > 20;

-- Display the names of students who have not enrolled in any course.
select name as stu_name,
c_name as cou_name
from students
left join courses
on students.s_id = courses.s_id
where courses.s_id is null;

-- Update the marks of the student whose s_id is 4 to 60.
update students
set marks = 60
where s_id = 4;

-- Display the names of students who scored between 60 and 90 marks, including both 60 and 90.
select name ,marks
from students 
where marks between 60 and 90;