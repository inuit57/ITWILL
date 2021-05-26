## 권한 유형
- System 권한 : DB를 조작할 수 있는 권한 ( 소유자 : DBA ) 
- Object 권한 : Object를 조작할 수 있는 권한 ( Object 소유자 ) 

### System 권한 
- DB를 조작할 수 있는 권한, System 권한의 종류는 100개 정도 된다. 
- 모든 System 권한은 DBA 가 소유한다. 

##### System 권한 부여 
```
Grant create session , create table, create sequence , create view
to demo ; 
```
- demo 에게 system 권한을 부여 

##### System 권한 회수
```
revoke create table from demo ; 
``` 
