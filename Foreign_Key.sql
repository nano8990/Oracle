-- 참조 무결성

-- EVENTID를 참조하는 테이블 생성
CREATE TABLE KOPO_EVENT_INFO_FOREIGN(
    EVENTID VARCHAR2(20 BYTE),
    EVENTPERIOD VARCHAR2(20 BYTE),
    PROMOTION_RATIO NUMBER,
    CONSTRAINT PK_KOPO_EVENT_INFO_FOREIGN PRIMARY KEY (EVENTID)
    );

CREATE TABLE KOPO_PRODUCT_VOLUME_FOREIGN(
    REGIONID VARCHAR2(20 BYTE),
    PRODUCTGROUP VARCHAR2(20 BYTE),
    YEARWEEK VARCHAR2 (8 BYTE),
    VOLUME NUMBER NOT NULL,
    EVENTID VARCHAR2 (20 BYTE),
    CONSTRAINT PK_KOPO_PRODUCT_VOLUME_FOREIGN PRIMARY KEY (REGIONID, PRODUCTGROUP, YEARWEEK),
    CONSTRAINT FK_KOPO_PRODUCT_VOLUME_FOREIGN FOREIGN KEY (EVENTID) REFERENCES KOPO_EVENT_INFO_FOREIGN (EVENTID)
    );

-- 데이터 삽입 : 부모테이블에 EVENTID가 없는데 추가하려하면 에러
INSERT INTO
    KOPO_PRODUCT_VOLUME_FOREIGN
    (REGIONID, PRODUCTGROUP, YEARWEEK, VOLUME, EVENTID) -- 컬럼명을 직접 써서 넣을 수도 있음(순서 상관없음)
    VALUES ('A01','ST0002','201505',50,'EVENT00001');

INSERT INTO KOPO_EVENT_INFO_FOREIGN
VALUES ('EVENT00001','201501',100);

-- 데이터 조회
SELECT * FROM KOPO_PRODUCT_VOLUME_FOREIGN;

SELECT * FROM KOPO_EVENT_INFO_FOREIGN;

-- 데이터 수정 : 자식테이블에서 참조하고 있는 EVENTID는 수정이 불가능, 다른 정보는 가능
UPDATE KOPO_EVENT_INFO_FOREIGN SET EVENTPERIOD = '10' WHERE EVENTID = 'EVENT00001';

UPDATE KOPO_EVENT_INFO_FOREIGN SET EVENTID = 'EVENT00002' WHERE EVENTID = 'EVENT00001';

-- 데이터 삭제 : 자식테이블에서 EVENTID를 참조하고 있는데 삭제하려고 하면 에러
DELETE FROM KOPO_EVENT_INFO_FOREIGN
WHERE EVENTID = 'EVENT00001';
-- RESTRICT : ERROR MESSAGE를 띄우는 게 DEFAULT
-- 테이블을 만들 때 맨 마지막에 붙여주면 됨
-- ON DELETE CASCADE : 참조하고 있는 자식테이블도 삭제
-- ON DELETE SET NULL : 참조하고 있는 자식테이블의 EVENTID를 NULL값으로 설정

ALTER TABLE KOPO_PRODUCT_VOLUME_FOREIGN
DROP CONSTRAINT FK_KOPO_PRODUCT_VOLUME_FOREIGN;

ALTER TABLE KOPO_PRODUCT_VOLUME_FOREIGN
ADD CONSTRAINT FK_KOPO_PRODUCT_VOLUME_FOREIGN
    FOREIGN KEY (EVENTID)
    REFERENCES KOPO_EVENT_INFO_FOREIGN (EVENTID);
    -- ON DELETE CASCADE;
    -- ON DELETE SET NULL;

-- 테이블 삭제 : 기본키에 다른 테이블이 참조하고 있을 경우 오류
DROP TABLE KOPO_EVENT_INFO_FOREIGN;


-- 부모테이블을 먼저 넣고 자식테이블을 넣으면 이론적으로 문제가 발생하지 않음