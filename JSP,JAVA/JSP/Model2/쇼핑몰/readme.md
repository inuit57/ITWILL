## 개요 
- 쇼핑몰의 기능 구현 
- 가장 기본적인 형태의 사이트, 기본을 할 줄 안다면 다른 것들도 쉽게 할 수 있다.
- 상품등록/관리/주문/장바구니 ... 


### web.xml 
```
  <!--  MemberFrontController 매핑 -->
  <servlet>
  	<servlet-name>MemberFrontController</servlet-name>
  	<servlet-class>com.member.action.MemberFrontController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>MemberFrontController</servlet-name>
  	<url-pattern>*.me</url-pattern>
  </servlet-mapping>
  <!--  MemberFrontController 매핑 -->
  
  <!-- AdminGoodsFrontController -->
  <servlet>
  	<servlet-name>AdminGoodsFrontController</servlet-name>
  	<servlet-class>com.admin.goods.action.AdminGoodsFrontController</servlet-class>
  </servlet>
  
  <servlet-mapping>
  	<servlet-name>AdminGoodsFrontController</servlet-name>
  	<url-pattern>*.ag</url-pattern>
  </servlet-mapping>
  <!--  AdminGoodsFrontController 매핑 -->
  ```
 - url-pattern을 다르게 처리. 이걸로 각자 part를 나눈다고 생각하면 좋다. 
 
