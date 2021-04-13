<%@page import="java.sql.Timestamp"%>
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

<h1> /memberBean/insertPro.jsp </h1>

<%
	request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="memberBean" class="com.itwillbs.member.MemberBean"></jsp:useBean>

<jsp:setProperty property="*" name="memberBean"/>

<%
	memberBean.setRegdate(new Timestamp(System.currentTimeMillis())); 
%>


아이디 : <jsp:getProperty property="id" name="memberBean"/> <br>
비밀번호 : <jsp:getProperty property="pw" name="memberBean"/> <br>
이름 :  <jsp:getProperty property="name" name="memberBean"/> <br>
나이 :  <jsp:getProperty property="age" name="memberBean"/> <br>
성별 : <jsp:getProperty property="gender" name="memberBean"/> <br>
이메일 : <jsp:getProperty property="email" name="memberBean"/> <br>

<!-- DB에 저장하기 -->

<%

	// 1. 드라이버 로드
	// 2. 디비연결
	// 3. sql 구문 작성 & pstmt 객체 생성
	// 4. sql 실행 
	
	Class.forName("com.mysql.jdbc.Driver") ; 

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	
	String sql = "insert into itwill_member  values( ? , ? , ? , ?, ? , ?, ? )"; 
	
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, memberBean.getId()); 
	pstmt.setString(2, memberBean.getPw()); 
	pstmt.setString(3, memberBean.getName()); 
	pstmt.setInt(4, memberBean.getAge());
	pstmt.setString(5, memberBean.getGender()) ; 
	pstmt.setString(6, memberBean.getEmail()); 
	pstmt.setTimestamp(7, memberBean.getRegdate()); 
	
	pstmt.executeUpdate(); 
	
	//response.sendRedirect("loginForm.jsp"); 
%>

<script type="text/javascript">

	alert("회원 가입 완료!"); 
	location.href="loginForm.jsp"; 
</script>

</body>
</html>