# 예외란? 
- Exception : 정상적으로 프로그램이 실행되지 못하고 종료되는 상황을 의미합니다. 

## 대처 방법 
- try~ catch문 : try문장 안에서 catch로 지정한 예외상황이 발생할 경우 catch로 이동. 
- throws exception문 : 


## 예외 출력(catch(Exception e){ ... } ) 
- e.printStackTrace()
  - 예외 발생 당시의 호출스택에 있던 메소드의 정보와 예외 메시지를 출력
  - 예외 발생하기까지의 모든 과정과 발생한 소스코드의 행 번호르 출력

- System.out.println( e.getMessage() ) 
  - 발생한 예외처리에 저장된 메시지를 간략하게 얻을 수 있도록 도와주는 메소드
  - 간략한 예외 정보만을 출력한다. 
