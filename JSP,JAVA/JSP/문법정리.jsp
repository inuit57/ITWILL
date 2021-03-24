<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/jsp1/test1.jsp</h1>
	
	<h2> JSP 기본요소</h2>
	<h3>1. 주석문</h3>

	
	<!-- html 주석  -->
	<%-- JSP 주석 --%>
	
	<script type="text/javascript">
		// JS 주석
		/* JS 주석2 */ 
	</script>
	<% 
		//Java 주석
		/* Java 주석2 */
	%>
	
	<!-- 
		java, jsp 주석은 내부적으로 실행되기에
		F12 눌러서 개발자 모드에서 코드를 확인했을 때 보이지 않는다.
		가능하다면 주석은 JSP 주석으로 남길 것.
	 -->
	 
	<h3>2. JSP 지시어</h3>

	 <%
	 	// JSP 지시어(Directive)
	 	// 지시, 알려주는 것
	 	// 해당 파일에서 JSP 코드를 실행할 때 어떤 방식으로 실행할 것인지에 대한 정보를 제공
	 	
	 	// < %@ page ~ % >  : MIME 타입 검색 ㄱㄱ 
	 	
	 	// < %@ include ~ % > : 액션 태그
	 
	 	// < %@ taglib ~ % > : JSTL 
	 	
	 %>
	 
	<h3>3. 스크립트 요소</h3>
	
	<%--
	 스크립트 요소 
	 JSP 코드 안에 java 코드를 사용가능하게 하는 요소
	 1) 선언문 (Declaration) : 맴버 변수, 메서드를 선언
	 2) 스크립틀릿 (Scriptlet)
	 3) 표현식 (Expression)	
	--%>
	
	<h3> JSP - 선언문 </h3>
	<%!
		// 선언문 : 멤버 변수, 멤버 메서드 선언
		String name = "홍길동";
		public void method(){
			System.out.println("출력"); 
		}
		
		//method(); 메서드 호출 불가능.
		int age = 20; //멤버 변수
	%>
	
	<h3> jsp - 스크립틀릿 </h3>
	
	<%
	
		//java 코드를 작성
		int num = 30;  //지역 변수 
		method(); //메서드 호출 가능 
		
		// 메서드 선언 불가능.
	%>
	<h3>4. 액션태그</h3>
	 
</body>
</html>
