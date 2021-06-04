package _0604;

import java.util.Stack;

// 자판기 클래스 ( 공급자 스레드와 소비자 스레드가 사용할 공유 데이터 역할을 수행 )
class AutoMachine{
	// 자판기 공간 (스택객체 메모리) 생성
	Stack store = new Stack(); 
	
	// 음료 공급자 스레드가 자판기 공간에 음료캔을 공급하기 위한 기능을 수행하는 메서드 
	public synchronized void putDrink(String can) {
		this.notify();
		store.push(can); 
	}
	// 음료 소비자 스레드가 자판기 공간에서 음료캔을 꺼내가기 위한 기능을 수행하는 메서드.
	public synchronized String getDrink() {
		if(store.isEmpty()) {
			try {
				this.wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		//return store.isEmpty() ? null : store.pop().toString() ;
		return store.pop().toString(); 
	}
	
	public synchronized boolean isEmpty() { 
		return store.isEmpty(); 
	}
}

class Seller implements Runnable{
	
	AutoMachine am ; 
	
	public Seller(AutoMachine am) {
		this.am = am; 
	}
	
	@Override
	public void run() {
		for(int i = 0 ; i< 10 ; i++) {
			System.out.println(Thread.currentThread().getName() + " : 음료수 NO." + i + "채워넣음");
			
			am.putDrink("음료수 No."+i); 
			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

class Consumer implements Runnable{
	
	private AutoMachine machine ; 
	
	public Consumer(AutoMachine am)	{
		machine = am ; 
	}
	
	@Override
	public void run() {
		String can = null ; 
		for(int i =0 ; i< 10 ; i++) {
			can = machine.getDrink(); 
			if (can != null) {
				System.out.println(Thread.currentThread().getName() 
						+ " : " + can + " 뽑아 먹음!");
			}
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}
}

public class SyncThreadEx2 {
	
	public static void main(String[] args) {
		AutoMachine am = new AutoMachine(); 
		
		Thread t1 = new Thread(new Seller(am)); 
		Thread t2 = new Thread(new Consumer(am)); 
		Thread t3 = new Thread(new Consumer(am)); 
		
		t1.start();
		t2.start();
		t3.start();
		
		
		
	}

}
