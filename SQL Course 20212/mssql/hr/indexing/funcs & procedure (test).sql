/* I can't run sql on the school computer so there might be syntax errors */
use hrdb;

drop function fullname;
go
create function fullname(@fn varchar(20), @ln varchar(25))
returns varchar(50) as
begin
  return @fn + ' ' + @ln;
end;
go

select dbo.fullname(first_name, last_name) from employees;

drop function get_job_title;
go
create function get_job_title(@job_id varchar(10))
returns varchar(10) as
begin
  return (select job_title from jobs where @job_id = job_id);
end;
go

select first_name, last_name, dbo.get_job_title(job_id)
from employees;


drop function count_departments;
go
create function count_departments(@country_id char(2))
returns int as
begin
  return (select count(*)
         from (departments d join locations l on d.location_id = l.location_id) 
            join countries c on l.country_id = c.country_id
         where c.country_id = @country_id);
end;
go

select sum(dbo.count_departments(country_id))
from countries
group by region_id;

drop procedure ChangeJob;
go
create procedure ChangeJob(@employee_id int, @job_id varchar(10))
as begin  
  insert into job_history values (
    @employee_id,
    (select hire_date from employees where employee_id = @employee_id),
    getdate(),
    (select job_id from employees where employee_id = @employee_id),
    (select department_id from employees where employee_id = @employee_id)
  );
  update employees set
    job_id = @job_id,
    salary = (select min_salary from jobs where job_id = @job_id)
  where employee_id = @employee_id;
end;
go