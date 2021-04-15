# 값 여러 개를 한번에 업데이트 해주기 

## MySQL
```
  UPDATE 테이블명 SET 필드명1='변경할값' , 필드명2='변경할값2' WHERE [조건];
  // Set절 뒤에 바꿀 값들을 연속해서 ","로 구분해서 적어주면 한번에 변경이 이뤄지게 된다. 
```


## Oracle 
``` 
  Update 테이블명 set (필드명1, 필드명2 ) = (변경할 값 1, 변경할 값2) where [조건] ; 
  
  //이런 식으로 작성해주어도 변경된다. 
```


### 참고자료 
[출처1](https://webisfree.com/2016-07-06/[sql]-%ED%85%8C%EC%9D%B4%EB%B8%94-%EC%95%88%EC%9D%98-%EC%BB%AC%EB%9F%BC-%EA%B0%92-%EB%B3%80%EA%B2%BD-%EC%88%98%EC%A0%95-update) 
[출처2](https://dongdongfather.tistory.com/114)
