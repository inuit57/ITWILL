<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">

<h5>
	include 기술을 사용해서 중복사용된 페이지를 줄임<br>
	1) {%@ include ~ %} (JSP 지시어) <br>
		컴파일되기 전에 include할 부분들을 붙이고 컴파일을 수행한다.
		(하나의 파일을 생성한다.) 
	
	2) { jsp:include page="" } {/jsp:include} (JSP 액션태그) <br>
		태그를 사용해서 다른 동작(JSP)을 실행가능한 코드의 형태  <br>
		각각의 파일을 컴파일 후 해당 코드에 추가 (여러개의 파일이 추가된 1개의 파일) <br>
		=> 특정 페이지를 해당 페이지에 추가할 때 사용 <br> 
	
	
	공통점 : 둘다 include 동작을 수행한다. 
	(다른 곳에 있는 정보를 현재 페이지에 추가한다. )
	차이점 : include 하는 방식과 시점에 차이가 존재한다. 

</h5>

<!-- <fieldset>

<legend>로그인 </legend>
<form action="top.jsp" method="get">

아이디 입력 :  <input type="text" name="id"> 
<input type="submit" value="전송">
</form>
</fieldset> -->

<table border="1" width ="600" height="600" >

	<tr>
		<td colspan="2" height="100">
			<jsp:include page="top.jsp">
				<jsp:param value="itwill" name="id" />
			
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>
			<jsp:include page="left.jsp"></jsp:include>
		</td>
		<td width="400"> 본문</td>
	</tr>
	
	<tr>
	<td colspan="2" height="100">
		<jsp:include page="bottom.jsp"></jsp:include>
	</td>
	</tr>
	
</table>




</body>
</html>
