# 서브쿼리 사용 시 주의사항 
- 반환되는 결과 값이 하나 이상인 경우, 그것을 비교연산자와 사용할 경우 오류가 날 수 있다.<br>
(어떤 값과 비교해야하는지 모호하기 때문) 
- 단일행 서브쿼리를 사용해야만 한다. 

예) 
```
select last_name , job_id, salary 
from employees 
where job_id = 
(select job_id 
from employees 
where last_name = 'Taylor') 
and salary > 
(select salary
from employees 
where last_name = 'Taylor') ; 
```
-> 
ORA-01427 에러 발생 


## 해결 방법
- "=" 대신 "IN" 연산자를 사용하면 된다. 
- IN : 안에 포함된 값이 있으면 True를 리턴한다. 


# Multiple-Row subquery
- 서브 쿼리에서 여러 행을 반환하는 경우의 처리 
## ANY 연산자 사용 (OR)
```
select employee_id , last_name, job_id, salary
from employees 
where salary < ANY 
(select salary from employees where job_id = 'IT_PROG') 
and job_id <> 'IT_PROG' ; 
```

- < ANY(9000 , 6000 , 4200) : 최댓값 보다 작으면 된다. 
- > ANY(9000 , 6000 , 4200) : 최솟값보다 크면 된다.
- = ANY : IN과 동일하다. 
     - <> ANY : 모든 값이 true가 되므로 연산자로서 의미가 없어서 사용되지 않는다. 

## ALL 연산자 사용 (and) 
```
select employee_id , last_name, job_id, salary
from employees 
where salary < ANY 
(select salary from employees where job_id = 'IT_PROG') 
and job_id <> 'IT_PROG' ; 
```

- < ALL(9000 , 6000 , 4200) : 최솟값보다 작으면 된다. 
- > ALL(9000 , 6000 , 4200) : 최댓값보다 크면 된다.
- <> ANY : NOT IN과 동일하다. 
     - = ALL : 모든 값이 true가 되므로 연산자로서 의미가 없어서 사용되지 않는다. 
