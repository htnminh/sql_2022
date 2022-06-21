USE hrdb;

-- create index employees_salary on employees(salary);

SELECT MAX(SALARY) as MAX_SAL, MIN(SALARY) as MIN_SAL
FROM employees
with(index(employees_salary));