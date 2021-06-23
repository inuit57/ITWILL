# CASE 식 
- IF then else 문법과 유사한 조건식 문법
```
case A when B then A*10
       when C then A*20
else A end ;
```
- 이렇게 사용할 경우 A와 동일한 값들에 대한 조회만 가능 

## 검색된 CASE표현식 
```
(CASE
   When A < 5000 then 'Low' 
   When A < 10000 then 'Mid' 
   When A < 15000 then 'high' 
   ELSE 'excellent' 
END)
```
- 원하는 비교 연산자를 사용할 때는 CASE 바로 뒤가 아닌 When 뒤에 조건을 작성하면 된다. 

# DECODE 함수
- case 식 또는 if-then-else 문의 작업을 수행. 조건부 조회를 편리하게 수행 
```
DECODE( col | expression , search1, result1, 
                         [,search2, result2,]
                         [,search3, result3,]
                         default)
                         ```
- 이것도 같은 경우인지만 비교가 가능하기에 비교연산자를 사용하려면 CASE 식을 써야 한다. 

# JOIN
## Natual JOIN (자연조인)
- 2개의 테이블에서 컬럼명과 컬럼크기가 모두 동일할 때 사용가능한 JOIN 
- 만약 그러한 컬럼이 2개 이상일 경우 using을 사용해서 어떤 것으로 가져올지 선택할 수 있다. 
- 또한, 이렇게 using절에 사용된 컬럼의 경우 앞에 어떤 테이블의 것인지 명시해줄 경우 에러가 난다. (접두어 사용불가)
