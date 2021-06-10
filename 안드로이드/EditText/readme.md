```
        final EditText et_InputMessage = (EditText) findViewById(R.id.edit1);
        // Edit 객체에 해당하는 키보드 버튼의 이미지 모양을 바꾸는 상수 값들 

//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_GO); // 이동버튼
//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_DONE); // 확인버튼
//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_NEXT); //다음 버튼
//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_NONE); //엔터 버튼
//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_SEARCH); //돋보기(검색) 버튼
//        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_SEND); //전송 버튼
        /*

            final 이 붙는 이유?
            - 내부 익명클래스에서 EditText 변수를 참조하기 때문이다.
            - 내부 클래스에서 접근하는 외부 지역 변수는 반드시 final 으로 선언해야 한다.
            - 아니면 그 변수가 가리키는 객체가 바뀌지 않는다는 보장이 있어야 한다.
            ====================================================================
            아래의 간단한 소스로 설명한다.

            public void onCreate(Bundle savedInstanceState){
                EditText editText = (EditText) findViewById(R.id.edit1);
                //....
                editText.setOnKeyListener(new OnKeyListener(){
                    public boolean onKey(....){
                        s = editText.getText();
                    }
                });

                editText = (EditText) findViewById(R.id.edit2);
            }

            위의 editText.getText() 호출시 editText는 어떤 객체를 가리키는가?
            editText1인가? 아니면 editTExt2인가?

            생성된 이벤트 리스너 객체는 onCreate() 메소드가 종료된 이후에도 살아있을 수 있다.
            이벤트 리스너 객체 안의 이벤트 처리 메소드는 이벤트가 발생하면 호출됩니다.

            이런 혼란을 막기 위해 editText는 반드시 final로 지정하도록 되어있다.
            만약 final로 지정하지 않으면 다음과 같은 오류메시지가 표시된다.


         */




        et_InputMessage.setImeOptions(EditorInfo.IME_ACTION_GO);

        et_InputMessage.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                boolean handled = false;

                if(actionId == EditorInfo.IME_ACTION_GO){
                    //Toast Message를 출력

                    //editText에 입력된 글자를 가져와서 토스트 메시지로 나타내기
                    Toast.makeText(
                            getApplicationContext(),
                            et_InputMessage.getText(),
                            Toast.LENGTH_SHORT
                    ).show();

                    handled = true;
                }

                return handled;
            }
        });

```
