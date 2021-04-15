<%@page import="java.io.Console"%>
<%@page import="com.itwillbs.member.MemberBean"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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


<h1>member/info.jsp</h1>

<h2> 회원 정보 조회 </h2>

<%-- <jsp:include page="/DBInfo.jsp"></jsp:include> --%>

<%
	//로그인 세션 처리 (로그인 x -> 로그인 페이지로 이동 )

	String id  = (String)session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("loginForm.jsp"); 
	}
	
	final String DRIVER_NAME = "com.mysql.jdbc.Driver"; 
	final String CONNECTION = "jdbc:mysql://localhost:3306/jspdb"; 
	final String DB_ID = "root" ; 
	final String DB_PW = "1234" ; 
	
	// 1. 드라이버 로드. 
	// 2. 디비 연결
	Class.forName(DRIVER_NAME); 
	
	Connection conn = DriverManager.getConnection(CONNECTION, DB_ID, DB_PW);
	// 3. sql 구문 작성 (select 문) 
	
	String sql = "Select * from itwill_member where id = ?" ; 
	PreparedStatement pstmt =  conn.prepareStatement(sql) ;
	pstmt.setString(1, id); 
	
	// 4. sql 객체 실행 -> rs에 저장
	ResultSet rs = pstmt.executeQuery(); 
	// 5. 데이터 처리. 

	MemberBean mb = new MemberBean();
	if(rs.next()){
		mb.setId(rs.getString("id")); 
		mb.setAge(rs.getInt("age")); 
		mb.setEmail(rs.getString("email")); 
		mb.setGender(rs.getString("gender")); 
		mb.setName(rs.getString("name"));
		mb.setPw(rs.getString("pw")); 
		mb.setRegdate(rs.getTimestamp("regdate")); 
		
		System.out.println(" SQL 구문 실행완료 "); 
		System.out.println(" 저장된 회원 정보 : "+ mb);
	}
		
%>

	<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=mb.getId() %> </td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=mb.getPw() %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=mb.getAge() %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=mb.getGender() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=mb.getEmail() %></td>
	</tr>
	<tr>
		<td>회원가입일</td>
		<td><%=mb.getRegdate() %></td>
	</tr>

	</table>
	
	<a href="main.jsp">메인으로 돌아가기</a>
</body>
</html>