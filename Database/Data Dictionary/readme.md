# 구성요소 
1) Base tables
   - DB의 모든 정보를 Oracle이 보기쉬운 형태로 분류해서 기록해놓은 테이블 
  
2) Data Dictionary Views
   - Base tables를 사용자가 보기 쉬운 형태로 만들어놓은 뷰.
   - read only(select만 가능)


## 자주 사용되는 View들
- 항상 desc 테이블명; 구문을 통해서 어떤 컬럼이 있는지 확인하고 조회하는 것이 좋다. 

1) user_xxx
    - 현재 사용자가 소유한 object 정보 조회 가능
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
       
2) all_xxx
    - 현재 사용자가 소유하거나 접근가능한 object 정보 조회 
    - 누구나 select 가능, 하지만 사용자별로 보여지는 정보가 다르다. 
    - 예) all_tables , all_views
    ```
       select owner , table_name, tablespace_name 
       from all_tables ; 
       
       selec owner, view_name, text from all_views ; 
       // owner : 소유자명 
    ```
3) dba_xxx 
    - def : 
4) v$xxx 
    - def : 
