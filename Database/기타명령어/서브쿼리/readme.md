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
