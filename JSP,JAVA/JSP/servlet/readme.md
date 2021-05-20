# 서블릿
- 

# web.xml 
- URL 매핑
```
	<servlet>
		<servlet-name>test1</servlet-name>
		<servlet-class>com.itwillbs.myServlet.TestServlet1</servlet-class>	
	</servlet>
	
	<servlet-mapping>
		<servlet-name>test1</servlet-name>
		<!-- 위의 servlet-name과 동일하게 설정 -->
		<url-pattern>/test1</url-pattern> 
		<!-- 매핑할 URL 주소 : http://localhost:8088/{프로젝트명}/test1-->
	</servlet-mapping>
```
- 좀더 범용성 있는 방식
```
	<servlet>
		<servlet-name>test2</servlet-name>
		<servlet-class>com.itwillbs.myServlet.TestServlet2</servlet-class>	
	</servlet>
	
	<servlet-mapping>
		<servlet-name>test2</servlet-name> 
		<!-- 위의 servlet-name과 동일하게 설정 -->
		<url-pattern>*.t2</url-pattern>  
		<!-- 매핑할 URL 주소 : http://localhost:8088/{프로젝트명}/???.t2 
		     주소끝이 .t2로 끝나기만 하면 OK	-->
	</servlet-mapping>
```

## forwrading 방식 처리 
```
public class TestServlet2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("get방식 호출");
				
		// 값을 담아줍니다. 여기에서 전달할 값을. 
		
		RequestDispatcher dis = req.getRequestDispatcher("/el/array_collection.jsp"); 
		dis.forward(req, resp); 
	}
}
```




## 등장배경 : HTML 코드 방식의 한계를 개선하기 위해서 (동적 데이터 처리)
(*  동적데이터 처리 : DB에서 값을 꺼내와서 처리하는 것. )

## 정의 : 웹 서버에서 실행되는 자바 클래스 파일 ( Server Side Applet)  

=> JSP 등장 배경 : 서블릿 코드를 실행, 처리 하기 위함
		=> JSP 파일을 서블릿 형태로 변경 - 클라이언트 요청 실행 


p27 ~
### 서블릿의 동작원리

1) 사용자의 URL을 요청 ( web.xml  -  배포 서술사를 사용해서 특정 주소와 서블릿클래스를 매핑)
2) 웹 컨테이너가 필요한 정보(request , response) 를 생성 
3) 서블릿 인스턴스와 쓰레드 생성 ( init() - 서블릿당 1번씩만)  
4) service() 메서드 호출 & 서블릿 클래스 실행 ( doGet() / doPost() 실행) 
5) 응답처리 & 쓰레드 종료(소멸)


p67 ~ 서블릿 라이프 사이클
p143 ~ 서블릿 포워딩 방법 (Dispatcher / Redirect) 

### 서블릿 생성 규칙
1) javax.servlet.Servlet 인터페이스를 구현해야 한다. 
2) 1번 동작을 수행하기 어렵다면 javax.servlet.http.HttpServelet 클래스를 상속받아야 한다. 
3) doGet() / doPost() 메서드를 overriding 한다. 
	java.servlet.http.HttpServletRequest,
	java.servlet.http.HttpServletResponse 를 반드시 구현해야 한다. 
4) java.io.IOException , javax.servlet.ServletException 예외처리를 진행해야 한다.
5) web.xml 을 통한 서블릿 매핑 (URL 매핑)  



----
### 서블릿 생애

[최초실행]
1. 클라이언트 url 요청
2. 웹컨테이너(톰캣) 호출 -> 서블릿 객체 생성 
3. init() 실행 : 초기화 
4. service() 실행 , doGet() / doPost() 실행 
5. 서블릿에서 응답 결과를 WAS에 전달
6. 클라이언트에 전달


[이후 실행] ( init() 이 없다. )  
1. 클라이언트 url 요청
2. 웹컨테이너(톰캣) 호출 -> 서블릿 객체 생성  
3. service() 실행 , doGet() / doPost() 실행 
4. 서블릿에서 응답 결과를 WAS에 전달
5. 클라이언트에 전달


---- 

### JSP -> Servlet 변경 규칙
1) jsp 페이지는 클라이언트 요청이 최초 발생시 서블릿으로 변경
2) 스크립틀릿(<% %> )은 서블릿-service() 메서드에 작성된다.
3) 표현식(<%= %>)은 서블릿-service() 메서드에 작성된다.
4) 선언문(<%! %>)은 서블릿의 멤버 변수/메서드 변환
5) HTML 코드는 서블릿-service() 메서드 안에서 out.write() 로 변환


