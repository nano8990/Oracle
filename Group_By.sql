-- GROUP BY
SELECT
    REGIONID,
    PRODUCT,
    ROUND(AVG(QTY),2) AS AVG_QTY,
    SUM(QTY) AS SUM_QTY,
    COUNT(QTY) AS COUNT_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW
GROUP BY REGIONID, PRODUCT
HAVING SUM(QTY) < 100000
ORDER BY REGIONID, PRODUCT;
-- HAVING절은 집계함수의 조건을 확인

-- FROM절 서브쿼리
SELECT A.*
FROM (SELECT *
      FROM KOPO_CHANNEL_SEASONALITY_NEW
      WHERE 1=1
      AND REGIONID = 'A01') A;

-- WHERE절 서브쿼리
SELECT *
FROM KOPO_CHANNEL_SEASONALITY_NEW
WHERE 1=1
AND REGIONID IN (SELECT REGIONID
                 FROM KOPO_PRODUCT_VOLUME);
-- 일반적으로 JOIN으로 풀 수 있지만 AND, OR조건을 잘 활용하면 여러군데에서 포함되는 것들을 선택할 수 있다. 

-- SELECT절 서브쿼리
SELECT A.*,
        (SELECT AVG(QTY)
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        WHERE REGIONID = A.REGIONID
        AND PRODUCT = A.PRODUCT
        GROUP BY A.REGIONID, A.PRODUCT) AS SUM_QTY
FROM KOPO_CHANNEL_SEASONALITY_NEW A;

-- SELECT절 안의 서브쿼리는 단일 행 값을 리턴해야 함
SELECT
    T3.NO,
    T3.NAME,
    (SELECT
        DNAME
    FROM SUBQUERY_B
    WHERE T3.DEPTNO = SUBQUERY_B.DEPTNO)
FROM SUBQUERY_A T3;

-- WITH 서브쿼리
-- MAE -> 각 실제값과 예측값의 절대값 차이의 평균
-- RMSE -> 각 실제값과 예측값의 절대값 차이를 제곱한 후 평균을 산출 -> 이후 SORT
WITH RMSE_CALCULATION AS(
    SELECT
        ITEM,
        YEARWEEK,
        QTY,
        ABS(QTY-PREDICTION) AS DIFF
    FROM RMSE_MAE_EXAMPLE
    )
SELECT
    A.ITEM,
    AVG(A.DIFF) AS MAE,
    AVG(
        POWER(A.DIFF, 2)
    ) AS MSE, 
    ROUND(
        SQRT(
            AVG(
                POWER(A.DIFF, 2)
            )
        ), 2
    ) AS RMSE
FROM RMSE_CALCULATION A
GROUP BY A.ITEM;




SELECT * FROM RMSE_MAE_EXAMPLE;



SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_1WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_2WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_3WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_4WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_5WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_6WEEK;

SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_1WEEK
UNION ALL
SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_2WEEK
UNION ALL
SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_3WEEK
UNION ALL
SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_4WEEK
UNION ALL
SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_5WEEK
UNION ALL
SELECT
    PRD_SEG1, 
    PRD_SEG2, 
    PRD_SEG3, 
    CONCAT(YEAR, WEEK) AS PLANWEEK,
    '201918' AS TARGETWEEK, 
    YEAR, 
    WEEK, 
    QTY, 
    OUTFCST
FROM PRO_FCST_RESULT_6WEEK;