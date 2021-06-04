package test;

class StopThreadDemo2 implements Runnable{
	@Override
	public void run() {

		try {
			//Thread.currentThread() ; 
			// 현재 실행(작업) 중인 스레드에 대한 정보를 반환하는 메소드 
			// isInterrupted() 메소드
			// 현재 작업 스레드를 중지해라 라는 명령을 내렸는지 확인하는 메소드 
			// interrupt() 
			// 현재 작업 스레드를 종료해라. 라는 명령어 
			
			//while(!Thread.currentThread().isInterrupted()) {
			while(true) {
				if( Thread.currentThread().isInterrupted()) {
					Thread.sleep(1000);// sleep()이 되어야 종료된다.
				}
				System.out.println("쓰레드 실행 중...");
			}
			
		}catch(Exception e) {
			System.out.println("interrupt 메소드를 이용하여 작업 스레드 중지시키기");
		}finally {
			// 작업스레드가 종료되는 시점에 반드시 실행되어야하는 문장
			
			System.out.println("Thread는 현재 Dead ... ... ");
			
		}
	}
}

public class StopThreadEx2 {

	public static void main(String[] args) {
		Thread th1 = new Thread(new StopThreadDemo2()); 
		
		th1.start(); 
		
		try {
			Thread.sleep(3000);
			th1.interrupt(); // 3초 뒤에 interrupt 발생.
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}
