# 사전 준비
```
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>위에 taglib를 등록해줄 것. 
```

## 출력
```
<c:out value="2*3" /> 
<!-- 2*3 을 출력한다. 문자열로만 인식하고 출력해준다. --> 

<c:out value="${ 2*3 }" /><br>
<!-- EL 표현식을 사용해줘야만 문자열이 아닌 변수 혹은 다른 것으로 인식하고 처리해준다. --> 
```
## 변수 선언 
```
<!-- JSTL 변수 선언  
		: EL 표현식을 사용해서 변수 호출/사용 가능 
		: JSP 표현식을 사용해서는 불가능 
	-->
	<c:set var="num3" value="100" />
	<c:set var="num4" value="200" />
	
	<c:set var="num4" value="${requestScope.memberList[0]  }" />
  
<!--  
	데이터 공유가 가능한 내장객체 : page , request, session , application.

	JSTL 변수 선언 -> jsp 내장 객체 속성(attribute) 선언과 동일하다.
	기본적으로 page (pageContext) 에  저장된다.  
-->
```

## 다른 영역에 속성 저장 및 전송 
```
<c:set var="model" value="samsung" scope="request"/>
scope에 값을 설정해주면 pace 대신 설정한 곳에 저장한다. (기본값 : page) 

<!-- EL 표현식은 Attribute에서 찾아서 사용한다.  -->
${ model } 
${ price + 1000  } 
<!-- 
  page, request, session, application 영역의 Attribute를 뒤져서 찾아내고
  알아서 형변환해서 적절한 사용형태로 만들어서 출력해준다. 
-->
```
## 속성 삭제 
```
<!-- 속성명은 동일한 이름 사용하지 말 것, 항상 생성/삭제시에는 scope를 명시해줄 것-->
<c:remove var="model" scope="request"/>
```

## 참고 : 다른 페이지로 데이터 전송
```
 <!--  request 영역의 데이터를 전달하기 위해서 
	 		액션태그(forward) 사용
	 		* 주소는 변경 X (set1.jsp) , 화면은 변경 O ( set2.jsp) 
	 		추가로 request, response 객체 정보 전달 
 -->
<jsp:forward page="set2.jsp"/>
 ```
 
 
## c:foreach
- begin : 시작하는 지점
- end : 끝나는 지점
- step : 한 번에 증가하는 수치 
- begin + step을 매번 반복한 숫자가 end보다 크거나 같아지면 종료. 

### JSTL+EL 표현식 반복문
```
   <c:forEach begin="1" end="5" step="1" var="i">
      <h2> ${i } </h2>
   </c:forEach>
```

### 토큰 기준 반복문
- items : 잘라먹을 문장
- delims : 자르는 기준이 되는 토큰
- var : 하나 자른 것을 넣어줄 대상
```
   <c:forTokens var="data" items="a.b.c.d.e.f.g.h.i.j" delims=".">
          반복코드! ${data }<br>  
   </c:forTokens>
```
