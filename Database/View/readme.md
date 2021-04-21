# 정의 및 사용이유
- 하나 이상의 테이블을 기반으로 생성되었으나 물리적으로 존재하지 않고
Data Dictionary 에 Select 구문 형태로 정의만 되어있는 가상의 논리적인 테이블. 

- 특정 테이블의 일부 정보만을 보여주고 싶거나 혹은 가공된 정보를 제공하고 싶을 때,
그 테이블을 복사하기에는 데이터 낭비가 되거나 혹은 데이터 변경시 내용 변경이 반영되지 않는 문제가 있고
그렇다고 그 테이블에 그대로 접근하도록 만들기에는 보안상의 문제가 생길 수 있다. 
- 이러한 경우에 사용하는 것이 바로 "View"로, 보안상 안전한 정보들과 필요한 정보를 가공해서 보여주는 것이 가능하다. 
또한 View는 원본데이터를 참조하는만큼 원본에 변경이 이뤄졌을 경우 View에도 내용이 반영되게 된다. 
덧붙여서 여러 개의 테이블을 매번 JOIN해야하는 경우에 테이블을 새로 만드는 것보다는 View를 만들어놓고
그것에서 조회하는 것이 훨씬 간편하다. (테이블을 새로 만들면 이후에 추가된 내용이 반영되지 않는다.) 

- 데이터베이스에 물리적으로 저장되는 것이 아니기에, 공간적인 제약이 없다.
(많이 만들더라도 상관없다. 그냥 select구문을 저장하는 것이라고 보면 된다. ) 

# 생성하기 
```
// DDL 구문이라서 auto commit 된다. 
create [or replace] [force|(noforce)] view 뷰이름
as (select 문)

//옵션들
// or replace : 또는 교체, 동일한 이름의 뷰가 있다면 교체
   - VIEW에는 ALTER 구문을 사용하지 못한다. 
// force : 기반 테이블이 없더라도 view를 생성. (잘 사용되지는 않는다.) 
// noforce : (기본설정) 기반 테이블이 있는 경우에만 view를 생성
```

## (예) 
```
create or replace force view test50
as select id, name,job from table_nothing(없는 테이블) ; 
// force 옵션을 넣을 경우 없는 테이블이더라도 view가 생성된다.
// 물론, 사용하기 위해서는 저 테이블을 만들어놓아야만 가능하다. 
```
참고로 테이블을 복사해서 생성하는 구문에서 table이
view로 바뀐 것을 제외하면 동일하다. 

## (예2)
```
create or replace view empvu80 
(id_number , name , sal , department_id) // alias를 여기에 이렇게 써도 된다. 
as select employee_id , 
   first_name || ' ' || last_name , 
   salary , 
   department_id 
from employees 
where department_id = 80 ; 
```
