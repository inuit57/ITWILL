# 테이블 삭제 
```
drop table 테이블명 ; 
```

일반적으로 삭제된 테이블은 복구 불가능. 
하지만 휴지통에 저장되는 경우, 복구할 수 있다. (오라클 10g 최신 버전에서 지원)

## 휴지통 조회
```
show recyclebin ; 
```

## 테이블 복구 (휴지통에서)
```
flashback table 테이블명 to before drop ; 
// drop 하기 전의 상태로 복구
```
