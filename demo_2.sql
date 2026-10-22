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

create table courses(
c_id int primary key auto_increment,
c_name varchar(20) not null,
s_id int, foreign key(s_id) references students(s_id)
);

alter table courses
rename column id to s_id;

-- to show/chk table 
desc students;
desc courses;