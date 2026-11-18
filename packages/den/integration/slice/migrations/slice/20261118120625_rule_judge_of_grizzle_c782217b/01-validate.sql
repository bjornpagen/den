CREATE OR REPLACE FUNCTION "slice"."__judge"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  DELETE FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1"
  ;
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) AND NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
    RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
      USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
            SCHEMA = 'pg_temp'::"pg_catalog"."text",
            TABLE = '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
  END IF;
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) AND NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
    RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
      USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
            SCHEMA = 'pg_temp'::"pg_catalog"."text",
            TABLE = '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
  END IF;
  IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
    CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder" "pg_catalog"."uuid", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
  ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
    RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
      USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
            SCHEMA = 'pg_temp'::"pg_catalog"."text",
            TABLE = '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
  END IF;
  IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) THEN
    CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource" smallint, "seat" bigint, "turn" bigint) ON COMMIT DELETE ROWS;
  ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
    RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
      USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
            SCHEMA = 'pg_temp'::"pg_catalog"."text",
            TABLE = '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
  END IF;
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
    DELETE FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
  END IF;
  IF EXISTS (SELECT "r23"."c78", "r23"."c79"::"slice"."__domain_gfw43vigph", "r23"."c80"::"slice"."__domain_gfw43vigph", "r23"."c81", "r23"."c82" FROM (SELECT "r22"."c74", "r22"."c75", "r22"."c76", "r22"."c73", "r22"."c77" FROM (SELECT "r21"."c68", "r21"."c69", "r21"."c70", "r21"."c71", "r21"."c72" FROM (SELECT "r20"."c63", "r20"."c64", "r20"."c65", "r20"."c66", "r20"."c67" FROM (SELECT "r19"."c61", "r19"."c58", "r19"."c59", "r19"."c60", "r19"."c62" FROM (SELECT "r9"."c21", "r9"."c22", "r9"."c23", "r18"."c51", "r18"."c52", "r18"."c53", "r18"."c50", "r18"."c54" FROM ((SELECT "r4"."c7", "r4"."c8"::bigint, "r4"."c9"::bigint FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6")) AS "r4"("c7", "c8", "c9") UNION SELECT "r8"."c18", "r8"."c19"::bigint, "r8"."c20"::bigint FROM (SELECT "r7"."c15", "r7"."c16", "r7"."c17" FROM (SELECT "r6"."c11", "r6"."c12", "r6"."c13" FROM (SELECT "r5"."holder", "r5"."resource", "r5"."seat", "r5"."turn", "r5"."until" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r5") AS "r6"("c10", "c11", "c12", "c13", "c14")) AS "r7"("c15", "c16", "c17")) AS "r8"("c18", "c19", "c20"))) AS "r9"("c21", "c22", "c23"), LATERAL (SELECT "r17"."c45", "r17"."c46", "r17"."c47", "r17"."c48", "r17"."c49" FROM (SELECT "r13"."c34", "r13"."c35", "r13"."c36", "r13"."c37", "r13"."c38" FROM (SELECT "r12"."c29", "r12"."c31", "r12"."c32", "r12"."c33", "r12"."c30" FROM (SELECT "r11"."c24", "r11"."c28", "r9"."c21", "r9"."c22", "r9"."c23" FROM (SELECT "r10"."holder", "r10"."resource", "r10"."seat", "r10"."turn", "r10"."until" FROM "slice"."fan_hold" AS "r10") AS "r11"("c24", "c25", "c26", "c27", "c28") WHERE "r11"."c25" = "r9"."c21" AND "r11"."c26" = "r9"."c22" AND "r11"."c27" = "r9"."c23") AS "r12"("c29", "c30", "c31", "c32", "c33")) AS "r13"("c34", "c35", "c36", "c37", "c38") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r15"."c39", "r15"."c40", "r15"."c41" FROM (SELECT "r14"."resource", "r14"."seat", "r14"."turn" FROM "slice"."fan_freed" AS "r14") AS "r15"("c39", "c40", "c41")) AS "r16"("c42", "c43", "c44") WHERE "r16"."c42" = "r13"."c35" AND "r16"."c43" = "r13"."c36" AND "r16"."c44" = "r13"."c37")) AS "r17"("c45", "c46", "c47", "c48", "c49") OFFSET 0) AS "r18"("c50", "c51", "c52", "c53", "c54")) AS "r19"("c55", "c56", "c57", "c58", "c59", "c60", "c61", "c62")) AS "r20"("c63", "c64", "c65", "c66", "c67")) AS "r21"("c68", "c69", "c70", "c71", "c72") WHERE NOT "r21"."c70" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r21"."c69" + 1, 1)::integer, 0) - 1 + 1]) AS "r22"("c73", "c74", "c75", "c76", "c77")) AS "r23"("c78", "c79", "c80", "c81", "c82")) THEN
    RAISE EXCEPTION 'a write breaks a rule over a query'
      USING ERRCODE = 'check_violation'::"pg_catalog"."text",
            CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
            SCHEMA = 'slice'::"pg_catalog"."text",
            TABLE = 'fan_freed'::"pg_catalog"."text";
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge"() FROM PUBLIC;
