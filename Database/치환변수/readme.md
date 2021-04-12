# 치환변수
- 정의 : 쿼리 구문에서 반복적으로 사용되는 변수를 쉽게 사용하기 위한 방법 
- 검색 기능 등을 구현하였을 때 자주 사용된다. 
- &{변수명} 으로 만들어서 사용 
- 예시 
```
select employee_id , last_name, salary , department_id 
from employees 
where employee_id = &{변수명} ; (엔터 입력)

Enter value for {변수명} :  값 입력 (엔터 입력)
// 조회 결과가 실행된다. 
```
