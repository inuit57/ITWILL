<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/list.jsp</h1>
	<h2>회원목록을 확인 (관리자) : Model2 </h2>

	<%
		List memberList = (List)request.getAttribute("memberList"); 
	%>

    <table border="1">
      <tr>
      	<td>아이디</td>
        <td>이름</td>
        <td>비밀번호</td>
        <td>나이</td>
        <td>성별</td>
        <td>이메일</td>
      </tr>
      <% for(int i =0 ; i< memberList.size() ; i++ ){
		   MemberDTO dto = (MemberDTO) memberList.get(i);     	  
      %>
      <tr> 
	      <td><%= dto.getId() %> </td>
	      <td><%= dto.getName() %></td>
	      <td><%= dto.getPass() %> </td>
      	  <td><%= dto.getAge() %></td>
      	  <td><%= dto.getGender() %> </td>
      	  <td><%= dto.getEmail() %> </td>
      </tr>
      <%} %>
      
      <!--  
      	암호화 : sha256 ? 
       -->
       
       
      <c:forEach items="${memberList }" var="curr" step="1">
      <tr>
      	<td>${curr.name }</td>
      	<td>${curr.pass}</td>
      </tr>
      </c:forEach>
    </table>


</body>
</html>