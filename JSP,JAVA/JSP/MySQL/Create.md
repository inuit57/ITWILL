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
- null을 넣어도 알아서 들어간다.

```
이미 만든 테이블에 자동증가 옵션을 넣고 싶을 때 
ALTER TABEL 'TEST' MODIFY 'num' INT NOT NULL AUTO_INCREMENT;
```

```
create table test2(
  idx int primary key auto_increment , 
  date date , 
  datetime datetime, 
  timestamp timestamp 
  ); 
```
- 여기에서 전부 null로 해서 insert 해준다면 idx, timestamp는 자동으로 채워준다. 
 
<b> 문제점 </b> <br>
만약 중간 숫자가 사용자의 실수로 삭제된다면 그것을 채우지 않고 마지막 숫자에서 증가시킨다. <br>
예를 들어서 10개를 만들고 중간의 5번을 지우고 하나를 추가할 때 그것이 부여받게 되는 값은 5가 아닌 11이 된다. <br> 


