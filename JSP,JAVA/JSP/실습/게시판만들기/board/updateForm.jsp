<%@page import="com.itwillbs.board.BoardBean"%>
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
  <h1>WebContent/board/updateForm.jsp</h1>
  
  <h2> 게시판 글 수정 </h2>
  <%
  
  // 페이지 이동시 전달정보가 있으면 가장 먼저 저장 
  	request.setCharacterEncoding("UTF-8"); 
  
  	if ( request.getParameter("num") == null){
  		response.sendRedirect("list.jsp"); 
  	}else{
	  	int num = Integer.parseInt(request.getParameter("num")) ;
	  	String pageNum = request.getParameter("pageNum"); 
	  	String pwChk = request.getParameter("ps"); 
	  	
	  	// BoardDAO 객체 생성
	  	BoardDAO bDao = new BoardDAO() ;
	  	
	  	// 글 번호에 해당하는 글 정보를 모두 가져와서 출력.
	  	BoardBean bb = bDao.getBoard(num); 
	  	if(pwChk.length()!=0 &&  ! bb.getPass().equals(pwChk)){
	  		%>
	  		
	  		<script type="text/javascript">
	  			alert("비밀번호가 다릅니다!");
	  			location.href= "content.jsp?num="+<%=bb.getNum()%>+"&pageNum="+<%=pageNum%> ; 
	  		</script>
	  		
	  		<% 
	  	}
  	
   %>

  <fieldset>
    <form action="updatePro.jsp" method="post">
          글쓴이 : <input type="text" name="name" readonly="readonly" value=<%=bb.getName()%> > <br>
          <!-- 비밀번호 : <input type="password" name="pass"><br>  -->
          제목 : <input type="text" name="subject" value=<%=bb.getSubject() %>><br>
          내용 : <textarea rows="10" cols="30" name="content"><%=bb.getContent() %></textarea>
          <input type="hidden" name="num" value=<%=bb.getNum() %>>
      <hr>
          
      <input type="submit" value="글 수정">
      <input type="button" value="취소" onclick="location.href='list.jsp?pageNum=<%=pageNum %>'">
    </form>
  </fieldset>
  
  <%
  	}
  %>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 

</body>
</html>