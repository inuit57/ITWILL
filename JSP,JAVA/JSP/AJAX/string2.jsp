<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	// 전달해준 데이터를 저장 -> 콘솔에 출력
	String data = request.getParameter("name"); 
	System.out.println(data); 
	int age = Integer.parseInt(request.getParameter("age"));
	System.out.println(age);
%>

<%=data%>
<%=age%>