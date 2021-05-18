# 서블릿
- 

# web.xml 
```
	<servlet>
		<servlet-name>test1</servlet-name>
		<servlet-class>com.itwillbs.myServlet.TestServlet1</servlet-class>	
	</servlet>
	
	<servlet-mapping>
		<servlet-name>test1</servlet-name> <!-- 위의 servlet-name과 동일하게 설정 -->
		<url-pattern>/test1</url-pattern>  <!-- 매핑할 URL 주소 : http://localhost:8088/{프로젝트명}/test1-->
	</servlet-mapping>
```
