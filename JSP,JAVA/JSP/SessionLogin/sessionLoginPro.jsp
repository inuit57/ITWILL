<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> sessionLoginPro.jsp </h1>

<%

	//** 한글 처리
	request.setCharacterEncoding("UTF=8"); 
	// 파라미터 받기 전에 먼저 한글 인코딩을 생각해서 처리해주는 게 좋다. 

	String id = request.getParameter("id") ; 
	System.out.println(id); 
	String pw = request.getParameter("pw") ; 
	
	String msg = "로그인 성공!" ; 
	if ( ! id.equals("itwill")){ 
		msg = "아이디를 확인하세요!"; 
	}else if (! pw.equals("1234")){
		msg = "비밀번호를 확인하세요!" ; 
	}else{
		session.setAttribute("id", id); 
		response.sendRedirect("sessionMain.jsp"); 
	}
	 
%>

<script type="text/javascript">

	
	alert("<%=msg%>"); 
	 	
	location.href = "sessionLoginForm.jsp"; 
//	location.href = "sessionLoginForm.jsp";
</script>


</body>
</html>