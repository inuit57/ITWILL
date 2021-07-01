## Correlated subquery (상호 관련 서브쿼리)
- 메인 쿼리에 들어있는 컬럼을 서브쿼리에서 사용하는 쿼리. 
- 성능적으로 뛰어난 문법은 아니므로, 일반 쿼리로 변경 가능하다면 변경하는 것이 맞다. 

- 하지만 이 쿼리를 써야만 하는 경우가 있기 때문에 사용되곤 한다.

- 예시
```
//각 부서에서 급여가 가장 높은 사원의 세부 정보를 표시합니다
SELECT department_id, employee_id, salary
FROM EMPLOYEES e
WHERE 1 =
 (SELECT COUNT(DISTINCT salary)
 FROM EMPLOYEES
 WHERE e.department_id = department_id
 AND e.salary <= salary)
```

```
//자신의 부서의 평균 급여보다 많은 급여를 받는 사원을 모두 찾습니다.
SELECT last_name, salary, department_id
FROM employees outer_table
WHERE salary >
 (SELECT AVG(salary)
 FROM employees inner_table
 WHERE inner_table.department_id =
 outer_table.department_id);
```

## EXISTS 연산자 (반대 : NOT EXISTS) 
- 서브쿼리의 결과 집합에 행이 있는지 테스트한다. 
- 존재 유무만 판단한다. 
- 존재하는 값이 확인되면 더이상 수행하지 않고 True를 리턴한다. 
- 그렇지 않을 경우 끝까지 수행하고 없다면 False를 리턴한다. 

- 예시
 ```
 // 부하직원이 있는 직원을 조회하는 쿼리 
 SELECT employee_id, last_name, job_id, department_id
FROM employees outer
WHERE EXISTS ( SELECT 'X'
 FROM employees
 WHERE manager_id =
 outer.employee_id);
 ---------------------------------------------------
 //같은 결과를 도출하는 쿼리
SELECT employee_id, last_name, job_id, department_id
FROM employees  
where employee_id in (select manager_id from employees) ; 
```
