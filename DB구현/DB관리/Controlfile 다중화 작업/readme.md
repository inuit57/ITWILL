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
SQL > startup => error : mount X 
```
