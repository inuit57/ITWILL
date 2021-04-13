# 자바빈 객체 생성 
```
jsp:useBean id="객체명(레퍼런스명)" class="클래스의 위치(패키지명)" />

name == id
param에 쓴 값을 property에 넣겠다. 
// jbAction.setId(request.getParameter(arg0)) 을 한번에 사용한 것
(param == 메소드의 parameter) 
(property == 객체명.setParameter() ) ; 

만약 param과 property의 값이 동일한 경우, param을 생략해도 된다. 

<jsp:setProperty property="id" name="jbAction" param="id" />
<jsp:setProperty property="id" name="jbAction" />	
  
<jsp:setProperty property="*" name="jbAction" />
//"*"로 알아서 다 넣도록 할 수도 있다.
```
