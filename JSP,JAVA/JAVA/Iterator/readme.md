# 개요 
- 모든 컬렉션 배열 객체에 저장되어있는 객체들을 순차적으로 접근할 때 사용 가능 


## 추상 메서드들 
- hasNext() : 컬렉션 배열에서 꺼내올 데이터가 있는지 확인하는 메서드
- next() : 다음 객체가 있는 경우 다음 객체의 정보를 받아오는 메서드. 


## 사용 예시 
```
ArrayList arrayList = new ArrayList() ; 
// add() 동작수행 
// ...

Iterator iterator = arrayList.iterator(); 

while(iterator.hasNext() ) { 
  System.out.println(iterator.next() ) ; 
}

```
