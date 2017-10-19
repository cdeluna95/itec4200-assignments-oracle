SELECT INITCAP('init cap or else')
FROM DUAL;

SELECT INITCAP(SYSDATE)
FROM DUAL;

SELECT INITCAP(21/7)
FROM DUAL;

SELECT LENGTH(1+2.14)
FROM DUAL;

SELECT LENGTH(SYSDATE)
FROM DUAL;

SELECT LPAD(1000 + 200.55, 14, '*')
FROM DUAL;

SELECT RPAD(1000 + 200.55, 14, '*')
FROM DUAL;

SELECT LPAD(SYSDATE, 20, '$#')
FROM DUAL;

SELECT INSTR(3 + 0.14, '.')
FROM DUAL;

SELECT INSTR('1#3#5#7#9', '#')
FROM DUAL;

SELECT INSTR('1#3#5#7#9', '#', 5)
FROM DUAL;

SELECT INSTR('1#3#5#7#9', '#', 3, 4)
FROM DUAL; -- 3 is starting position, 4 is occurrence

SELECT REPLACE('1#3#5#7#9', '#', '>')
FROM DUAL;

SELECT REPLACE('1#3#5#7#9', '#')
FROM DUAL;

SELECT SUBSTR(SYSDATE, 4)
FROM DUAL;

SELECT SUBSTR(SYSDATE, 4, 3)
FROM DUAL; -- 4 is starting position, 3 is number of characters

SELECT SUBSTR(SYSDATE, -2)
FROM DUAL; -- negative number starts from right

SELECT SUBSTR(SYSDATE, -6, 3)
FROM DUAL;

SELECT ROUND(45.982, -2)
FROM DUAL;

SELECT ROUND(55.982, -2)
FROM DUAL;

SELECT MOD(7, 35)
FROM DUAL;

SELECT MOD(4.2, 3)
FROM DUAL;

SELECT NEXT_DAY('20-AUG-17', 'Sunday')
FROM DUAL;

SELECT hire_date,
       NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday') AS "6-Month Review"
FROM employees;

SELECT TO_CHAR(SYSDATE, 'MM/DD/YYYY  HH24:MI AM') AS "Date Info"
FROM DUAL; -- AM, but outputs PM

SELECT TO_CHAR(SYSDATE, 'DAY') AS "Today's Day!"
FROM DUAL;

SELECT last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('September 28, 1997', 'MM/DD/YYYY');

SELECT TO_CHAR(TRUNC(SYSDATE, 'MM'), 'Month DD, YYYY')
FROM DUAL;
