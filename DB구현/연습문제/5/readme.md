1)
```
select substr(last_name, 0 , 8) as name, rpad('*' , floor(salary/1000) , '*' ) as sal 
from employees
order by salary desc ; 
```

2)
```
select to_char(next_day (add_months(hire_date, 6) , 'mon') , 'DL') as res
from employees 
```
- 추가공부 필요 : 숫자를 영어로 출력하는 방법 'JSP' 
