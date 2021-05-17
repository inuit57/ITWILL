# 개요
- DB가 시작될 때 어떤 순서로 진행되는지에 대해서 서술한다. 
- DB 상태를 조회하는 쿼리
```
   select status from v$instance ; 
```
- 상태 확인(status)
   - started (= nomount)
   - mounted 
   - open
- DB 종료 : 종료 명령어가 입력된 상태 이후로는 추가적인 DB 접속을 허용하지 않는다.
   - 정상종료
      - shutdown immediate : 현재 진행중인 SQL을 모두 stop 시키고, 트랜젝션은 전부 rollback, 유저 접속종료를 기다리지 않고 종료시킨다.
      - shutdwon transactional : 진행 중인 트랜젝션이 있다면 그것이 종료될 때까지 기다린 후 종료한다. (새로 트랜젝션을 추가X)
      - shutdown normal(default) : 유저들이 연결종료를 할 때까지 기다린 후 종료합니다. 
    - shutdown abort : 비정상 종료 (강제종료) , 남아있는 세션이나 트랙젝션들을 기다리지 않고 모두 종료시킨다. 

## &lt; Shutdown > 
- DB가 꺼져있는 상태 
  - 다음 단계로 안 넘어간다면 Parameter file 점검
### 상태변경 
- startup {단계명} : 원하는 단계로 변경가능. 단계명을 적지 않을 경우 open으로 변경
   - startup nomount (Shutdown에서 nomount상태로 변경)
   - startup (shutdown 상태에서 open상태로 변경)
   - startup mount (Shotdown에서 mount상태로 변경)

## &lt; Nomount > 
- Instance가 시작된 단계
- DB 생성
- Controlfile 재생성
  - 다음 단계로 안 넘어간다면 Control file 점검
  
### 상태변경
- alter database mount (nomount에서 mount로)

## &lt; Mount > 
- Controlfile이 정상적으로 읽혀진 단계
- Datafile, Redologfile 위치 및 이름 변경
- 전체 DB 복구
- DB 모드(Archive log mode) 변경
  - 다음단계로 안 넘어간다면 아래의 파일을 점검
    - Data file
    - Redo log file
### 상태변경
- alter database open (mount에서 open으로)

## &lt; Open > 
- DB가 정상적으로 켜진 단계
- 일반 DB User 접속 가능 

