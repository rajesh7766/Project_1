--Selecting mulitiple columns data using refcursor in Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_select"(refcursor) RETURNS refcursor AS '
BEGIN
    OPEN $1 FOR SELECT * FROM "MySchema"."CURRENCY_MASTER";
    RETURN $1;
END;
' LANGUAGE plpgsql;

BEGIN;
SELECT "MySchema"."function_select"('funccursor');
FETCH ALL IN funccursor;
COMMIT;
