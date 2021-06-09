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

## 부분 DB 백업
