# JOIN의 처리 
- 2가지 방법이 있습니다.
  - Join된 데이터를 같이 처리해줄 DTO 객체를 만들기
  - 2개의 DTO객체를 만들고 각각 정보를 저장하고 그것을 하나로 묶어서 전달하기 

## 2개의 DTO를 만들어서 묶어서 처리
```
		Vector totalList = new Vector();
		List basketList = new ArrayList();
		List goodsList = new ArrayList();
```
- 장바구니를 처리하는 예제 
- 장바구니 정보와 상품 정보를 join해서 가져와야 하는 경우
- 여기에서는 각각 select를 한 뒤, 각각 List에 담아서 저장하고
- List 2개를 Vector에 담아서 vector객체를 보내는 식으로 묶어서 처리를 수행하였다.
