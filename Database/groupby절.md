# 그룹함수 

- sum , count , avg , max , min 등이 있다. 
- 주의사항 : null 값을 제외하고 계산한다. 
- 특히, avg()를 계산할 때 주의해야 하는데, null 값이 제외되기에 전체인원으로 나눈 평균이 아닐 수 있다.
- 만약 전체인원의 평균을 계산하려고 한다면 avg(nvl(column_name)) 으로 하는 것이 좋다. 

# Group By절 
- 보통 그룹 함수와 같이 사용되곤 한다. 
- group by절로 그룹화한 열들 그룹 함수로 계산해서 출력해준다. 

```
select department_id , job_id , count(last_name) 
from employees
group by department_id , job_id ;  // job_id를 빼먹으면 에러 난다. 

```

# Having 절
- 그룹함수를 사용한 조건을 사용하려고 할 경우 where절이 아닌 having 절을 사용해야 한다. 
