 

   create table employee (emp_id int primary key,firstname varchar(50),lastname VARCHAR(50),salary int,
   joining_date datetime, dept varchar(40)) 
   insert into employee values(8,'Raju','Sharma',150000,'2021-4-12 09:00','Admin')
    insert into employee values(3,'Kishor','Pandit',300000,'2021-2-1 09:00','HR')
	 insert into employee values(4,'Ankit','Shah',500000,'2017-5-13 09:00','account')
	  insert into employee values(5,'Kushal','Joshi',80000,'2014-4-14 09:00','account')
	   insert into employee values(6,'Mehul','Patel',350000,'2021-2-17 09:00','Admin')
	    insert into employee values(7,'Chirag','Shah',200000,'2021-4-19 09:00','Admin')
   select * from employee

   create table emp_bonus(empref_id int , bonusamount int,
   bonus_date datetime foreign key (empref_id)references employee(emp_id) )

   insert into emp_bonus values(1,5000,2014-5-1)
 
     insert into emp_bonus values(2,4000,2017-5-1)
	   insert into emp_bonus values(3,3500,2022-2-1)
	     insert into emp_bonus values(1,3000,2016-2-1)
		   insert into emp_bonus values(2,4500,2019-5-1)
	
	 create table emp_title(empref_id int , empl_title varchar(40),iffective_date datetime)

	 insert into emp_title values(1,'Manager','2016-6-21')
	 insert into emp_title values(2,'Executive','2016-6-11')
	 insert into emp_title values(8,'Executive','2016-6-11')
	 insert into emp_title values(5,'Manager','2016-6-11')
	 insert into emp_title values(4,'Assi Manager','2016-6-11')
	 insert into emp_title values(7,'Manager','2016-6-11')
	 insert into emp_title values(6,'Lead','2016-6-11')
	 insert into emp_title values(3,'Lead','2016-6-11')
	 
	select * from emp_title

	--1	Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
	
	Select firstname as Emp_name from employee

  -- 2	Display “LAST_NAME” from Employee table in upper case. 
     
	 Select upper (lastname) from employee 

  --3	Display unique values of DEPARTMENT from EMPLOYEE table. 
 
 select distinct(emp_title)from  emp_title

  --4	Display the first three characters of  LAST_NAME from EMPLOYEE table. 
  
  select left(lastname,3) from employee

 ------- 5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length. 
 select DISTINCT(dept) as department, datalength(dept) as length from employee

--6	Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.a space char should separate them. 

select CONCAT(firstname,' ',lastname)as fullname from employee

--7	DISPLAY all EMPLOYEE details from the employee table   order by FIRST_NAME Ascending.

select * from employee order by firstname asc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending

select * from employee order by firstname asc,dept desc 

--9	Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table. 

select * from employee where firstname = 'Ankit' or firstname='Raj'

--10	Display details of EMPLOYEE with DEPARTMENT name as “Admin”. 

select * from employee where dept='admin'
--11	DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’. 
select * from employee where firstname like 'v%'

--12	DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000. 
select * from employee where salary between 100000 and 500000
--13	Display details of the employees who have joined in Feb-2020. 
	select * from employee where joining_date between '2020-02-01' and '2020-2-28' 

--14	Display employee names with salaries >= 50000 and <= 100000. 
select * from employee where salary >=50000 and salary<=100000
--16 DISPLAY details of the EMPLOYEES who are also Managers. 
select * from employee as e inner join emp_title as b on e.emp_id=b.empref_id
where b.empl_title='manager'


--17 DISPLAY duplicate records having matching data in some fields of a table. 
select salary ,COUNT(*) from employee group by salary having COUNT(*)  >1 

--18	Display only odd rows from a table. 
select * from employee where emp_id % 2 !=0

 --19	Clone a new table from EMPLOYEE table. 
 select *into empclone from employee
 select * from empclone

--20	DISPLAY the TOP 2 highest salary from a table.

select * from employee where salary in (select top 2 salary from employee order by salary desc)
--21. DISPLAY the list of employees with the same salary. 
 select * from employee where salary in(select salary from employee group by salary having COUNT(salary)>1)

--22	Display the second highest salary from a table. 
 with T as (select *, DENSE_RANK() over (order by salary DESC) as drank  from employee)
SELECT *FROM T where drank=2
--23	Display the first 50% records from a table. 
select top 50 PERCENT * from employee

--24.	Display the departments that have less than 3 people in it. 
select dept from employee  group by dept having COUNT(dept)<3

--25.	Display all departments along with the number of people in there.
select dept ,count ( * )as no_people from employee group by dept

--26.	Display the name of employees having the highest salary in each department. 
select firstname, dept,salary from employee e
where e.salary in (select MAX(salary) from employee group by dept)
--27	Display the names of employees who earn the highest salary. 
select * from employee e where e.salary = (select MAX(salary) from employee)
--28	Diplay the average salaries for each department 
select dept,avg(salary) as evg_salary from employee group by dept





--29	display the name of the employee who has got maximum bonus 
  select * from  employee e 
  inner   join  emp_bonus b  on
e.emp_id=b.empref_id where b.bonusamount in 
 (select max (bonusamount) from emp_bonus)


--30	Display the first name and title of all the employees 
 

 select e.firstname ,t.empl_title from employee e inner join emp_title t on e.emp_id=t.empref_id