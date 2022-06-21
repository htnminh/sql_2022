USE hrdb;

SELECT AVG(SALARY) as AVG_SAL, COUNT(DISTINCT EMPLOYEE_ID) as COUNT_EMPL_ID
FROM employees
with(index(employees_salary));