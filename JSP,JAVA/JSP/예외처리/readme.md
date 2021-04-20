# 예외 
- 일반적이지 않은 실행 상태 

# 예외처리
```
	try ~ catch ~ finally 구문 
	
	Throwable : Exception의 상위 객체 
	Exception : 모든 예외들의 상위 객체.
	(public class Exception extends Throwable{ } )
	
	예외가 발생하면 던진다.(Throw)라고 표현한다. 
	그것을 catch로 받아서 처리한다.   
	
	try{
		예외가 발생할 수도 있는 코드 작성 
	}catch(Exception 객체) { 
		발생한 예외에 대한 처리를 수행한다. 
		보통 에러코드를 여기에서 출력하도록 한다.
	}finally{
		예외여부와 상관없이 반드시 실행하는 문장. (예/ 자원 해제) 
		
	}
	
	정상코드 : try 시작 -> try끝 -> finally 시작->finally 끝
	오류코드 : try 시작 -> 문제발생 -> catch() 시작->catch() 끝 -> finally 시작/끝.
	
```


## 추가 공부
- try - with - resources 문
- finally 를 안 쓰더라도 자동으로 자원을 해제. 
