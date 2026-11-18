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
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
    DELETE FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
  END IF;
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) THEN
    IF EXISTS (SELECT "r22"."c84", "r22"."c85", "r22"."c86", "r22"."c87", "r22"."c88" FROM (SELECT DISTINCT "r21"."c79", "r21"."c80", "r21"."c81", "r21"."c82", "r21"."c83" FROM (SELECT "r15"."c68", "r15"."c69", "r15"."c70", "r15"."c71", "r15"."c72" FROM (SELECT "r14"."c63", "r14"."c64", "r14"."c65", "r14"."c66", "r14"."c67" FROM (SELECT "r13"."c52", "r13"."c53", "r13"."c54", "r13"."c55", "r13"."c56", "r13"."c57", "r13"."c58", "r13"."c59" FROM (SELECT "r12"."c44", "r12"."c45", "r12"."c46", "r12"."c47", "r12"."c48", "r12"."c49", "r12"."c50", "r12"."c51" FROM (SELECT "r5"."c10", "r5"."c11", "r5"."c12", "r11"."c39", "r11"."c40", "r11"."c41", "r11"."c42", "r11"."c43" FROM (SELECT "r4"."c7", "r4"."c8", "r4"."c9" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6")) AS "r4"("c7", "c8", "c9") OFFSET 0) AS "r5"("c10", "c11", "c12"), LATERAL (SELECT "r10"."c34", "r10"."c35", "r10"."c36", "r10"."c37", "r10"."c38" FROM (SELECT "r9"."c26", "r9"."c27", "r9"."c28", "r9"."c29", "r9"."c30" FROM (SELECT "r8"."c18", "r8"."c19", "r8"."c20", "r8"."c21", "r8"."c22", "r8"."c23", "r8"."c24", "r8"."c25" FROM (SELECT "r7"."c14", "r7"."c15", "r7"."c16", "r7"."c13", "r7"."c17", "r5"."c10", "r5"."c11", "r5"."c12" FROM (SELECT "r6"."holder", "r6"."resource", "r6"."seat", "r6"."turn", "r6"."until" FROM "slice"."fan_hold" AS "r6") AS "r7"("c13", "c14", "c15", "c16", "c17") WHERE "r7"."c14" = "r5"."c10" AND "r7"."c15" = "r5"."c11" AND "r7"."c16" = "r5"."c12") AS "r8"("c18", "c19", "c20", "c21", "c22", "c23", "c24", "c25") WHERE NOT "r8"."c19" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r8"."c18" + 1, 1)::integer, 0) - 1 + 1]) AS "r9"("c26", "c27", "c28", "c29", "c30", "c31", "c32", "c33")) AS "r10"("c34", "c35", "c36", "c37", "c38") OFFSET 0) AS "r11"("c39", "c40", "c41", "c42", "c43")) AS "r12"("c44", "c45", "c46", "c47", "c48", "c49", "c50", "c51")) AS "r13"("c52", "c53", "c54", "c55", "c56", "c57", "c58", "c59") OFFSET 0) AS "r14"("c60", "c61", "c62", "c63", "c64", "c65", "c66", "c67")) AS "r15"("c68", "c69", "c70", "c71", "c72") WHERE NOT EXISTS (SELECT 1 FROM (SELECT true FROM (SELECT true FROM (SELECT true FROM (SELECT "r16"."resource", "r16"."seat", "r16"."turn" FROM "slice"."fan_freed" AS "r16") AS "r17"("c73", "c74", "c75") WHERE "r17"."c73" = "r15"."c68" AND "r17"."c74" = "r15"."c69" AND "r17"."c75" = "r15"."c70") AS "r18"("c76") OFFSET 0) AS "r19"("c77")) AS "r20"("c78"))) AS "r21"("c79", "c80", "c81", "c82", "c83")) AS "r22"("c84", "c85", "c86", "c87", "c88")) THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'check_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_freed'::"pg_catalog"."text";
    END IF;
  END IF;
  IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
    IF EXISTS (SELECT "r9"."c27", "r9"."c28"::"slice"."__domain_gfw43vigph", "r9"."c29"::"slice"."__domain_gfw43vigph", "r9"."c30"::"slice"."__domain_jotafzuj2i", "r9"."c31"::"slice"."__domain_mxhao3k6ss" FROM (SELECT DISTINCT "r5"."c16", "r5"."c17", "r5"."c18", "r5"."c19", "r5"."c20" FROM (SELECT "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c14", "r4"."c15" FROM (SELECT "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c9", "r3"."c10" FROM (SELECT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10") WHERE NOT "r3"."c7" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r3"."c6" + 1, 1)::integer, 0) - 1 + 1]) AS "r4"("c11", "c12", "c13", "c14", "c15")) AS "r5"("c16", "c17", "c18", "c19", "c20") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c21", "r7"."c22", "r7"."c23" FROM (SELECT "r6"."resource", "r6"."seat", "r6"."turn" FROM "slice"."fan_freed" AS "r6") AS "r7"("c21", "c22", "c23")) AS "r8"("c24", "c25", "c26") WHERE "r8"."c24" = "r5"."c16" AND "r8"."c25" = "r5"."c17" AND "r8"."c26" = "r5"."c18")) AS "r9"("c27", "c28", "c29", "c30", "c31")) THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'check_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_hold'::"pg_catalog"."text";
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource" smallint, "seat" bigint, "turn" bigint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource", "seat", "turn")
    SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."resource" = "r1"."resource" AND "r2"."seat" = "r1"."seat" AND "r2"."turn" = "r1"."turn")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource" smallint, "seat" bigint, "turn" bigint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource", "seat", "turn")
    SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder" "pg_catalog"."uuid", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder", "resource", "seat", "turn", "until", "__count")
    SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", 1::smallint FROM "news" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder" "pg_catalog"."uuid", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder", "resource", "seat", "turn", "until", "__count")
    SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."resource" = "r1"."resource" AND "r2"."seat" = "r1"."seat" AND "r2"."turn" = "r1"."turn" AND "r2"."holder" = "r1"."holder" AND "r2"."until" = "r1"."until")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder", "resource", "seat", "turn", "until", "__count")
    SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."resource" = "r1"."resource" AND "r2"."seat" = "r1"."seat" AND "r2"."turn" = "r1"."turn" AND "r2"."holder" = "r1"."holder" AND "r2"."until" = "r1"."until") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_p5mgeiywqn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder", "resource", "seat", "turn", "until", "__count")
      SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r3")
      ;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() FROM PUBLIC;

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_hold"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"();
