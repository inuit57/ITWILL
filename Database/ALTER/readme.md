<테이블 수정> 

1.  컬럼 추가 <br>
```
SQL > alter table 테이블명
         add ( 필드명 필드타입(크기) {DEFAULT 기본값} ) ;  
```
>새로 추가되는 컬럼은 마지막에 들어가게 된다. <br>
> 그리고 추가된 컬럼의 기본값으로는 null 값이 들어가게 된다. <br>
> Default 기본값을 설정해줄 경우에는 설정한 값이 들어간다.

2.  컬럼 수정 (데이터 타입, 컬럼 사이즈, default 값 등 ) , 제약조건 추가
```
SQL > alter table 테이블명 
        modify --------- ; 
```
> 컬럼 크기를 증가시키는 것은 언제나 가능. <br>
> 컬럼 크기를 줄이는 것은 현재 들어있는 데이터를 저장할 수 있는 범위 안에서 줄이는 것이 가능. <br>
> 이미 만들어진 컬럼에 기본값을 설정해주더라도 null이 기본값으로 바뀌지는 않는다. <br>
> 기본값을 설정한 이후에 넣는 컬럼이 그렇게 들어가게 된다. 


3. 컬럼 삭제 
```
SQL > alter table 테이블명 
         drop (컬럼명) ; 
```
4. 제약조건 추가
4-1. 테이블 레벨 -PK , FK , UK , CK 
```
SQL > alter table 테이블명
         add constraint 제약조건명 제약조건유형(컬럼명) ; 
```
4-2. 컬럼 레벨 - PK , FK , UK , CK , <b>NN</b> 
```
SQL > alter table 테이블명
        modify 컬럼명 constraint 제약조건명 제약조건유형 ; 
```


5. 제약조건 삭제 
```
SQL > alter table 테이블명
        drop constraint 제약조건명 
```
