# 치환변수
- 정의 : 쿼리 구문에서 반복적으로 사용되는 변수를 쉽게 사용하기 위한 방법 
( 추가/검색 기능 등을 구현하였을 때 자주 사용된다. ) 
- 어디에든 사용할 수 있다. where절에도 가능하고 from절에도 쓸 수 있다. 
- 여러 개를 사용하는 것도 가능하다. 

- &{변수명} 으로 만들어서 사용 
- 예시 
```
select employee_id , last_name, salary , department_id 
from employees 
where employee_id = &{변수명} ; (엔터 입력)

Enter value for {변수명} :  값 입력 (엔터 입력)
// 조회 결과가 실행된다. 
```

## 문자/날짜
- 문자나 날짜 값을 받아야하는 변수의 경우 작은 따옴표로 묶어서 작성해야 한다. 
- 다만, 대/소문자 구분을 하기 때문에 필요한 경우 양쪽에 Upper/lower 함수를 사용해서 맞춰서 비교할 것. 
- '&string_data' 
```
select * 
from employees
where job_id = '&job_id' ; 
```

## insert문 예시
```
insert into departments 
values (&d_id , '&d_name' , &m_id, &loc_id) ; 
```


