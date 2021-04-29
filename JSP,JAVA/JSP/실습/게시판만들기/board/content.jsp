<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">


function update(num, pageNum) {
	
	//var psChk = prompt("비밀번호 입력",""); 
	
	location.href = "updateForm.jsp?num="+num+"&pageNum="+pageNum ; //+"&ps="+psChk; 
	
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Content</title>
</head>
<body>
  <h1>WebContent/board/updateForm.jsp</h1>
  
  
  <%
  
  // 페이지 이동시 전달정보가 있으면 가장 먼저 저장 
  	request.setCharacterEncoding("UTF-8"); 
  
  	if ( request.getParameter("num") == null){
  		response.sendRedirect("list.jsp"); 
  	}else{
	  	int num = Integer.parseInt(request.getParameter("num")) ;
	  	String pageNum = request.getParameter("pageNum"); 
	  	
	  	// BoardDAO 객체 생성
	  	BoardDAO bDao = new BoardDAO() ;
	  	
	  	
	  	// 글 조회수를 1 증가 (DB 처리)
	  	bDao.updateReadCount(num);  
	  	
	  	// 글 번호에 해당하는 글 정보를 모두 가져와서 출력.
	  	
	  	BoardBean bb = bDao.getBoard(num); 
  	
   %>

	<table border="1">
	<tr>
		<td>글 번호</td>
		<td><%=bb.getNum() %></td>
		<td>조회수</td>
		<td><%=bb.getReadcount() %></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><%=bb.getName() %></td>
		<td>작성일</td>
		<td><%=bb.getDate() %></td>	
	</tr>
	<tr>
		<td> 글 제목</td>
		<td colspan="3"><%=bb.getSubject() %></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">없음</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=bb.getContent() %></td>
	</tr>
	<tr>
		<td colspan="4">
			<input type="button" value="수정하기" onclick="update(<%=bb.getNum()%>,<%=pageNum %>);">	  
	    	<input type="button" value="삭제하기" onclick="" >
	    	<input type="button" value="답글 쓰기" 
	    			onclick="location.href='reWriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>';">
	    	<input type="button" value="목록으로" onclick="location.href='list.jsp?pageNum=<%=pageNum %>';">
		</td>
	</tr>
	
	</table>
	

  <%-- 
  <fieldset>
    <form>
          글쓴이 : <input type="text" name="name" readonly="readonly" value=<%=bb.getName()%> > <br>
          <!-- 비밀번호 : <input type="password" name="pass"><br>  -->
          제목 : <input type="text" name="subject" readonly value=<%=bb.getSubject() %>><br>
          내용 : <textarea rows="10" cols="30" readonly name="content"><%=bb.getContent() %></textarea>
          
      <hr>
          
      <!-- <input type="submit" value="글 수정"> -->
      <input type="button" value="글수정" onclick="update(<%=num%>,<%=pageNum %>)">
      <input type="button" value="취소" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
    </form>
  </fieldset>
   --%>
  <%
  	}
  %>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 

</body>
</html>