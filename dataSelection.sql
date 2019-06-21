--조건에 맞는 행 조회
select * from kopo_product_volume
    where 1=1 --많은 조건을 copy , paste 할때 편하게 바로 붙이기 위해 쓰는 키워드. 의미는 언제나 true   
    and productgroup = 'ST0001'
    and yearweek > 201601;
    
--컬럼 조회
select * from kopo_product_volume;


--table 복사
create table 
    kopo_product_volume_A02 as
select * from kopo_product_volume;

drop table kopo_product_volume_A02;



select * from kopo_product_volume_A02;


--합집합(union)
select * from kopo_product_volume
union all
select * from kopo_product_volume_A02;

--union은 중복제거 + 정렬. 따라서 중복만 제거하고싶으면 union all 한후에 중복제거만을 따로 해주는 것이 시간상 빠르다.
select * from kopo_product_volume_A02
union
select * from kopo_product_volume;


--복수의 컬럼을 조회할때는 세로로 들여쓰기 정렬해서 코드를 작성한다.
select REGIONID
    ,   PRODUCTGROUP
    ,   YEARWEEK
    ,   VOLUME
from kopo_product_volume;


--테이블 별칭 주기. 여러개의 테이블을 가지고 작업을 할때 유용
select A.REGIONID FROM KOPO_PRODUCT_VOLUME A;

--컬럼조회할 때 편하게 하나의 컬럼으로 추출해서 데이터를 쉽게 보기위함
select A.*
    ,    '2019_배치프로그램' as PLANID
FROM 
KOPO_PRODUCT_VOLUME A;

--원본은 계속 유지된다.
select * from kopo_product_volume; 

select A.*
    ,    'LED_TV' || '_' || A.PRODUCTGROUP as PLANID
FROM 
KOPO_PRODUCT_VOLUME A;

--중복제거 : 일반적으로 중복을 허용하지 않는 기본키(예를들면 기본키의 행의 개수가 150)의 정보를 
--알고있는상태에서 데이터가 제대로 들어오고있는지 확인하기위해 destinct(예를들면 행의 개수가 70개)
--사용. 이 경우 기본키 설정에 문제가 있는 것이거나, 어쨌든 데이터에 문제가 있다라는 판단이 가능하다.
--즉, 기본키 검증 
select 
    distinct PRODUCTGROUP
from KOPO_PRODUCT_VOLUME;

