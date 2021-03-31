# NULL 관련 함수 


1) NVL (expr1 , expr2) : expr1이 null 인 경우 expr2를 리턴, 아니라면 expr1을 리턴.
2) NVL2 (expr1 , expr2 , expr3) : expr1이 null이 아닐 경우 expr2를 리턴, null인 경우 expr3을 리턴 
3) NULLIF(expr1 , expr2) : 제시된 두 개의 값이 같은 경우 null , 아니라면 expr1을 리턴 
4) coalesce(expr1, expr2 , .... exprn) : null이 아닌 값을 만날 때까지 nvl을 반복. (마지막 값은 null이 아니어야만 한다) 

