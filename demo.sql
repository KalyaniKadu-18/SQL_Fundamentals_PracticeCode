create database employee;

use employee;

create table manager(
name varchar(30) not null,
age varchar(10),
id varchar(100) primary key
);

insert into manager (name,age,id)
values
("Kalyani",22,101),
("Kalyani",22,102),
("Kalyani",22,103),
("Kalyani",22,104);

alter table manager 
modify column id int;

alter table manager 
add column department varchar(50);

alter table manager 
drop column age;

alter table manager
add column age int (50) not null;

alter table manager 
rename column age to agee;

-- truncate table manager--

-- drop table manager--

-- delete table manager --

select agee from manager
order by id desc;

select agee from manager 
having agee > 22;

select agee from manager 
having agee > 21;

UPDATE manager
SET name = 'Mohan'
WHERE id = 103;

select max(agee) from manager;

select min(agee) from manager;

select count(*) from manager;

alter table manager
add column section varchar(20);

INSERT INTO manager (name, agee, section)
VALUES
('Kalyani', 22, 'A'),
('Kalyani', 22, 'B'),
('Kalyani', 22, 'C'),
('Kalyani', 22, 'D');

alter table manager
modify id int not null auto_increment;

select * from manager;


