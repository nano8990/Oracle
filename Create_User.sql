

-- ����� ����
-- ���� : ctrl + enter
CREATE USER DJ2019
    IDENTIFIED BY DJ2019;
    
-- ������ ����� ������
SELECT * FROM DBA_USERS;

-- (����� �̸���)
SELECT USERNAME
    FROM DBA_USERS;

-- ���� ����(����/���ҽ� �� ���̺� ����)
GRANT CONNECT, RESOURCE, DBA TO DJ2019;