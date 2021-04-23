<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
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
	int pageSize = 2 ; //10 ; 
	
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
		<td><a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
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
	if (cnt != 0){ //글이 있을 때 표시 
		
		//전체 페이지 수 계산 
		int pageCount = cnt/pageSize + (cnt%pageSize == 0 ? 0 : 1) ;
	
		//한 화면에 보여줄 페이지 번호의 갯수 
		int pageBlock = 5;
		
		//페이지 블럭의 시작 페이지 번호
		// 1~ 10페이지 : 1
		// 11~20페이지 : 11
		int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;  
		
		//페이지 블럭의 끝 페이지 번호
		int endPage = startPage + pageBlock-1  ;
		if(endPage > pageCount){
			endPage = pageCount ; 
		}
		
		%>
		
		<%-- 
		<%
	     	// 이전 (해당 페이지블럭의 첫번째 페이지 호출)
    	if(startPage > pageBlock){
    		%>
    		<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
    		<%
    	}   	
    	
    	// 숫자  1....5
    	for(int i=startPage;i<=endPage;i++){
    		%>
    		    <a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a> 
    		<%    		
    	}
    	
    	// 다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
    	if(endPage < pageCount){
    		%>
    		<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    		<%
    	}
    	%> 
    	--%>
		<script type="text/javascript">
			function pageMovePre() {
				var link = <%=(startPage-1) %> ;
				var curr = <%=(currentPage) %> ; 
				
				if(curr == 1) { 
					link = 1;  
				}else if(curr != <%=startPage%> ){
					link = curr - 1; 
				}else{ // startPage 일때. 
					link = <%=startPage%> -1 ; 
				}
				
				location.href="list.jsp?pageNum="+link ;
				
			}
			function pageMovePost() {
				var link = <%=(endPage+1) %> ; 
				var curr = <%=(currentPage) %> ;
				if(curr == <%=pageCount%>) { 
					link = <%=pageCount%>;  
				}else if(curr != <%=endPage%> ){
					link = curr + 1; 
				}else{ // endpage일 때 
					link = <%=endPage%> +1 ; 
				}
				
				location.href="list.jsp?pageNum="+link ; 	
			}
		</script>

		<input type="button" value="이전" onclick="pageMovePre()">
		<%

		// 숫자 버튼
		for(int i = startPage ; i <=endPage ; i++){
			%>
			<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
			<%
		}
		// 다음 버튼 
		%>
		 <input type="button" value="다음" onclick="pageMovePost()">
		
	<%
	}//글이 있을 때 표시 
%>

<%-- 
<a href="list.jsp?pageNum=<%=(currentPage-1)>0 ? currentPage-1 : currentPage %> ">이전</a>
<%
for(int i =1 ; i<= Math.ceil((double)cnt/pageSize) ; i++){
%>
	<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>
	<!-- <a href="list.jsp?pageNum=2">2</a> -->
<% }%>
<a href="list.jsp?pageNum=<%=(currentPage+1)>Math.ceil((double)cnt/pageSize) ? currentPage : (currentPage+1) %>">다음</a> 
--%>
<br>
<input type="button" onclick="location.href='writeForm.jsp'" value="글 작성"/>
</body>
</html>
