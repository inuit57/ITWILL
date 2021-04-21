# 개요 
- 가변길이 배열. 
- 만약 생성시에 제네릭 타입을 지정해주지 않는 경우 ArrayList<Object>로 생성된다. 
- 일반적으로는 제네릭 타입을 넣어준다. 예) ArrayList<Integer> 


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
- ArrayList와는 달리 항상 동기화된다는 차이점이 있다. 
(이로 인하여 성능 상 ArrayList보다는 조금 떨어진다는 단점을 가지고 있지만 멀티스레드 환경에서 안전하다.)
