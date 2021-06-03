# 개념 정리 
```
프로그램 : 운영체제에 현재 실행되고 있지 않은 실체 

프로세스 : 현재 메모리 상에 올라가서 실행되고 있는 프로그램 

쓰레드 : 하나의 프로세스 내부에 존재하는 하나의 작업. 
```
- [자료참고](https://gmlwjd9405.github.io/2018/09/14/process-vs-thread.html) 


### 멀티 프로세스
- 하나의 운영체제에서 여러 개의 프로세스가 동시에 실행되는 것. 

## 쓰레드
- 실행 중인 하나의 프로세스에 있는 하나의 작업단위 
- --
- 프로세스 내에서 실행되는 여러 흐름의 단위 , 프로세스의 특정한 수행경로
- 스레드는 프로세스 내에서 각각 Stack만 따로 할당받고 Code, Data, Heap 영역은 공유한다
- 시작부터 끝까지 완전한 하나의 작업을 의미한다. 

### 상태
- 대기(Not running) , 실행 중(running) , 죽은 상태(Dead)

### 멀티쓰레드
- 단일 프로그램이 두 개 이상의 task를 동시에 수행할 수 있다.
- 여러 개의 스레드가 번갈아가면서 진행된다. 
- 대부분의 I/O 장치는 CPU보다 작업 속도가 느리기 때문에 유휴시간이 발생하게 된다.
- 이러한 유휴시간에 다른 태스크를 실행할 수 있도록 해주는 것이 멀티스레드. 

- 주스레드(main thread)로부터 다른 스레드들이 생성된다. 

### 사용하는 이유?
- 동시에 여러 가지 일을 처리하려고 사용한다.
- 유휴시간을 보다 효율적으로 사용하기 위해서 사용한다. 

- 보다 정확하게 이해하려면 입출력 속도가 연산속도보다 느리다는 것에 대해서 이해해야 한다. 
알고리즘 같은 연산을 쓰레드로 구현하는 것이 아니라 입출력 처리가 되는 시간동안 그것이 다 된 다음에
연산을 진행하는 것이 아니라 기다리는 대신 다른 연산을 처리한다고 이해하는 것이 좋다. 
- 물론 입출력 연산이 없는 여러 개의 일반적인 연산을 다중화하여 구현할 수도 있으나 
이 경우에는 어떤 것이 먼저 실행된다는 보장이 없기 때문에 개발자가 그 순서를 조정해주는 것이 좋다. 

### 구현하는 방법
- Thread 클래스를 사용하는 방식
  - White Box Pattern
- Runable 인터페이스를 사용하는 방식 
  - Black Box Pattern
  - 실제 개발시에는 이 방식을 더 많이 사용한다. (캡슐화할 수 있기 때문)

### start() and run() 
- start()는 새로운 스레드가 작업을 실행하는데 필요한 호출 스택을 생성하고 run()을 호출한다.
- 그리고 생성된 호출 스택에 run()이 저장되도록 만든다. 
- 아예 main() 과는 별도의 호출 스택 영역을 만들고 거기에서 동작되도록 한다고 보면 된다. 

#### Thread 클래스 사용 
```
public class ThreadEx01 extends Thread{
	public ThreadEx01(String name) {
//		this.name = name;
		super(name); 
	}
	// callback Method : 개발자가 아닌 JVM이 자동으로 호출해주는 메소드 
	// 작업 스레드 객체들이 해야할 일을 구현해 놓을 콜백 메소드 
	@Override
	public void run() {
		// run() 메서드는 무조건 하나만 만든다. 
		int sum =0 ; 
		for(int i =0 ; i< 5 ; i++) {			
			// 작업 스레드 2개 중 현재 작업중인 작업 스레이드에게 1초간 휴식 주기 			
			try {
				sleep(1000); // 단위 : ms , 1초간 휴식 
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			sum+= i ; 
			System.out.println(super.getName() + " : " + sum);
		}
	}
	public static void main(String[] args) throws InterruptedException 
		ThreadEx01 t1,t2; 
		t1 = new ThreadEx01("1번"); 
		t2 = new ThreadEx01("2번"); 
	
		// 총 쓰레드는 3개. 메인  , 작업 스레드 1,2번 
		// start() : 
		// 직접적으로 run() 을 호출하지는 않지만
		// JVM에게 자식 스레드가 일할 준비가 되었으니
		// JVM에게 run() 메소드를 호출하라는 의미
		t1.start();
		//t1.join(); // join을 쓰면 이게 다 된 다음에 진행하게 할 수 있다.
		t2.start();
		// 번갈아가면서 호출되고 있다는 것을 알 수 있다.
		// 실행할 때마다 순서가 조금씩 달라진다. 
	}
}
```

#### Runnable 인터페이스 사용 
- 쓰레드화 작업이 필요하다. 
- 캡슐화 할 수 있어서 이 쪽을 더 권장한다. 
- 쓰레드를 실행시키는 start() 메서드는 Thread 클래스에 들어있다.
그렇기에 Thread 클래스를 생성해야 하는데 이 때 생성자의 인자로 
Runnable 인터페이스를 상속받은 객체의 인스턴스를 넣어준다. 이를 쓰레드화 작업이라고 말한다. 
```
public class Test implements Runnable{
	// run() 메소드를 오버라이딩 해줘야 한다. 
	// 현재 스레드 이름을 저장할 변수 
	String name ; 
	public Test(String name) {
		this.name = name ; 
	}
	@Override
	public void run() {
		int sum = 0 ; 
		for(int i =0 ; i < 5; i++) {
			try {
				Thread.sleep(1000);
				sum+= i ;
				System.out.println(name + " : " + sum);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		Test t1, t2 ; 
		t1 = new Test("첫번째 스레드"); 
		t2 = new Test("두번째 스레드"); 
		Thread tt1 = new Thread(t1);
		Thread tt2 = new Thread(t2);
		//이를 스레드화 작업이라고 한다. 
		tt1.start();
		tt2.start();
	}
}
```
