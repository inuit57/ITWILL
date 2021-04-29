# 개요 
- 파일 업로드, 다운로드 작업에 대해서 기술한다.
- 기본적으로는 입출력 작업에 해당한다. 

## 사전 준비
- servlets.com 사이트로 이동
- COS File Upload Library 버튼
- [다운로드](http://servlets.com/cos/cos-20.08.zip)


## 파일 업로드 
- input type="file"로 해서 만들어서 넘겨준다. 
- form 태그에 반드시 enctype을 명시해야 한다. 
- 무조건 post 방식으로 보내야한다. 
```
<form id="fregisterform" name="fregisterform" 
  method="post" enctype="multipart/form-data">
  
</form>
```
