```
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> WebContent/JSP5/insertTest.jsp </h1>
	
	<%
	
		//Statement : SQL 구문을 실행하는 객체
		// PreparedStatement : SQL 구문을 실행하는 객체 
		// -> 쿼리문을 실행할 준비가 되어있는 상태 ( 처리 속도 우수 , 보안상 안전 )
		
		final String DRIVER = "com.mysql.jdbc.Driver" ;  
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb" ;
		final String DBID = "root" ; 
		final String DBPSW = "1234" ; 
		
		
		String name = "itwill" ; 
		String gender = "남" ; 
		int age = 30 ; 
		String jumin = "900101-1231234" ; 
		// 1단계 : 드라이버 로드
		Class.forName(DRIVER) ; 
		// 2단계 : DB 연결 
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPSW ) ; 
	
		// 3단계 : sql 구문 작성 & statement 객체 생성
		// ( -> preparedstatement 변경 예정 )
	
		String sql 
		//= "insert into itwill_member (name, gender,age, jumin) values('테스트','남',10,'901123-1111112')" ;   - 방법1
		//= "insert into itwill_member (name, gender,age, jumin) values('" + name + "',"+ gender+"'," + age +" ,'" + jumin + " ')"  ;  - 방법1 
		= "insert into itwill_member (name, gender,age, jumin) values(? , ? , ? , ? )" ; // 값 대신 ?로 대체. 앞의 컬럼명에 1:1로 대응된다. 
			
		//Statement stmt = conn.createStatement();  - 방법1
		// 바로 실행할 수 있는 객체를 만들고 가져가는 것. 
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		// 준비만 하고 가져가는 것. 바로 실행할 수 없다. 
		// "?" 를 채워줘야만 실행할 수 있다. 			
		
		// ? 채우기
		// XXX 는 컬럼의 데이터 타입에 따라서 변경 
		//pstmt.setXXX(?의 위치, 값);
		pstmt.setString(1, name) ; // 위치는 1부터 시작.
		pstmt.setString(2, gender); 
		pstmt.setInt(3, age);
		pstmt.setString(4, jumin); 
		
		
		// 4단계 : SQL 구문 실행 
		//stmt.executeUpdate(sql);  
		
		
		//pstmt.executeUpdate(); 
		// => insert , update , delete 구문 실행시 
		// DB 내부의 값이 변경된다. 
				
		//pstmt.executeQuery(); 
		// = > select 구문 실행시 
		// DB 내부의 값이 변경되지 않는다. 
		pstmt.executeUpdate();
		
		
		
		
	%>

</body>
</html>
```
