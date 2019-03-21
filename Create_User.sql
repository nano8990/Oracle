

-- 사용자 생성
-- 실행 : ctrl + enter
CREATE USER DJ2019
    IDENTIFIED BY DJ2019;
    
-- 생성한 사용자 정보는
SELECT * FROM DBA_USERS;

-- (사용자 이름만)
SELECT USERNAME
    FROM DBA_USERS;

-- 권한 생성(접속/리소스 및 테이블 생성)
GRANT CONNECT, RESOURCE, DBA TO DJ2019;