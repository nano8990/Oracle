--DB 링크 설정해서 다른 서버의 테이블 가져오기. orcl
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

--tnsnames.ora 파일 정보를 이용하여 link 설정
create database link KOPO_ORACLE_LINK_2
connect to kopo
identified by kopo
Using 'ORCL';

drop database link KOPO_ORACLE_LINK_2;

--연결된 서버로 테이블 조회하는 방법
select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK;

select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK_2;

--테이블복사를 통해 서버의 테이블을 가져올수 있다.
create table KOPO_PRODUCT_VOLUME
as select * from KOPO_PRODUCT_VOLUME@KOPO_ORACLE_LINK;

--복사해온거 조회
select * from KOPO_PRODUCT_VOLUME;

--현업에서 이관 할때는 excel 에다가 위의 create ~ 명령어를 전부 적어놓은 다음에 쭉 실행만 시키면됨
--첨부사진 참고