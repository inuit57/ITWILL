<%@page import="com.itwillbs.member.MemberBean"%>
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

<h2> /member/updateForm.jsp </h2>

<h2> 회원 정보 수정 페이지 </h2>


<%
	//로그인 세션 처리 (로그인 x -> 로그인 페이지로 이동 )

	String id  = (String)session.getAttribute("id");
	if(id == null) {
		response.sendRedirect("loginForm.jsp"); 
	}
	
	final String DRIVER_NAME = "com.mysql.jdbc.Driver"; 
	final String CONNECTION = "jdbc:mysql://localhost:3306/jspdb"; 
	final String DB_ID = "root" ; 
	final String DB_PW = "1234" ; 
	
	// 1. 드라이버 로드. 
	// 2. 디비 연결
	Class.forName(DRIVER_NAME); 
	
	Connection conn = DriverManager.getConnection(CONNECTION, DB_ID, DB_PW);
	// 3. sql 구문 작성 (select 문) 
	
	String sql = "Select * from itwill_member where id = ?" ; 
	PreparedStatement pstmt =  conn.prepareStatement(sql) ;
	pstmt.setString(1, id); 
	
	// 4. sql 객체 실행 -> rs에 저장
	ResultSet rs = pstmt.executeQuery(); 
	// 5. 데이터 처리. 

	MemberBean mb = null ; 
	if(rs.next()){
		mb = new MemberBean();
		mb.setId(rs.getString("id")); 
		mb.setAge(rs.getInt("age")); 
		mb.setEmail(rs.getString("email")); 
		mb.setGender(rs.getString("gender")); 
		mb.setName(rs.getString("name"));
		mb.setPw(rs.getString("pw")); 
		mb.setRegdate(rs.getTimestamp("regdate")); 
		
		System.out.println(" SQL 구문 실행완료 "); 
		System.out.println(" 저장된 회원 정보 : "+ mb);
	}
		
%>

<fieldset>
<legend>정보 수정</legend>
	<% if( mb != null){  %>
	<form action="updatePro.jsp" method="get">
		아이디 : <input type="text" name="id" readonly="readonly" value=<%=mb.getId() %>> <br>
		비밀번호 : <input type="text" name="pw" readonly="readonly" value=<%=mb.getPw() %>> <br>
		<!-- 아래 4개만 변경하도록 만들 것이다. -->
		<hr>
		이름 : <input type="text" name="name" value=<%=mb.getName() %>> <br>
		나이 : <input type="number" name="age" value=<%=mb.getAge() %>><br>
		성별 : 남
		<input type="radio" name="gender" value="남" 
		<%
			if(mb.getGender().equals("남")){ 
				// 여기에서 그냥 놓아두면 null 과 String을 비교하려는 에러가 난다.
				// 그래서 form 태그를 전체적으로 감싸는 if문을 넣어서 처리. 
				%>
				checked="checked"
				<%
			}
		%>
		> 
		여
		<input type="radio" name="gender" value="여"
		<%
			if(mb.getGender().equals("여")){
				%>
				checked="checked"
				<%
			}
		%>
		><br> 
		이메일 : <input type="email" name="email" value=<%=mb.getEmail() %>> <br>
		<input type="submit" value="전송">
	</form>
	<%  }	%>
</fieldset>

</body>
</html>
