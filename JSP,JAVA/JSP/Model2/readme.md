

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
	
	
### Controller , Action 처리
- DB 부분 제외하면 Action, Forward , Controller 정도로 정리가 된다. 

#### Controller (주소이동)
- 주소줄에서 적절히 잘라서 forward 객체를 만들어서 페이지 주소 이동을 시켜준다. 
- 만약 잘라낸 주소에 action이 있는 경우, action 객체를 만들고 action.execute() 함수를 호출.
- execute() 함수의 리턴 값으로 들어온 forward 객체를 받아서 처리를 수행하도록 한다. 
- 주소 이동은 무조건 여기에서 다 수행한다. 

#### Action (DB 로직 처리) 
- DB 처리를 수행한다. 
- 처리한 뒤 Forward 객체를 리턴해준다. 
- 주소가 바뀌어야 하는 경우, 여기 안에서 처리를 해준다. (그리고 바뀐 주소로 controller에 접근한다.) 


---- 

DB 처리가 필요한 경우, Action(java)을 만들어서 DB 처리와 이동할 경로를 설정. 

그렇지 않을 경우 그냥 바로 페이지 이동. 


### Controller 구현 
```
// doGet() , doPost() 오버라이딩. 
// 내부에서 doProcess() 호출하도록 만든다. 
// 어떤 방식으로 하든 doProcess()에서 처리할 수 있도록 처리를 일원화. 

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		System.out.println("AdminGoods_doProcess() 호출");
		
		/************* 1. 페이지 주소 파싱 *******************/
		//가상주소 전체 가지고 오기 
		String requestURI = req.getRequestURI(); 
		System.out.println("requestURI : " + requestURI);
		
		String contextPath = req.getContextPath(); 
		
		String command = requestURI.substring(contextPath.length()); 
		System.out.println("command : " + command);
		System.out.println("C : 1. 페이지 주소 파싱 완료 ");
		/************* 1. 페이지 주소 파싱 *******************/
		if( command.equals("/GoodsAdd.ag")){
			
			
		}
		/************* 2. 페이지 주소 매핑(연결) *******************/
		
		
		/************* 2. 페이지 주소 매핑(연결) *******************/
		
		/************* 3. 페이지 주소 이동 *******************/
		/************* 3. 페이지 주소 이동 *******************/
	}
```
1. 페이지 파싱
2. 페이지 주소 매핑(연결) 
3. 페이지 주소 이동
