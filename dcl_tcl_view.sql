create database demo_3;

use demo_3;

create table student(
  student_id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    department_name VARCHAR(50),
    department_location VARCHAR(50)
    );
    
alter table student
rename column student_id to s_id;    
    
INSERT INTO STUDENT VALUES
(1, 'Amit', 85, 'Computer', 'Pune'),
(2, 'Priya', 72, 'IT', 'Mumbai'),
(3, 'Rahul', 90, 'Computer', 'Pune'),
(4, 'Sneha', 65, 'Commerce', 'Nashik'),
(5, 'Neha', 88, 'IT', 'Mumbai');    

-- create user
create user 'user1'@'localhost'
identified by 'pass123';

-- login access to user
grant usage on *.* to 'user1'@'localhost';

-- revoke login from user
revoke usage on *.* from 'user1'@'localhost';

-- Write an SQL command to give SELECT permission on the STUDENT table to user user1.
grant select on demo_3.student to 'user1'@'localhost';

-- Write an SQL command to give the INSERT permission on the STUDENT table from user user1.
grant insert on demo_3.student to 'user1'@'localhost';

-- Write an SQL command to remove the INSERT permission on the STUDENT table from user user1.
revoke insert on demo_3.student from 'user1'@'localhost';

-- Write an SQL command to permanently save all changes made in the current transaction.
commit;

-- Write an SQL command to permanently rollback changes made in the current transaction.
rollback;

-- Create a view named HIGH_MARKS that displays the student_id, name, and marks of students who scored more than 80.
create view high_marks as
select s_id,name,marks
from student
where marks > 80;

-- Write an SQL query to display all records from the view named HIGH_MARKS.
select * from high_marks;

-- Write an SQL command to delete the view named HIGH_MARKS.
drop view high_marks;

-- to show definition of view
show create view high_marks;

-- show list of views from database
show full tables
where table_type = 'view';

