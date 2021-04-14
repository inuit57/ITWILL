# 인터페이스 

## 정의 
- 다중 상속이 불가능하기에 생겨난 자바의 문법. (참고 : 다중상속이 불가능한 이유- 다이아몬드 상속 때문) 
- 안에는 상수와 추상메서드만이 존재할 수 있다. 
- 인터페이스를 상속받아서 구현하게 되는 클래스는 반드시 인터페이스 내부의 모든 추상메서드를 구현해야만 한다. 
- 인터페이스를 상속받은 클래스도 기존의 클래스 상속관계처럼 인터페이스를 부모로, 구현한 클래스를 자식으로 보면 된다. 

- 상속이든 인터페이스든 중요한 것은 범위가 더 큰 놈이 작은 놈한테 들어가는 것은 괜찮지만,그 반대는 안된다는 것이다. 
( 확실하게 하려면 instanceof 연산자를 통해서 한번 확인을 하고 진행하는 것이 좋다. 캐스팅해서 억지로 넣기전에.) 

## 구현
```
interface Name { 
  //추상 메서드 (public abstract 생략 가능) 
  // 상수 (public static final 생략가능)
}

class NameImpl implements Name{
  //추상메서드 구현 (public 으로)
} 
```

## 사용
```
Name name = new NameImpl() ; 
// 일반적인 클래스 사용하듯, 사용가능. 
// Name name = new Name() ; 
// 이렇게 쓰는 것은 불가능하다. 반드시 인터페이스를 구현한 클래스의 생성자로 만들 것. 
```


## 주의사항. 
### 인터페이스를 다중 상속한 인터페이스의 경우. 
```
interface AAA {
	void aaa(); 
}
interface BBB{
	void bbb(); 
}
interface ABAB extends AAA,BBB{
	//인터페이스는 다중 상속이 된다. 
}

// AAA 를 상속받아서 구현한 클래스.
class AAAImpl implements AAA{
  public void aaa(){ System.out.println("AAA"); } 
} 

// AAA , BBB를 상속받아서 구현한 클래스. 
class ABImpl implements AAA, BBB{
	@Override
	public void aaa() {
		// TODO Auto-generated method stub
		System.out.println("AAABB");
	}@Override
	public void bbb() {
		// TODO Auto-generated method stub
		System.out.println("BBBAA");
	}
}

public static void main(String[] args){

   ABAB abab = (ABAB) new AAAImpl(); 
   abab.aaa(); //이러면 오류난다. 
   abab.bbb(); //당연히 사용하려고 하면 에러난다. 
   // 이유라고 한다면 당연한 거지만, BBB에 대한 부분을 구현하지 않았으므로 오류가 난다. 
   
   ABAB abab2 = (ABAB) new ABImpl(); 
   abab2.aaa(); 
   abab2.bbb(); 
   // 실행하면 이 놈도 에러가 난다. 
   // 이유라고 한다면 ABAB도 인터페이스이기 때문에 ABAB에서 추가로 넣은 추상메서드가 있을 수 있기 때문에.
   // 자바가 그것조차 용서하지 않아서 오류가 난다. 
   
   BBB b = new ABImpl(); 
   b.bbb(); //이건 잘 된다. 
   
   
}
```
