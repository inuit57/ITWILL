1)
```
select substr(last_name, 0 , 8) as name, rpad('*' , floor(salary/1000) , '*' ) as sal 
from employees
order by salary desc ; 
```

2)
```
SELECT last_name, hire_date,
 TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'), 'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW
FROM employees;
```
- Ddspth 에 대한 공부 필요. 

3)
```
SELECT last_name, NVL(TO_CHAR(commission_pct), 'No Commission') COMM
FROM employees;
```

