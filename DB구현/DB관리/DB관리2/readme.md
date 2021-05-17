## parameter 변경

- SQLPLUS
  - show parameter {파라미터명}
    - show parameter db_block_size : db 생성 시에 설정한 db block size를 조회
    - show parameter control_files : control_files를 조회 
    - show parameter undo : "undo"가 들어간 paramter를 조회, 명칭을 굳이 다 알지 않아도 조회 가능. 
    - show parameter : 모든 파라미터를 조회

  - alter system set {파라미터명} = {변경할 값}
    - 예) alter system set db_cache_size = 512M 
    - [scope = memory | both(default) | spfile ] ; 
    - scope 옵션
      - memory : 현재 DB에만 적용, spfile에는 변경하지 않겠다. DB 재시작시 파일에 있던 원래 값으로 되돌아간다.
      - both : 현재 DB와 spfile 모두에 변경내용을 적용하겠다. 
      - spfile : 
