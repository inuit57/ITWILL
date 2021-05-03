## DB 구조

- 오라클 데이터베이스는 Instance와 Database로 이뤄져있다.
- 일반적으로 이야기하는 DB는 Database를 의미한다. 

- 여러 개의 물리적인 파일이 생성되었을 때 DB가 생성되었다고 말한다.



## Database 물리적 구조

- 필수 요소
    - Data files 
        -  실제 Data 파일들이 저장된 곳
        -  Data Dictionary 가 저장된 곳
        -  분류해서 저장한다. 
        -  Datafile 정보 조회 : v$datafile , v$tempfile 테이블을 조회하기.
            -  select name, bytes from v$datafile ; // 이름, 크기 조회
            -  select name from v$tempfile ; //  v$tempfile : 임시데이터가 저장되는 공간
    - Control file 
        - 
    - Redolog files 
        - 
    <br> // 위의 3개는 필수요소 중에서도 꼭 필요한 것들
    
    - Parameter file
    - Password file

- 옵션 요소
    - Archived log files
    - 이외에도 많지만 이것 정도만 기억하기

## 인스턴스 구조
- SGA 라는 메모리 구조와 여러 개의 background 프로세스로 구성되어있다.
- 모든 작업은 SGA 라는 메모리 구조에서 이뤄진다. (select , insert 등등)

### SGA : 실제 작업공간
- 필수 요소
    - Shared Pool 
    - DB Buffer Cache
    - Redo Log Buffer   
- 옵션 요소 (알고만 있자) 
    - Streams Pool
    - Large Pool
    - Java Pool 
### Background Process
- 필수 요소
   - PMON
   - SMON
   - DBWR(DB writer)
   - LGWR(log writer)
   - CKPT(check point) 
- 옵션 요소
    - ARC (Archive)
    - 이외에도 많다.  
