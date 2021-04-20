# 커넥션풀(Connection Pool) 
: 미리 연결정보(Connection)을 생성해서 저장 후 사용 -> 사용 후 반납

- 서비스() 1개당 1개의 Connection 사용
- 커텍션의 최대 갯수를 제한한다. 
	- 만약 모든 커넥션을 사용한 상태에서 추가요청이 들어온다면 대기시킨다.
	- 관리객체가 사용후 자원 회수
	
## 진행 흐름
```
1) 웹 브라우저에서 요청
2) 할당될 커넥션 객체가 있는지 확인
3) 있는 경우
	i) 커넥션 할당
	ii) 커넥션 객체 사용(sql 실행)
	iii) 커넥션 반납 
4) 없는 경우  
	i) 커넥션 객체가 반환될 때까지 대기
	ii) 혹은 임시 커넥션 객체를 생성 후 할당(관리자가 제어)
```
## 다운로드 
- bin 파일 다운로드
- JAVA 버전(8.0)에 맞춰서 다운로드 진행하기. 

- [commons-collections4.4](http://commons.apache.org/proper/commons-collections/download_collections.cgi)
- [DBCP 2.8](http://commons.apache.org/proper/commons-dbcp/download_dbcp.cgi)
- [Pool 2.9](https://commons.apache.org/proper/commons-pool/download_pool.cgi) 
