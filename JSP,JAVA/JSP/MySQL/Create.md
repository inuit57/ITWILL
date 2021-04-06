# 기본키 조건
## primary key 
- unique + not null 
- 중복 x , null 이어서는 안된다. 
- 홈페이지로 치면 ID 값. 

```
create table test1(
  idx int primary key , 
  date date 
); 
```

## auto_increment 
- 자동으로 넣을 때마다 숫자가 증가. 
- null을 넣어도 알아서 들어간다? 

```
create table test2(
  idx int primary key auto_increment , 
  date date , 
  datetime datetime, 
  timestamp timestamp 
  ); 
```



