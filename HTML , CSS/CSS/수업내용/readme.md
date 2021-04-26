수업내용들을 여기에 복사해두기로 한다. 
복습할 때 한 번씩 볼 것.


## css 사용법
- css를 적용할 파일의 head 안에 아래와 같은 link를 넣어주면 된다. 
- 예)
```
<head>
  (...)
  <link href="style.css" rel="stylesheet">
  <link href="text.css" rel="stylesheet">
</head>
```

## 선택자
1) 태그 
- 태그명{ 속성 : 속성값 } 
```
  h2{ color : olive; } 
```
2) id
- #id명 { 속성 : 속성값 } 
```
  #id { color :green; } 
```
3) class
- .class명 {속성 : 속성값} 
```
  .class{ color : red;}
```

### 관계 선택자
1) A > B 
 - 상위요소 A의 바로 한단계 아래의 B를 지정하는 선택자

2) A B 
 - 상위 요소 A 아래에 있는 B를 지정하는 선택자 (바로 한단계 아래가 아니어도 된다.) 
