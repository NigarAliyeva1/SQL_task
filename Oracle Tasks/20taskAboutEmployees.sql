--SUAL 1:
--hr.locations cedvelinden butun melumatlari goturun ve yalniz seher London olsun
--siralama maasa gore olsun (artan ardicilliqla)
select *
from locations l
join departments d on l.location_id = d.location_id
join employees e on d.department_id = e.department_id
order by e.salary;


--SUAL 2:
-- department cedvelinden department adlarini ve department idini gosterin
-- ancaq icinde ing olan department adlari olsun
-- siralama department_id ye gore azalan sira ile olsun
select department_name,department_id from departments
where department_name like '%ing%'
order by department_id desc;

--SUAL 3:
-- employee cedvelinden iscilerin tam adini, hire_date ini goturun
-- ancaq yalniz ise baslama vaxti 24 dekabr 2005 ci ilden sonra olan
-- iscilerin melumatlari olsun
select first_Name||' '||last_name as full_name,hire_date from employees
where hire_date>to_date( '24.12.2005','dd,mm,yyyy');

--SUAL 4:
--adi S ile baslayan iscilerin maasina 1000 elave edin:
update employees
set salary=salary+1000
where first_name like 'S%';
commit;


--SUAL 5:
-- telefon nomresi 515 ile baslayan iscilerin adini soyadini telefon nomresini gosterin
select first_name, last_name, phone_number from employees
where phone_number like '515%';

--SUAL 6:
---- iscilerin adini, job_idsini gosterin
-- ancaq job_id si IT_PROG, ST_CLERK, SA_REP olan job_idler olmasin

select first_name, job_id from employees
where job_id not in ('IT_PROG' , 'ST_CLERK', 'SA_REP');

--SUAL 7:
-- iscilerin adi ve job idsi birlesik gosterilsin ve bu sekilde meselen: 
--Steven is AD_PRES:
select first_name||' is '||job_id from employees;


--SUAL 8:
--Nece department oldugunu department id ile gosterin
select d.department_Id,count(e.employee_id) from employees e join departments d on e.department_id=d.department_id
group by d.department_Id;


--SUAL9:
--Iscilerin tam adini, maasini, heftelik maasini, illik maasini gosterin
select first_name||' '||last_name as full_name, salary, salary/4 as weekly_salary, salary*12 annual_salary from employees;


--SUAL 10:
--H?m ilk h?rfi, h?m de son herfi a olmayan seher adlarini gosterin
--??h?r adlar?n? t?krars?z ??kild? göst?rin.
select distinct city from locations
where city not like 'a%a';


--Sual 11:
---iscilerin emp idsini, dep idsini, adini, soyadini, evvelki maasini, departament adini, tecrube ilini, 
----hazirki maasini gosterin gosterin ve eger tecrube ili 15 e qederdirse isciye 500 azn mukafat verin, 
--eger tecrube ili 15 den boyukdurse o zaman isciye 1000 azn mukafat verin:
select e.employee_id,e.department_id,e.first_name,e.last_name,e.salary old_salary,d.department_name, 
trunc(months_between(sysdate,e.hire_date)/12,0) as years_worked,
case
when trunc(months_between(sysdate,e.hire_date)/12,0)<=15 then e.salary+500 
when trunc(months_between(sysdate,e.hire_date)/12,0)>15 then e.salary+1000 
end as current_salary
from employees e join departments d on e.department_id=d.department_id;
--MSSQL-d? DATEDIFF-l? daha asan h?ll etm?k olar



--Sual 12:
--- en az maas alan departamentin en az maasini, ve dep adini gosterin:
select min(e.salary),d.department_id
from employees e join departments d on e.department_id=d.department_id
group by d.department_id;


--Sual 13:
---max maasi 50-ci dep-in max maasindan boyuk olan dep-lerin id-sini ve max maasini gosterin
select max(e.salary) as salary ,d.department_id
from employees e join departments d on e.department_id=d.department_id
where 
salary > (select max(e.salary) from employees e join departments d on e.department_id=d.department_id where d.department_id=50)
group by d.department_id;


--Sual 14:
--iscilerin emp idsini, adini, soyadini, dep adini, seherini, olkesini, olke idsini
--qeyd edin amma yalniz olkesi United Kingdom olanlari gosterin

select e.employee_id,e.first_name,e.last_name,e.department_id,l.city,c.country_name,c.country_id
from employees e join departments d on e.department_id=d.department_id join locations l on  d.location_id=l.location_id join countries c on  l.country_id=c.country_id
where c.country_name='United Kingdom';

select * from employees;

--Sual 15:
-- her sobenin adini (dep name) ve en yuksek maaslarini tapin
select d.department_name,max(e.salary)
from employees e join departments d on e.department_id=d.department_id
group by d.department_name;

--Sual 16:
--- en az maas alan isciden cox olan iscini ve ya iscileri tapin
select * from employees
where salary>(select min(salary) from employees);

--Sual 17:
--- icininin adini soayadini start date ni end date ni start date ve end date ile arasindaki
--- ferqi gosterin (gun sayini), il sayini gosterin
select first_name,last_name,hire_date,sysdate,trunc(sysdate-hire_date) as days_worked, trunc(months_between(sysdate,hire_date)/12,0) as years_worked
from employees;

--Sual 18: 
---state_province si null olmayan seherleri, olkeleri gosterin
---( istifade edilecek cedveller: hr.locations ve hr.countries)
select l.city,c.country_name from locations l join countries c on  l.country_id=c.country_id
where state_province is not null;


--Sual 19:
---- employee id si 103 olan isciden daha cox maas alan iscileri gosterin
select *
from employees
where 
salary > (select salary from employees where employee_id=103);


--Sual 20:
--- employee_id si cut olan iscilerin, adini, departament adini, maasini, region_name
--elave istifade edeceyiniz cedvel 
--(hr.emp_details_view)
select first_name,department_name,salary,region_name from emp_details_view
where mod(employee_id,2) = 0;



