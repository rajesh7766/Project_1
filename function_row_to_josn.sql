--ROW_TO_JSON function displaying data from Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_row_to_josn"(refcursor) RETURNS refcursor AS '
BEGIN
    OPEN $1 FOR 
	SELECT ROW_TO_JSON(t) FROM (SELECT * FROM "MySchema"."CURRENCY_MASTER") t;
    RETURN $1;
END;
' LANGUAGE plpgsql;
COMMIT;


BEGIN;
SELECT "MySchema"."function_row_to_josn"('funccursor');
FETCH ALL IN funccursor;

COMMIT;
