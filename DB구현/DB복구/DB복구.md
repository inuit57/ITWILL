## Controlfile 복구 방법
- Controlfile은 다중화된 Member 하나라도 이상이 있으면 DB 작동이 멈추게 된다. 
- 반드시 DB를 종료한 상태에서 남아있는 Member를 사용해서 복구해야 한다. (백업파일 사용 X) 
- 백업 파일은 Controlfile이 모두 손실된 경우에만 사용한다. 

- 그래서 대부분의 기업은 무조건 Controlfile을 다중화해서 사용한다. 


1) DB 종료
- SQL > shut abort 
2) 손실된 Controlfile을 남아있는 member를 사용해서 복구 (복사해서 생성)
- SQL > ! 
- $] cd /u01/app/oracle/oradata/ORCL/controlfile
- $] cp o1_mf_fwvn95xm.ctl u01/app/oracle/fast_recovery_area/orcl/ORCL/contolfile/o1_mf_fwvn96cd_.ctl 

3) DB 재시작
- SQL > startup => error(mount X) => 1번부터 다시 작업 

4) Open이 잘 된 경우 복구 끝. 
- SQL > select name from v$controlfile ; 
