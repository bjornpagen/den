DO $$
BEGIN
  PERFORM "pg_catalog"."pg_advisory_xact_lock"(7567026782556624299::bigint);
  EXECUTE "pg_catalog"."format"('ALTER DATABASE %I SET default_transaction_isolation = %L'::"pg_catalog"."text", "pg_catalog"."current_database"(), 'serializable'::"pg_catalog"."text");
END
$$;

CREATE SCHEMA "slice";

CREATE FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_join_names_mqsumlsj56"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ChainRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_join_names_mqsumlsj56"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_kind_names_zria4jypsm"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Page","ChainRunFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_kind_names_zria4jypsm"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_join_names_gct5lzhdqo"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Batch","FanRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_join_names_gct5lzhdqo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_kind_names_gikh2fxf2t"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Square","BatchFinish","FanRunFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_kind_names_gikh2fxf2t"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__feed_names_azjbqebc6i"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__feed_names_azjbqebc6i"() FROM PUBLIC;

CREATE DOMAIN "slice"."chain_chain_run_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_join" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_join_names_mqsumlsj56"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_kind_names_zria4jypsm"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_outcome_names_vo4tgqx6qh"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_page_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_page_input_feed_names_dxuyhzkiur"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_join" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_join_names_gct5lzhdqo"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_kind_names_gikh2fxf2t"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_outcome_names_7pbhseigfj"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__feed_names_azjbqebc6i"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."__domain_jotafzuj2i" AS "pg_catalog"."uuid";

CREATE DOMAIN "slice"."__domain_gfw43vigph" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint) IS TRUE);

CREATE DOMAIN "slice"."__domain_mxhao3k6ss" AS bigint;

CREATE DOMAIN "slice"."__text_t4rwovzmqj" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-0-9a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE OR REPLACE FUNCTION "slice"."__refuse"("state" "pg_catalog"."text", "constraint_name" "pg_catalog"."text", "detail" "pg_catalog"."text") RETURNS boolean
LANGUAGE plpgsql VOLATILE PARALLEL SAFE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RAISE EXCEPTION 'grizzle refused the statement'
    USING ERRCODE = "state",
          CONSTRAINT = "constraint_name",
          DETAIL = "detail";
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__require_serializable"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF "pg_catalog"."current_setting"('transaction_isolation'::"pg_catalog"."text") <> 'serializable'::"pg_catalog"."text" THEN
    RAISE EXCEPTION 'a write to a grizzle table requires SERIALIZABLE'
      USING ERRCODE = 'invalid_transaction_state'::"pg_catalog"."text",
            SCHEMA = TG_TABLE_SCHEMA,
            TABLE = TG_TABLE_NAME,
            HINT = 'write at SERIALIZABLE'::"pg_catalog"."text";
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__require_serializable"() FROM PUBLIC;

CREATE TABLE "slice"."__ledger" (
  "folder" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "ordinal" integer NOT NULL,
  "file" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "source" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "target" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "files" integer NOT NULL,
  "digest" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__ledger_pk" PRIMARY KEY ("folder", "ordinal"),
  CONSTRAINT "__ledger_ordinal_check" CHECK (("ordinal" >= 0) IS TRUE),
  CONSTRAINT "__ledger_files_check" CHECK (("files" >= 0) IS TRUE)
);

REVOKE ALL ON TABLE "slice"."__ledger" FROM PUBLIC;

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."__ledger"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE OR REPLACE FUNCTION "slice"."__snapshot_guard"("fingerprint" "pg_catalog"."text") RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r1" WHERE "r1"."ordinal" = 0 AND "r1"."files" <> (SELECT "pg_catalog"."count"(*) FROM "slice"."__ledger" AS "r2" WHERE "r2"."folder" = "r1"."folder" AND "r2"."ordinal" <> 0)) THEN
    RAISE EXCEPTION 'a grizzle migration of this schema is running or stopped part-way'
      USING ERRCODE = '55Z02'::"pg_catalog"."text";
  END IF;
  IF NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r3" WHERE "r3"."ordinal" = 0 AND "r3"."target" = "fingerprint" AND NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r4" WHERE "r4"."ordinal" = 0 AND "r4"."folder" > "r3"."folder")) THEN
    RAISE EXCEPTION 'the latest grizzle migration of this schema is not the snapshot of this Db'
      USING ERRCODE = '55Z01'::"pg_catalog"."text";
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") FROM PUBLIC;
