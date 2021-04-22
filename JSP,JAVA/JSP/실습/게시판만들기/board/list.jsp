<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> list.jsp </h2>

<%

	// DB에 저장된 글의 갯수를 알아오기
	// select count(*) from itwill_board; 

	// BoardDAO 객체 생성 
	BoardDAO bDao = new BoardDAO();
	// DB의 글의 수를 계산하는 메서드를 생성 -> 호출 
	
	int cnt = bDao.getBoardCnt();
	
	//-------------------------------
	// 게시판 페이징 처리 : DB에서 원하는 만큼만 글 가져오기 
	
	// 한 페이지당 보여줄 글의 갯수 
	int pageSize = 10 ; 
	
	// 현재 페이지 번호 확인 
	String pageNum = request.getParameter("pageNum"); 
	if(pageNum == null){
		pageNum = "1"; 
	}
	
	//페이지별 시작행 계산하기 
	// 1p -> 1번 , 2p -> 11번 , 3p -> 21번 
	// Np -> (n-1)*10 + 1 번
	//---------------------------------
	int currentPage = Integer.parseInt(pageNum); 
	int startRow = (currentPage-1)*pageSize + 1; 
	int endRow = currentPage*pageSize; 
	
	//ArrayList arr = bDao.getBoardList(); 
	ArrayList arr = bDao.getBoardList(startRow,pageSize);

%>

<h2> ITWILL 게시판 글 목록 [ 총 : <%=cnt %> 개 ]</h2>
<% if (! arr.isEmpty()){ %>
<table border="2">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>IP</th>
	</tr>
<%
	//for(BoardBean bb : arr){
	for(int i =0 ; i< arr.size() ; i++){  
		BoardBean bb = (BoardBean)arr.get(i); 	
	%>
	<tr>
		<td><%=bb.getNum() %></td>
		<td><%=bb.getSubject() %></td>
		<td><%=bb.getName() %></td>
		<td><%=bb.getDate() %></td>
		<td><%=bb.getReadcount() %></td>
		<td><%=bb.getIp() %></td>
	</tr>
<%	}
}%>
</table>
<br>
<%
for(int i =1 ; i<= Math.ceil((double)cnt/pageSize) ; i++){
%>
	<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>
	<!-- <a href="list.jsp?pageNum=2">2</a> -->
<% }%>
<input type="button" onclick="location.href='writeForm.jsp'" value="글 작성"/>
</body>
</html>
