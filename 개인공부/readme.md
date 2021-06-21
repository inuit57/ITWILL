## 개요
- 개인 공부 사항을 정리한다. 
- 다른 곳에 적는 것보다는 국비교육 진행하면서 배운 것들이니 여기에 남겨두는 것도 의미 있으리라. 

## Optional 클래스
- java.util.Optional&lt;T> 클래스
- null point 처리를 좀더 쉽게 해주는 클래스

```
  Optional<String> opt = Optional.ofNullable("자바 Optional 객체");

  if(opt.isPresent()) {
      System.out.println(opt.get());
  }
```
- isPresent() 함수를 통해서 Null인지 한번 확인하고 get() 함수로 가져와서 처리할 수 있다.
- [자료참고](http://tcpschool.com/java/java_stream_optional)
- [자료참고2](https://mangkyu.tistory.com/70)

- 사용이유 : orElse() 를 통해서 null 일 경우에 대한 처리를 할 수 있다. 그리고 복잡한 코드에서의 null 검사를 쉽게 가능. 
  
