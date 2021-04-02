<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> languageCheck.jsp </h1>

<% 

	String str = request.getParameter("language") ;  
	 
	Cookie cook = new Cookie("language" , str) ;
	cook.setMaxAge(600); 
	response.addCookie(cook);
	
	// 쿠키는 자동으로 알아서 관리되는 듯 싶다. 
	// 굳이 그 값이 있는지 확인 안해도 알아서 처리해주는 듯.
	
	/* Cookie[] cooks = request.getCookies(); 
	
	if (cooks != null){
		for(Cookie c : cooks){
			if ( c.getName().equals("language")){
				c.setValue(str); 
				response.addCookie(c); 
				break; 
			}
		}
		// 없는 경우에도 생성해줄 것. 
		Cookie cook = new Cookie("language" , str) ;
		cook.setMaxAge(600); 
		response.addCookie(cook);
	}else{
		Cookie cook = new Cookie("language" , str) ;
		cook.setMaxAge(600); 
		response.addCookie(cook);
	}  */

%>

<script type="text/javascript">

	alert("쿠키 설정 완료 ! : <%=str%>" ) ;  
	location.href = "cookieForm.jsp" ; 
</script>
</body>
</html>