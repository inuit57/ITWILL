## 개요
- 위치를 각각의 요소들 간에 관계로 설정하는 방식의 레이아웃. 
- 만약 설정해주지 않을 경우 모든 요소들이 겹쳐져서 보여지게 된다. 
- 상대적인 위치로 설정 가능. 

## 설정방법
```
 android:layout_below = "@id/{id값}"  //아래
 android:layout_toRightOf = "@id/{id값}"  //오른쪽.
 android:layout_alignParentRight="true" // 부모기준으로 오른쪽 끝에 붙이기
 android:layout_toLeftOf="@id/{id값}" // 왼쪽
```
- id값을 설정하고 어떤 id 값 밑에 위치시킬 것인지로 설정하는 식으로 처리. 
