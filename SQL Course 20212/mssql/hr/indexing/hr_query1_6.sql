USE hrdb;

SELECT SUM(SALARY) as SUM_SAL
FROM employees
with(index(employees_salary));