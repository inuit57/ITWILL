# &lt;Database fail 유형>

1. Statement fail
2. User proc fail
3. Network fail
4. User error
5. Instance fail
6. Media fail

## 1. Statement fail
- DB에서 실행한 SQL구문이 정상적으로 실행되지 않고 오류가 발생된 경우
- 원인 : 오타, 문법 오류 , 권한 부족, 저장 공간 부족 등
- 해결 : SQL 구문 수정, 권한 부여, 저장 공간 추가 등 

## 2. User proc fail
- DB에 접속되어 있던 User가 비정상적으로 접속을 종료한 경우
- 원인 : user가 비정상 종료, DBA로부터 Kill 을 당한 경우, Client PC가 다운된 경우 등 
- 해결 : User가 다시 접속하면 된다. (PMON이 User의 트랜젝션 rollback, Lock 해제함)

## 3. Network fail
- DB는 정상적으로 켜져있으나 DB 접속이 안 되는 경우 
- 원인 : 네트워크에 문제가 있는 경우, 리스너가 꺼져있는 경우
- 해결 : 네트워크 문제 해결, 리스너 시작 후 DB 재시작 

## 4. User error (사용자 실수)
- DB에서 실행한 SQL 구문이 정상적으로 실행되었으나 잘못된 작업을 수행한 경우
- 원인 : 잘못된 DDL , 잘못된 DML 등
- 해결 : 트랜젝션 진행 중이면 rollback하면 됨, 테이블을 잘못 삭제한 경우라면 flashback table 실행.
        - 트랜젝션이 종료된 경우라면 반대의 작업을 다시 진행하는 수밖에 없다. 
5. Instance fail
6. Media fail
