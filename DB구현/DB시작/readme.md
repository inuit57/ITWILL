# 개요
- DB가 시작될 때 어떤 순서로 진행되는지에 대해서 서술한다. 


## &lt; Shutdown > 
- DB가 꺼져있는 상태 
  - 다음 단계로 안 넘어간다면 Parameter file 점검
### 상태변경 
- startup {단계명} : 원하는 단계로 변경가능. 단계명을 적지 않을 경우 open으로 변경

## &lt; Nomount > 
- Instance가 시작된 단계
- DB 생성
- Controlfile 재생성
  - 다음 단계로 안 넘어간다면 Control file 점검
  
### 상태변경
- startup nomount (Shutdown에서 nomount상태로 변경)
- alter database mount (nomount에서 mount로)

## &lt; Mount > 
- Controlfile이 정상적으로 읽혀진 단계
- Datafile, Redologfile 위치 및 이름 변경
- 전체 DB 복구
- DB 모드(Archive log mode) 변경
  - 다음단계로 안 넘어간다면 아래의 파일을 점검
    - Data file
    - Redo log file
### 상태변경
- startup mount (Shotdown에서 mount상태로 변경)
- alter database open (mount에서 open으로)

## &lt; Open > 
- DB가 정상적으로 켜진 단계
- 일반 DB User 접속 가능 
- startup (shutdown 상태에서 open상태로 변경)
