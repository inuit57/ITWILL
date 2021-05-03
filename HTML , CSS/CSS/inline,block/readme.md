## inline
```
자동으로 줄이 안 바뀌는 (한줄에 나란히 올 수 있는) 태그들을 
inline 요소라고 한다. 
크기가 적용이 되지 않는다.(width , heigh를 줄 수 없다.)
margin도 좌우는 적용이 가능하나, 위아래는 적용이 되지 않는다.
```

## block
```
자동으로 줄이 바뀌는 (한줄에 나란히 올 수 없는) 태그를
block 요소라고 하며 
크기 적용 가능하고 모든 방향의 margin 적용 가능하다.
```

## display:inline, display:block
```
각각 block요소를 inline으로, 그리고 반대로도 적용이 가능하도록 만들어주는 옵션이다.

단, input,label 태그와 같은 오래된 태그는 적용되지 않는다.
```

## display:inline-block
```
2개의 장단점을 합쳐놓은 형태

display 속성이 inline-block으로 지정된 엘리먼트는 기본적으로 inline 엘리먼트처럼 
전후 줄바꿈 없이 한 줄에 다른 엘리먼트들과 나란히 배치됩니다. 
하지만 inline 엘리먼트에서 불가능하던 width와 height 속성 지정 및 
margin과 padding 속성의 상하 간격 지정이 가능해집니다.

```

### 자료참고
[자료1](https://www.daleseo.com/css-display-inline-block/)
