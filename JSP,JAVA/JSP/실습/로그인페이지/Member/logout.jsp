<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>member/logout.jsp</h2>

<%

	 
	//로그아웃 처리하기
	//세션 초기화. 
	session.invalidate(); 	
	//session.removeAttribute("id");
	//이것보다는 초기화해주는 것이 좋다. 로그아웃이니까. 
	//전체 초기화로 정보를 전부 지워주는 것이 좋다. 

	//response.sendRedirect("loginForm.jsp"); 
%>

	<script type="text/javascript">
	
		alert("정상적으로 로그아웃되었습니다.")
		location.href = "main.jsp" ; //확실히 확인하기 위해서 main으로 보낸다.
	</script>
</body>
</html>