<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!--  직접 Jquery 파일을 추가해서 사용(준비) -->
<!-- <script src="../js/jquery-3.6.0.slim.js"></script> -->

<!-- 외부 서버(페이지) CDN에서 파일을 전달 받아서 사용(준비)  -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->


<!-- 
	* 한번에 여러 개의 Jquery를 사용가능하나, 가능하면 중복 사용을 자제할 것. 
	(예/ 템플릿이나 기능을 가져와서 사용해야 할 때 ) 
	=> 버전 충돌이 일어날 수 있기 때문.	
	=> Jquery 추가는 한 곳에서 정리하는 것이 좋다. 
	(<head> 같이 위 쪽에 모아놓는 게 좋다.) 
 -->
<!-- 
	JQUERY 는 자바스크립트의 라이브러리 입니다. ( 기능을 모아놓은 형태 ) 
	1. 사용하기 위해서는 라이브러리를 추가해야 한다. ( 파일/CDN ) 
 -->
 	<script src="../js/jquery-3.6.0.js"></script>
 <!--  
 	2. Jquery 사용 준비
 	아래와 같은 형태를 만들고 써야한다. 
  -->
<script type="text/javascript">
	alert('자바스크립트!'); 
	
	//$(document).ready(function(){엔터}); 
	// => html-body 생성후 호출
	// * 실행 순서 : java(jsp) -> javascript -> html -> Jquery
	
	$(document).ready(function(){
		alert('Jquery 실행1 !'); 
	});
	
	//$(function(){});
	$(function(){
		alert("Jquery 실행 2 !")
	});
	
	jQuery(document).ready(function(){
		alert('Jquery 실행 3 !'); 
	});
	
	jQuery(function(){
		alert("Jquery 실행 4 !")
	});
	
	
</script>

</head>
<body>
	<h1>test1.jsp</h1>
	
	<script type="text/javascript">
		alert("자바 스크립트(body)"); //이게 먼저 호출되고 제이쿼리가 실행된다.
	</script>
	
</body>
</html>