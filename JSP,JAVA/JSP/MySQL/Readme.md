# [설치 사이트](https://dev.mysql.com/downloads/file/?id=500616)
- 위 사이트에서 각자 환경에 맞도록 설치 

# 설치 과정
- Developer Default (기본 설정)
  - 나중에 익숙해지면 Custom으로 해서 필요한 것들만 설치하기
- [excute] 버튼 누르기 (필요한 것들 설치) 
  -  맨위에 MySQL Server만 제대로 설치되었다면 문제 없다. 
-  [next] 버튼 활성화 될 경우, 누르고 [Yes] -> [excute] 누르기
    - 기다리면 된다. 
-  [next]-> [next] 
-  포트번호 기억하기 (기본 : <b>3306</b>) -> [next]
-  <b>root 계정 비밀번호 설정 ( 1234/ 1234 ) 
    -  AddUser
    -  ID : jspid 
    -  Role : DB Admin 그대로 두기 
    -  PSW : jsppass
    </b>
 - start the MySQL Server at System Startup 
    -  윈도우 켜질 때 실행되게 할 건지 하는 것. 체크 해제
    -  서비스 이름 : MySQL57 
-  [excute] -> [Finish] 
-  [next]-> 라우터 설정은 무시 -> [next] 반복
-  root 비밀번호 입력하고 check > status 초록불 확인 -> next
-  [excute] -> [Finish] 
-  [next]  ... 
-  설치 완료 후 뭐 실행할 거냐고 하는 체크박스 있는데 풀어주기. 


# 실행
- <b>MySQL5.7 Command Line Client 실행 </b>
  -  root 계정으로 로그인 (pwd : 1234) 

- <b>mysql> status </b>
> 상태정보 확인  <br>
> 확인해보면  characterset이 latin1로 되어있다. 한글 다 깨지니까 수정이 필요하다. <br>

# my.ini 파일 수정
- 경로 :  C:\ProgramData\MySQL\MySQL Server 5.7 (만약 안보인다면 숨김파일도 보이도록 설정할 것)
- my.ini 파일 열기 
```
 [mysqld] 밑에 작성 (메모장에 적고 복사해서 옮기기)
 character-set-server=utf8
 ```
 
 # 서비스 재실행
 - "서비스" 프로그램 실행 ( Window키 + R > services.msc )
 - 현재 실행중인 서비스 중에서 하나 선택하고 M 누르고 
 - Mysql57 더블클릭 > 서비스 상태 중지 > 시작 
 - 다시 MySQL5.7 Command Line Client 실행하고 <b> status </b> 로  characterset이 utf8이 되었는지 확인

# Path 설정
- 윈도우창 > 환경 변수 검색 > 실행
- 환경변수 편집 > 시스템 변수 > Path 더블클릭 
- C:\Program Files\MySQL\MySQL Server 5.7\bin 을 추가하고 확인 누르기. 
- 명령프롬프트 (Window+R > cmd 실행)  > mysql 입력 후 결과가 출력되면 설정완료된 것. 


# CMD 창에서 mysql 접속
- mysql -u root -p 
> mysql -u 계정명 -p -h[서버주소] [db명]
- 비밀번호 입력 (1234) 
- status : Mysql DB 기본 설정 값 조회 


# DB 생성, 삭제, 선택, 목록 조회 
1) 목록 조회 
    > show databases ; 
2) DB 생성
    > create database [db명] ;
    - create database itwill ; 
    - create database jspdb ; //수업 진행 하는 동안 사용할 DB

3) DB 선택
    > use [db명];
    - use itwill; 
    - status 입력해보면 Current  database 값이 변경된 것을 확인 가능.
4) DB 삭제
    > drop database [db명]; 
    - drop database itwill; 
    - show database 로 확인해보면 사라진 것을 확인할 수 있다. 

----

# Table 생성, 삭제, 조회, 구조 확인 

1) 테이블 생성
   > create table [테이블명] (  <br>
   >      필드명1 데이터타입 {제약조건} , <br>
   >      필드명1 데이터타입 {제약조건} , <br>
   >      필드명1 데이터타입 {제약조건} , <br>
   >      필드명1 데이터타입 {제약조건} , <br> 
   >  ....<br>
   >  ); 
   - 문자데이터
        - VARCHAR2(오라클)
        - VARCHAR(MYSQL)
    - 숫자데이터
        - NUMBER(오라클)
        - INT(MYSQL)
2) 테이블 조회
  > show tables; 

3) 테이블 삭제
  > drop table [테이블명]; 

4) 테이블 구조 확인 
  > desc [테이블명] ; 

5) 실습
    - create table itwill ( idk int ) ; 
    - desc itwill ;
    - drop table itwill; 
    - show tables; 

## 테이블 데이터 추가/삭제/조회/갱신

1) 추가
```
insert into [table명]  ( 컬럼명1, 컬럼명2, 컬럼명3 ... ) 
values ( 값1, 값2 , 값 3 ... ) ; 

//앞에 적은 컬럼명에 맞춰서 값들을 넣어주기
```
```
insert into [table명] 
values (값1 , 값2 , 값3 , 값4 ... ) ; 

//컬럼명 없이 사용하는 경우
//모든 컬럼명에 해당되게 값을 다 적어넣어야 한다. 
```

2) delete 문 (삭제)
```
delete from [테이블명] {where 조건} 
// where 조건을 안 넣고 사용할 경우, 테이블의 데이터가 다 삭제된다. 
```

3) select 문
```
select [컬럼명] from [테이블명] where [조건] 
```
5) update 문
