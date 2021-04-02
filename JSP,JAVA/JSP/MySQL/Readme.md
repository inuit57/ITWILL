# [설치 사이트](https://dev.mysql.com/downloads/file/?id=500616)
- 위 사이트에서 각자 환경에 맞도록 설치 

# 설치 과정
- Developer Default (기본 설정)
  - 나중에 익숙해지면 Custom으로 해서 필요한 것들만 설치하기
- [excute] 버튼 누르기 (필요한 것들 설치) 
  -  맨위에 MySQL Server만 제대로 설치되었다면 문제 없다. 
-  [next] 버튼 활성화 될 경우, 누르고 [Yes] -> [excute] 누르기
    - 기다리면 된다. 
-  [next]-> [next] 
-  포트번호 기억하기 (기본 : <b>3306</b>) -> [next]
-  <b>root 계정 비밀번호 설정 ( 1234/ 1234 ) 
    -  AddUser
    -  ID : jspid 
    -  Role : DB Admin 그대로 두기 
    -  PSW : jsppass
    </b>
 - start the MySQL Server at System Startup 
    -  윈도우 켜질 때 실행되게 할 건지 하는 것. 체크 해제
    -  서비스 이름 : MySQL57 
-  [excute] -> [Finish] 
-  [next]-> 라우터 설정은 무시 -> [next] 반복
-  root 비밀번호 입력하고 check > status 초록불 확인 -> next
-  [excute] -> [Finish] 
-  [next]  ... 
-  설치 완료 후 뭐 실행할 거냐고 하는 체크박스 있는데 풀어주기. 


# 실행
- MySQL5.7 Command Line Client 실행 
  -  root 계정으로 로그인 (pwd : 1234) 

- mysql> status 
> 상태정보 확인  <br>
> 확인해보면 charset이 latin1로 되어있다. 한글 다 깨지니까 수정이 필요하다. <br>

- C:\Program Data\MySQL\MySQL Server 5.7
- my.ini 파일 열기 
```
 [mysqld] 밑에 작성 (메모장에 적고 복사해서 옮기기)
 character-set-server=utf8
 collection-server=utf8
 default=character-set=utf8
 skip-character-set-client-handshake
 ```
