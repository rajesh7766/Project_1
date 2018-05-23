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
