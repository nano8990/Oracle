SELECT 
    REGIONID,
    PRODUCTGROUP,
    YEARWEEK,
    VOLUME,
    ROUND(VOLUME * 1.1, 0) AS WEIGHTED_VOL
FROM KOPO_PRODUCT_VOLUME
WHERE 1 = 1 
AND DBMS_LOB.SUBSTR(PRODUCTGROUP) = 'ST0001'
AND (DBMS_LOB.SUBSTR(YEARWEEK) >= '201544'
AND DBMS_LOB.SUBSTR(YEARWEEK) <= '201548');

-- NVL(expr1, expr2)
-- expr1의 값이 null이면 expr2를 반환하고, null이 아니면 expr1을 반환하는 함수

-- DECODE(expr, search, result, default)
-- expr과 각 search 값을 비교하여 같으면 result 값을 반환, 다르면 default 값을 반환

SELECT
    REGIONID,
    ITEM,
    TARGETWEEK,
    PLANWEEK,
    MAP_PRICE,
    IR,
    PMAP,
    ROUND(PMAP * 0.9, 0) AS PMAP10,
    ROUND(
        DECODE(NVL(MAP_PRICE, 0), 0, 0, PMAP / MAP_PRICE * 100), 2
    ) AS PERCENT,
    PRODUCT
FROM KOPO_PROMOTION;

SELECT A.*,
    CASE
        WHEN A.MAP_PRICE = 0
            THEN 0
        WHEN A.MAP_PRICE IS NULL
            THEN 0
        ELSE ROUND(A.PMAP / A.MAP_PRICE * 100, 2) END AS PERCENT
FROM KOPO_PROMOTION A;