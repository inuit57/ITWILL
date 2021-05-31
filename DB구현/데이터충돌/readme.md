# Lock이란?
- 동일한 시간에 동일한 데이터에 대해서 서로 다른 세션이 동시에 작업하는 것을 막기 위해서<br>
  Oracle은 DML 발생 시 관련 행 단위로 lock을 구현한다.
- lock은 트랜잭션 종료(commit, rollback)시 해제된다.
- lock이 구현된 행에 작업 요청시 Queue(큐)에서 기다린다. (커서만 깜빡거린다.)


## Lock 충돌 발생되는 경우 
- 커밋(commit)되지 않은 트랜젝션
- 긴 트랜젝션 

# Lock 충돌 확인 
- SYSDBA 권한이 있는 계정으로 로그인. 
- v$session 테이블을 조회한다. 

## v$session
- 같은 이름으로도 동시 접근이 가능하기에 username만으로 구분하는 것은 어렵다.
- 그래서 세션 생성 시에 부여받는 SID , SERIAL# 을 같이 조회할 것.

```
select username, sid, serial# , blocking_session
from v$session
where username is not null ; 

// background process, server process를 안보고 싶다면 
// 이렇게 조회하면 된다. 
// user process만 출력하는 구문.

```

