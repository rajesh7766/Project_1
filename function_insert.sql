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
