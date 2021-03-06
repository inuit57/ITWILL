## 제이쿼리란?
자바스크립트의 라이브러리라고 이해하면 좋다.
자바스크립트로 만든 함수와 변수 등을 모아놓은 것들.

## 제이쿼리 다운로드
- 2가지 방법이 있다. 
  - 파일을 저장해서 프로젝트에 넣고 사용하는 방법
  - 네트워크 상에 있는 파일의 주소를 <script src="">로 넣어서 사용하는 방법 

1) 다운로드 페이지 접속
- https://jquery.com/download/

.min.js : 압축된 형태, 공백이 모두 제거된 버전<br>
큰 차이는 없지만 좀더 효율을 따진다면 압축된 것을 사용하는 게 좋다.

아래에 ajax, effects가 빠진 버전도 있다.<br>
이것은 좀더 가볍게 제이쿼리를 사용할 때 쓰라고 해놓은 것.

1_1)다운로드해서 사용하는 방법
- https://code.jquery.com/jquery-3.6.0.min.js
- https://code.jquery.com/jquery-3.6.0.js
: 브라우저에서 해석가능한 것은 브라우저에서 보여준다.
- 우클릭> 다른이름으로 저장 

- 이클립스에 WEB-INF 아래에 폴더를 만들고 넣어준다.
- 제이쿼리를 사용하려는 jsp 파일 안에서 
<script src="폴더경로/제이쿼리 파일명.js"></script> 
로 작성해서 사용하면 된다. 

1_2) Using jQuery with a CDN
- https://code.jquery.com/
- JQuery Core를 다운로드해서 쓰면 된다.
- [uncompressed]를 누를 경우 스크립트 태그가 나온다
복사해서 jsp 페이지에 넣어주면 쓸 수 있다.

### (참고)
Other CDNS 밑에 있는 곳에서 다른 제이쿼리들도 받을 수 있다. <br>
```
Google CDN
Microsoft CDN
->느림 (상대적으로, ms단위 수준으로)
CDNJS CDN
jsDelivr CDN
->빠름 (상대적으로, ms단위 수준으로)
```
----------------------------------------------------

장단점이 있다.
파일을 넣어서 쓰는 것은 네트워크가 안되는 상황에서도 괜찮다.

--------
검색해서 써보자.
https://api.jquery.com/

여기로 들어와서 찾아보거나 아니면 검색해서 사용하면 된다.
구글이나 네이버에서 사용하려는 기능이 어떤 함수를 쓰면 되는지 검색하고
알아온 뒤 그 함수를 여기에서 다시 검색해보는 것이 좋다. 

