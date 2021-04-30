## 개요 
- 자바 Collection 객체 중 하나인 Vector에 대해서 서술한다. 
- List 계열에 속한 객체로, 입력할 때마다 자동으로 크기가 증가한다. 


## 생성하기
```
Vector vec = new Vector() ; 
// 기본 생성자로 생성하게 될 경우 초기 용량은 10 , 
// 데이터가 가득 찬 상태에서 추가로 입력할 경우에 1칸씩 증가되게 된다. 

Vector vec2 = new Vector(20, 3) ; 
// 이렇게 초기 용량과 증가 크기를 지정해서 생성할 수도 있다. 
```


## 내용물 출력하기
```
	System.out.println("출력방식 1 : Enumeration");
	Enumeration e = vec.elements(); 
	while(e.hasMoreElements()) {
		System.out.println(e.nextElement());
	}

	System.out.println("----------------");
	System.out.println("출력방식 2 : Iterator");
	Iterator iter = vec.iterator(); 

	while(iter.hasNext()) {
		System.out.println(iter.next());
	}
	System.out.println("----------------");
	System.out.println("출력방식 3 : Vector");

	for(Object obj : vec) {
		System.out.println(obj);
	}
```		
