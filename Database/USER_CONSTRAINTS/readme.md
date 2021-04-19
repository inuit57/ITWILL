# 정의
- DB 사전에 저장되어 있는 제약조건(constraint) 목록. 

```
desc user_constraints ; 
// 모든 종류가 다 나온다. 
// select 하기 전에 이걸로 먼저 보는 것이 좋다. 
```

# 각각의 컬럼에 대한 간단한 설명
## CONSTRAINT_NAME 
- 제약조건명

## CONSTRAINT_TYPE 
- 제약조건 타입 
  - P : PK
  - U : UNIQUE
  - R : REFERENCE의 약자, FK 제약조건
  - C : 일반적인 제약조건 (NOT NULL, CHECK) 
  
## TABLE_NAME 
- 테이블 이름. 
- 대문자로 저장되어있다. 비교할 경우 ''로 묶고 테이블명을 대문자로 해서 조회할 것.
(혹은 LOWER() 또는 UPPER() 함수를 사용할 것.) 

## SEARCH_CONDITION 
- CONSTRAINT_TYPE에서 "C"로 나오는 것이 어떤 조건인지 확인할 수 있다.
- 자세한 조건을 확인할 수 있다. NOT NULL 인지 CHECK 제약조건인지. 

## R_CONSTRAINT_NAME 
- FK에 해당될 때 참조하는 곳의 제약조건명을 알려준다. 

# 예시 
```
select constraint_name, constraint_type, search_condition, r_constraint_name 
from user_constraints 
where lower(table_name) = 'employees' ; 
``` 


# 일반화
```
select constraint_name, constraint_type, search_condition, r_constraint_name 
from user_constraints 
where lower(table_name) = lower('&t_name') ; 
``` 
