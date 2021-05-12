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
        -  다중화 기능을 제공하지 않으니 열심히 백업을 받아놓을 것.
    
    - Control file 
        - DB의 무결성을 유지/관리할 수 있는 모든 동기화 정보가 기록된 곳
          (DB의 논리적/물리적 구조 정보, 마지막 작업 번호 등등 ) 
        - 또 하나의 작은 DB라고 봐도 될 정도로 많은 정보를 가지고 있다.
          (Control file 없이 DB를 운영하는 것은 불가능할 정도)
        - DB당 하나만 존재한다. 
        - 다중화 기능 제공함 (최대 8개 까지 가능, 권장 : 3개) 
            - 다중화가 많으면 안정성은 올라가지만 성능은 떨어지게 된다. 
            - 다중화라는 것은 여러 개의 동일한 자료를 여러 개 만들어 놓는 것. (백업과는 조금 다른 복원용 데이터)
            - 다중화를 하려고 한다면 디스크 공간을 다르게 두어서 저장하는 것이 좋다. 
        - 정보 조회 : v$controlfile 
    - Redolog files 
        - DB에서 발생된 변경작업(DDL,DML,DCL)의 로그 정보(Redo data)가 기록된 곳 
        - 주 목적 : Datafile Recovery(데이터 파일 복구) 
            - 날아간 기간동안 일어난 변경작업 목록을 읽어서 다시 진행하는 것으로 복구를 진행할 수 있다. 
        - 순환형으로 관리되고 다중화 기능을 제공한다. (다중화 갯수에 제한없음)
            - 한 Redo log group에 log가 가득찰 경우, 다른 Redo log group으로 넘어간다. (이를 log switch라고 부른다.) 
            - 만약 모든 Redo log group에 log가 가득찰 경우, 제일 처음 작성한 Redo log group에 덮어쓰면서 작성한다. 
            - 보관 기간을 늘이고 싶다면 Redo log group의 갯수를 늘이거나 크기를 늘이는 수 밖에 없다. (영구보관은 불가능)
        - DB당 최소 2개 이상의 Redo log group이 존재해야 한다.
        - Redo log group에는 최소 1개 이상의 member가 존재해야 한다. 
        - 정보 조회 : v$log , v$logfile
            - select group# , members from v$log ; // 그룹3개, 멤버 각각 2개 : Oracle에서 권장하는 구조
            - select group# , member from v$logfile order by group# ; // 이렇게 조회할 경우 member의 파일 위치를 확인가능하다. 
    - ----
    - Parameter file
        - instance정의 정보가 기록된 곳 ( SGA 할당 정보 등 ) 
        - DB의 여러 설정 정보가 기록된 곳 , 반드시 하나만 존재하는 파일.(위치도 고정)
        - 위치 : $ORACLE_HOME/dbs ( $ORACLE_HOME : Oracle Software가 설치된 물리적인 경로)
            - cd $ORACLE_HOME 해서 이동 가능. 
        - 이름 : spfile{SID}.ora  (ex / spfileorc1.ora ) 
        - 이진파일로 되어있으므로 읽거나 수정하려고 하지 말 것. (자동생성 관리되는 파일) 
    - Password file
        -  DB를 시작/종료할 수 있도록 인증해주는 곳 
        -  Parameter file과 마찬가지로 하나만 존재하는 파일
        -  위치 : $ORACLE_HOME/dbs ( $ORACLE_HOME : Oracle Software가 설치된 물리적인 경로)
        -  이름 : orapw{SID} (ex / orapworc1 ) , 확장자는 따로 없다. 
        

- 옵션 요소
    - Archived log files
        - redolog file 과 관련된 파일 , redolog 파일은 순환형 구조라서 앞 내용이 덮어씌워지면 복구가 불가능한 부분이 발생한다.
        - 이를 log switch라고 부르는데, Archved log file을 운영할 경우, 덮어쓰기 전에 redolog file 내용을 복사해서 만들어놓는다.
        - 이렇게 만들어진 log file들은 삭제하기 전까지 계속 남아있는다. 메모리를 좀더 사용하는 방법이지만 보다 오래된 기록에 대한 복구가 가능하다. 
 
        - 옵션이기에 운영을 해도 되고 안해도 된다. ( 안한다면 redolog file만 사용하겠다.) 
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
