# Controlfile 다중화 작업 

1. DB 추가 
2. DB 종료
3. OS 추가
4. DB 시작 

- 순서를 지켜서 작업해줘야만 한다. 
- 

## 1. DB 추가 
```
SQL > alter system set control_files = 
//기존에 있는 control_files들 추가 
'/home/oracle/control_cjn.ctl' scope  = spfile ; 
```
- scope는 spfile 만 설정 가능하다. 


## 2. DB 종료 
```
SQL > shut immediate
```

## 3. OS 추가
```
$] cd /u01/app/oracle/oradata/ORCL/controlfile
$] cp o1_mf_fvwn95xm_.ctl /home/oracle/control_cjn.ctl
$] cd /home/oracle
$] ls => control_cjn.ctl 생성된 것 확인 
```

## 4. DB 시작
```
SQL > startup 
```
- ORA 00205 에러 : control 파일명이나 경로가 잘못되었을 경우 발생. 
- show parameter control_files 입력해서 파일명이나 경로가 제대로 입력되었는지 확인
- 그리고 1번부터 다시 반복. 

## 5. 확인 작업
```
SQL > select name from v$controlfile ; 
```
- 앞서 작업한 controlfile들이 출력되는지 확인하면 된다. 
