USE hrdb;

create index employees_fn on employees(FIRST_NAME);
go

SELECT * 
FROM employees
with(index(employees_fn))
ORDER BY FIRST_NAME DESC;