

-- ��� ���̺� Ȯ��
SELECT * FROM TABS;

-- ���̺� ���� �� �⺻Ű ����
CREATE TABLE KOPO_PRODUCT_VOLUME_�赿��
(
    REGIONID VARCHAR(20 BYTE),
    PRODUCTGROUP VARCHAR(20 BYTE),
    YEARWEEK VARCHAR(6 BYTE),
    VOLUME NUMBER NOT NULL,
    CONSTRAINTS PK_KOPO_PRODUCT_VOLUME_�赿�� PRIMARY KEY(REGIONID,PRODUCTGROUP,YEARWEEK)
);

-- ���̺� ��ȸ
SELECT * FROM KOPO_PRODUCT_VOLUME_�赿��;

-- ���̺��� ���� ���� : ���̺�� ����Ŭ�� �� F4�� ������ ��
DESC KOPO_PRODUCT_VOLUME_�赿��;

-- ���̺� ����
DROP TABLE KOPO_PRODUCT_VOLUME_�赿��;

-- ������ �ֱ�1 : �� �÷��� �Ӽ��� ��߳� �����͸� ������ ������ ������ ���� ���ǿ� ����
INSERT INTO KOPO_PRODUCT_VOLUME_�赿��
VALUES('REGIONID', 'PRODUCTGROUP', '201702', 2); -- VOLUME(NUMBER)�� ���ڸ� �־ ����

-- ������ �ֱ�2 : �⺻ Ű�� ������ �÷��� �ߺ��� �����͸� ������ ��ü ���Ἲ ���� ���ǿ� ����
INSERT INTO KOPO_PRODUCT_VOLUME_�赿��
VALUES('REGIONID', 'PRODUCTGROUP', '201702', 1);

INSERT INTO KOPO_PRODUCT_VOLUME_�赿��
VALUES('REGIONID', 'PRODUCTGROU', '201702', 2); -- �⺻ Ű�� ������ �͵��� �ߺ��� �����̹Ƿ� ����

-- ���� NUMBER �Ӽ��� NOT NULL�� �����ؼ� VOLUME�� NULL���� �������� ����