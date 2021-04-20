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
- .jar 파일을 WEB-INF/lib 폴더 안에 복사해서 넣어주기.

## 프로젝트 설정 변경
- 서버 중지 시키기 (톰켓 서버 중지) 
- META-INF/context.xml 파일 만들기
	- 디비연결에 필요한 정보를 작성 
	- 주의! Resource다. resource가 아니다. 
```
<context>
	<Resource
		name=" 해당 연결의 이름 " // 외부에서 알아볼 수 있는 이름 : 예) jdbc/mysqlDB
		auth=" 컨테이너 자원 관리자 : Application 또는 Container "
		type=" javax.sql.DataSource 객체 타입 "
		driverClassName=" 드라이버 이름 "
		username=" 사용자명(DBID) "
		password=" 사용자비밀번호(DBPW)"
		url=" DB접속 URL "
		maxWait=" 5000 " //최대로 기다릴 시간, 단위 : ms (1/1000초) 
	/>
</context>
```

## 사용
- DAO 파일에서 디비 연결 동작 
```
		try {
			//Context 객체를 생성 
			Context initCTX  = new InitialContext();
			
			// DB 연동 정보를 불러오기 (context.xml) 
			//initCTX.lookup("java:comp/env/" + context.xml에 적었던 name ); 
			DataSource ds =
			(DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			/*
				//참고 : 아래의 2가지의 동작을 하나로 합친 것이 위의 문장
				Context envCTX = (Context) intiCTX.lookup("java:comp/env"); 
				DataSource ds = (DataSource)envCTX.lookup("jdbc/mysqlDB"); 
			*/
			
			try {
				conn = ds.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} 
```
