# 칸마다 색깔 다르게 넣기
```
#tab05 tr:nth-of-type(2n){
	background-color: #ccc;
}
```
- nth-of-type() 사용
- 인자로는 숫자(n번쨰) 또는 수식 사용 가능(예 / 2n )

## 영역 밖 글자 처리
```
#tab06 tr:nth-of-type(4) td{
	/* 영역 밖 글자 처리 */
	white-space: nowrap ; /* 공백처리 */
	over-flow : hidden ; /* 숨김 */
	text-overflow:ellipsis; /* 말 줄임표(...) 표시 */
}
```
