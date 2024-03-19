UPDATE NPGSQL_TESTS SET RESULT_BOOL = (CASE WHEN RESULT = 'Working fine on pldotnet 👍' THEN TRUE ELSE FALSE END);
SELECT FEATURE,
    SUM(CASE WHEN RESULT_BOOL = true THEN 1 ELSE 0 END) AS successes,
    SUM(CASE WHEN RESULT_BOOL = false THEN 1 ELSE 0 END) AS failures
FROM NPGSQL_TESTS
GROUP BY FEATURE
UNION ALL
SELECT 'TOTAL' AS FEATURE,
    SUM(CASE WHEN RESULT_BOOL = true THEN 1 ELSE 0 END) AS successes,
    SUM(CASE WHEN RESULT_BOOL = false THEN 1 ELSE 0 END) AS failures
FROM NPGSQL_TESTS
ORDER BY failures DESC, successes DESC;