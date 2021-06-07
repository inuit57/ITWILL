# 개발환경 구성
- 먼저, JDK를 설치. 
- 참고) 안드로이드 스튜디오 2.2 부터는 open JDK가 내장되어있어서 별도로 JDK를 설치하지않아도 된다.
- 안드로이드 SDK 가 별도의 폴더에 존재해야한다.
- SDK에는 모든 안드로이드 버전의 개발 API가 들어있지 않기 때문에 필요한 것을 추가 다운로드해야 한다. 

# 화면(UI) 작성 방법 3가지 
1) XML 코드로 작성
2) JAVA 코드로 작성
3) XML , JAVA 코드를 동시에 사용 

## 2. JAVA 코드로 작성
```
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Linear Layout 객체 생성
        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);

        //버튼 객체 생성
        Button b1 = new Button(this);
        b1.setText("첫번째 버튼");
        //버튼 객체를 LinearLayout 내부에 추가
        container.addView(b1);

        Button b2 = new Button(this);
        b2.setText("두번째 버튼");

        container.addView(b2);

        setContentView(container);
        //setContentView(R.layout.activity_main);
    }
}
```
