### DB 구조

- 오라클 데이터베이스는 Instance와 Database로 이뤄져있다.
- 일반적으로 이야기하는 DB는 Database를 의미한다. 

- 여러 개의 물리적인 파일이 생성되었을 때 DB가 생성되었다고 말한다.



### Database 물리적 구조

- 필수 요소
    - Data files : 실제 데이터 파일들이 저장된 공간
    - Control file
    - Redolog files

    - Parameter file
    - Password file

- 옵션 요소
    - Archived log files
    - 이외에도 많지만 이것 정도만 기억하기

### 인스턴스 구조
- SGA 라는 메모리 구조와 여러 개의 background 프로세스로 구성되어있다.
- 모든 작업은 SGA 라는 메모리 구조에서 이뤄진다. (select , insert 등등)

#### SGA : 실제 작업공간
- 필수 요소
    - Shared Pool 
    - DB Buffer Cache
    - Redo Log Buffer   
- 옵션 요소 (알고만 있자) 
    - Streams Pool
    - Large Pool
    - Java Pool 
#### Background Process
- 
