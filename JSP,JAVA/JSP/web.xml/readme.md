# web.xml 
- java dynamic project로 생성할 경우에 WEB-INF/web.xml 이라는 파일이 생성된다. 
- 배포서술자 라고도 말한다. 일종의 프로젝트 시작점. 

# error 페이지 처리 

```
<error-page>
  <error-code>404</error-code>
  <location>/error/404page.jsp</location> 
</error-page> 

```

- 에러코드를 적고 이동하게 될 주소를 location에 적어준다.
- 에러 페이지 하나당 하나의 에러코드를 적어줘야한다. 
