--DB ��ũ �����ؼ� �ٸ� ������ ���̺� ��������. orcl
create database link KOPO_ORACLE_LINK
connect to kopo
identified by kopo
Using '(
DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.110.111)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
)';

--tnsnames.ora ���� ������ �̿��Ͽ� link ����
create database link KOPO_ORACLE_LINK_2
connect to kopo
identified by kopo
Using 'ORCL';

drop database link KOPO_ORACLE_LINK_2;

--����� ������ ���̺� ��ȸ�ϴ� ���
select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK;

select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK_2;

--���̺��縦 ���� ������ ���̺��� �����ü� �ִ�.
create table KOPO_PRODUCT_VOLUME
as select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK;

--�����ؿ°� ��ȸ
select * from KOPO_PRODUCT_VOLUME;

--�������� �̰� �Ҷ��� excel ���ٰ� ���� create ~ ��ɾ ���� ������� ������ �� ���ุ ��Ű���
--÷�λ��� ����