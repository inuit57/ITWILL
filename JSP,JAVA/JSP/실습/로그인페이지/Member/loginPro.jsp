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

<h1> loginPro.jsp </h1>

<jsp:useBean id="memberBean" class="com.itwillbs.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="memberBean"/>

<%

	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234"); 
	
	String sql = "select count(*) from itwill_member where id=? and pw=? " ; 
	
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	
	pstmt.setString(1, memberBean.getId()); 
	pstmt.setString(2, memberBean.getPw()); 

	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		out.println("로그인 성공!") ; 
	}
%>


</body>
</html>