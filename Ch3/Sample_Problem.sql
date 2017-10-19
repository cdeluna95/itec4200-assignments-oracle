SET VERIFY ON
SELECT last_name, &&column_name
FROM employees
ORDER BY &column_name;
UNDEFINE column_name
