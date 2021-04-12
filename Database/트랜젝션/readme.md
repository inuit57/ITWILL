# 트랜젝션 제어 명령어
- commit : DML 구문을 DB에 실제로 반영한다.
- rollback : 마지막 트랜젝션을 시작하기 전으로 되돌린다. 


## 트랜젝션 구성 
- 여러 개의 DML 구문이 하나의 트랜젝션  (insert , delete, update) 
- 하나의 DDL 구문이 하나의 트랜젝션 (create , drop , alter) 
- 하나의 DCL 구문이 하나의 트랜젝션 ( grant, revoke ) 
    -  DDL / DCL 은 rollback 이 안된다.
    -  auto commit이 내장되어있다. 

## 트랜젝션 시작 및 종료 
- 시작 : 첫 번째 DML 구문 실행 시 
- 종료 : 
    - commit 또는 rollback 실행 시 
    - DDL 또는 DCL 구문 실행 시 (auto commit) 
    - SQL 프로그램 정상 종료시 ( auto commit ) 
    - 시스템 장애로 프로그램 강제 종료될 경우 (auto commit) 
