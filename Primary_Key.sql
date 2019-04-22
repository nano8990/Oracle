-- ������ ��ȸ
SELECT * FROM KOPO_PRODUCT_VOLUME_DJ2;

SELECT * FROM REGION_MASTER_DJ2;

-- ���̺� ����
CREATE TABLE KOPO_PRODUCT_VOLUME_DJ2(
    REGIONID VARCHAR2(20),
    PRODUCTGROUP VARCHAR2(20),
    YEARWEEK VARCHAR2(20),
    QTY NUMBER
    );

-- ������ ����
INSERT INTO KOPO_PRODUCT_VOLUME_DJ2
    VALUES('A02', 'ST0001', '201701', 20);


-- ���̺� ���� ���� : �⺻Ű ����(������ ���Ἲ�� ��߳��� �����Ͱ� ������ ������ ��)
ALTER TABLE KOPO_PRODUCT_VOLUME_DJ2
    ADD CONSTRAINTS KOPO_PRODUCT_VOLUME_DJ2_PK
    PRIMARY KEY (REGIONID, PRODUCTGROUP, YEARWEEK);

-- ���̺� ���� : ������ ����
TRUNCATE TABLE KOPO_PRODUCT_VOLUME_DJ2;


-- ���̺� ����
CREATE TABLE REGION_MASTER_DJ2(
    REGIONID VARCHAR2(100),
    REGIONNAME VARCHAR2(100)
    );
    
-- ������ ����
INSERT INTO REGION_MASTER_DJ2
    VALUES('A02', '�ѱ�');

-- �ڹٿ� �ٷ� �����ϱ� ���ؼ���
-- COMMIT�̶�� ��ɾ ����ϴ��� Commit �������� Ŭ���Ͽ��� �Ѵ� /
-- Ȥ�� View - Toad Options�� Oracle - Transaction - Commit after every statement üũ
COMMIT;
    
-- ������ ����(������ ����)
EDIT REGION_MASTER_DJ2;