<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> Member/main.jsp (Model2) </h1>

<%

	//사용자가 로그인을 했을 때만 main페이지를 보여주기
	//그렇지 않다면 로그인 페이지로 되돌리기. 
	
	String id  = (String)session.getAttribute("id");

//	if (session.getAttribute("id") == null) {
	if (id == null){
		// 로그인 페이지로 되돌리기.
// 		response.sendRedirect("loginForm.jsp"); 
		response.sendRedirect("./MemberLogin.me");
	}

%>

	<h2> <%= id %> 님 환영합니다~! </h2>
	<h2>${sessionScope.id } </h2>

	<input type="button" value="로그아웃" onclick="location.href='./MemberLogout.me'">
	<hr>
	
	<h3><a href="./MemberInfo.me" > 회원 정보 조회 </a></h3>
	
	<h3><a href="./MemberUpdate.me"> 회원 정보 수정</a></h3>


</body>
</html>