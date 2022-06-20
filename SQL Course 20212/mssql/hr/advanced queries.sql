use hrdb;

-- 1
select first_name, last_name, job_id, department_id
from employees
where department_id in
	(select department_id from departments where location_id in 
		(select location_id from locations where city = 'London'));

-- 2
select
	e.employee_id, e.last_name as employee_last_name, 
	m.employee_id as manager_id, m.last_name as manager_last_name
from employees e, employees m

-- 3
select jh.EMPLOYEE_ID, datediff(DAY, jh.START_DATE, jh.END_DATE) as NO_DAYS 
from job_history as jh join jobs on jh.JOB_ID = jobs.JOB_ID
where DEPARTMENT_ID = 90;

-- 3
select jh.EMPLOYEE_ID, datediff(DAY, jh.START_DATE, jh.END_DATE) as NO_DAYS 
from (select * from job_history where department_id = 90) jh
	join jobs on jh.JOB_ID = jobs.JOB_ID;

-- 4
select JOB_TITLE, AVG(SALARY) as AVG_SALARY
from employees join jobs on employees.JOB_ID = jobs.JOB_ID
group by JOB_TITLE;

-- 5
select JOB_TITLE, first_name, last_name, salary - min_salary
from employees join jobs on employees.JOB_ID = jobs.JOB_ID;

-- 6
select * from job_history where employee_id in
  (select employee_id from employees where salary > 10000);

-- 7
select department_name, first_name, last_name, hire_date, salary
from (select distinct manager_id from employees where year(getdate())-year(hire_date)>15) m
	join employees e on m.manager_id = e.employee_id
	join (select department_id, department_name from departments) d on e.department_id = d.department_id; 
 
-- 1
select first_name, last_name from employees 
where month(hire_date) = 6;

-- 2
select year(hire_date)
from employees
group by year(hire_date)
having count(*) > 10;

-- 3
select first_name
from employees 
where year(hire_date) = 1987;

-- 4
select department_name, first_name, last_name, salary
from (select distinct manager_id from employees where year(getdate())-year(hire_date)>5) m
	join employees e on m.manager_id = e.employee_id
	join (select department_id, department_name from departments) d on e.department_id = d.department_id; 

-- 5
-- https://stackoverflow.com/questions/3969059/sql-case-sensitive-string-compare
select * from employees
where first_name = upper(first_name) COLLATE Latin1_General_CS_AS;

-- 6
select right(phone_number, 4) from employees;
