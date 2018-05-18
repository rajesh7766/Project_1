-- FUNCTION: "MySchema"."FunInsertCurrency"(bigint, character, character)

-- DROP FUNCTION "MySchema"."FunInsertCurrency"(bigint, character, character);

CREATE OR REPLACE FUNCTION "MySchema"."FunInsertCurrency"(
	currency character,
	status character)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE 
AS $BODY$

begin
insert into "MySchema"."CURRENCY_MASTER_2" 
values (currency_id,currency,status);
end;

$BODY$;

ALTER FUNCTION "MySchema"."FunInsertCurrency"(bigint, character, character)
    OWNER TO postgres;

COMMENT ON FUNCTION "MySchema"."FunInsertCurrency"(bigint, character, character)
    IS 'Inserting data Into Currency Master table';
