# 정의
- 테이블 구조는 남겨두고 테이블의 모든 행을 삭제 

# 사용법
``` 
truncate table 테이블명; 
```

# delete문과의 비교 

| DELETE | TRUNCATE | 
|--------|-----------|
| 특정 행만 삭제 가능 | 모든 행밖에 삭제 못함 |
| DML | DDL |
| 저장공간 반납 X | 저장공간 반납 O | 
| ROLLBACK 가능 | ROLLBACK 불가능 | 

