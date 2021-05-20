

### model1 방식의 개발 (php)
```
		JSP <-> DB
		-> 바로 주고 받는 방식
		-> 개발 속도가 빠르다.
		-> 개발 효율이 좋다. (비용이 적게 든다) 
		
		-> 단점 : 유지보수가 매우 힘들다.  (디자이너 - 개발자)
		-> 소규모 프로젝트에 효과적이다.
```

		
### model2 방식의 개발
```
		View <-> Controller <-> Model
		(JSP)    (Servlet)      (JAVA)
		
		-> 디자인 부분과 개발(비즈니스 로직)을 완전하게 분리
		-> 프로젝트 규모가 크다 (비용 및 시간이 증가) 
		
		-> * 일정규모 이상의 프로젝트일 때만 사용 
		
		* 초급 -> 중급 -> 고급
			디자인 패턴 : 개발을 실행시 효율적인 개발을 위한 패턴 형태의 동작을 정리
			
		
		* MVC 패턴 
		=> Model View Controller 를 사용한 개발 패턴 (model2 개발방식과 유사) 
		
		[ MVC 패턴 기반의 model2 방식의 개발 ]
		Model - 비지니스 로직 구성 ( java 파일 )  -> DB 관련 처리, Pro 페이지
			(POJO - Plain Old Java Object : 순수 자바 파일)  
		View - 화면/디자인 페이지 구성 (JSP 파일) 
		Controller - 두 개의 파일을 연결 구성(Servlet 파일)
	```
 
