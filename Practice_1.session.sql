CREATE DATABASE CompanyDB;

use CompanyDB;

create table emp(
    emp_id INT auto_increment primary key,
    emp_name varchar(20) not null,
    sal int,
    joining_date date
);

alter table emp
add column dept varchar(20); 

INSERT INTO emp (emp_name, sal, joining_date)
VALUES
("A", 10000, '2024-10-12'),
("B", 20000, '2026-10-01'),
("C", 10000, '2024-11-12'),
("D", 100000, '2025-01-22'),
("E", 70000, '2021-06-12'),
("F", 90000, '2025-09-30');

-- how to add values after creating a column with alter add command
update emp
SET dept = case
when emp_id = 1 then "IT"
when emp_id = 2 then "HR"
when emp_id = 3 then "Sales"
when emp_id = 4 then "Finance"
when emp_id = 5 then "IT"
when emp_id = 6 then "HR"
END;

SELECT * from emp;

update emp
set sal = sal + (sal*0.20) 
where dept = "IT";

SELECT * from emp;

SELECT DISTINCT sal 
FROM emp
ORDER BY sal DESC
limit 2;

SELECT max(sal) as max_sal
from emp
where sal < (
    select max(sal)
    from emp
);

SELECT min(sal) as max_sal
from emp
where sal > (
    select min(sal)
    from emp
);

select dept, count(emp_id),
    avg(sal)
from emp
GROUP BY dept
having count(emp_id) < 3;

create table dept(
dept_id int primary key,
name varchar(30) not null
);

insert into dept(dept_id,name)
values
(1,"IT"),
(2,"Finance"),
(3,"HR"),
(4,"Sales");

alter table emp 
add column dept_id int;

UPDATE emp
SET dept_id = CASE
    WHEN dept = 'IT' THEN 1
    WHEN dept = 'HR' THEN 2
    WHEN dept = 'Sales' THEN 3
    WHEN dept = 'Finance' THEN 4
END;

-- add foreign key
alter table emp
add constraint fk_d
foreign key (dept_id)
references dept(dept_id);

select * from emp;

select sal
from emp 
where sal > (
    select avg(sal)
    from emp
);

start transaction;
delete from emp
where joining_date < '2022-01-01';

select * from emp;

commit;
rollback;