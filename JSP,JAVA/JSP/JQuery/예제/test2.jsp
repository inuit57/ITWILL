<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(document).ready(function() {
		alert("JQUERY 준비 시작");
		
		//전체에 css 적용
		//$('*').css('color', 'blue') ;
		//태그 선택자
		$('h2').css('color', 'red');
		
		//아이디 선택자
		// ["태그명#아이디명"] 또는 ["#아이디명"]
		$("h2#title").css('color' , 'green');
		
		//클래스 선택자
		// ["태그명.클래스명"] 또는 [".클래스명"]
		$("h2.class").css('color' , 'pink');
		
		// 보통 ID는 개발자가, class는 디자이너가 많이 사용한다.
		
		
		/////////////////////////////////////////
		// 속성 탐색 선택자 
		
		// var tmp = $('input').val('홍길동'); //input 태그에 값을 넣어준다.
		// $('input').val(); // 값을 꺼내올 수 있다.
		
		//alert(tmp); //[object Object]
		//console.log(tmp); // jQuery.fn.init(2)
		
		//input[type=타입속성명]을 줘서 처리할 수 있다. 
		$('input[type=text]').val('테스트');  // 아이디에만 들어간다.
		$('input[type=password]').val('123456');  // 패스워드에만 들어간다.
		
		// 태그[속성^=값] : 값으로 작하는 태그 
		// 태그[속성$=값] : 값으로 끝나는 태그
		// 태그[속성~=값] : 값을 포함하는 태그 (권장: 값에 단어를 넣을 것)
		$('input[type^=t]').val('이름정보t');  // 굳이 text까지 안쳐도 되니까. 이런 식으로 해줘도 된다.  
		// shift + F5 
		// 캐시를 비우고 새로고침을 진행한다.
		// 강력한 새로고침.
		
		//////////////////////////////////////
		// 위치 탐색 선택자
		//
		// 태그:odd - 홀수 태그만 적용
		// 태그:even - 짝수 태그만 적용
		// 태그:first - 첫번째 태그만 적용
		// 태그:last - 마지막 태그만 적용
		$("tr:odd").css('background','lightgray'); // 홀수 번째 있는 배경색 변경
		$("tr:even").css('background', 'green');
		$("tr:first").css('background', '#00FF00');
		
		
		alert("JQUERY 준비 끝"); 
	})
</script>
</head>
<body>

<h1>test2</h1>

<h2 id="title">제목1</h2>
<h2 class="class">제목2</h2>


아이디 : <input type="text" id="input_id"><br>
비밀번호 : <input type="password" id="input_pw"><br>


<hr>

<table border="1">

	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	
</table>

</body>
</html>