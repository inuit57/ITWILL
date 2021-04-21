# 개요 
- 가변 문자열을 저장할 용도에 사용되는 클래스.
```
    StringBuffer sb = new StringBuffer("String Buffer");
  
  	sb.append("test"); // 뒤에 붙인다. 
		//sb+="1"; // 에러가 난다. String과는 달리 + 연산자로 뒤에 붙이는 것이 안된다. 
    
```

## 연산속도 비교 
```
String:13949700
String BB:3505700
StringBuffer:3446000
```
- StringBuffer > String Builder > String 순으로 속도가 빠르다. 
- for문에서 문자열을 붙이는 등의 조작을 할 경우 String보다는 StringBuffer를 사용하는 것이 성능상 더 좋다. 
```
import java.util.ArrayList;

// 주제 : String 과 StringBuffer의 속도 차이 비교 

class Clock { 
	 
	// 작업할 클래스 이름(String/StringBuffer)를 저장할 변수 
	private String clockName  ; 

	private long startTime ; 
	private long endTime ; 
	private long leadTime ; 
	
	
	public Clock(String name) {
		clockName = name ; 
	}
	
	// nanoTime(), currentTimeMills() 
	// 둘다 현재시간을 Long 값으로 리턴하지만 단위에서 차이가 있다.
	// 전자의 경우 ns(nano second) , 후자의 경우 ms(millisecond)를 사용한다. 
	public void clockStart() { 
		startTime = System.nanoTime(); //System.currentTimeMillis();
	}
	public void clockEnd() {
		endTime = System.nanoTime();  //System.currentTimeMillis(); 
		leadTime = endTime - startTime; 
	}
	
	public void showInfo() {
		System.out.println(clockName+":" + leadTime);
	}
	
	public long getLeadTime() {
		return this.leadTime; 
	}

}

public class Test121 {
	
	
	public static void main(String[] args) {
		final int maxCnt = 100000 ;
		
		String str1 = new String("string"); 
		
		StringBuffer str2 = new StringBuffer("stringB"); 
		
		StringBuilder str3 = new StringBuilder("stringBB"); 
			
		Clock c1 = new Clock("String");
		
		c1.clockStart();
		for(int i =0 ; i< maxCnt ; i++) {
			//str1 = str1 + "JAVA";
			str1.concat("JAVA"); 
		}
		c1.clockEnd();
		c1.showInfo();
	
		Clock c3 = new Clock("String BB"); 
		c3.clockStart();
		for(int i =0 ; i< maxCnt ; i++) {
			//str1 = str1 + "JAVA";
			str3.append("JAVA");  
		}
		c3.clockEnd();
		c3.showInfo();
	
		Clock c2 = new Clock("StringBuffer"); 
		c2.clockStart();
		for(int i =0 ; i< maxCnt ; i++) {
			str2.append("JAVA");   
		}
		c2.clockEnd();
		c2.showInfo();
		
		System.out.println("------------------");
		
		System.out.println(c1.getLeadTime() > c2.getLeadTime() ? 
				c2.getLeadTime() > c3.getLeadTime() ? "String BB" : "StringBuffer" :
					c1.getLeadTime() > c3.getLeadTime() ? "String BB" : "String");  

		
	}

}
```
