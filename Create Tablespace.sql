-- ���̺����̽� ����
CREATE TABLESPACE TS_DJ2019  -- DJ_ts��� ���̺����̽����� ����
    DATAFILE 'E:\ORACLE\DATA\TS_DJ2019.dbf' SIZE 1024M  -- �� ��ο� 1GBũ��� .dbf���Ϸ� ����
    AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED  -- �뷮�� �� ���� �ڵ����� 100MB ����, �ִ��ѵ� ����
    SEGMENT SPACE MANAGEMENT AUTO;  -- ������ �ڵ����� ����
    
-- �ӽ� ���̺����̽� ����(SEGMENT ���������� �ʿ����)
CREATE temporary tablespace TS_DJ2019TP
    TEMPFILE 'E:\ORACLE\DATA\TS_DJ2019TP.dbf'
    SIZE 1024M 
    AUTOEXTEND ON NEXT 100M
    MAXSIZE UNLIMITED;

-- ����ڿ��� ���� SYSTEM / TEMP�� �����Ǿ� �ִ� �۾������� ���� ���� �͵�� �Ҵ�����
ALTER USER DJ2019  -- ����ڸ�
    IDENTIFIED BY DJ2019  -- ��й�ȣ(�ٲܰŸ� ���� �ȹٲܰŸ� ��� ��)
    DEFAULT TABLESPACE TS_DJ2019  -- �⺻ ���̺����̽�
    TEMPORARY TABLESPACE TS_DJ2019TP;  -- �ӽ� ���̺����̽�
    
-- ����� ���� ��ȸ
SELECT * FROM DBA_USERS; -- �� ����������� Ȯ���غ���