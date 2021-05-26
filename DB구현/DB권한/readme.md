

## DCL 구문
- grant : 권한을 부여
- revoke : 권한을 회수 

```
(참고)
DQL (데이터 질의어) : select 
DML (데이터 조작어) : update, delete , insert , (merge) 
DDL (데이터 정의어) : create , alter, drop , truncate 
DCL (데이터 제어어) : grant , revoke 
```

## 권한 유형
- System 권한 : DB를 조작할 수 있는 권한 ( 소유자 : DBA ) 
- Object 권한 : Object를 조작할 수 있는 권한 ( Object 소유자 ) 

### System 권한 (DBA만 부여 가능)
- DB를 조작할 수 있는 권한, System 권한의 종류는 100개 정도 된다. 
- 모든 System 권한은 DBA 가 소유한다. 

##### System 권한 부여 
```
Grant create session , create table
to demo 
{with admin option}; 
```
- demo 에게 system 권한을 부여 
- {with admin option} 
  - 옵션으로 작성해도 되고 안해도 된다.  
  - 부여받은 권한을 다른 유저에게 부여할 수 있게 된다.
  - 예를 들어서 위의 경우, create session, create table 권한만 다른 유저에게 부여 가능.  
  - 부여받지 않은 다른 권한은 불가능. 

- create session 은 DBA 만 부여가능
- with admin option을 부여받은 유저가 다른 유저에게 with admin option을 부여하는 것 가능. 


##### System 권한 회수
```
revoke create table from demo ; 
``` 
- 권한을 회수하더라도 with admin option으로 인하여
 추가로 부여하였던 권한들까지 연쇄적으로 회수하지는 않는다. 
- revoke에서 with admin option을 회수할 수는 없다.  

### Object 권한 ( Object 소유자가 부여가능)
- 어떤 Object에 대해서 부여할지를 on 절에 작성해줘야 한다. 

#### Object 권한 부여 
```
grant select , update 
on employees
to demo 
{with grant option}; 
```
- with grant option
  - 옵션으로 작성해도 되고 안해도 된다.  
  - 다른 유저에게 자신이 가진 권한을 부여가능. 
  - 단, 이렇게 해서 권한을 부여하게 될 경우. on절에 작성할 때 원래 사용자명을 붙여서 사용해야 한다. 
  ```
  grant select on hr.employees 
  to ford ; 
  ```

#### Object 권한 회수
```
revoke create on employees from demo ; 
```
- 권한을 회수할 경우 with grant option으로 인하여
 추가로 부여하였던 권한들까지 <b> 연쇄적으로 회수된다.</b>
