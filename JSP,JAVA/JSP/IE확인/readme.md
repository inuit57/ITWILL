### 확인 방법
```
// 헤더에서 사용자 정보를 가져오기 
	String agent = request.getHeader("User-Agent"); 
	System.out.println("사용자 정보 : " + agent);
	
	//사용자 정보 안에 "MISE" , "Trident" 있을 경우 
	boolean ieBrowser = (agent.indexOf("MSIE")> -1 || agent.indexOf("Trident")>-1); 
	
	if(ieBrowser){
		fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
		// UTF-8 로 변경(한글이 안 깨지도록)
		// +기호를 띄어쓰기(%20)로 변경
	}else{
		// 모든 브라우저들 한글 깨짐 방지 (인코딩 방식 UTF-8로 변경)
		fileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1"); 
	}
 ```
