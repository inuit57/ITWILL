# 개요 
-java.lang.String 클래스
- 자바에서 문자열을 담아두는 클래스
- 한번 생성된 이후, 변하지 않는(immutable) 문자열을 저장해두기 위해 사용
 
 # 함수 
 - boolean contains(CharSequence str) : 문자열 안에 str 문자열이 포함되어있다면 true를 리턴
 - boolean equals(Object obj) : obj와 String 객체의 내용물이 동일한지 확인한다. (== 을 쓰면 안된다.) 
 
 
 # 추가로 공부하기 
 - CharSequence 인터페이스 
  - String은 이 인터페이스를 상속받아서 구현한 클래스 
  - 이 인터페이스를 구현한 클래스는 String 이외에도 3가지가 더 있다.
    - CharBuffer
    - StringBuffer
    - StringBuilder
    - 각각에 대해서 공부할 필요가 있다. 
