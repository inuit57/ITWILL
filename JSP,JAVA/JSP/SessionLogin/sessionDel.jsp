<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> sessionDel.jsp </h1>


<%
	session.removeAttribute("id"); 
%>

<script>
	alert("세션 값 삭제!") ; 
	
	location.href = "session1.jsp"; 
</script>
</body>
</html>