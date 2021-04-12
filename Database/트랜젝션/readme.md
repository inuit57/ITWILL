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
    - 시스템 장애로 프로그램 강제 종료될 경우 (auto ROLLBACK) 

## SAVEPOINT A 
- rollback시에 지정해서 돌아갈 수 있는 특정 시점을 만들 수 있다. 
- 생성 : savepoint (세이브포인트명)
- 사용 : rollback to savepoint (세이브포인트명)
- 예시
```
insert into AAA values(...) 
slect * from AAA ; 

SAVEPOINT A ; 
delete from AAA; 

rollback to savepoint A ; // A로 돌아간다. insert문, select * from AAA 는 수행된다. 

rollback ; // 이렇게 쓸 경우 insert, select문을 하기 이전으로 돌아간다. 
```
- 주의사항
    - 세이브포인트명은 DB에 따로 저장되는 것이 아니기에 만든 이가 기억해야한다.
    - 한번 rollback으로 사용된 세이브 포인트는 사라진다. 하나의 세이브 포인트를 2번 사용할 수는 없다. 
