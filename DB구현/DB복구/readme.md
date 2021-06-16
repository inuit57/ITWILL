# 복구 용어
- Datafile recovery = restore + recover 
- 2단계로 진행이 이뤄진다.

## Restore(복원)
- 백업 파일로부터 손실된 파일을 되살리는 작업 
- 데이터 손실이 발생한다. 
- 작업 방법 : $] cp ----- 

## Recover(복구)
- Datafile만 해당되는 작업
- 복원된 Datafile에 Redo log file , Archived log file의 Redo data를 재적용하는 작업 
- 데이터 손실을 줄일 수 있다.
- 작업 방법 : SQL> recover ------ ; 

## Controlfile 복구 방법
- Controlfile은 다중화된 Member 하나라도 이상이 있으면 DB 작동이 멈추게 된다. 
- 반드시 DB를 종료한 상태에서 남아있는 Member를 사용해서 복구해야 한다. (백업파일 사용 X) 
- 백업 파일은 Controlfile이 모두 손실된 경우에만 사용한다. 

- 그래서 대부분의 기업은 무조건 Controlfile을 다중화해서 사용한다. 

## 복구 절차
### 1) DB 종료
- SQL > shut abort 
### 2) 손실된 Controlfile을 남아있는 member를 사용해서 복구 (복사해서 생성)
- SQL > ! 
- $] cd /u01/app/oracle/oradata/ORCL/controlfile
- $] cp o1_mf_fwvn95xm.ctl u01/app/oracle/fast_recovery_area/orcl/ORCL/contolfile/o1_mf_fwvn96cd_.ctl 

### 3) DB 재시작
- SQL > startup => error(mount X) => 1번부터 다시 작업 

### 4) Open이 잘 된 경우 복구 끝. 
- SQL > select name from v$controlfile ; 

## Redo log file 복구 방법
- Redo log file은 Group 내 Member가 하나라도 정상이면 DB 작동에 영향을 미치지 않는다.
- 그래서 이것에 오류가 생겼는지 알아채는 것이 늦어질 수 있다. 겉으로 보여지는 문제는 없으므로. 
  - DB 관리자는 운영체제 단에서 파일이 정상적으로 있는지를 확인하는 것도 업무 중 하나 
  - Group 내 Member가 모두 죽어버리면 DB가 멈춘다. 
- Control 파일과는 달리 남아있는 Member를 사용해서 복원하는 것이 불가능하다. (Redo log file은 재사용 불가)
  - 굳이 안의 내용을 살릴 필요가 없다. 
  - 손실된 Member를 삭제하고 새로 다중화한다. 

## 복구 절차
### 1) 손실된 Member를 삭제 
```
alter database
drop logfile member '오류난 Member 파일 경로' ; 
```

### 2) 새로운 Member를 해당 위치에 추가 
- 한 바퀴 돌고나면 결국 이상이 없어진다. 
```
alter database
add logfile member '새로운 Member 파일 경로'  // 단, 기존에 사용한 것과 동일한 이름은 사용 불가
to group 2 ; 
```

## Datafile 손실 시 복구
- 가장 먼저 확인해야 하는 것은 손실된 데이터 파일이 Critical 한 지를 확인해야 한다.

### Non-critical Datafile의 복구
- 일반 Datafile을 의미한다.

#### [예시] user01.def(file# : 3) 손실 시 복구 절차
##### (DB 켜는 중)
```
  1. DB mount 상태(open 실패)
  2. 손실된 Datafile만 Offline으로 변경  
    - SQL> alter database datafile 3 offline ; 
  3. DB open 
    - SQL > alter database open; 
    - 우선은, 모든 기능을 사용하지는 못하더라도 다른 사용자들이 사용할 수 있도록 열어주기
  4. restore
  5. recover
```
##### (DB 켜져 있는 상태)
```
  1. DB open 상태
    - open 상태에서 Datafile 손실된 경우.
    - 특정 DB 에 대한 작업이 계속 실패할 때, 의심해봄직 하다. 
  2. 손실된 Datafile만 Offline으로 변경 (굳이 DB를 끌 필요는 없다.)
    - SQL> alter database datafile 3 offline immediate; 
  3. restore
  4. recover
```

### Critical Datafile의 복구
- 필수 Datafile을 의미한다. 
  - system, undo 
