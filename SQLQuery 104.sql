
select * from student
select *from softwares
select * from programmers

--1.	Find out the selling cost AVG for packages developed in Pascal. 
select avg(SCOST) as avgcost from softwares where DEVELOPIN ='pascal'group by SCOST


--2.	Display Names, Ages of all Programmers. 
select  PNAME ,DATEDIFF(YY,dbo1,GETDATE()) as age from programmers

--3.	Display the Names of those who have done the DAP Course. 
select * from student where COURSE='dap'


--4.	Display the Names and Date of Births of all Programmers Born in January. 
select pname ,dbo1 from programmers where MONTH(dbo1)=1

--5.	What is the Highest Number of copies sold by a Package? 
select max(sold) as highest_no_of_copy_sold from softwares

--6.	Display lowest course Fee. 
select min(course_fee)as lowest_fee from student
--7.	How many programmers done the PGDCA Course?
select count(s.pname) from programmers p inner join
student s on p.PNAME=s.PNAME where s.COURSE ='pgdca'

--8.	How much revenue has been earned thru sales of Packages Developed in C.
select sum(scost) as revenue_earnd_C from softwares  where DEVELOPIN='c'

--9.	Display the Details of the Software Developed by Ramesh. 
select PNAME ,title from softwares where PNAME='ramesh'

--10.	How many Programmers Studied at Sabhari? 
select count(p.pname) as programmers_from_Sabhari from programmers p inner join
student s on p.PNAME=s.PNAME where s.INSTITUTE='sabhari'
--11.	Display details of Packages whose sales crossed the 2000 Mark. 
select * from softwares where SCOST>2000

--12.	Display the Details of Packages for which Development Cost have been recovered. 
select * from softwares where DCOST <=(scost*sold)
--13.	What is the cost of the costliest software development in Basic? 
	select MAX(scost)as cost  from softwares where DEVELOPIN='basic'
--14.	How many Packages Developed in DBASE? 
select COUNT(title) from softwares where DEVELOPIN='dbase'
--15.	How many programmers studied in Pragathi? 
student s on p.PNAME=s.PNAME where s.INSTITUTE='pragathi'
--16.	How many Programmers Paid 5000 to 10000 for their course? 
select count(p.pname) as programmer from programmers p inner join
student s on p.PNAME=s.PNAME where s.COURSE_FEE between 5000 and 10000
--17.	What is AVG Course Fee 

select avg(course_fee) from student

--18.	Display the details of the Programmers Knowing C. 
  select * from programmers where PROF1='c' or PROF2='c'

--19.	How many Programmers know either COBOL or PASCAL. 
  select count(distinct PNAME ) from programmers where PROF1 in('cobol' ,'pascal') 
  or PROF2 in ('cobol','pascal')

   --select count(distinct PNAME ) from programmers where (PROF1='cobol' or PRselect count(p.pname) as programmers_from_Sabhari from programmers p inner join
OF2='pascal') 
 -- or (PROF2='cobol' or PROF1='pascal')

--20.   How many Programmers Don’t know PASCAL and C 
select count(distinct PNAME ) from programmers where 
PROF1 not in ('c','pascal') 
  and PROF2 not in('c','pascal')
 
--21.	How old is the Oldest Male Programmer. 
select max(DATEDIFF(yy,dbo1,GETDATE())) from programmers where GENDER='m'


--22.	What is the AVG age of Female Programmers? 
select AVG(DATEDIFF(yy,dbo1,GETDATE())) from programmers where GENDER='f'
--23.	Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
select PNAME,datediff(yy,doj,getdate())from programmers order by PNAME desc


--24.	Who are the Programmers who celebrate their Birthday’s During the Current Month? 
select Pname ,DBO1 from programmers where month(dbo1) IN (SELECT MONTH(GETDATE()))

--25.	How many Female Programmers are there?
SELECT COUNT(PNAME)FROM programmers WHERE GENDER='F'

--26.	What are the Languages studied by Male Programmers. 
select PROF2,PROF1 from programmers where GENDER='m'

--27.	What is the AVG Salary? 
select avg (salary) as avg_salary from programmers

--28.	How many people draw salary 2000 to 4000? 
select COUNT(pname) from programmers where SALARY between 2000 and 4000

--29.	Display the details of those who don’t know Clipper, COBOL or PASCAL. 
 select count(distinct PNAME ) from programmers where PROF1 not in('clipper','cobol' ,'pascal') 
  and PROF2 not in ('clipper''cobol','pascal')

--30.	Display the Cost of Package Developed By each Programmer. 
select sum (dcost) ,pname  from softwares group by PNAME
--31.	Display the sales values of the Packages Developed by the each Programmer. 
select sum(sCOST) sales_value_of_packages,PNAME from softwares group by PNAME

--32.	Display the Number of Packages sold by Each Programmer. 
select count(TITLE) as no_of_packages_sold,PNAME from softwares group by PNAME

--33.	Display the sales cost of the packages Developed by each Programmer Language wise. 
select sum(DCOST) as value_of_packages,DEVELOPIN from softwares group by DEVELOPIN

--34.	Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy. 
select avg(dcost) as avg_development_cost,avg(scost) as avg_selling_cost,
avg(scost) as avg_price_per_copy  from softwares group by developin

--35.	Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select pname,min(dcost) as min_cost ,max(DCOST) AS MAX_COST from softwares group by PNAME
--36.	Display each institute name with number of Courses, Average Cost per Course. 
SELECT  INSTITUTE,COUNT(COURSE) AS no_of_course ,AVG(COURSE_FEE) as avg_course_fee 
FROM student GROUP BY INSTITUTE
--37.	Display each institute Name with Number of Students.
select INSTITUTE,count(pname)as No_of_std  from student group by INSTITUTE
--38.	Display Names of Male and Female Programmers. Gender also. 
select pname,GENDER from programmers
--39.	Display the Name of Programmers and Their Packages. 
select pname,SALARY from programmers
--40.	Display the Number of Packages in Each Language Except C and C++. 

  select DEVELOPIN,COUNT(title) from softwares group by DEVELOPIN having DEVELOPIN<>'c' and DEVELOPIN<>'c++'
--41.	Display the Number of Packages in Each Language for which Development 
----Cost is less than 1000. 
select DEVELOPIN ,count(title)No_of_packages from softwares where DCOST<1000 group by DEVELOPIN
--42.	Display AVG Difference between SCOST, DCOST for Each Package.
select title, (avg(dcost)-avg(SCOST))as AVG_difference_beetween_scostanddcost 
from softwares group by TITLE
--43.	Display the total SCOST, DCOST and amount to Be Recovered for each Programmer 
--for Those Whose Cost has not yet been Recovered.
select * from
(select scost,dcost,(scost*sold)-DCOST as cost   from softwares) as x where  cost <0
--44.	Display Highest, Lowest and Average Salaries for those earning more than 2000.
select max(salary)as maxsalary,min(salary) as minsalary,avg(salary) as avgsalary
from programmers where SALARY>2000 
--45.	Who is the Highest Paid C Programmers? 
select * from programmers where SALARY=(select max(salary)from programmers
where PROF1 ='c' or  PROF2 = 'c')
--46.	Who is the Highest Paid Female COBOL Programmer? 
select * from programmers where SALARY=(select max(salary) from programmers where GENDER='f'
and ( PROF1 ='colob' or  PROF2 = 'colob'))
--47.	Display the names of the highest paid programmers for each Language. 
select p.PNAME,DEVELOPIN from programmers p ,softwares s where s.PNAME = p.PNAME and 
SALARY = (select max(SALARY) from programmers)


--48.	Who is the least experienced Programmer. 
select * from programmers where doj=(select min(DOJ) from programmers)
--49.	Who is the most experienced male programmer knowing PASCAL. 

select * from programmers where doj=(select max(DOJ) from programmers where
GENDER='m' and (prof1= 'pascal'or prof2 = 'pascal'))
--50.	Which Language is known by only one Programmer? 
select prof1,prof2 from programmers group by prof1,prof2 having count(prof1) =1 or count(prof2)=1 
--51.	Who is the Above Programmer Referred in 50? 
select * from   (select  pname, datediff(yy,dbo1,getdate()) as age from programmers ) 
as x where age >50
--52.	Who is the Youngest Programmer knowing DBASE? 
select * from programmers where dbo1=(select  max(DBO1)as a from programmers
where (prof1= 'dbase'or prof2 = 'dbase') )
--53.	Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
select * from programmers where GENDER='f' and SALARY>3000 and (PROF1  not in ( 'c','c++','oracle')
and PROF2  not in ( 'c','c++','oracle'))
--54.	-Which Institute has most number of Students? 
select COUNT(pname) as noofstudent ,institute from student group by INSTITUTE
--55.	What is the Costliest course? 
select * from student where COURSE_FEE=(select max(COURSE_FEE) from student)
--56.	Which course has been done by the most of the students? 
 select  distinct course from student where COURSE = (select  max(course) from student)

--57.	Which Institute conducts costliest course. 
select INSTITUTE from student where COURSE_FEE=(select max(COURSE_FEE) from student)
--58.	Display the name of the Institute and Course, which has below AVG course fee. 
select distinct INSTITUTE,COURSE from student where COURSE_FEE<(select avg(course_fee ) from student)
--59	Display the names of the courses whose fees are within 1000 (+ or -)
--of the Average Fee, 
   select INSTITUTE from student where COURSE_FEE=(select avg(COURSE_FEE)+1000 from student) and
COURSE_FEE=(select avg(COURSE_FEE)-1000 from student)

--60.	Which package has the Highest Development cost? 
select TITLE from softwares where DCOST=(select max(dcost) from softwares)
--61.	Which course has below AVG number of Students? 
create table temp_avg  (a int, cours varchar(50))
  insert into temp_avg select count(pname),COURSE from student group by course
select * from temp_avg

select cours  from temp_avg where a < (select  avg(a)from temp_avg)   

--62.	Which Package has the lowest selling cost? 
select distinct  TITLE from softwares where scost=(select min( scost) from softwares)
--63.	Who Developed the Package that has sold the least number of copies? 
select DEVELOPIN from softwares where SOLD = (select min(sold) from softwares)

--64.	Which language has used to develop the package, which has the highest sales amount? 

select  distinct DEVELOPIN from softwares where SOLD=(select MAX(sold) from softwares)
--65.	How many copies of package that has the least difference between development and selling cost where sold. 
select sold ,title from softwares where (DCOST - SCOST) = (select min(dcost - SCOST) from softwares)

--66.	Which is the costliest package developed in PASCAL. 
select title from softwares where DCOST=(select max(dcost) from softwares where DEVELOPIN ='pascal')
--67.	Which language was used to develop the most number of Packages. 
select DEVELOPIN from softwares where TITLE=(select max(title) from softwares)
--68.	Which programmer has developed the highest number of Packages? 
select pname from softwares where TITLE=(select max(title) from softwares)

--69.	Who is the Author of the Costliest Package? 
select pname from softwares where DCOST =(select max(DCOST) from softwares)

--70.	Display the names of the packages, which have sold less than the AVG number of copies. 
select title from softwares where SOLD<(select avg(SOLD) from softwares)

--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
 select distinct PNAME from softwares where 2*DCOST >= SCOST


--72.	Display the programmer Name and the cheapest packages developed by them in each language. 
select pname,DEVELOPIN from softwares where DCOST=(select min(dcost) from softwares)

--73.	Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
	select developin,pname,sold from softwares where SOLD in (select  min(sold) from  softwares  group by PNAME ) or
 sold in (select max(sold)from softwares  group by PNAME)
--74.	Who is the youngest male Programmer born in 1965? 
select pname from programmers where GENDER='m' and DBO1 =(select dbo1 where datepart(year,dbo1)='1965')-- from programmers)
--75.	Who is the oldest Female Programmer who joined in 1992? 
select * from programmers where  doj = (select min(doj) from programmers where year(doj)='1992')

--76.	In which year was the most number of Programmers born. 
create table temp_born (yearp int,cnt int)
insert into temp_born select year (dbo1),count(pname)from programmers group by year (dbo1)
select *from temp_born where cnt in (select max(cnt) from temp_born)



--77.	In which month did most number of programmers join?
create table temp_month (monthp int,cnt int)
insert into temp_month select month(doj),count(pname)from programmers group by month(doj)
select *from temp_month where cnt in (select max(cnt) from temp_month)

--78.	In which language are most of the programmer’s proficient. 
 select DEVELOPIN from softwares s , programmers p where p.PNAME = s.PNAME and  p.PROF1 = (select MAx(p.prof1) from programmers p )
	 and PROF2 = (select max(prof2) from programmers p) group by DEVELOPIN
--79.	Who are the male programmers earning below the AVG salary of Female Programmers? 
select pname from programmers where GENDER='m'and SALARY<(select avg(SALARY) from programmers where GENDER='f')
--80.	Who are the Female Programmers earning more than the Highest Paid? 
select pname ,salary from programmers where gender ='f' and SALARY>=(select max(salary)from programmers )
--81.	Which language has been stated asthe proficiency by most of the Programmers? 
   select developin  from  softwares f , programmers p where p.PNAME = f.PNAME and PROF1 = (select MAx(prof1) from programmers)
	 or PROF2 = (select max(prof2) from programmers) group by f.DEVELOPIN
--82.	Display the details of those who are drawing the same salary. 
select * from programmers WHERE salary in( select salary from programmers  group by SALARY having  count(salary)>1)
--83.	Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
select * from softwares f,programmers p where f.PNAME=p.PNAME and GENDER='m' and SALARY>3000

--84.	Display the details of the packages developed in Pascal by the Female Programmers. 
select * from softwares f,programmers p where f.PNAME=p.PNAME and GENDER='f' and DEVELOPIN='pascal'

--85.	Display the details of the Programmers who joined before 1990. 
select * from programmers where year(doj)<'1990'
--86.	Display the details of the Software Developed in C By female programmers of Pragathi. 
--select * from softwares f,programmers p,student s where INSTITUTE ='pragathi' and DEVELOPIN='c' and GENDER='f'
select f.* from softwares f inner join programmers p on f.PNAME=p.PNAME
inner join student s on p.PNAME= s.PNAME  where DEVELOPIN='c'and DEVELOPIN='c' and GENDER='f'
--87.	Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
select count(f.title) noof_packages,s.INSTITUTE,sum(f.sold)as copiessold,sum(f.SCOST)as salesvalue  from softwares f ,student s 
where  f.PNAME = s.PNAME group by INSTITUTE

--88.	Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied. 

create table temo_pname(ins varchar(50),no int)
insert into temo_pname select INSTITUTE , count(pname) from student group by INSTITUTE

select s.* from softwares s,programmers p,temo_pname t where GENDER = 'm' and DEVELOPIN = 'dbase'
and t.no = (select max(no) from temo_pname) and s.PNAME =p.PNAME

--89.	Display the details of the software Developed by the male programmers Born before 1965 
--and female programmers born after 1975. \
select  distinct s.PNAME ,DEVELOPIN,GENDER,DBO1 from softwares s, programmers p where ( GENDER = 'm' and year(dbo1) < '1965') or
(GENDER = 'f' and year(dbo1) > '1975') and s.PNAME = p.PNAME 

--90.	Display the details of the software that has developed in the language which is neither the first 
--nor the second proficiency of the programmers. 
select s.* from softwares s,programmers p where s.DEVELOPIN<>p.PROF1 and s.DEVELOPIN<>p.PROF2 and p.PNAME=s.PNAME
--91.	Display the details of the software developed by the male students of Sabhari. 
select distinct s.* from softwares s,student st ,programmers p where s.pname=st.pname 
and  st.pname=p.pname and p.GENDER='m' and st.INSTITUTE = 'sabhari' 
--92.	Display the names of the programmers who have not developed any packages. 
select * from programmers where PNAME not in (select pname from softwares)
--93.	What is the total cost of the Software developed by the programmers of Apple? 
select sum (scost)cost_of_software from softwares s,student st  where s.pname=st.pname 
and st.INSTITUTE = 'apple'
--94.	Who are the programmers who joined on the same day? 
select p.* from programmers p ,programmers pr where p.DOJ=pr.DOJ and p.pname<>pr.PNAME
--95.	Who are the programmers who have the same Prof2? 
select distinct p.PNAME,p.PROF2 from programmers p ,programmers pr where p.PROF2=pr.PROF2 and p.pname<>pr.PNAME

--96.	Display the total sales value of the software, institute wise. 
select s.INSTITUTE,sum(sf.sold*sf.scost)as salse_value from  student s,softwares sf where s.PNAME=sf.PNAME
group by s.INSTITUTE
--97.	In which institute does the person who developed the costliest package studied. 
select s.INSTITUTE from student s,softwares sf where s.PNAME = sf.PNAME and 
sf.DCOST = (select max(sf.DCOST)from softwares sf ) group by s.INSTITUTE
--98.	Which language listed in prof1, prof2 has not been used to develop any package
select s.DEVELOPIN from  programmers p, softwares s where s.PNAME=p.PNAME and
p.PROF1<>s.DEVELOPIN and p.PROF2<>s.DEVELOPIN

-- 99. How much does the person who developed the highest selling package
--earn and what course did HE/SHE undergo. 
select p.SALARY,s.COURSE,sf.TITLE from student s, softwares sf, programmers p where p.PNAME = sf.PNAME
and sf.PNAME = s.PNAME and sf.SOLD = (select max(sf.sold) from softwares sf)
--100.	What is the AVG salary for those whose software sales is more than 50,000/-. 
 select avg(sALARY) as avg_salary FROM Programmers p, softwares s where p.pname = s.pname and s.scost*s.sold >50000

--101.	How many packages were developed by students,
--who studied in institute that charge the lowest course fee? 
select f.pname ,count(title) as packages from softwares f, student s where COURSE_FEE = (select min(COURSE_FEE) from student)and
f.PNAME = s.PNAME group by f.PNAME

--102.	How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
select count(s.TITLE)as noofpackages,st.PNAME from student st, softwares s 
where dcost = (select min(dcost) from softwares) and st.PNAME = s.PNAME group by TITLE,st.PNAME
--103.	How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select  count(s.TITLE)as noofpackages from programmers p, softwares s WHERE GENDER='F' AND
 SALARY > (select  max(SALARY) FROM programmers WHERE GENDER='M')  and P.PNAME = s.PNAME 
--104.	How many packages are developed by the most experienced programmer form BDPS. 

 select count(title) from softwares s, programmers p where DEVELOPIN = 'bdps' and
year(doj) in (select min(year(doj)) from programmers) and p.pname = s.PNAME
--105.	List the programmers (form the software table) and the institutes they studied. 
select distinct s.PNAME ,st.INSTITUTE from softwares s,programmers p, student st where
( p.pname = s.PNAME ) and (s.PNAME = st.PNAME) 
--106.	List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
select p.pname,count(developin)as developin from programmers p,softwares f where p.PNAME = f.PNAME group by p.PNAME
--107.	List the programmer names (from the programmer table) and No. Of Packages each has developed.
select distinct p.PNAME,count(s.developin)pro_developed from programmers p,softwares s where p.pname = s.PNAME group by p.PNAME

