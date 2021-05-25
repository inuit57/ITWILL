<%@page import="java.io.Console"%>
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


<h1>member/info.jsp(Model2)</h1>

<h2> 회원 정보 조회 </h2>

	<table border="1">
	<tr>
		<td>아이디</td>
		<td>${mdto.id }</td>
<%-- 		<td><%=mb.getId() %> </td> --%>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${mdto.pass }</td>
<%-- 		<td><%=mb.getPw() %></td> --%>
	</tr>
	<tr>
		<td>나이</td>
		<td>${mdto.age }</td>
<%-- 		<td><%=mb.getAge() %></td> --%>
	</tr>
	<tr>
		<td>성별</td>
		<td>${mdto.gender }</td>
<%-- 		<td><%=mb.getGender() %></td> --%>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${mdto.email }</td>
<%-- 		<td><%=mb.getEmail() %></td> --%>
	</tr>
	<tr>
		<td>회원가입일</td>
		<td>${mdto.reg_date }</td>
<%-- 		<td><%=mb.getRegdate() %></td> --%>
	</tr>

	</table>
	
	<a href="./Main.me">메인으로 돌아가기</a>
</body>
</html>