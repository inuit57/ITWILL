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
