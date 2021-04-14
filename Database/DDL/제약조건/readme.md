# create문
varchar2(10) : 문자 10개를 저장할 수 있는 컬럼
number(p , s) 
- p : 숫자 자릿수(전체) 
- s : 소수점 자리수
default : 아무 값도 입력되지 않았을 때 넣어주는 값(기본 : null)
- insert 문에서도 default 라고 값을 넣어줄 수도 있다.
(만약 설정된 default 값이 있을 경우 그 값이 들어가고 그렇지 않다면
기본으로 설정된 null 값이 들어가게 된다. ) 



# 제약조건 선언시기
- 테이블 생성 시(권장)  : create table --- ; 
- 테이블 생성 후  : alter table ----- ; 

# 제약조건 유형 5가지
1) Primary key : 기본키 ( Unique + Not null)
- 테이블 당 한 번만 사용 가능 
2) Foreign key : 외래키 
- 자기 자신 테이블이나 다른 테이블의 특정컬럼(PK, UK)를 참조하는 제약조건
- 그 컬럼에 있는 값만을 사용할 수 있다. 만약 그 컬럼에 없는 값을 사용하면 에러.
3) Unique  : 중복값 불가능. 
4) Not null : null 값 입력 불가 
5) Check :  조건을 넣을 수 있다. (예 / check(salary >0) 

# 제약조건명
: 제약조건에 위배되었을 때 명시한 제약조건명과 함께 오류메시지를 띄워준다. 

- 사용자 지정(권장) :  고유하고 의미있는 이름을 권장. constraint 뒤에 규칙에 따라서 작성 필요. 
(예 / 테이블약자_컬럼약자_제약조건유형약자)
(예2 / EMP_ID_PK ) 
- 사용자 생략 : Oracle이 자동으로 부여. 
(sys_cXXXX : XXXX는 의미없는 숫자들. )


## 사용예시

1) a column-level constraint
{컬럼명} constraint {제약조건명} {제약조건유형}
(예 / employee_id number(6) constaraint emp_empID_pk primary_key ) 

2) a table-level constraint
- 여러컬럼을 묶을 경우에 주로 사용. 
- not null 제약조건은 사용불가 
- 마지막에 아래와 같이 작성
constraint {제약조건명} {제약조건유형} ( 컬럼명 )
(예 / constaraint emp_empID_pk primary_key (employee_id) ) 




----

### FK - table level 문법 
constraint {제약조건명} foreign key (컬럼명) references 참조테이블명(참조컬럼명)

### FK - column level 문법 
(컬럼명) constraint {제약조건명} references 참조테이블명(참조컬럼명)
// 중간에 foreign key 생략 가능. 


--- 

### check 제약조건
[ex1] 
salary number(10) constraint [제약조건명] check( 조건문 )

컬럼레벨,테이블레벨의 문법이 똑같다.
salaray number(10) constraint [제약조건명] check (salary > 0) ,  
( == ) 
salaray number(10) , 
constraint [제약조건명] check (salary > 0) , 

[ex2]
주민번호 varchar2(13) constraint [제약조건명] check(length(주민번호) = 13) , 

[ex3]
학년 number(10) constraint [제약조건명] check (학년 >= 1 or 학년 <= 6) , 
(==) 
학년 number(10) constraint [제약조건명] check (학년 between 1 and 6) , 

[ex4]
과목 varchar2(10) constraint [제약조건명] check (과목 in ('java' , 'jsp' , 'web', 'db')) , 
