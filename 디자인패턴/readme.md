## 자바빈 패턴
- getter/setter 메서드를 사용하여 Beans객체를 만드는 방법
- 장점 : <userBean> 액션태그를 사용해서 Parameter 여러 개를 편하게 넣어줄 수 있다. 
```
//사용예시
  <jsp:useBean id="memberBean" class="test.bean.MemberBean" />
  <jsp:setProperty name="memberBean" property="*" />
//출처: https://all-record.tistory.com/105 [세상의 모든 기록]
```

## 빌더패턴
- 내부에 Builder 클래스를 생성하고 기본 생성자는 private로 지정해서 생성하는 방식.
- 장점 : setter메서드가 없기 때문에 외부에서 값을 변경할 수 없다. 
