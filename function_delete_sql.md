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
