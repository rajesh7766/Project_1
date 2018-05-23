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
