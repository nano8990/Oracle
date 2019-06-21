SELECT * FROM CASE_ORDER ORDER BY
(
    CASE PRODUCTGROUP
    WHEN 'REF' THEN 1
    WHEN 'OVEN' THEN 2
    WHEN 'WM' THEN 3
    ELSE 4
    END
), YEAR DESC;

SELECT TO_NUMBER(WEEK) AS RE_WEEK, QTY FROM SORT_EXAMPLE ORDER BY RE_WEEK DESC;

SELECT
    LPAD(
        REPLACE(
            CUSTOMERCODE,
            SUBSTR(CUSTOMERCODE, -4), 
            '****'
        ),
        10,
        '0'
    ) AS CUSTOMER_PASSWORD
FROM KOPO_CUSTOMERDATA;

SELECT
-- 반올림
ROUND(12.345),
-- 내림
FLOOR(12.345),
-- 올림
CEIL(12.345),
-- 나머지
MOD(4, 3),
-- 숫자1의 숫자2제곱
POWER(3, 3)
FROM DUAL;

SELECT
    FIRST_NUMBER,
    SECOND_NUMBER,
    FIRST_NUMBER / SECOND_NUMBER AS AVG,
    ROUND(FIRST_NUMBER / SECOND_NUMBER) AS ROUND_EX,
    CEIL(FIRST_NUMBER / SECOND_NUMBER) AS CEIL_EX,
    MOD(FIRST_NUMBER, SECOND_NUMBER) AS MOD_EX,
    POWER(FIRST_NUMBER, SECOND_NUMBER) AS POW_EX
FROM NUMBER_EXAMPLE;

SELECT
    A.YEARWEEK,
    A.ACTUAL,
    A.FCST,
    CASE
        WHEN A.FCST = 0
            THEN 0
        WHEN A.FCST IS NULL
            THEN 0
        WHEN A.FCST < (ACTUAL / 2)
            THEN 0
        ELSE
            ROUND(
                (1 - ABS(FCST - ACTUAL) / FCST) * 100, 2
                )
        END AS ACCURACY
FROM RMSE_MAE_EXAMPLE2 A
WHERE FCST <> 0
ORDER BY YEARWEEK;

-- 날짜 함수
SELECT
    SYSDATE,
    NEXT_DAY(SYSDATE, 2) AS NEXT_DAY,
    LAST_DAY(SYSDATE) AS LAST_DAY
FROM DUAL;

-- 날짜 계산(연산은 일 단위)
SELECT TO_CHAR(SYSDATE-7, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYWW') FROM DUAL;

SELECT TO_CHAR(SYSDATE-30, 'YYYYMMDD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL;

SELECT TO_CHAR(SYSDATE-1, 'YYYYMMDD') FROM DUAL;

-- 형변환
SELECT * FROM
SORT_EXAMPLE
ORDER BY TO_NUMBER(WEEK) DESC;

-- CASE WHEN
SELECT 
    YEARWEEK,
    CASE
        WHEN QTY < 1000
            THEN 1000
        WHEN QTY > 1000 AND QTY < 10000
            THEN 10000
        ELSE 30000
    END AS NEW_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW;

-- DECODE
SELECT A.*,
    DECODE(
        A.GENDER, 'Male', 1, 'Female', 2, 0
    ) AS SORT_ORDER
FROM KOPO_CUSTOMERDATA A
ORDER BY SORT_ORDER;