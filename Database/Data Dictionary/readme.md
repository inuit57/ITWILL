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
       select view_name, text from user_views
       // view_name : 뷰 이름
       // text : 뷰를 만들 때 사용한 서브쿼리 정보 
       ```
2) all_xxx
    - def : 
3) dba_xxx 
    - def : 
4) v$xxx 
    - def : 
