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
	
		//스크립틀릿 작성 - java 코드
		//문자열 배열 - 4칸
		// {"java" , "jsp", "web" , "DB"} 
		
		String[] strArr = {"java" , "jsp", "web" , "DB"}; 
		
		int i =0 ;
		for(String str:strArr){
			i++; 
			out.println("strArr["+i+"] : "+str+"<br>"); 
			// 줄 바꿀 때 <br> 태그를 넣어줘야 한다.
			// out.print(" html 코드 작성 ") ; 
			// " " 안의 내용이 html 코드라고 생각하면 된다. 
		}
	
	
		
		//표현식을 사용해서 화면 출력
		i = 0 ; 
		for(String str:strArr){
			i++; 
			%>
			<!--  HTML -->
			<hr>
			<!-- JSP 표현식은 html 코드에 작성! -->
			<%= "strArr["+i+"] : "+str+"<br>" %>
			<!--  HMTL -->
			<% 
		}
	
	%>


	<hr>
	<h3> 테이블 생성 </h3>
	
	<table border="2">
		<%
			i= 0 ; 
			for(String str:strArr){
				i++; 
				out.println(
				"<tr>"+
				"<td> "+i+" </td>"+
				"<td> "+str+" </td>"+
				"<td> "+str+i+" </td>"+
				"</tr>");
			}
		%>
	</table>
	<hr>
	<table border="3">
	<%
			i= 0 ; 
			for(String str:strArr){
				i++; 
				%>
				
				<tr>
				<td> <%=i %> </td>
				<td> <%=str %> </td>
				<td> <%=str+i %> </td>
				</tr>
				<%
			}
		%>
	
	</table>
</body>
</html>
