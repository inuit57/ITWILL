# 개요 
- JSTL 표현식 , EL 표현식에 대해서 서술한다. 

## 사전 준비
```
라이브러리 설치가 필요.  
https://tomcat.apache.org/download-taglibs.cgi

Compat 을 제외한 3개 설치 필요. ( Impl, Spec, EL ) 
```

## EL 표현식 (Expression Language) 
: 표현 언어 -> JSP 표현식을 다른 형태로 사용 
```
${ 코드 작성 } 
```

```
 <!--  el 연산자 p516 ~ -->
 
 <!--  
 	. : 각종 객체에 접근해서 사용
 	[] : 배열
 	() : 우선순위 변경
 	x? true : false  , 삼항 조건 연산자
 	empty : 값이 null 이거나, collection의 size가 0일 때 true를 리턴. 
 	--------------------------------------
 	+ , - , * , / , % 
 	&&(and)  , ||(or) , !(not) 
 	--------------------------------------
 	== / eq
 	!= / ne 
 	<  / lt
 	>  / gt
 	<= / le
 	>= / ge 
 	
 	왼쪽의 표현의 경우, HTML 안에서 태그로도 사용되곤 하기에 
 	오른쪽의 표현을 대신 사용하는 것을 권장. 
 
  -->
  ```

## JSTL ( JSP Standard Tag Library )
: jsp 에서 자주 사용하는 기능을 모아놓은 태그

### [core](https://github.com/inuit57/ITWILL/tree/main/JSP%2CJAVA/JSTL/core#%EC%82%AC%EC%A0%84-%EC%A4%80%EB%B9%84)
```
- 자카르타 회사에서 제공하는 커스텀 태그 라이브러리 

크게 4가지로 나누어서 볼 수 있다. 
- CORE 라이브러리 (기본 기능) : 변수 선언, 조건문, 반복문 , 페이지 이동 
- Formatting 라이브러리  : 국제화(다국어 처리) , 형식화(날짜, 숫자 처리)

- DB 라이브러리 : CRUD 기능 
- XML 라이브러리 : XML 문서 처리 
(아래 2가지는 책에 있으니 참고할 것) 
```
