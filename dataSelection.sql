--���ǿ� �´� �� ��ȸ
select * from kopo_product_volume
    where 1=1 --���� ������ copy , paste �Ҷ� ���ϰ� �ٷ� ���̱� ���� ���� Ű����. �ǹ̴� ������ true   
    and productgroup = 'ST0001'
    and yearweek > 201601;
    
--�÷� ��ȸ
select * from kopo_product_volume;


--table ����
create table 
    kopo_product_volume_A02 as
select * from kopo_product_volume;

drop table kopo_product_volume_A02;



select * from kopo_product_volume_A02;


--������(union)
select * from kopo_product_volume
union all
select * from kopo_product_volume_A02;

--union�� �ߺ����� + ����. ���� �ߺ��� �����ϰ������ union all ���Ŀ� �ߺ����Ÿ��� ���� ���ִ� ���� �ð��� ������.
select * from kopo_product_volume_A02
union
select * from kopo_product_volume;


--������ �÷��� ��ȸ�Ҷ��� ���η� �鿩���� �����ؼ� �ڵ带 �ۼ��Ѵ�.
select REGIONID
    ,   PRODUCTGROUP
    ,   YEARWEEK
    ,   VOLUME
from kopo_product_volume;


--���̺� ��Ī �ֱ�. �������� ���̺��� ������ �۾��� �Ҷ� ����
select A.REGIONID FROM KOPO_PRODUCT_VOLUME A;

--�÷���ȸ�� �� ���ϰ� �ϳ��� �÷����� �����ؼ� �����͸� ���� ��������
select A.*
    ,    '2019_��ġ���α׷�' as PLANID
FROM 
KOPO_PRODUCT_VOLUME A;

--������ ��� �����ȴ�.
select * from kopo_product_volume; 

select A.*
    ,    'LED_TV' || '_' || A.PRODUCTGROUP as PLANID
FROM 
KOPO_PRODUCT_VOLUME A;

--�ߺ����� : �Ϲ������� �ߺ��� ������� �ʴ� �⺻Ű(������� �⺻Ű�� ���� ������ 150)�� ������ 
--�˰��ִ»��¿��� �����Ͱ� ����� �������ִ��� Ȯ���ϱ����� destinct(������� ���� ������ 70��)
--���. �� ��� �⺻Ű ������ ������ �ִ� ���̰ų�, ��·�� �����Ϳ� ������ �ִٶ�� �Ǵ��� �����ϴ�.
--��, �⺻Ű ���� 
select 
    distinct PRODUCTGROUP
from KOPO_PRODUCT_VOLUME;

