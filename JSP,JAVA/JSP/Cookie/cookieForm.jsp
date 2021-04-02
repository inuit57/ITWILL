<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1> WebContent/JSP4/Cookie/cookieForm.jsp</h1>
	
	
	" 안녕하세요. 쿠키 연습! " or " Hello, Cookie Test! " 출력" <br>
	<hr>
	
	
	<%
	
		Cookie[] cooks = request.getCookies(); 
		String res = ""; 
		if(cooks != null){
			for(Cookie c : cooks){
				if ( c.getName().equals("language")) {
					if ( c.getValue().equals("kor")){
						res =" 안녕하세요. 쿠키 연습! " ;  
					}else{
						res =  " Hello, Cookie Test! " ;   
					}
					break; 
				}
			}
		}
	
		if ( !res.equals("")) {
	%>
	결과 데이터 :  <%=res %>
	
	<%
		}
	%>
	<hr>
	
	
	<form action ="languageCheck.jsp" method="get">
		<input type="radio"  name="language" value="kor" > 한국어
		<input type="radio"  name="language" value="eng" > 영어
		<hr>
		<input type="submit" value="전송" >  
	</form>
</body>
</html>