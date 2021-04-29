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
	MultipartRequest mp = new MultipartRequest(
							request, // => jsp 내장객체(파라미터)
							path, // => 실제 파일이 저장될 위치
							maxSize, // => 파일의 최대 크기
							"UTF-8", // => 파일 업로드시 인코딩
							new DefaultFileRenamePolicy() // => 파일이름이 중복될 경우의 처리
							); 
	
	System.out.println("파일 업로드 완료!"); 
	%>
</body>
</html>