<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> loginPro.jsp </h1>

<jsp:useBean id="memberBean" class="com.itwillbs.member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="memberBean"/>

<%

	Class.forName("com.mysql.jdbc.Driver"); 
	
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234"); 
	
	String sql = "select pw from itwill_member where id=? "; 
	// select count(*) from itwill_member where id=? and pw=? ; 
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	
	pstmt.setString(1, memberBean.getId()); 
	//pstmt.setString(2, memberBean.getPw()); 

	ResultSet rs = pstmt.executeQuery();
	
	// sql injection 이라는 것을 막기 위해서
	// if문을 넣는 식으로 안전하게 만든다. 
	if(rs.next()){
		
		if(memberBean.getPw().equals(rs.getString("pw"))){
			
			out.println("로그인 성공!") ;
			
			session.setAttribute("id", memberBean.getId());
			%>
			<script>
				alert("로그인 성공"); 
				location.href= "main.jsp" ; 
			</script>
			<%
			//response.sendRedirect("main.jsp"); 
		}else{
			//회원이지만 비밀번호 오류. 
			%>
			<script type="text/javascript">
				alert("비밀번호 오류!"); 
				
				//location.href="loginForm.jsp";
				history.back();  // 뒤로 가기 
			</script>
			<%
		}
		
	}else{
		// 비회원
		if ( memberBean.getId() == null){
			response.sendRedirect("loginForm.jsp");
		}
		%>
			<script type="text/javascript">
				
				alert("비회원입니다!"); 
				//location.href="loginForm.jsp";
				history.back();  // 뒤로 가기 
			</script>
		<%
	}
%>


</body>
</html>
