USE hrdb;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
FROM employees
with(index(employees_salary))
ORDER BY SALARY ASC;