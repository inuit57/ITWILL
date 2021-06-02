import javax.swing.JOptionPane;

// 10초간 다이얼로그 창에 아무것도 입력하지 않으면 강제로 다이얼로그창 종료. 
public class MultiThreadEx3 {

	//사용자가 10초 안에 데이터를 다이얼로그에 입력했는지 판단하는 변수
	static boolean inputCheck = false ;
	// true : 입력함, false : 입력하지 않음.
	public static void main(String[] args) {
		
		//카운터
		Thread t1 = new Thread(new Work1()); 
		t1.start();
		
		//입력창
		Thread t2 = new Thread(new Work2()); 
		t2.start();
		
		try {
			t1.join(); // 카운터 스레드가 종료될 때까지 대기, 종료된 후 동작. 
			if (!MultiThreadEx3.inputCheck) {
				System.err.println("입력 시간 만료!");
				t2.interrupt(); // 해당 스레드 강제 종료
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

class Work1 implements Runnable{
	@Override
	public void run() {
		for(int i = 10 ; i> 0 ; i--) {
			//사용자가 10초 안에 다이얼로그 창에 데이터를 입력하면?
			if(MultiThreadEx3.inputCheck) {
				return;
			}
			
			System.out.println(i);
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		MultiThreadEx3.inputCheck = false; 
	}
}

class Work2 implements Runnable{
	@Override
	public void run() {
		String input = JOptionPane.showInputDialog("입력하세요~");
		if(input != null) {
			System.out.println("입력하신 값은 " + input + "입니다.");
			MultiThreadEx3.inputCheck = true;
		}
	}
}
