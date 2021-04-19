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
  - C : 일반적인 
## TABLE_NAME 
- 테이블 이름. 
- 어떤 식으로 저장되어있을지 모르므로 upper나 lower함수를 사용해서 맞춰주고 select를 하는 게 좋다. 

## SEARCH_CONDITION 

## SEARCH_CONDITION_VC 

## R_CONSTRAINT_NAME 
- FK에 해당될 때 참조하는 곳의 제약조건명을 알려준다. 

# 예시 
```
select constraint_name, constraint_type, search_condition, r_constraint_name 
from user_constraints 
where lower(table_name) = 'employees' ; 
``` 

