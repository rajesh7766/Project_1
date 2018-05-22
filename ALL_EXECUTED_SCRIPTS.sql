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
======================================
--Inserting data using Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_insert"(a bigint, b character, c character)
RETURNS void
AS
$BODY$
	BEGIN
	insert into "MySchema"."CURRENCY_MASTER" 
	values (a,b,c);
	END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

SELECT * FROM "MySchema"."function_insert"(20, 'MUS', 'InActive');
======================================
--update data using Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_update"(a bigint, b character, c character)
RETURNS void
AS
$BODY$
	BEGIN
	update "MySchema"."CURRENCY_MASTER" set currency=b,status=c where currency_id=a;
	END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

SELECT * FROM "MySchema"."function_update"(20, 'MUS', 'InActive');
======================================
--delete data using Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_delete"(a bigint)
RETURNS void
AS
$BODY$
	BEGIN
	delete from "MySchema"."CURRENCY_MASTER" where  currency_id=a;
	END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

SELECT * FROM "MySchema"."function_delete"(20);
=======================================
--ROW_TO_JSON function displaying data from Postgressql
CREATE OR REPLACE FUNCTION "MySchema"."function_row_to_josn"(refcursor) RETURNS refcursor AS '
BEGIN
    OPEN $1 FOR 
	SELECT ROW_TO_JSON(t) FROM (SELECT * FROM "MySchema"."CURRENCY_MASTER") t;
    RETURN $1;
END;
' LANGUAGE plpgsql;

BEGIN;
SELECT "MySchema"."function_row_to_josn"('funccursor');
FETCH ALL IN funccursor;
COMMIT;
=======================================
--Passing object as input in postgres sql 
CREATE TYPE "MySchema"."dataset4" AS (id bigint, t character(10), x character(10));
CREATE TABLE "MySchema"."source4" OF "MySchema"."dataset4" (PRIMARY KEY(id));  -- add constraints in same command

INSERT INTO "MySchema"."source4" VALUES
    (26, 'TTT', 'Inactive')
   ,(27 'PPP', 'Inative');

CREATE OR REPLACE FUNCTION "MySchema"."process4"(_tbl regclass)
  RETURNS SETOF dataset4 AS
$func$
BEGIN
RETURN QUERY EXECUTE 'SELECT * FROM ' || _tbl;
END
$func$  LANGUAGE plpgsql;

SELECT * FROM "MySchema"."process4"('"MySchema"."source4"');

