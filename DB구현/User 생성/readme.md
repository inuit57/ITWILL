## 유저 생성시 주의사항 
- 유저 생성 후 권한 부여까지 하였더라도 
- 테이블을 만들고 insert를 하는 것은 공간을 할당 받아야만 가능하다. 


### 유저 생성 시 공간할당까지 해주는 법
```
create user test3 
identified by test3 

default tablespace inventory 
temporary tablesapce temp 
quota 30M on inventory ;  // 여기가 공간 할당 해주는 부분 
quota 20M on users ; // 이런 식으로 quota 를 여러 번 사용해서 다른 tablespace의 공간을 할당해줄 수 도 있다.  
```

### 할당량 변경해주기 
```
alter user test1
quota 20M on users ; 
```

### Default TableSpace가 아닌 다른 곳에 만들기 
```
create table emp2 
(id number(10), name varchar2(10)) 
tablespace users; 
```
- users tablespace 공간에 테이블을 생성해준다. 
- 이런 식으로 default tablespace가 아닌 다른 곳에 넣어줄 수도 있다. 
