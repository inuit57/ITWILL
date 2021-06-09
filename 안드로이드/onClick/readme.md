## View 객체를 사용하지 않는 예제. 
```
    <Button
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:id="@+id/button2"
        android:text="button"
        
        android:onClick="sub"
        />
```
- 먼저 xml 파일의 객체 안에 onClick으로 등록

```
    public void sub(View view){
        int num1 = Integer.parseInt(edit1.getText().toString());
        int num2 = Integer.parseInt(edit2.getText().toString());

        int result = num1 - num2 ;

        //결과값 문자열로 설정.
        edit3.setText(" " + result);
    }
```
- 함수를 생성할 때 인자로는 View 객체를 넣어줘야만 자동으로 매핑이 된다.
- 
