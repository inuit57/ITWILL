import javax.swing.JOptionPane;

// 10초간 다이얼로그 창에 아무것도 입력하지 않으면 강제로 다이얼로그창 종료. 
public class MultiThreadEx3 {

	//사용자가 10초 안에 데이터를 다이얼로그에 입력했는지 판단하는 변수
	static boolean inputCheck = false ;
	// true : 입력함, false : 입력하지 않음.
	public static void main(String[] args) {
		
		new Thread(new Work1()).start();
		new Thread(new Work2()).start();
		
	}
}

class Work1 implements Runnable{
	@Override
	public void run() {
		for(int i = 10 ; i> 0 ; i--) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			System.out.println(i);
		}
		if (!MultiThreadEx3.inputCheck) {
			System.err.println("입력 시간 만료!");
			System.exit(0);
		}
	}
}

class Work2 implements Runnable{
	@Override
	public void run() {
		String input = JOptionPane.showInputDialog("입력하세요~");
		MultiThreadEx3.inputCheck = true; 
		System.out.println("입력하신 값은 " + input + "입니다.");
	}
}
