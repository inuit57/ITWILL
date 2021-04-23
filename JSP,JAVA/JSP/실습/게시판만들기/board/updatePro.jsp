<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>contentPro.jsp</h2>

<%
//	String name = request.getParameter("name"); 
	String subject = request.getParameter("subject");  
	String content = request.getParameter("content") ;
	int num = Integer.parseInt(request.getParameter("num")); 
	
	BoardBean bb = new BoardBean() ; 
//	bb.setName(name); 
	bb.setSubject(subject); 
	bb.setContent(content);  
	bb.setNum(num); 
	
	System.out.println(num); 
	
	BoardDAO bDao = new BoardDAO(); 
	bDao.updateBoard(bb);
	
	 
	
	
	//System.out.println("업데이트 완료!") ; 
	%>
	 
	<script type="text/javascript">
		alert("업데이트 완료?"); 
		location.href= "list.jsp"; 
	</script> 
	
	<%
	//response.sendRedirect("list.jsp"); 
%>

</body>
</html>