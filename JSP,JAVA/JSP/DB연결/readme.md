# 작업 순서 

## 0) DB 켜기 
- MySQL Workbrench 켜기 

## 1) 드라이버 로드 
```
Class.forName("com.mysql.jdbc.Driver") ; 
```
## 2) DB 연결 
```
// import =  "java.sql.Connection"
// import = "java.sql.DriverManager"

Connection conn = DriverManager.getConnection(DBURL, DBID , DBPW) ; 
// DBURL : "jdbc:mysql://ip주소:port번호/접속할 DB명
// 예) "jdbc:mysql://localhost:3306/jspdb"

```

## 3) SQL 구문 작성 
### 3-1) Statement 방식 
```
// import =  "java.sql.Statement"

String sql = "insert into itwill_member (name, gender,age, jumin) values('테스트','남',10,'901123-1111112')" ;   
//"insert into itwill_member (name, gender,age, jumin) values('" + name + "',"+ gender+"'," + age +" ,'" + jumin + " ')"  ;  

Statement stmt = conn.createStatement();  
stmt.executeUpdate(sql);
// 이 경우에는 바로 실행 가능. 
``` 

### 3-2) PreparedStatement 방식
```
// import = "java.sql.PreparedStatement"

String sql = "insert into itwill_member (name, gender,age, jumin) values(? , ? , ? , ? )" ; // ?로 값을 대체해서 넣는다. 

PreparedStatement pstmt = conn.prepareStatement(sql);
// ? 채우기 
pstmt.setString(1, name) ; 
pstmt.setString(2, gender); 
pstmt.setInt(3, age);
pstmt.setString(4, jumin); 


// update 문
PreparedStatement pstmt = conn.prepareStatement("update itwill_member set name = ? where idx =?" );
	 
pstmt.setString(1, u_name);
pstmt.setInt(2, idx);

```

### 4) SQL 구문 실행 
``` 
// Update, delete,  insert문 : DB 내부 값이 변경되는 경우. 
stmt.executeUpdate(sql); 

pstmt.excuteUpdate() ; 
// PreparedStatement의 경우 만들 때 sql문장을 가져가기 때문에 
// pstmt.excuteUpdate(sql); 을 사용하지 않는다. 

// select 문 : DB 내부 값이 변경되지 않는 경우. 
stmt.executeQuery(sql); 
pstmt.executeQuery() ;
```
