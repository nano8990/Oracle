-- STEP1-1: UNION DATA
-- DROP TABLE PRO_FCST_STEP1_UNION_DJ;

-- CREATE TABLE PRO_FCST_STEP1_UNION_DJ AS
SELECT * FROM
(
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201918' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_1WEEK
    WHERE YEAR || WEEK = '201918'
    UNION ALL
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201917' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_2WEEK
    WHERE YEAR || WEEK = '201918'
    UNION ALL
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201916' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_3WEEK
    WHERE YEAR || WEEK = '201918'
    UNION ALL
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201915' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_4WEEK
    WHERE YEAR || WEEK = '201918'
    UNION ALL
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201914' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_5WEEK
    WHERE YEAR || WEEK = '201918'
    UNION ALL
    SELECT
        PRD_SEG1,
        PRD_SEG2,
        PRD_SEG3,
        YEAR || WEEK AS TARGETWEEK,
        '201913' AS PLANWEEK,
        QTY,
        OUTFCST
    FROM PRO_FCST_RESULT_6WEEK
    WHERE YEAR || WEEK = '201918'
)
ORDER BY
    PRD_SEG1 ASC,
    PRD_SEG2 ASC,
    PRD_SEG3 ASC,
    PLANWEEK DESC;

SELECT * FROM PRO_FCST_STEP1_UNION_DJ;

--------------------------------------------------------------------------------
-- STEP2: PIVOT DATA
-- DROP TABLE PRO_FCST_STEP2_PIVOT_DJ;

-- CREATE TABLE PRO_FCST_STEP2_PIVOT_DJ AS
SELECT * FROM (
    SELECT
        PRD_SEG1 AS SEG1,
        PRD_SEG2 AS SEG2,
        LPAD(PRD_SEG3, 5, '1') AS SEG3,
        TARGETWEEK,
        PLANWEEK,
        SUBSTR(TARGETWEEK, 1, 4) AS YEAR,
        SUBSTR(TARGETWEEK, -2) AS WEEK,
        QTY AS ACTUAL,
        OUTFCST
    FROM PRO_FCST_STEP1_UNION_DJ
)
PIVOT(
    SUM(OUTFCST)
    FOR PLANWEEK IN
    (
        '201913' AS FCST_W6,
        '201914' AS FCST_W5,
        '201915' AS FCST_W4,
        '201916' AS FCST_W3,
        '201917' AS FCST_W2,
        '201918' AS FCST_W1
    )
)
ORDER BY SEG1, SEG2, SEG3;

SELECT * FROM PRO_FCST_STEP2_PIVOT_DJ;

--------------------------------------------------------------------------------
-- STEP1-2: JOIN DATA
-- DROP TABLE PRO_FCST_STEP1_JOIN_DJ;

-- CREATE TABLE PRO_FCST_STEP1_JOIN_DJ AS
SELECT * FROM
(
    SELECT
        T1.PRD_SEG1 AS SEG1,
        T1.PRD_SEG2 AS SEG2,
        LPAD(T1.PRD_SEG3, 5, '1') AS SEG3,
        T1.YEAR || T1.WEEK AS TARGETWEEK,
        T1.YEAR AS YEAR,
        T1.WEEK AS WEEK,
        T1.QTY AS ACTUAL,
        T6.OUTFCST AS FCST_W6,
        T5.OUTFCST AS FCST_W5,
        T4.OUTFCST AS FCST_W4,
        T3.OUTFCST AS FCST_W3,
        T2.OUTFCST AS FCST_W2,
        T1.OUTFCST AS FCST_W1
    FROM PRO_FCST_RESULT_1WEEK T1
    FULL OUTER JOIN PRO_FCST_RESULT_2WEEK T2
        ON T1.PRD_SEG1 = T2.PRD_SEG1
        AND T1.PRD_SEG2 = T2.PRD_SEG2
        AND T1.PRD_SEG3 = T2.PRD_SEG3
        AND T1.YEAR = T2.YEAR
        AND T1.WEEK = T2.WEEK
        AND T1.QTY = T2.QTY
    FULL OUTER JOIN PRO_FCST_RESULT_3WEEK T3
        ON T1.PRD_SEG1 = T3.PRD_SEG1
        AND T1.PRD_SEG2 = T3.PRD_SEG2
        AND T1.PRD_SEG3 = T3.PRD_SEG3
        AND T1.YEAR = T3.YEAR
        AND T1.WEEK = T3.WEEK
        AND T1.QTY = T3.QTY
    FULL OUTER JOIN PRO_FCST_RESULT_4WEEK T4
        ON T1.PRD_SEG1 = T4.PRD_SEG1
        AND T1.PRD_SEG2 = T4.PRD_SEG2
        AND T1.PRD_SEG3 = T4.PRD_SEG3
        AND T1.YEAR = T4.YEAR
        AND T1.WEEK = T4.WEEK
        AND T1.QTY = T4.QTY
    FULL OUTER JOIN PRO_FCST_RESULT_5WEEK T5
        ON T1.PRD_SEG1 = T5.PRD_SEG1
        AND T1.PRD_SEG2 = T5.PRD_SEG2
        AND T1.PRD_SEG3 = T5.PRD_SEG3
        AND T1.YEAR = T5.YEAR
        AND T1.WEEK = T5.WEEK
        AND T1.QTY = T5.QTY
    FULL OUTER JOIN PRO_FCST_RESULT_6WEEK T6
        ON T1.PRD_SEG1 = T6.PRD_SEG1
        AND T1.PRD_SEG2 = T6.PRD_SEG2
        AND T1.PRD_SEG3 = T6.PRD_SEG3
        AND T1.YEAR = T6.YEAR
        AND T1.WEEK = T6.WEEK
        AND T1.QTY = T6.QTY
    WHERE T1.YEAR || T1.WEEK = '201918'
)
ORDER BY SEG1, SEG2, SEG3;

SELECT * FROM PRO_FCST_STEP1_JOIN_DJ;

--------------------------------------------------------------------------------
-- STEP3: CALCULATION AND SAVE SECOND SHEET
-- DROP TABLE PRO_FCST_RESULT1_DJ;

-- CREATE TABLE PRO_FCST_RESULT1_DJ AS
SELECT
    D.*,
    (
        NVL(D.FCST_W6, 0) +
        NVL(D.FCST_W5, 0) +
        NVL(D.FCST_W4, 0) +
        NVL(D.FCST_W3, 0) +
        NVL(D.FCST_W2, 0) +
        NVL(D.FCST_W1, 0)
    ) / (
        NVL2(FCST_W6, 1, 0) +
        NVL2(FCST_W5, 1, 0) +
        NVL2(FCST_W4, 1, 0) +
        NVL2(FCST_W3, 1, 0) +
        NVL2(FCST_W2, 1, 0) +
        NVL2(FCST_W1, 1, 0)
    ) AS FCST_AVG,
    (
        NVL(D.FA_W6, 0) +
        NVL(D.FA_W5, 0) +
        NVL(D.FA_W4, 0) +
        NVL(D.FA_W3, 0) +
        NVL(D.FA_W2, 0) +
        NVL(D.FA_W1, 0)
    ) / (
        NVL2(FA_W6, 1, 0) +
        NVL2(FA_W5, 1, 0) +
        NVL2(FA_W4, 1, 0) +
        NVL2(FA_W3, 1, 0) +
        NVL2(FA_W2, 1, 0) +
        NVL2(FA_W1, 1, 0)
    ) AS ACC_AVG
FROM(
    SELECT
        C.*,
        NVL(FCST_W6 * ACC_W6, 0) AS FA_W6,
        NVL(FCST_W5 * ACC_W5, 0) AS FA_W5,
        NVL(FCST_W4 * ACC_W4, 0) AS FA_W4,
        NVL(FCST_W3 * ACC_W3, 0) AS FA_W3,
        NVL(FCST_W2 * ACC_W2, 0) AS FA_W2,
        NVL(FCST_W1 * ACC_W1, 0) AS FA_W1
    FROM(
        SELECT
            B.*,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W6 = 0 OR B.FCST_W6 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W6 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W6 / B.FCST_W6)
            END AS ACC_W6,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W5 = 0 OR B.FCST_W5 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W5 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W5 / B.FCST_W5)
            END AS ACC_W5,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W4 = 0 OR B.FCST_W4 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W4 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W4 / B.FCST_W4)
            END AS ACC_W4,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W3 = 0 OR B.FCST_W3 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W3 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W3 / B.FCST_W3)
            END AS ACC_W3,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W2 = 0 OR B.FCST_W2 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W2 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W2 / B.FCST_W2)
            END AS ACC_W2,
            CASE
                WHEN B.ACTUAL = 0 OR B.FCST_W1 = 0 OR B.FCST_W1 IS NULL
                    THEN 0
                WHEN B.ACTUAL / B.FCST_W1 > 2
                    THEN 0
                ELSE 1 - (B.ABS_W1 / B.FCST_W1)
            END AS ACC_W1
        FROM (
            SELECT
                A.*,
                ABS(A.ACTUAL - A.FCST_W6) AS ABS_W6,
                ABS(A.ACTUAL - A.FCST_W5) AS ABS_W5,
                ABS(A.ACTUAL - A.FCST_W4) AS ABS_W4,
                ABS(A.ACTUAL - A.FCST_W3) AS ABS_W3,
                ABS(A.ACTUAL - A.FCST_W2) AS ABS_W2,
                ABS(A.ACTUAL - A.FCST_W1) AS ABS_W1
            FROM PRO_FCST_STEP1_JOIN_DJ A
        ) B
    ) C
) D;

-- PRO_FCST_STEP1_JOIN_DJ
-- PRO_FCST_STEP2_PIVOT_DJ

SELECT * FROM PRO_FCST_RESULT1_DJ;

--------------------------------------------------------------------------------
-- STEP4: ACCURACY CALCULATION
-- DROP TABLE PRO_FCST_RESULT2_DJ;

-- CREATE TABLE PRO_FCST_RESULT2_DJ AS
SELECT
    SEG1 AS ROW_LABEL,
    SUM(FCST_AVG) AS SUM_FCST_AVG,
    SUM(ACC_AVG) AS SUM_ACC_AVG,
    SUM(ACC_AVG) / SUM(FCST_AVG) AS ACCURACY
FROM PRO_FCST_RESULT1_DJ
GROUP BY SEG1
ORDER BY SEG1;

-- INSERT INTO PRO_FCST_RESULT2_DJ
SELECT
    'TOTAL_SUM' AS ROW_LABEL,
    SUM(SUM_FCST_AVG) AS SUM_FCST_AVG,
    SUM(SUM_ACC_AVG) AS SUM_ACC_AVG,
    SUM(SUM_ACC_AVG) / SUM(SUM_FCST_AVG) AS ACCURACY
FROM PRO_FCST_RESULT2_DJ;

SELECT * FROM PRO_FCST_RESULT2_DJ;