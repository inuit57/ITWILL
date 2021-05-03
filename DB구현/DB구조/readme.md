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
        - DB의 무결성을 유지/관리할 수 있는 모든 동기화 정보가 기록된 곳
          (DB의 논리적/물리적 구조 정보, 마지막 작업 번호 등등 ) 
        - 또 하나의 작은 DB라고 봐도 될 정도로 많은 정보를 가지고 있다.
          (Control file 없이 DB를 운영하는 것은 불가능할 정도)
        - DB당 하나만 존재한다. 
        - 다중화 기능 제공함 (최대 8개 까지 가능, 권장 : 3개) 
            - 다중화가 많으면 안정성은 올라가지만 성능은 떨어지게 된다. 
            - 다중화라는 것이 결국 백업을 몇 개까지 만들어놓을 것인가 라는 것. 
    - Redolog files 
        - ㅇㅇㅇ
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
