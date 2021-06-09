# 백업 도구(Tool) 

## User 관리 방식의 백업
- 운영체제 명령어를 사용한 백업
- 물리적으로 데이터를 복사해서 백업(cp)

## RMAN 방식의 백업
- 오라클에서 제공하는 프로그램. recovery manager을 사용한 백업
- RMAN 명령어를 사용한 백업 

-----

# 백업 모드 

## Offline 백업 (= cold backup)
- DB가 꺼진 상태의 백업
  - shut, nomount, mount 상태에서 이뤄지는 백업
## Online 백업  (= hot backup)
- DB까 켜져있는 상태에서 진행되는 백업 (open 상태)

----- 

# 백업 전략
## 전체 DB 백업
- Datafiles(전부) + Control files(1개 이상)
- 다른 파일들은 다시 만드는 것이 어렵지 않기에 굳이 백업을 받아놓지는 않는다. 
## 부분 DB 백업
- 특정 Datafile만 또는 Controlfile만 백업

----

# 백업 유형
## Full 백업 
- Datafile의 모든 block을 포함하는 백업
## incremental 백업 (증분 백업) 
- 마지막 백업 이후, 변경된 block만을 포함하는 백업

---

# 백업파일 유형
## iamge copy
- 복사본 형태의 백업 파일
- 원본 : 백업본 = 1 : 1 
## backupset 
- 파일들의 모음(묶음) 형태의 백업 파일
- *.bkp  
- 
