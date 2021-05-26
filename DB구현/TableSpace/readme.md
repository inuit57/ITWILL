# 정의
- 테이블이 저장되는 공간입니다.
- 오라클에서는 테이블스페이스라는 공간을 먼저 만들고 거기에 테이블 데이터를 저장합니다. 
 
 
## 생성
```
CREATE TABLESPACE storm

DATAFILE 'C:\ORACLE\ORADATA\app_data.dbf' SIZE 100M

DEFAULT STORAGE 
(

  INITIAL    10K
  NEXT      10K
  MINEXTENTS 2
  MAXEXTENTS 50
  PCTINCREASE 50

)
```
※ 추후에 위의 데이타크기(100M) 보다 커지면 데이타크기는 수동명령으로 늘릴수 있다. <br>
※ 만들때 SIZE 100M 뒤에 autoextend on next 10m maxsize 500 옵션을 주면 용량이 FULL로 차면 자동으로 용량이 증가 됩니다.<br>
※ 비슷한 성격(연관성)의 테이블을은 같은 테이블스페이스에 두는게 좋다.<br>
※ 일반적으로 테이블 스페이스 생성시 SIZE를 안주면 디폴트로 2GB 로 잡힙니다.<br>

 
 [참고자료](https://developerhjg.tistory.com/108?category=735703)
