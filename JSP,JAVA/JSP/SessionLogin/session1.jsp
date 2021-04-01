<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	세션 : 서버에서 관리
	쿠키 : 클라이언트에서 관리 
	
	사용자의 정보를 저장하고 관리하기 위함. 
	어느 한 쪽의 부담을 줄이기 위해서 나누어서 관리.

	request 요청, 페이지를 넘겨주고 나면
	서버와 클라이언트의 연결은 끊긴다.
	=> 서버와 클라이언트의 상태를 연결하기 위해서 세션, 쿠키를 사용한다.  
 -->
 
 	<h2> 세션(Session) : 웹 서버의 컨테이너 정보(상태)를 유지하기 위한 정보 </h2>
 	- 웹 브라우저당 1개씩 설정<br>
 	- 서버 측에서 관리 => 쿠키에 비해서 보안상 안전 <br>


	- 세션 정보 저장<br>
	 session.setAttribute("세션 키 값", "세션 데이터값"); <br>
	 
	 - 세션 정보 사용<br>
	 session.getAttribute("세션 키 값"); <br>
	 
	 - 세션 정보(attribute 삭제) 삭제<br>
	 session.removeAttribute("세션 키 값") ;<br> 
	 
	 - 세션 정보 초기화 <br> 
	 session.invalidate(); <br>
	 
	 <script type="text/javascript">
	 
	 	 // JSP 와 JS.
	 	 // JSP가 무조건 먼저 실행되게 되버린다.
	 	 // 한 페이지 안에서 실행할 수가 없다. 
	 	 // 즉, 조건에 따라서 JSP가 실행되도록 JS에서 제어할 수 없다. 
		 function func(){
			 location.href = "sessionSet.jsp"; 
		 }
	 	 
		 function func2(){
			 location.href = "sessionRemove.jsp"; 
		 }
	 </script>
	 <input type="button" value="세션 값 생성(저장)" onclick="func()"> <br>
	 
	 <input type="button" value="세션 값 삭제 " onclick="location.href='sessionDel.jsp'"> <br>
	 <input type="button" value="세션 초기화" onclick="func2()"> <br>
	 
	 <hr><hr>
	 <!-- 
	 세션 값이 있을 때는 세션 값을 출력!
	 세션 값이 없을 때는 "세션 값 없음!" 출력!
	  -->
	 
	 <%
	 	String id  = (String)session.getAttribute("id"); 
	 	// Object로 들어와서 String으로 바꿔줘야 한다. 
	 	
	 	// id , 로그인 정보를 주로 세션에 저장한다
	 			
	 	//if (session.getAttribute("id") != null ){
	 	if (id == null){
	 		id = "세션 값 없음" ; 
	 	}
	 %>
	 <hr>
	 <h2>세션 값 : <%= id %> </h2>
	 
	 
	 <%
	 	System.out.println(session.getAttribute("id")); 
	 %>
</body>
</html>