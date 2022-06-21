USE hrdb;

-- create index employees_fn_ln on employees(FIRST_NAME, LAST_NAME);

SELECT FIRST_NAME as "First Name", LAST_NAME as "Last Name"
FROM employees
with(index(employees_fn_ln));