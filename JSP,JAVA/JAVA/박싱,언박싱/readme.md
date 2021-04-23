# 정의
- Wrapper Class 객체에 기본 자료형을 넣거나 혹은 반대로 하는 과정을 말한다. 
- JDK 1.5 버전 이후로는 자동으로 수행해준다. 


## Boxing 
- new 를 활용한 방법
- valueOf()를 활용한 방법

```
Charater ch = new Charater('c'); 
Integer it = Integer.valueOf(1) ; 
```

## UnBoxing 
- 기본자료형Value() ; 

```
int i = it.intValue() ; 
```
