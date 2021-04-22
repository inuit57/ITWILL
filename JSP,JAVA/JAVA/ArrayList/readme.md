# 개요 
- 가변길이 배열.(동적배열)
- List 계열 ( 순서를 기억(index) , 중복 허용 ) 
- 만약 생성시에 제네릭 타입을 지정해주지 않는 경우 ArrayList<Object>로 생성된다. 
- 일반적으로는 제네릭 타입으로 Wrapper 클래스를 넣어준다. 예) ArrayList<Integer> 

## 참고 
- Wrapper Class : 기본형 8가지 데이터 타입을 참조형으로 변경한 것.
- 데이터 타입의 첫글자만 대문자로 바꾼 형태라고 생각하면 된다. java.lang밑에 있다. 
- Integer, Long, Boolean, Character, Double , Float , Short , Byte  


# 예시 
```
ArrayList list = new ArrayList(); 

list.add("Hello"); 
list.add(1234); // new Integer(1234) 로 바뀌어서 저장된다. 
list.add(123.4f) ;  // new Float(123.4f)로 바뀌어서 저장된다. 

for(int i = 0 ; i < list.size() ; i++){
  Object obj = list.get(i) ; 
  System.out.println(obj) ; 
}  
```

## 추가로 공부 필요 
### Vector 
- Vector v = new Vector(size) ; // 크기 지정이 필요 
- ArrayList 처럼 가변길이 배열이다. 
  - v.add(data) ; //add 메서드로 뒤에 추가 가능 
  - v.get(index); //get 메서드로 특정 위치에 있는 값을 읽어올 수 있다.
- ArrayList와는 달리 항상 동기화된다는 차이점이 있다. 
(이로 인하여 성능 상 ArrayList보다는 조금 떨어진다는 단점을 가지고 있지만 멀티스레드 환경에서 안전하다.)

### 다른 컬렉션(Collection) 개체들
- Map 
- HashMap
