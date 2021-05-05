# 개요 
- 파일 업로드, 다운로드 작업에 대해서 기술한다.
- 기본적으로는 입출력 작업에 해당한다. 

## 사전 준비
- servlets.com 사이트로 이동
- COS File Upload Library 버튼
- 파일 다운 받기 : [다운로드](http://servlets.com/cos/cos-20.08.zip)
- 압축 풀고 lib 폴더 안에 있는 cos.jar 파일을 WEB-INF/lib 에 넣어주기.

- upload 폴더를 WebContent 아래에 생성

- DB에는 파일 이름(또는 경로)만 저장한다. 
- 실제 파일은 내 컴퓨터(서버 컴퓨터)의 물리적 공간에 저장. 

- (가상 경로 : 외부에서 접근 가능한 폴더)
  - D:\workspace_jsp2\StudyJSP2\WebContent\upload
- (실제 경로 : 외부에선 접근 불가능한 폴더)
  - D:\workspace_jsp2\.metadata\.plugins\ **org.eclipse.wst.server.core** \tmp0\wtpwebapps\StudyJSP2\upload

- 참고 : [MIME 타입](https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types) 

## 파일 업로드 
- input type="file"로 해서 만들어서 넘겨준다. 
- form 태그에 반드시 enctype을 명시해야 한다. 
- 무조건 post 방식으로 보내야한다. 
```
<form id="fregisterform" name="fregisterform" 
  method="post" enctype="multipart/form-data">
  
</form>
```
