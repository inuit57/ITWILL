<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> fileUploadPro.jsp </h1>
	
	<%
	
	// 파일 업로드 전 준비
	// 0) 해당 라이브러리 설치 (cos.jar)
	// 1) 파일이 저장될 위치를 지정
	String path = request.getRealPath("/upload");
	System.out.println("파일 저장되는 실제 경로 : " + path); 
	
	// 2) 파일의 크기를 지정 -> 최대 10Mb로 제한.
	//int maxSize2 = 10 * 1024 * 1024 ; // 10 MB
	int maxSize = 10 * ( 1 << 20) ; 
	
	// 파일 업로드 => Multipart 객체를 생성
	MultipartRequest multi = new MultipartRequest(
							request, // => jsp 내장객체(파라미터)
							path, // => 실제 파일이 저장될 위치
							maxSize, // => 파일의 최대 크기
							"UTF-8", // => 파일 업로드시 인코딩
							new DefaultFileRenamePolicy() // => 파일이름이 중복될 경우의 처리
							); 
	
	System.out.println("파일 업로드 완료!"); 
	
	// 이전 페이지에서 전달해준 정보를 출력 
	/* 
	// null 만 출력된다. 
	// 파일 업로드 폼으로 넘겼기 때문에 다르게 뽑아내야 한다.
	String name = request.getParameter("name"); 
	String subject = request.getParameter("subject"); 
	String filename= request.getParameter("filename"); 
	*/

	String name = multi.getParameter("name"); 
	String subject = multi.getParameter("subject"); 
	String filename = multi.getFilesystemName("filename");
	
	String oFileName = multi.getOriginalFileName("filename"); // 원본파일 이름 , 자동으로 바뀌어진 이름이 아닌 파일 자체 이름.
	// 이렇게 적어주면 값들을 확인 가능하다. 
	%>
	이름 : <%=name%> <br>
	제목 : <%=subject %><br>
	파일 : <%=filename %><br>
	파일(원본) : <%=oFileName %><br> 
</body>
</html>
