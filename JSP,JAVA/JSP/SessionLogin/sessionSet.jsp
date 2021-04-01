<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>sessionSet.jsp</h1>


	<%
		session.setAttribute("id", "itwill"); 
		
		//다시 원래 페이지로 이동
		
	%>
	<%-- <jsp:forward page="session1.jsp"></jsp:forward> --%>
	<script type="text/javascript">
	
		alert("세션 값 생성 ~!"); 
		location.href = "session1.jsp"; 
	</script>

</body>
</html>