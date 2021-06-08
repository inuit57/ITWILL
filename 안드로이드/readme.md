# 개발환경 구성
- 먼저, JDK를 설치. 
- 참고) 안드로이드 스튜디오 2.2 부터는 open JDK가 내장되어있어서 별도로 JDK를 설치하지않아도 된다.
- 안드로이드 SDK 가 별도의 폴더에 존재해야한다.
- SDK에는 모든 안드로이드 버전의 개발 API가 들어있지 않기 때문에 필요한 것을 추가 다운로드해야 한다. 

# 화면(UI) 작성 방법 3가지 
1) XML 코드로 작성
2) JAVA 코드로 작성
3) XML , JAVA 코드를 동시에 사용 

## 1. XML 코드로 작성
- activity_main.xml 을 수정 
- GUI 환경에서 작업할 수 있다는 장점이 존재한다. (결과물이 어떻게 나올지 바로 확인 가능)
- Layout 종류를 변경 가능하다. (LinearLayout , RelativeLayout 등등) 

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

        // java로만 작성할 경우에는 생성한 레이아웃을 setContentView()의 인자로 넘겨준다. 
        setContentView(container);
        
        // XML로 작성할 경우에는 아래의 방식으로 접근.
        //setContentView(R.layout.activity_main); 
    }
}
```

## 3. XML, JAVA 코드를 같이 사용
- 기본적인 화면 구성은 xml에서 작업하고 java 코드 상에서 화면 구성물에 대한 제어를 처리하는 방식
- 특정 조건 상에서 버튼 색상이나 크기를 변경한다던지 하는 식의 작업이 가능하다. 
```
Button b1 = (Button)findViewById(R.id.button1);
```
- findViewById(R.id.{id값} ) ; 함수를 통해서 객체를 가져올 수 있다. 

# 속성 값들 
## 크기 관련
- android:layout_width , android:layout_height : 각각 너비와 높이를 지정한다.
- "wrap_content" : 안의 내용물에 맞춰서 크기를 지정한다.
- "match_parent" : 부모의 크기를 따라가도록 한다. (가장 기본이 되는 부모는 화면이 된다.) 

```
        단위.
        px(pixels) : 화면의 실제 픽셀.(권장 단위 X )
                     장치마다 해상도가 다르기 때문이다. 
        dp : dp 는 화면의 밀도가 160dpi 의 화면에서 하나의 물리적인 픽셀을 의미.
             예를 들어서 160dp로 지정하면 화면의 밀도와는 상관없이 항상 1인치가 된다. 
        sp : 화면 밀도와 사용자가 지정한 폰트 크기에 영향을 받아서 변환된다. 
             폰트 크기를 설정할 때 주로 사용된다. 
        pt : 1/72 인치를 표시한다. 
        mm : 밀리미터 단위를 나타낸다.
        in : 인치 단위를 나타낸다. 
        
        장치의 종류에 관계없이 항상 동일한 크기로 표시되게 하려면
        dp 단위를 사용해야 한다. 1인치 = 160 dp  .  
 ```

## 아이디값 
- android:id : 구분할 수 있는 독립적인 id 값을 부여한다. id값은 중복이 불가능하다.
- 예시
```
android:id="@+id/button1" 
// 이렇게 하면 button1이라는 id 값을 부여 가능. 
```

## android:visibility 속성
- visible (기본) : 0 , 화면에 보이게 설정한다.
- invisible : 1, 보이지 않지만 공간을 차지한다.
- gone : 2, 보이지 않고, 공간도 차지하지않는다. 

## margin, padding 
### android:layout_margin 속성
- 바깥쪽 여백을 설정한다. 위,아래,좌,우 등등 특정 위치에 대한 margin만 별도로 부여하는 것도 가능.
- 그냥 margin 속성을 사용할 경우 전체에 동일한 margin을 부여한다. 

### android:padding 속성
- 안쪽 여백을 설정한다. 
