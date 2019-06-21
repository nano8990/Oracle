-- PIVOT(행을 열로)
SELECT * FROM DT_RESULT_FINAL2
ORDER BY PRODUCTGROUP, PRODUCT, ITEM, YEARWEEK, MEASURE;

SELECT * FROM (
    SELECT * FROM DT_RESULT_FINAL2
)
PIVOT(
    SUM(SALES)
    FOR MEASURE IN
    ('REAL-QTY' AS REAL_QTY, 'PREDICTION-QTY' AS PREDICTION_QTY)
)
ORDER BY PRODUCTGROUP, PRODUCT, ITEM, YEARWEEK;

-- PIVOT 예제
SELECT * FROM (
    SELECT
        REGIONID,
        PRODUCT,
        ROUND(AVG(QTY)) AS QTY,
        'W'||SUBSTR(YEARWEEK, -2) AS WEEK
    FROM KOPO_CHANNEL_SEASONALITY_NEW
    GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK, -2)
)
PIVOT(
    SUM(QTY)
    FOR WEEK IN
    ('W01' AS W01,
    'W02' AS W02,
    'W03' AS W03,
    'W04' AS W04,
    'W05' AS W05,
    'W06' AS W06,
    'W07' AS W07,
    'W08' AS W08,
    'W09' AS W09,
    'W10' AS W10,
    'W11' AS W11,
    'W12' AS W12,
    'W13' AS W13,
    'W14' AS W14,
    'W15' AS W15,
    'W16' AS W16,
    'W17' AS W17,
    'W18' AS W18,
    'W19' AS W19,
    'W20' AS W20,
    'W21' AS W21,
    'W22' AS W22,
    'W23' AS W23,
    'W24' AS W24,
    'W25' AS W25,
    'W26' AS W26,
    'W27' AS W27,
    'W28' AS W28,
    'W29' AS W29,
    'W30' AS W30,
    'W31' AS W31,
    'W32' AS W32,
    'W33' AS W33,
    'W34' AS W34,
    'W35' AS W35,
    'W36' AS W36,
    'W37' AS W37,
    'W38' AS W38,
    'W39' AS W39,
    'W40' AS W40,
    'W41' AS W41,
    'W42' AS W42,
    'W43' AS W43,
    'W44' AS W44,
    'W45' AS W45,
    'W46' AS W46,
    'W47' AS W47,
    'W48' AS W48,
    'W49' AS W49,
    'W50' AS W50,
    'W51' AS W51,
    'W52' AS W52,
    'W53' AS W53)
);

-- UNPIVOT
WITH T AS(
    SELECT * FROM DT_RESULT_FINAL3
)
SELECT
    MEASURE,
    PRODUCTGROUP,
    PRODUCT,
    ITEM,
    YEARWEEK,
    SALES
FROM T
UNPIVOT(
    SALES
    FOR MEASURE IN(REAL_QTY AS 'REAL-QTY', PREDICTION_QTY AS 'PREDICTION-QTY')
)
ORDER BY YEARWEEK, (
    CASE MEASURE
    WHEN 'PREDICTION-QTY' THEN 1
    WHEN 'REAL-QTY' THEN 2
    ELSE 3
    END
);

-- UNPIVOT 예제
WITH T AS(
    SELECT * FROM (
        SELECT
            REGIONID,
            PRODUCT,
            ROUND(AVG(QTY)) AS QTY,
            'W'||SUBSTR(YEARWEEK, -2) AS WEEK
        FROM KOPO_CHANNEL_SEASONALITY_NEW
        GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK, -2)
    )
    PIVOT(
        SUM(QTY)
        FOR WEEK IN
        ('W01' AS W01,
        'W02' AS W02,
        'W03' AS W03,
        'W04' AS W04,
        'W05' AS W05,
        'W06' AS W06,
        'W07' AS W07,
        'W08' AS W08,
        'W09' AS W09,
        'W10' AS W10,
        'W11' AS W11,
        'W12' AS W12,
        'W13' AS W13,
        'W14' AS W14,
        'W15' AS W15,
        'W16' AS W16,
        'W17' AS W17,
        'W18' AS W18,
        'W19' AS W19,
        'W20' AS W20,
        'W21' AS W21,
        'W22' AS W22,
        'W23' AS W23,
        'W24' AS W24,
        'W25' AS W25,
        'W26' AS W26,
        'W27' AS W27,
        'W28' AS W28,
        'W29' AS W29,
        'W30' AS W30,
        'W31' AS W31,
        'W32' AS W32,
        'W33' AS W33,
        'W34' AS W34,
        'W35' AS W35,
        'W36' AS W36,
        'W37' AS W37,
        'W38' AS W38,
        'W39' AS W39,
        'W40' AS W40,
        'W41' AS W41,
        'W42' AS W42,
        'W43' AS W43,
        'W44' AS W44,
        'W45' AS W45,
        'W46' AS W46,
        'W47' AS W47,
        'W48' AS W48,
        'W49' AS W49,
        'W50' AS W50,
        'W51' AS W51,
        'W52' AS W52,
        'W53' AS W53)
    )
)
SELECT
    REGIONID,
    PRODUCT,
    WEEK,
    QTY
FROM T
UNPIVOT(
    QTY
    FOR WEEK IN
    (W01 AS 'W01',
    W02 AS 'W02',
    W03 AS 'W03',
    W04 AS 'W04',
    W05 AS 'W05',
    W06 AS 'W06',
    W07 AS 'W07',
    W08 AS 'W08',
    W09 AS 'W09',
    W10 AS 'W10',
    W11 AS 'W11',
    W12 AS 'W12',
    W13 AS 'W13',
    W14 AS 'W14',
    W15 AS 'W15',
    W16 AS 'W16',
    W17 AS 'W17',
    W18 AS 'W18',
    W19 AS 'W19',
    W20 AS 'W20',
    W21 AS 'W21',
    W22 AS 'W22',
    W23 AS 'W23',
    W24 AS 'W24',
    W25 AS 'W25',
    W26 AS 'W26',
    W27 AS 'W27',
    W28 AS 'W28',
    W29 AS 'W29',
    W30 AS 'W30',
    W31 AS 'W31',
    W32 AS 'W32',
    W33 AS 'W33',
    W34 AS 'W34',
    W35 AS 'W35',
    W36 AS 'W36',
    W37 AS 'W37',
    W38 AS 'W38',
    W39 AS 'W39',
    W40 AS 'W40',
    W41 AS 'W41',
    W42 AS 'W42',
    W43 AS 'W43',
    W44 AS 'W44',
    W45 AS 'W45',
    W46 AS 'W46',
    W47 AS 'W47',
    W48 AS 'W48',
    W49 AS 'W49',
    W50 AS 'W50',
    W51 AS 'W51',
    W52 AS 'W52',
    W53 AS 'W53')
);

SELECT * FROM KOPO_CHANNEL_SEASONALITY_NEW;