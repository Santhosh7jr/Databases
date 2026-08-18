SELECT * FROM teachers;

TABLE teachers;

SELECT * FROM teachers ORDER BY salary DESC;

SELECT first_name, hire_date, salary FROM teachers ORDER BY 2 DESC;

SELECT DISTINCT school FROM teachers;

SELECT first_name, salary FROM teachers WHERE salary > 40000 ORDER BY salary DESC;

SELECT * FROM teachers WHERE salary > 40000 AND salary < 60000 ORDER BY salary DESC;

SELECT id, first_name, school, salary FROM teachers WHERE salary < 40000 OR salary > 45000 ORDER BY 4 DESC;