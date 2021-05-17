# 개요
- DB가 시작될 때 어떤 순서로 진행되는지에 대해서 서술한다. 


## &lt; Shutdown > 
- DB가 꺼져있는 상태 

## &lt; Nomount > 
- Instance가 시작된 단계
- DB 생성
- Controlfile 재생성

## &lt; Mount > 
- Controlfile이 정상적으로 읽혀진 단계
- Datafile, Redologfile 위치 및 이름 변경
- 전체 DB 복구
- DB 모드(Archive log mode) 변경

## &lt; Open > 
- DB가 정상적으로 켜진 단계
- 일반 DB User 접속 가능 
