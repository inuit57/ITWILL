# 정규표현식 
- 문자열의 규칙을 간단하게 표현하는 것.
- 이를 통해서 문자열을 검사하는 것을 간편하게 수행할 수 있다. 
- 참고 자료 : https://poiemaweb.com/js-regexp

<img src="https://poiemaweb.com/img/regular_expression.png">

## 사용법
### 플래그
- i : 대/소문자를 무시하고 검색한다.
- g : 문자열 내의 모든 패턴을 검색한다.
- m : 문자열의 행이 바뀌더라도 검색을 계속한다. 

### 패턴
- . : 임의의 문자 하나를 의미한다. (... 으로 사용할 경우 3글자를 추출한다.) 
  - 예) a.b : a?b와 같은 의미, a로 시작하고 중간에 아무문자 하나가 들어가고 그리고 b로 끝나는 것을 검색
- + : + 앞에 있는 패턴을 반복해서 수행한다. 
- | : or 기능
- [a-z] : 범위지정을 하려면 [] 기호 안에 시작점 "-" 끝점 으로 하면 된다. (예/ 0-9) 
- \d : 숫자만을 추출한다.
- \D : 숫자가 아닌 값만을 추출한다.
- \w : 알파벳 문자만을 추출한다.
- \W : 알파벳 문자가 아닌 값을 추출한다.
- ^ : 문자열의 처음을 의미한다.
  -  예) /^Http/ : Http로 시작하는지 검사
- $ : 문자열의 끝을 의미한다. 
  -  예) /.com$/ : .com으로 끝나는지 검사
- [^a-z] : []안에 사용된 ^는 해당 패턴이 사용되지 않은 것들만을 알아낼 때 쓴다.
- 


