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
- 
