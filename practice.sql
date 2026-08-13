create database practice;

use practice;

create table department(
dept_name varchar(50),
dept_id int primary key auto_increment
);

insert into department (dept_name )
values 
("HR"),
("IT"),
("Finanace"),
("Account");

select * from department;

create table employee (
emp_name varchar(30),
emp_id int primary key auto_increment,
manager_id int ,
salary int,
dept_id int
) auto_increment= 101; 

insert into employee (emp_name,emp_id, manager_id, salary, dept_id)
values
('Rahul', 1, 5, 50000, 101),
('Priya', 2, 5, 60000, 102),
('Amit', 3, 6, 55000, 101),
('Sneha', 4, 6, 45000, 103),
('Rohit', 5, NULL, 90000, 104),
('Karan', 6, NULL, 95000, 104);

select * from employee;

create table project(
project_name varchar(30),
project_id int primary key,
emp_id int 
);

insert into project (project_name,project_id,emp_id)
values 
('Azure', 1, 1),
('Docker', 2, 2),
('AWS', 3, 3),
('React', 4, 1),
('SQL', 5, 4);

select * from project;

-- SELECT column_names
-- FROM table_name AS alias1
-- JOIN table_name AS alias2
-- ON alias1.column = alias2.column; 

-- self join--
select 
e.emp_name as employeename, 
m.emp_name as managersalary,
s.emp_name as employeesalary
from employee e
join employee m
on e.manager_id ;

-- inner join 
-- select * 
-- from table1 as t1
-- inner join table2 as t2
-- on table1.id = tbale2.id;


-- inner join
SELECT 
e.emp_name,p.emp_id  
FROM employee as e
INNER JOIN project as p
ON e.emp_id = p.project_id;

-- left join
SELECT *
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.emp_id;

-- right join
SELECT * 
FROM employee as e
RIGHT JOIN project as p
ON e.emp_id = p.emp_id;

-- full join
SELECT *  
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.project_id
UNION 
SELECT * 
FROM employee as e
RIGHT JOIN project as p
ON e.emp_id = p.emp_id;

-- left exclusive
SELECT *
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.emp_id
WHERE p.emp_id IS NULL;

-- rigth exclusive 
SELECT *
FROM employee as e
RIGHT JOIN project as p
ON e.emp_id = p.emp_id
WHERE e.emp_id IS NULL;

-- 1.Display employee names along with their department names.
SELECT 
e.emp_name , d.dept_name
FROM employee as e
LEFT JOIN department as d
ON e.dept_id = d.dept_id;

-- Display employee names along with the project names they are working on.
SELECT 
e.emp_name , p.project_name
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.emp_id;

-- Display all employees along with their project names, including employees who are not assigned to any project.
SELECT 
e.emp_name , p.project_name
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.emp_id;

-- Find all employees who are not assigned to any project.
SELECT 
e.emp_name , p.project_name
FROM employee as e
LEFT JOIN project as p
ON e.emp_id = p.emp_id
WHERE  
project_name IS NULL;

-- Display employee names along with their manager names.
SELECT 
e.emp_name as EMPLOYEE, 
m.emp_name as MANAGER
FROM employee as e
JOIN employee as m
ON e.manager_id = m.emp_id
WHERE e.manager_id IS NOT NULL;

-- Display employees whose salary is greater than their manager's salary.
SELECT 
e.salary as EMPLOYEE_SALARY,
m.salary as MANAGER_SALARY
FROM employee as e
JOIN employee as m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- Display employee name, department name, and project name.
SELECT 
e.emp_name , d.dept_name , p.project_name
FROM employee as e
JOIN department as d
ON e.dept_id = d.dept_id
JOIN project as p
ON e.emp_id = p.emp_id 

-- Count the total number of employees in each department.










