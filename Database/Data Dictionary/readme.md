# 구성요소 
1) Base tables
   - DB의 모든 정보를 Oracle이 보기쉬운 형태로 분류해서 기록해놓은 테이블 
  
2) Data Dictionary Views
   - Base tables를 사용자가 보기 쉬운 형태로 만들어놓은 뷰.
   - read only(select만 가능)


## 자주 사용되는 View들
   - 항상 desc 테이블명; 구문을 통해서 어떤 컬럼이 있는지 확인하고 조회하는 것이 좋다. 
      - 1,2 : 일반사용자
      - 3,4 : DBA (4번은 DBA가 실시간으로 정보를 확인해야할 때 주로 사용) 

1) user_xxx
    - 현재 사용자가 소유한 object 정보 조회 가능 , 실시간 반영 X
       - 예) user_tables : 현재 사용자가 소유한 table 정보 조회 가능 
       ``` 
         select table_name, tablespace_name from user_tables; 
          // table_name : 테이블명
          // tablespace_name : 테이블이 DB에 저장된 공간 이름
       ```
       - 예) user_views : 현재 사용자가 소유한 view 정보 조회 가능 
       ```
         select view_name, text from user_views ;
          // view_name : 뷰 이름
          // text : 뷰를 만들 때 사용한 서브쿼리 정보 
       ```
       - 예) user_users : 현재 사용자 정보 조회 가능 
       ```
          select username , user_id , account_status , created 
          from user_users; 
          // username : 유저명
          // user_id : DB 상에 기록된 id 
          // account_status : 현재 계정 상태 
          // created : 생성된 날짜.
       ```
       - 예) user_objects : 현재 사용자가 접근/사용할 수 있는 모든 object 조회 
       ```
         select object_name, object_type, created, status 
         from user_objects 
         order by object_type; 
       ```
       - 예) user_constraint : 현재 사용자에 저장된 제약조건들을 조회
       ```
         select constraint_name, constraint_type, search_condition, r_constraint_name
         from user_constraint 
         where lower(table_name) = lower('&t_name') ; 
       ```
       - 예) user_cons_columns : 현재 사용자에 저장된 제약조건을 컬럼명까지 조회
       ```
         select column_name, constraint_name 
         from user_cons_columns
         where table_name = upper('&t_name') ; 
       ```
2) all_xxx
    - 현재 사용자가 소유하거나 접근가능한 object 정보 조회 
    - 누구나 select 가능, 하지만 사용자별로 보여지는 정보가 다르다. 실시간 반영 X
       - 예) all_tables , all_views
       ```
          select owner , table_name, tablespace_name 
          from all_tables ; 

          selec owner, view_name, text from all_views ; 
          // owner : 소유자명 
       ```
3) dba_xxx 
    - DB의 모든 정보 조회 
    - DBA만 사용 가능하다. 
    - 실시간 반영 X
      - 예) dba_tables, dba_users , dba_data_files 
4) v$xxx 
    - DB의 모든 정보 조회 
    - DBA만 사용 가능하다. 
    - 실시간으로 업데이트 된다.  
      - 예 ) v$datafile  
      - 예2) v$session  : 현재 DB에 접속되어 있는 유저 정보 확인 가능

## 정보 확인
- dictionary 테이블을 조회한다. 
- dict 라고 줄인 동의어를 사용해서 조회해도 된다. 
   - 예시
   ```
   select * 
   from dictionary 
   where table_name = 'USER_TABLES' ; 
   //보통 where절에 table_name을 검색해서 comments 정보를 확인하는 식으로 사용한다. 

   select table_name, comments 
   from dict 
   where table_name = 'USER_USERS' ; 
   ```
