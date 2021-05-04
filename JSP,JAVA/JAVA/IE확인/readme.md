### 확인 방법
```
// 헤더에서 사용자 정보를 가져오기 
	String agent = request.getHeader("User-Agent"); 
	System.out.println("사용자 정보 : " + agent);
	
	//사용자 정보 안에 "MISE" , "Trident" 있을 경우 
	boolean ieBrowser = (agent.indexOf("MSIE")> -1 || agent.indexOf("Trident")>-1); 
	
 ```
