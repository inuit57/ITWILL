# Redo Log file 다중화 
- DB의 모든 변경작업의 로그 정보가 기록된 곳 
- 순환형으로 관리되는 파일 
- DB 당 최소 2개 이상의 Redo log Group 존재해야함. 
- 권장되는 갯수는 그룹 3개, 그룹당 맴버는 2개

## 그룹당 맴버 갯수 조회 
```
select group#, members from v$log ; 
```

```
select group#, members, status from v$log ; 
```
- status 가 current 인 그룹이 현재 기록되고 있는 그룹. 

## 그룹당 맴버 정보 조회 
```
select group#, member 
from v$logfile
order by group# ; 
```

## Redo log Group 추가
```
alter database add logfile group 4 
('/u01/app/oracle/oradata/ORCL/onlinelog/redo4a.log',
'/u01/app/oracle/fast_recovery_area/orcl/ORCL/onlinelog/redo4b.log')
size 50M ; 
```

## Redo log Member 추가
```
alter database add logfile member
'/u01/app/oracle/oradata/ORCL/datafile/redo1c.log' to group 1, 
'/u01/app/oracle/oradata/ORCL/datafile/redo2c.log' to group 2,
'/u01/app/oracle/oradata/ORCL/datafile/redo3c.log' to group 3,
'/u01/app/oracle/oradata/ORCL/datafile/redo4c.log' to group 4 ; 
```

## DB log mode 조회
``` 
select log_mode
from v$database ; 

archive log list 
```


## DB log mode 변경
1) DB 종료
```
shut immediate
```
2) DB mount
```
startup mount
```
3) DB log mode 설정
```
alter database archivelog ; 
// alter database noarchivelog; 
```
4) DB open 
```
alter database open ; 
```
5) 확인 
```
archive log list 
```
