스프링.txt
- 참고 : 파일 오른쪽 위의 s 표시 - spring에서 현재 사용 중이라는 뜻.
- 스프링 웹 프로젝트 구성 

	크게 3개의 layer(tier)와 DB 하나 있는 구조로 되어있다. 
	
	1) Presentation Layer(tier) : UI 담당 영역 / 웹 - 모바일을 구분하는 계층
		=> jsp(view) 구현 / html , css , js 등등 
		=> controller  
	
	2) Business Logic Layer : 서비스 계층 , 고객의 요구사항을 반영하는 계층 (기능적 구성) = Action Page 
		=> Service(Model의 역할) 구현 
		
	3) Data Access Layer(= Persistence Layer) : DB 데이터 처리 계층. 
		=> DAO 
		=> MyBatis (xml)
		
	4) DB
		=> MySQL
		
		
		
	* MyBatis : DB와 DAO 객체 사이에서 효율적인 데이터 처리를 위한 프레임워크  
	- SQL Mapper 라이브러리  
	- 간결한 코드 처리 : 예외처리, pstmt , rs 객체를 처리 
	- SQL 구문을 분리 : xml / annotation 을 사용한 처리 가능. 
	- spring과 자동 연동
	- 동적 SQL 가능 
	   
	   - https://mvnrepository.com/artifact/org.mybatis/mybatis/3.4.1
	   - https://mvnrepository.com/artifact/org.mybatis/mybatis-spring/1.3.0
	   - https://mvnrepository.com/artifact/org.springframework/spring-jdbc/5.3.8
	   - https://mvnrepository.com/artifact/org.springframework/spring-test/5.3.8
	   
	   -${org.springframework-version} 
	   - spring-jdbc, spring-test 의 version을 이걸로 수정 
	   - 기존 spring 버전을 따라가겠습니다~. 
	   
	   - spring-test의 scope는 삭제 
	   
   - root-context.xml 수정 
       - Namespace 탭에서 aop, context,jdbc, mybatis-spring 체크하고 저장 
       - beans에서 사용할 수 있도록 해준다는 것.
	   
	   - DataSource 객체 추가
	   ``` 
	   <!-- DataSource 객체 -->
		<bean id="dataSource"
			class="org.springframework.jdbc.datasource.DriverManagerDataSource">
			<property name="driverClassName" value="com.mysql.jdbc.Driver">	</property>
			<property name="url" value="jdbc:mysql://localhost:3306/springdb"></property>
			<property name="username" value="root"></property>
			<property name="password" value="1234"></property>
		</bean>
	 	```
	 	
	* MyBatis - 스프링 연동 처리 객체 
	  => SqlSessionFactory 객체 : DB 연결 , SQL 실행 관련 동작
	 	=> SqlSessionFactoryBean 클래스를 사용해서 해당 객체를 생성
	 - root-context.xml에 추가
	```
	<!-- SqlSessionFactory 객체 -->
	<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<property name="dataSource" ref="dataSource"></property>
		<property name="configLocation" value="classpath:/mybatis-config.xml"></property>	
	</bean>
	<!-- SqlSessionFactory 객체 -->
	```
	
	- src/main/resouces 아래에 mybatis-config.xml 파일 추가 
	- mybatis config dtd 검색 
	```
	<!DOCTYPE configuration
	  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
	  "http://mybatis.org/dtd/mybatis-3-config.dtd">
	<configuration>
	
	</configuration>
	```
	- 일단 여기까지만 등록하기 
	- sqlSessionFactory 객체에 configLocation 속성에 mybatis 등록 
	
	
	* 스프링 MVC ( model2 방식 )
	```
	[기존 MVC] 
	요청 -> Controller <-> Model <-> DB
	          ||
	         View
     	
	[Front Controller 패턴을 사용한 MVC]
	요청 ->    Front    <-> Controller <-> Model <-> DB  
	       Controller 
	           ||
	          View
	
	- View 와 DB로 가는 처리를 분리 
	- Controller의 역할을 위임했다고도 표현한다.
	
	[Spring]              |                                         |              
	요청 ->    Front    <->| Controller <-> Service(Model)<-> DAO <->| MyBatis <-> DB  
	       Controller     |                                         |      
	           ||         |                                         |    
	          View        |                 Spring MVC              |
	 ```            
    - 안쪽의 Controller ~ Model은 Spring에서 제공되는 기능을 활용 
    - Spring MVC에서 처리하는 작업
       - URI를 분석해서 적당한 컨트롤러를 매핑 
       - 컨트롤러에 필요한 메서드 호출
       - 컨트롤러의 결과 데이터를 View로 전달하는 작업 
       - 처리에 따른 적절한 뷰 연결 
       
       - 파라미터의 수집 
       
    - 개발자가 처리해야하는 작업 
       - 특정 URI에 해당하는 컨트롤러를 생성
       - 서비스 객체를 생성
       - DAO 객체의 생성
       - 컨트롤러의 처리를 담당하는 메서드 생성 
