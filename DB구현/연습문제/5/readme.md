1)
```
select substr(last_name, 0 , 8) as name, rpad('*' , floor(salary/1000) , '*' ) as sal 
from employees
order by salary desc ; 
```
