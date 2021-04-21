# 정의
- 자동으로 고유한 번호를 반환해주는 번호 생성기 같은 Object 

## 생성 (create)
```
create sequence 시퀀스명  

[increment by n ] //default = 1,  증가하는 수치
[start with n] // defualt = 1 , 시작 위치 
[ {maxvlue n | (nomaxvlaue) } ] // 최대값, 생략시 nomaxvalue, 시스템에 정의된 최댓값(10^27)
[ {minxvlue n | (nominvlaue) } ] // 최솟값, 생략시 nomaxvalue, 시스템에 정의된 최소값(-10^26)
[ {cycle | (nocycle) } ] // 최댓값/최솟값을 찍고나면 순환하는 것이 cycle, 오류메시지를 띄워주는 것이 nocycle
[ {cache n | nocache } ]  // 미리 n개만큼 계속 만들어놓는 것. 캐시메모리 사용여부 
```
## 수정 (alter) 
- 시퀀스 시작값 변경 불가 (start with N) 
```
alter sequence 시퀀스명
[increment by n ] 
[ {maxvlue n | (nomaxvlaue) } ] 
[ {minxvlue n | (nominvlaue) } ] 
[ {cycle | (nocycle) } ] 
[ {cache n | nocache } ]  
```

### 기본값 정리 
```
create sequence 시퀀스명 
==
create sequence 시퀀스명
increment by 1 
start with 1 
nomaxvalue
nominvalue
nocycle
cache 20 

// 순서는 따로 없다. 옵션이라서 "," 찍지 말기 

```
- 성능이 더 좋은 것은 캐시. 기본값 cache 20 
- 캐시에 저장된 것을 사용하면 새로 만들어놓는다. 

## 사용방법
```
시퀀스명.nextval -> 다음으로 사용될 시퀀스값
시퀀스명.currval -> 마지막으로 사용된 시퀀스값(현재)

(예)
insert into departments 
values ( dep_seq.nextval , 'Test1', 100,1700) ; 

(예2) : 현재 시퀀스 값 확인
select dep_seq.currval
from dual ; 
```

## 주의사항
- nextval 로 증가시킨 시퀀스번호는 rollback으로 되돌아가지 않는다. 
- 이러한 것을 Gap이라고 말한다. 
```
insert 340 ;
insert 350 ; 
commit ; 
insert 360 ; 
insert 370 ; 
rollback ; 
insert 시퀀스명.nextval ; // 380이 된다. 
```
