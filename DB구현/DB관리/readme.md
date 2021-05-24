## 개요 
- DB 설치 및 관리에 대한 전반적인 내용을 다룬다. 

### 참고
- Oracle의 버전 
  - 8i, 10g , 12c 등의 뒤에 붙는 알파벳의 의미 
  - i : internet , g : grid , c : cloud 라는 뜻을 가지고 있다. 
  - 그냥 Oracle에서 당시 상황에 맞춰서 내놓는다는 모양
  - R1 : 베타 버전, R2 : 개선되고 완성된 버전

- Oracle 종료 명령어(sqlplus) : shut immediate 

### 설치 순서 
1) Linux(OS) 설치
2) Oracle Software 설치


### DB의 저장영역 추가하는 방법
1. 새로운 Table Space를 생성 
2. 기존 Table Space에 Datafile을 추가 
3. 기존 Datafile 의 size 늘이기
4. Datafile 의 자동확장 기능 사용 
