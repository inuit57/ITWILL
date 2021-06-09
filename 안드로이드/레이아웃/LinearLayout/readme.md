# 개요 
- 추가되는 객체들을 차례대로 배치하는 형태의 레이아웃이다.
- 수평으로 배치하는 것이 기본값. ( orientation="horizontal" ) 
##속성
### orientation 
- 수직 또는 수평으로 배치하도록 할 수 있다.
### gravity
- 자식 뷰의 위치에 대한 설정
- center : 수평,수직 기준 중앙에 배치
- fill : 자식뷰가 컨테이너를 가득 채우도록 배치 
  - fill_vertical :수직을 채우도록 배치
  - fill_horizontal : 수평을 채우도록 배치
- 자식뷰의 크기를 변경하지 않는 속성들
  - top : 자식뷰를 컨테이너의 상단에 배치
  - bottom : 하단에 배치
  - left : 좌측에 배치
  - right : 우측에 배치 
  - center_vertical : 수직의 중앙배치 
  - center_horizontal : 수평의 중앙 배치 


## layout_width="match_parent"
- 만약 다른 버튼이 앞에 있는 경우 남는만큼 차지한다.
- 여러 개가 있을 경우 제일 앞에 match_parent로 설정된 것이 다 덮어버린다. 
