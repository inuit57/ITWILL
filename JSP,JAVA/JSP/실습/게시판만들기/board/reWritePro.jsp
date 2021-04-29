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

<%
	// 전달되는 파라미터 값 저장
	request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>

<%
	//bb.toString() ;  
	System.out.println(bb);   
	//bb.setIP(request.getRemoteAddr());
	
	bb.setIp(request.getRemoteAddr()); 

	// BoardDAO() 객체 작성
	BoardDAO bDao = new BoardDAO(); 
	
	bDao.reInsertBoard(bb); 
	
	response.sendRedirect("list.jsp"); 
%>




</body>
</html>