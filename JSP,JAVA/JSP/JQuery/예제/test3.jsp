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
		//h2 글자색 변경
		$('h2').css('color','lightgray');
		var c = $('h2').css('color');
		console.log(c); // rgb(0, 0, 0) 
		
		$('h2').css('background','black');
		
		//이렇게 한 줄로 쓰는 것도 가능하다.
		// 체이닝 기법 : 여러가지 속성을 [. 연산자를 사용해서] 연달아서 작성하는 것.
		$('h2').css('color','orange').css('background','black');
		
		// 한번에 여러개의 속성을 적용시키는 다른 방법
		$('h2').css({
			color:"lightgray",
			background:"green"
		}); 
		
		// 각 태그의 글자별로 색상을 변경.
		
		var col = ['red' , 'orange', 'yellow']; 
		
		// index : 요소의 index 번호를 계산.
		$('h2').css('color',function(index){
			// function의 리턴 값으로 color를 설정한다. 
			return col[index]; 
		}); 
		// index를 넘어서면 더이상 색을 바꿔주지 않는다.
		
		
		// 여러개의 속성 사용
		// 1) 배열을 사용해서 배경색을 변경
		// 2) 글자색은 black으로 변경 
		
// 		$('h2').css('background',function(index){
//			return col[index]; 
//		}).css('color' , 'black');
		
		$('h2').css({
			color:'black',
			background:function(idx){
				return col[idx];
			}
		})
		
		$('h2').css({
			color:function(idx){
				return col[idx];
			},
			background:function(idx){
				return col[idx];
			}
		})
		
	})
	

</script>

</head>
<body>
	<h1>WebContent/jq/test3.jsp</h1>
	
	
	<h2>head-0</h2>
	<h2>head-1</h2>
	<h2>head-2</h2>
	<h2>head-3</h2> 
</body>
</html>
