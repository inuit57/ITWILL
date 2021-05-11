## JSON 문법 체크
- https://jsonlint.com/
- JSON은 문법 틀리면 이도 저도 안되니까 한번 이런 걸로 검사해보는 것도 좋다. 
- https://jsonformatter.curiousconcept.com/#
- 잘 찾아보면 다른 형태로 바꿔주는 것도 있다. 

## 사용법 
```
// 비동기방식 처리 
		// Ajax (Asynchronous JavaScript And XML)
		// -> 비동기 방식의 javascript , xml
		
		// * xml : 데이터 타입 - 데이터를 태그의 형태로 저장 , 의미 단위로 되어있다. 옛날방식->JSON으로 발전
		// * 비동기 방식 : 화면 전환 없이 클라이언트,서버 간에 데이터를 교환하는 방식 
		// => 페이지 이동횟수 감소 , 깔끔한 동작의 구현 
		// => 페이지 이동 O (화면에 표시 X) , 한 페이지에 여러 개의 비동기방식은 처리효율이 떨어질 수 있다.
		
		//$.ajax() : 비동기방식의 페이지 이동을 하는 함수 
		

		$.ajax({
			url: "전송페지이(form태그의 action 페이지)" ,
			type: "전송방식(get/post)",
			data: {key :"value" , ...},  //전송할 데이터
			dataType:"요청한 데이터타입(페이지 갔다왔을 때 데이터타입)",
					 "(html, xml, json, text .... )" , 
			success:  function(result){ // result : 페이지 갔다왔을 때 가져올 데이터가 들어있다. 
				//페이지 이동 성공시 실행되는 코드 
				
			}, 
			error: function(){
				// 페이지 이동 실패 시에 실행하는 코드 
			}, 
			complete: function(){
				//ajax가 완전히 실행된 이후 실행하는 코드 
			}
			
		}); 
```

## 보낸 데이터를 받는 법
```

//Ajax로 데이터를 {key : "value"} 형태로 보냈을 경우. 

String value = request.getParameter("key"); 
//이런 식으로 각각의 key마다 getParameter를 써서 받아오면 된다. 어렵지 않다. 

```

## JSON 형태로 보내주기 
```
1) 상단에 test/html 되어있는 것을 application/json 으로 변경
2) <% %> 으로 내부적으로 잘 처리하기
3) <%=JSON 객체 %> 하는 식으로 아래에 찍어주기 
```

## JSON-simple 
- https://code.google.com/archive/p/json-simple/downloads
- 1.1.1 버전 jar 파일을 다운받아서 프로젝트에 넣어주면 된다. 



## 추가로 공부할 것
- form 에 있는 데이터들을 ajax로 한번에 던져주는 방법
- 가져갈 데이터를 주는 방법?
- 
