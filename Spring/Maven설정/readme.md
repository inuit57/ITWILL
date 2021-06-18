# pom.xml 설정
```
 <properties>
		<java-version>1.8</java-version>
		<org.springframework-version>4.3.8.RELEASE</org.springframework-version>
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
```
- 1.8 로 변경
- 4.3.8 로 변경

# dependency 설치
- [maven사이트](https://mvnrepository.com/)에 접속
- 필요한 jar 파일 명을 검색
- maven 탭에 있는 것을 선택 후 pom.xml 에 집어넣기 
- 다운로드가 이뤄진다.

## 넣었는데도 적용이 안되는 경우
- 파일을 웹에서 받아오다가 중간에 깨진 경우 
### update project 해보기 
- 프로젝트 우클릭 -> Maven -> update project
- 이렇게 하면 해결될 수도 있다. 

### 파일을 날리고 다시 받기 
- C드라이브>사용자>사용자명>.m2>repository 
- 문제있는 것에 해당되는 폴더를 날리고 다시 받기. 
(잘 모르겠다 싶으면 다 지워버리고 싹 다 다시 받기)
- sts 를 종료하고 shift delete로 날리기 
