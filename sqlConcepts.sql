create database lin;
use lin;

create table emp( empid int primary key, empname varchar(20),qualfication varchar(20), nationality varchar(20), salary int, appointment date, experience int, occupation varchar(20));
drop table emp;

create table employee( empid int primary key, empname varchar(20), nationality varchar(20), qualfication varchar(20), salary int, appointment date, experience int, occupation varchar(20));
insert employee values(101, 'Ahmad Saleh', 'Saudi', 'BA', 5000, '2001-01-01', 2, 'TA'),
(202, 'Khaled Al Ahmadi', 'Saudi', 'Master', 7500, '2002-02-02', 4, NULL),
(303, 'Fahad Abdullah', 'Syrian', 'Master', 7000, '2003-03-03', 2, 'Lecture'),
(404, 'Adel Ahmad', 'Egyptian', 'Doctorate', 9000, '2004-04-04', NULL, 'Doctor'),
(505, 'Rami Omar', 'Saudi', 'Doctorate', 11500, '2005-05-05', 8, 'Doctor'),
(606, 'Samer Mohmad', 'Syrian', 'Doctorate', 9500, '2006-06-06', 3, 'Doctor');


-- name, nationaly and salary in ascending order
select empname, nationality, salary from employee order by empname asc;

-- name,natinality and salary in descending order
select empname, nationality, salary from employee order by salary desc;

select empname, nationality, salary from employee where nationality ='syrian' and appointment between '2000-01-01'and '2004-06-08';-- not showing results
select distinct nationality from employee;

select distinct salary from employee;

update employee set salary= salary+500;
select salary from employee;
select (salary-300) as salary_after_demotion from employee;
select empname, salary, nationality, (salary+200) from employee where empname= 'Ahmad Saleh';
select nationality, sum(salary) from employee group by(nationality);

-- DEPATMENT TABLE
create table department(depid int primary key, depname varchar(20) not null);

-- EMPS TABLE AKA EMPLOYEES
create table emps( empid int primary key, empname varchar(20) unique, salary decimal(6), nationality varchar(20), depid int, constraint fk1 foreign key(depid) references department(depid));
 
 -- SCIENTIIC DATA TABLE
create table scidata(empid int primary key, constraint fk2 foreign key(empid) references emps(empid), qualification varchar(20), expyears int);

insert into department 
values(1, 'programming'),
(2, 'networking'),
(3, 'engineering');

insert into emps 
values(1, 'ahmad', 5000,  'saudi', 1),
(2,  'omar', 7500, 'egyptian', 1),
(3, 'fahad', 8000, 'saudi', 2),
(4, 'sultan', 6500,  'syrian',1),
(5, 'rami', 10000, 'saudi', 2),
(6, 'adel', 4000, 'egyptian', 2);

insert into scidata 
values(1, 'BA', 2),
(2, 'master', 1),
(3, 'doctorate', 3),
(4, 'master', 5),
(5, 'doctorate', 1),
(6, 'BA', 0);

-- equijoin
select department.depname, emps.empname, emps.nationality from department, emps
where department.DEPID = emps.EMPID;

select department.depname, emps.empname, emps.nationality from department, emps
where department.DEPID = emps.EMPID
order by depname asc;

select department.depname, emps.empname, emps.nationality from department inner join emps
on department.DEPID = emps.DEPID
order by depname asc;

-- natural join
select department.depname, emps.empname, emps.nationality from department natural join emps;

select* from department natural join emps;

-- outer join
select department.depname, emps.empname, emps.nationality, emps.salary
from department left outer join emps
on department.depid = emps.depid;

select department.depname, emps.empname, emps.nationality, emps.salary
from department right outer join emps
on department.depid = emps.depid;

-- multiple join
select department.depname, emps.empname, emps.nationality, emps.salary, scidata.qualification
from department, emps, scidata
where department.depid = emps.depid and emps.empid = scidata.empid;

-- multiple table join
select department.depname, emps.empname, emps.nationality, emps.salary, scidata.qualification
from department inner join emps on department.depid = emps.depid inner join scidata on emps.empid = scidata.empid;

-- processing multiple tables
select department.depname, emps.empname, emps.nationality, emps.salary from department inner join emps 
on department.depid = emps.depid 
where nationality = 'saudi';

select department.depname, emps.empname, emps.nationality from department, emps 
where department.depid = emps.depid and nationality = 'saudi';

-- views

create table customers(name varchar(20), custid int, rating int);
create table clothes (color varchar(20), clothid int primary key, clothname varchar(20));
create table purchase( pname varchar(20), clothid int, constraint fk foreign key(clothid) references clothes(clothid)); 
alter table customers add age int;

create view v2 as select name, age from customers;

alter table customers add cid int primary key;
alter table purchase add cid int;
alter table purchase add constraint fkfk foreign key(cid) references customers(cid);

create view v3 as
select c.name, c.age, clo.clothname, clo.color from customers c, clothes clo, purchase p 
where c.cid = p.cid and clo.clothid = p.clothid;

INSERT INTO customers (cid, name, age, custid, rating) VALUES
(1, 'Ali', 22, 101, 5),
(2, 'Sara', 25, 102, 4),
(3, 'Omar', 30, 103, 3),
(4, 'Layan', 21, 104, 5);

INSERT INTO clothes (clothid, clothname, color) VALUES
(10, 'Jacket', 'Black'),
(11, 'Shirt', 'White'),
(12, 'Dress', 'Red'),
(13, 'Jeans', 'Blue');

INSERT INTO purchase (pname, clothid, cid) VALUES
('Ali', 10, 1),
('Sara', 11, 2),
('Omar', 12, 3),
('Layan', 13, 4);

select* from v3;

create view v4 as select * from clothes where color='Red';
select* from v4;
select* from v2 where age>20;
ALTER TABLE purchase
DROP FOREIGN KEY fkfk;


alter table customers modify cid int auto_increment; 
insert into v2
values('Suzan', 31);
select* from v2;
select* from customers;
drop view v4;