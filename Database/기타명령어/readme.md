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
