# 개요 
- 가장 큰 n개의 값 또는 가장 작은 n개의 값을 가져오는 구문. 
- ROWNUM이라는 컬럼을 사용하여 컬럼들의 행번호를 지정하고 order by로 정렬한 뒤 ROWNUM의 범위를 지정해서 처리하는 구문. 

```
SELECT AA.* , ROWNUM
FROM (SELECT [column_list]
FROM table
ORDER BY TOP-N_column) as AA
WHERE ROWNUM <= N;
```

# 주의 사항
- rownum 를 where절에서 비교할 때는 < , <= 밖에 사용할 수 없다. 
  - 행을 가져오는 과정에서 rownum을 생성해주는 방식이기 때문에 >=,> , = , !=을 사용하면 rownum을 증가시키는 것이 불가능해진다. 
  (where 조건문에서 걸려서 rownum을 생성하지 못하게 된다.) 
- 또한 정렬이 필요한 출력테이블은 따로 서브쿼리로 작성해서 미리 정렬을 하고 그것을 바깥 select문에서 rownum을 사용해서 순번을 등록시켜줘야 한다. 


## 응용 - 범위 체크
- salary가 상위 10위~20위에 해당하는 사원들의 정보를 출력하기. 
```
select * 
from 
( 
  select AA.* , rownum as rank 
  from 
  (
    select employee_id, last_name, salary , e.department_id, department_name
    from employees e join departments d 
    on e.department_id = d.department_id 
    order by salary desc 
  ) as AA
)
where (10<= rank) and (rank <=20) ; 
```
- 주의사항 : 마지막 where 조건문에서 (10<=rownum) and (rownum <=20) 으로 조건식을 주면 안된다.
- 이렇게 할 경우 다시 현재 조회하는 컬럼에서 rownum을 생성하기 때문에 의미가 없어지므로 <br>
내부 select 문에서 rank로 alias해준 rownum으로 연산을 수행해야 한다. 



## 자료 출처
- [rownum 으로 범위지정](https://mainia.tistory.com/267)
- [rownum 사용시 주의사항](https://blog.naver.com/jihoon8912/220237484302)
