USE hrdb;

-- Since I'm not really sure what is "working with the company"
-- in this case, so I will count the numbers of employees
-- group by DEPARTMENT_ID.
SELECT DEPARTMENT_ID, COUNT(DISTINCT EMPLOYEE_ID) as COUNT_EMPL_ID
FROM employees
GROUP BY DEPARTMENT_ID;