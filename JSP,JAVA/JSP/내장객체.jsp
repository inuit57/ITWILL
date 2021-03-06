<%@page import="java.util.Date"%>
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

	//교재 p177
	// 내장 객체 : JSP 자체적으로 내장되어있는 객체 
	// 별도의 객체 생성 없이 사용가능 ( == import문 없이도 사용가능) 
	// 내장 객체는 JSP페이지가 서블릿클래스로 변환될 때 
	// _jspService() 메서드 안에서 가장 먼저 final로 선언된다.
	//
	
	/*
		[javax.servlet 패키지] - 8개
		request : 클라이언트 요청정보를 저장하는 객체 (HTTP 요청, 파라미터)
		response : 요청정보에 대한 응답정보를 처리하는 객체
		session : 클라이언트의 세션 정보를 저장하는 객체 
		pageContext : 페이지에 실행을 할 때 필요한 정보를 저장하는 객체( project )
		out 응답 페이지 전송을 위한 출력 스트림(stream) 객체 
		application : 해당 애플리케이션의 컨텍스트(현재 project) 정보를 저장한 객체 (pageContext를 포함하는 느낌. 이게 더 크다) 
		config : 해당 페이지의 서블릿 설정 정보를 저장 
		page : 해당 페이지 서블릿 객체 (인스턴스)
		
		[java.lang 패키지] - 1개
		exception : 예외 처리용 객체 
	*/ 
	
	new Date(); 

 %>


<h3> request 내장 객체 </h3>
 <!--  요청하는 거의 모든 정보를 가지고 있는 객체 -->
 
 서버 도메인 명 : <%= request.getServerName() %> <br>
 <!--  localhost -->
 서버 포트 번호 : <%= request.getServerPort() %> <br>
 <!--  8088 -->
 URL : <%= request.getRequestURL() %> <br>
 <!--  http://localhost:8088/StudyJSP2/jsp1/test3.jsp  -->
 URI : <%= request.getRequestURI() %> <br>
 <!-- /StudyJSP2/jsp1/test3.jsp -->

<!-- 현재 접속한 유저의 IP 정보를 얻어올 수 있다. -->
클라이언트 호스트명 : <%= request.getRemoteHost() %> <br>
<!--  0:0:0:0:0:0:0:1  -->
클라이언트 IP : <%= request.getRemoteAddr() %> <br>
<!--  0:0:0:0:0:0:0:1  -->

프로토콜 : <%= request.getProtocol() %> <br>
<!--  HTTP/1.1 -->

페이지 요청(전송) 방식 : <%= request.getMethod() %> <br>
<!--  GET -->

프로젝트 경로 ( == 컨텍스트 경로) : <%= request.getContextPath() %> <br>
<!--  /StudyJSP2 -->

물리적 경로 : <%= request.getRealPath("/") %> <br>
<!--  D:\workspace_jsp2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\StudyJSP2\ -->

<hr>
http 헤더(user-agent) : <%= request.getHeader("user-agent") %> <br>
<!-- Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36 -->
http 헤더(accept-language) : <%= request.getHeader("accept-language") %> <br>
<!-- ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7 -->
http 헤더(host) : <%= request.getHeader("host") %> <br>
<!--  localhost:8088 -->
http 헤더(connection) : <%= request.getHeader("connection") %> <br>
<!-- keep-alive -->

<h3> response 내장 객체 </h3>

<%

	//response.setHeader("해더이름", 값);  //해더 변경
	//response.addCookie("쿠키값");  //쿠키 등록 
	//response.sendRedirect("URL 주소");  // URL 변경 (페이지 이동)
	//response.setContentType("MIME 타입"); // ContentType을 변경가능.
%>

<h3> session 내장 객체 </h3>

세션 ID : <%= session.getId() %> <br>
<!--  세션 ID : BAE676E47595FBC3198A06F7BCBEF92F -->
세션 생성 시간 : <%= session.getCreationTime() %> <br>
<!--  세션 생성 시간 : 1616556761579  , 밀리세컨드 단위-->
세션 최종 접속 시간 : <%= session.getLastAccessedTime() %> <br>
<!--  밀리세컨드 단위로 리턴.  -->
<!--  위의 2개의 값을 이용해서 얼마나 머물렀는지를 계산가능 -->

세션 유지 시간 : <%= session.getMaxInactiveInterval() %> <br>
<!-- 1800, 단위 : 초   -->
<!-- 기본적으로 설정된 세션 유지 시간은 30분. 변경가능  -->

<%
	session.setMaxInactiveInterval(30); //30초로 변경
	//초 단위로 값을 넣어서 변경 가능.
%>

변경된 세션 유지 시간 : <%= session.getMaxInactiveInterval() %> <br>

</body>
</html>
