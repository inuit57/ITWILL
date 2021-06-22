# 1번 문제
employees 테이블로부터 평균 급여가 가장 높은 부서의 부서 번호와 최저 급여를 표시 

```
select department_id, mini from 
(
(select department_id, min(salary) as mini , avg(salary) as avg from employees group by departemnt_id) 
join 
(select max(avg(salary)) as max from employees group by department_id) 
on avg = max 
) ; 
```
- 참고사항 : max(avg(salary)) 를 사용할 때 주의할 점 
- select department_id, max(avg(salary)) 와 같은 식으로 조회는 불가능하다. 
- 구문이 대단히 모호해지기 때문 
- [참고자료](https://keep-cool.tistory.com/37?category=720231)

## 모범풀이
```
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MAX(AVG(salary))
 FROM employees
 GROUP BY department_id);
 ```


# 2번 문제 
- Having 절을 잘 사용하면 좋다. 

## 모범 풀이

a) 사원수가 3명 미만인 부서:
```
SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) < 3;
```

b) 사원수가 가장 많은 부서:
```
SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
 FROM employees
 GROUP BY department_id);
```
c) 사원수가 가장 적은 부서:
```
SELECT d.department_id, d.department_name, COUNT(*)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(*) = (SELECT MIN(COUNT(*))
 FROM employees
 GROUP BY department_id);
 ```
