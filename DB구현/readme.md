## DB 생성
- 리스너를 켜주고 (lsnrctl start) 
- DBCA 명령어를 실행시켜서 오라클 DB 생성하기 


## 생성한 DB로 변경하기 
- echo $ORACLE_SID 로 ORACLE_SID로 현재 설정된 DB를 확인가능
- export ORACLE_SID={DB명} 
  - 예) export ORACLE_SID=resp 
  - 이렇게 하면 현재 터미널 창에서만 DB명을 바꿀 수 있다.
  - .bash_profile 안에 있는 SID는 바뀌지 않는다. (여기에 설정하면 계속 Default DB를 그것으로 지정한다.) 
- 이후로 접속하는 것은 동일하게 진행. 
