USE hrdb;

SELECT FIRST_NAME, LAST_NAME, SALARY, 0.15*SALARY AS PF
FROM employees
with(index(employees_salary));