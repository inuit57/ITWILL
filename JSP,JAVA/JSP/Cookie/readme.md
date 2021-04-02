# 쿠키<br>
 클라이언트 쪽에서 사용(관리) 되는 데이터, 생존 기간 동안 계속해서 유지 <br>
 클라이언트의 하드디스크에 저장 => 상대적으로 보안상 취약. (파일을 수정할 수 있다.) <br>
<hr>
쿠키가 없다면 서버에서 쿠키를 만든다. <br>
그리고 서버에서 연결을 종료하기 전에. response에 쿠키 정보를 넣어서 보낸다. <br>
이후, 다시 서버와 연결하게 될 때 클라이언트에서 request에 받았던 쿠키 정보를 넣어서 보낸다. <br>
(서버는 쿠키를 받아서 확인하고 필요한 데이터들만 다시 보낸다. 처음부터 통신을 안 해도 된다. ) <br>


<hr>
- 이름, 값, 유효기간, 도메인, 경로 ... 생성됨 <br>

# 쿠키 규칙 <br>
- 쿠키의 이름은 알파벳 + 숫자의 조합. <br>
- 쿠키 값 : 일반적인 데이터(공백, 괄호, 세미콜론을 쓰려고 한다면 추가 인코딩 필요) <br>

<hr>

# 서버가 해야 하는 일 <br>
1) 쿠키 생성(객체)  <br>
2) 쿠키 안에 필요한 설정을 저장한다.  (쿠키 유효기간, 설명, 도메인 , ...)  <br>
3) 웹브라우저에 생성된 쿠키를 전달한다. <br>


# 클라이언트가 사용할 때 처리되는 동작
1) 웹 페이지 요청 정보에서 쿠키 값을 가져옴 
2) 쿠키 생성 => (이름, 값) 쌍으로 생성된 배열의 형태로 리턴.  
3) 쿠키 설정 값 지정
4) 웹 페이지에 응답 정보를 사용해서 쿠키를 전달
5) 쿠키 이름을 사용해서 쿠키의 값을 거내서 사용 



# 쿠키 객체 생성 (쿠키 값 생성) - 서블릿API 활용 
(이 밖에도 쿠키를 만드는 방법은 다양하게 있다.)
```	
	//Cookie cookie = new Cookie("key", "value") ; 
	Cookie cookie = new Cookie("CookName", "cookie_value") ;
	
	cookie.setMaxAge(600) ; // 단위 : 초 
	// 쿠키를 삭제하려고 한다면 이 값을 0으로 설정하면 된다. 
	response.addCookie(cookie) ; 
 ```
 
 # 쿠키 값 삭제 
 ```
Cookie[] cookies = request.getCookies(); 
// 쿠키 값 한번에 다 받아오기.

if ( cookies != null){
	for(Cookie c : cookies){
		if (c.getName().equals("CookName")){
			System.out.println("쿠키 삭제"); 
			c.setMaxAge(0); // 이렇게 죽여야한다. 생존 시간을 0으로 만들어서.
			response.addCookie(c) ; // 이러고 다시 담아서 보내줘야 죽는다.
		}
	}
}
```

# 쿠키 값(Value) 변경
- 만약 Name이 같다면 새로 쿠키를 만들고 Value만 바꾼 새 쿠키를 만들고 넣는 것만으로도 변경된다.
```
// 기존에 있던 쿠키 value를 braveCookie로 바꾸는 예제. 
Cookie cookie = new Cookie("CookieName", "braveCookie") ;

//cookie.setMaxAge(600) ; // 단위 : 초 
response.addCookie(cookie) ; 
```

