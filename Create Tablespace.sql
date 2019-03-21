-- 테이블스페이스 생성
CREATE TABLESPACE TS_DJ2019  -- DJ_ts라는 테이블스페이스명을 생성
    DATAFILE 'E:\ORACLE\DATA\TS_DJ2019.dbf' SIZE 1024M  -- 이 경로에 1GB크기로 .dbf파일로 생성
    AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED  -- 용량이 다 차면 자동으로 100MB 증가, 최대한도 무한
    SEGMENT SPACE MANAGEMENT AUTO;  -- 공간은 자동으로 관리
    
-- 임시 테이블스페이스 생성(SEGMENT 공간관리는 필요없음)
CREATE temporary tablespace TS_DJ2019TP
    TEMPFILE 'E:\ORACLE\DATA\TS_DJ2019TP.dbf'
    SIZE 1024M 
    AUTOEXTEND ON NEXT 100M
    MAXSIZE UNLIMITED;

-- 사용자에게 원래 SYSTEM / TEMP로 설정되어 있는 작업공간을 내가 만든 것들로 할당하자
ALTER USER DJ2019  -- 사용자명
    IDENTIFIED BY DJ2019  -- 비밀번호(바꿀거면 쓰고 안바꿀거면 없어도 됨)
    DEFAULT TABLESPACE TS_DJ2019  -- 기본 테이블스페이스
    TEMPORARY TABLESPACE TS_DJ2019TP;  -- 임시 테이블스페이스
    
-- 사용자 정보 조회
SELECT * FROM DBA_USERS; -- 잘 만들어졌는지 확인해보자