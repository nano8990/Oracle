-- 데이터 조회
SELECT * FROM KOPO_PRODUCT_VOLUME_DJ2;

SELECT * FROM REGION_MASTER_DJ2;

-- 테이블 생성
CREATE TABLE KOPO_PRODUCT_VOLUME_DJ2(
    REGIONID VARCHAR2(20),
    PRODUCTGROUP VARCHAR2(20),
    YEARWEEK VARCHAR2(20),
    QTY NUMBER
    );

-- 데이터 삽입
INSERT INTO KOPO_PRODUCT_VOLUME_DJ2
    VALUES('A02', 'ST0001', '201701', 20);


-- 테이블 구조 변경 : 기본키 삽입(하지만 무결성에 어긋나는 데이터가 있으면 오류가 남)
ALTER TABLE KOPO_PRODUCT_VOLUME_DJ2
    ADD CONSTRAINTS KOPO_PRODUCT_VOLUME_DJ2_PK
    PRIMARY KEY (REGIONID, PRODUCTGROUP, YEARWEEK);

-- 테이블 비우기 : 데이터 삭제
TRUNCATE TABLE KOPO_PRODUCT_VOLUME_DJ2;


-- 테이블 생성
CREATE TABLE REGION_MASTER_DJ2(
    REGIONID VARCHAR2(100),
    REGIONNAME VARCHAR2(100)
    );
    
-- 데이터 삽입
INSERT INTO REGION_MASTER_DJ2
    VALUES('A02', '한국');

-- 자바와 바로 연동하기 위해서는
-- COMMIT이라는 명령어를 사용하던가 Commit 아이콘을 클릭하여야 한다 /
-- 혹은 View - Toad Options의 Oracle - Transaction - Commit after every statement 체크
COMMIT;
    
-- 데이터 편집(가급적 지양)
EDIT REGION_MASTER_DJ2;