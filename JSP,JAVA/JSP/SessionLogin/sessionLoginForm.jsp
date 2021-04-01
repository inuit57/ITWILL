<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> sessionLoginForm.jsp </h1>


<!-- 
	로그인 처리 로직 
	
	1) 아이디 , 비밀번호를 입력 -> sessionLoginPro.jsp 전달
	2) 아디디 , 비밀번호가 ["itwill", "1234"]인지 판단
	2-1) 아이디/비밀번호 체크
	2-2) 문제가 발생한 경우 ( 체크했는데 다른 경우 ) : 각각의 상황에 따라 메시지 출력
	2-3) 문제가 없는 경우 sessionMain.jsp 페이지로 이동 + id정보를 저장하는 세션 값 생성
	3) sessionMain.jsp 페이지에서 "id님 로그인 성공!" 출력
	4) 로그아웃 버튼 생성 (sessionLogout.jsp에서 처리) 
	
 -->
 
 <%
 	String id = (String)session.getAttribute("id") ; 
 	
 	if (id == null) {
 		id = "비회원"; 
 	}
 %>
 <%=id %> <br>
 	
 <fieldset>
 
 	<legend>로그인 </legend>
	<form action="sessionLoginPro.jsp" method="post">
	아이디 : <input type="text" name="id" > <br>
	비밀번호 : <input type="text" name="pw"> <br>
	
	<input type="submit" value="로그인">  
	
	<% 
	if (! id.equals("비회원")) {
		%>
	<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp' "> <br>
	<%
	}
	 %>
	</form>
 </fieldset>

</body>
</html>
