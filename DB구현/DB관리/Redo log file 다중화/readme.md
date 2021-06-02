# Redo Log file 다중화 
- DB의 모든 변경작업의 로그 정보가 기록된 곳 
- 순환형으로 관리되는 파일 
- DB 당 최소 2개 이상의 Redo log Group 존재해야함. 

## 그룹당 맴버 갯수 조회 
```
select group#, members from v$log ; 
```

## 그룹당 맴버 정보 조회 
```
select group#, member 
from v$logfile
order by group# ; 
```
