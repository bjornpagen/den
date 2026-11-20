CREATE OR REPLACE FUNCTION "slice"."__judge_assign_assignment_input_wuew75ls3w"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root", "r2"."mode") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root", "r2"."mode" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text";
  END IF;
  IF "__written" @> '{"__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text";
  END IF;
  IF "__written" @> '{"__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt","__delta_olds_assign_assignment_input_mode_within_jln5vvbnma","__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6","__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 0::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."assign_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 0::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_in_assign_root_iwogkwrka6'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6","__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_in_assign_spa2ewu36p'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_denblf4gm6","__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_in_assign_uaihjcbwg4'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_assignment_input_wuew75ls3w"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_26q24qxvlk"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_assign_assignment_input_mode_within_dxw55vocvh"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl","__delta_news_assign_assignment_input_mode_within_dxw55vocvh"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl","__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."scope" FROM "slice"."assign_assignment_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_nearest_in_d6kzlau6ya'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_assignment_input_mode_within_dxw55vocvh","__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."scope" FROM "slice"."assign_assignment_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_within_in_assign_pva2wgl7vj'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_26q24qxvlk"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_input_jsjoaq6p3w"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."mode") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."mode" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text";
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_input_mode_within_dil526qf3j"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text";
  END IF;
  IF "__written" @> '{"__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw","__delta_olds_assign_decide_input_mode_within_dil526qf3j","__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n","__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."assign_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_in_assign_step_alw775jwbe'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n","__delta_olds_assign_decide_input_mode_within_dil526qf3j"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_input_mode_within" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_in_assign_decide_a4fqevvlsj'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_s4zvullm7n","__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_in_assign_decide_khcyb7tfoc'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_input_jsjoaq6p3w"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_j32k5tsmaz"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw","__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw","__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."step" FROM "slice"."assign_decide_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_nearest_in_assign_iuixfzpvg7'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_input_mode_within_5mdl5gjbtu","__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input_mode_within" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."step" FROM "slice"."assign_decide_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_within_in_assign_tftacuvlxt'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_j32k5tsmaz"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_output_iez77fjrkx"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_decide_output_5rdjmbf6p5"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."stage") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."stage" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text";
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg","__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_5rdjmbf6p5"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_5rdjmbf6p5"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_5rdjmbf6p5","__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c23", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."stage", "r12"."step" FROM "slice"."assign_decide_output" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_in_assign_decide_d2rdvy7xmi'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_5rdjmbf6p5","__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."text", "r5"."c11"::"pg_catalog"."text" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c23", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."stage", "r12"."step" FROM "slice"."assign_decide_output" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_in_assign_decide_iqnjpbthyj'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_output_iez77fjrkx"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_output_stage_rest_dl4rc34gos"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq","__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq","__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c28", "r17"."c29" FROM (SELECT "r16"."root", "r16"."stage", "r16"."step" FROM "slice"."assign_decide_output" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_rest_in_assign_yuewy7ndin'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_decide_output_stage_serve_vj7fc2mlab","__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c28", "r17"."c29" FROM (SELECT "r16"."root", "r16"."stage", "r16"."step" FROM "slice"."assign_decide_output" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_serve_in_assign_3ymh64g45e'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_dl4rc34gos"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_done_4pcl2f7b3b"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_assign_done_e56dn6i6we"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_assign_failed_zxyyypjj4h"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_done_e56dn6i6we","__delta_news_assign_failed_zxyyypjj4h"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_7o35ioebal" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_done_e56dn6i6we","__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_result_7o35ioebal" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."assign_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_done_in_assign_result_mccxlev75g'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_assign_failed_zxyyypjj4h","__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_result_7o35ioebal" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."assign_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_failed_in_assign_result_xt2v5y4l2p'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_failed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_done_4pcl2f7b3b"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_chain_run_input_uxohggxxkj"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_chain_chain_run_input_n52na7fbei"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_chain_ordered_input_zjw2fbv22r"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_chain_run_input_n52na7fbei","__delta_news_chain_ordered_input_zjw2fbv22r"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_chain_run_input_n52na7fbei","__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 0::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."chain_chain_run_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."chain_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 0::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_chain_run_input_in_chain_root_amnxsjpwug'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_chain_run_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_ordered_input_zjw2fbv22r","__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 1::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."chain_ordered_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."chain_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 1::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_ordered_input_in_chain_root_wbdtjnxkf2'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_ordered_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_chain_run_input_uxohggxxkj"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_done_bny4tyogt6"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_chain_done_kma7mybieg"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_chain_failed_qydpblratn"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_done_kma7mybieg","__delta_news_chain_failed_qydpblratn"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_done_kma7mybieg","__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."chain_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_done_in_chain_result_wo66ka6omy'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_failed_qydpblratn","__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."chain_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_failed_in_chain_result_oxijjtbcua'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_failed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_done_bny4tyogt6"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_page_input_q2evszpml3"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_chain_page_input_hakxswds3h"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "seq" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_page_input_hakxswds3h"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_chain_page_input_hakxswds3h","__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_page_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."chain_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_page_input_in_chain_step_iui2bqi4eg'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_page_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_page_input_q2evszpml3"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_batch_input_ahcbwfepfq"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_fan_batch_input_gzmilspc2n"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_batch_input_gzmilspc2n"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_within_7xoagvzzet" ("kind" smallint, "parent" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_batch_input_gzmilspc2n","__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_fan_within_7xoagvzzet" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."fan_batch_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."fan_within" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_batch_input_in_fan_within_a66oofagwd'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_batch_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_batch_input_ahcbwfepfq"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_done_l6g3p6tb2e"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_fan_done_f4t5mqdjck"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_fan_failed_4vwjcia7pd"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_done_f4t5mqdjck","__delta_news_fan_failed_4vwjcia7pd"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_done_f4t5mqdjck","__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."fan_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_done_in_fan_result_dbzlqmyfjm'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_failed_4vwjcia7pd","__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."fan_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_failed_in_fan_result_l6a3lfozn3'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_failed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_done_l6g3p6tb2e"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_fan_run_input_o2iprmqu62"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_fan_fan_run_input_rt4ehlub4b"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_fan_run_input_rt4ehlub4b"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_fan_run_input_rt4ehlub4b","__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 0::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."fan_fan_run_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."fan_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 0::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_fan_run_input_in_fan_root_2jzdzob6au'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_fan_run_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_fan_run_input_o2iprmqu62"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_hold_kyuaetdhtj"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_fan_hold_5yqbrcgkyv"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_hold_5yqbrcgkyv"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource" smallint, "seat" bigint, "turn" bigint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_freed_mwml6ea3za"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_freed_mwml6ea3za","__delta_news_fan_hold_5yqbrcgkyv"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c82", "r24"."c83", "r24"."c84", "r24"."c85", "r24"."c86" FROM (SELECT "r23"."c77", "r23"."c78", "r23"."c79", "r23"."c80", "r23"."c81" FROM (SELECT "r10"."c22", "r10"."c23", "r10"."c24", "r22"."c69", "r22"."c70", "r22"."c71", "r22"."c72", "r22"."c73" FROM (SELECT "r9"."c19", "r9"."c20", "r9"."c21" FROM ((SELECT "r4"."c7", "r4"."c8"::bigint, "r4"."c9"::bigint FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6")) AS "r4"("c7", "c8", "c9") UNION SELECT "r8"."c16", "r8"."c17"::bigint, "r8"."c18"::bigint FROM (SELECT "r7"."c13", "r7"."c14", "r7"."c15" FROM (SELECT "r6"."c10", "r6"."c11", "r6"."c12" FROM (SELECT "r5"."resource", "r5"."seat", "r5"."turn" FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r5") AS "r6"("c10", "c11", "c12")) AS "r7"("c13", "c14", "c15")) AS "r8"("c16", "c17", "c18"))) AS "r9"("c19", "c20", "c21") OFFSET 0) AS "r10"("c22", "c23", "c24"), LATERAL (SELECT "r21"."c64", "r21"."c65", "r21"."c66", "r21"."c67", "r21"."c68" FROM (SELECT "r20"."c61", "r20"."c62", "r20"."c63", "r20"."c59", "r20"."c60" FROM (SELECT "r19"."c54", "r19"."c55", "r19"."c56", "r19"."c57", "r19"."c58" FROM (SELECT "r18"."c49", "r18"."c53", "r10"."c22", "r10"."c23", "r10"."c24" FROM LATERAL (SELECT "r14"."c38", "r14"."c39", "r14"."c40", "r14"."c41", "r14"."c42" FROM (SELECT "r13"."c33", "r13"."c30", "r13"."c31", "r13"."c32", "r13"."c34" FROM (SELECT "r12"."c26", "r12"."c27", "r12"."c28", "r12"."c25", "r12"."c29", "r10"."c22", "r10"."c23", "r10"."c24" FROM (SELECT "r11"."holder", "r11"."resource", "r11"."seat", "r11"."turn", "r11"."until" FROM "slice"."fan_hold" AS "r11") AS "r12"("c25", "c26", "c27", "c28", "c29") WHERE "r12"."c26" = "r10"."c22" AND "r12"."c27" = "r10"."c23" AND "r12"."c28" = "r10"."c24") AS "r13"("c30", "c31", "c32", "c33", "c34", "c35", "c36", "c37")) AS "r14"("c38", "c39", "c40", "c41", "c42") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r16"."c43", "r16"."c44", "r16"."c45" FROM (SELECT "r15"."resource", "r15"."seat", "r15"."turn" FROM "slice"."fan_freed" AS "r15") AS "r16"("c43", "c44", "c45")) AS "r17"("c46", "c47", "c48") WHERE "r17"."c46" = "r14"."c39" AND "r17"."c47" = "r14"."c40" AND "r17"."c48" = "r14"."c41")) AS "r18"("c49", "c50", "c51", "c52", "c53") WHERE "r18"."c50" = "r10"."c22" AND "r18"."c51" = "r10"."c23" AND "r18"."c52" = "r10"."c24") AS "r19"("c54", "c55", "c56", "c57", "c58") WHERE CASE WHEN "r19"."c57" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r19"."c56" + 1, 1)::integer, 0) - 1 + 1] THEN false ELSE true END) AS "r20"("c59", "c60", "c61", "c62", "c63")) AS "r21"("c64", "c65", "c66", "c67", "c68") OFFSET 0) AS "r22"("c69", "c70", "c71", "c72", "c73")) AS "r23"("c74", "c75", "c76", "c77", "c78", "c79", "c80", "c81")) AS "r24"("c82", "c83", "c84", "c85", "c86")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'check_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_freed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_hold_kyuaetdhtj"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_square_input_zpxf6iizzy"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_fan_square_input_qbcgxymh4m"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_square_input_qbcgxymh4m"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_eribsfky6x" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_fan_square_input_qbcgxymh4m","__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_step_eribsfky6x" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_square_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."fan_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_square_input_in_fan_step_t7lroigcjm'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_square_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_square_input_zpxf6iizzy"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_brittle_input_e4oxym4quk"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_retry_brittle_input_nl76wgehgl"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_retry_steadfast_input_4le3o7ctyk"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_brittle_input_nl76wgehgl","__delta_news_retry_steadfast_input_4le3o7ctyk"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_brittle_input_nl76wgehgl","__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_brittle_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."retry_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_brittle_input_in_retry_step_ayhgze3rfy'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_brittle_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_steadfast_input_4le3o7ctyk","__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_steadfast_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."retry_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_steadfast_input_in_retry_step_xlseavmggr'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_steadfast_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_brittle_input_e4oxym4quk"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_done_exdy4mgpv7"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_retry_done_gl4uribtvf"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_retry_failed_pqelqrzkgz"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_done_gl4uribtvf","__delta_news_retry_failed_pqelqrzkgz"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_rhla2oyczu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_done_gl4uribtvf","__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_result_rhla2oyczu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."retry_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_done_in_retry_result_cluafk7ckl'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_failed_pqelqrzkgz","__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_result_rhla2oyczu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."retry_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_failed_in_retry_result_j6mnxpbxyv'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_failed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_done_exdy4mgpv7"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_ladders_input_rvyvp655kl"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_retry_ladders_input_wllyl2jqoh"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_ladders_input_wllyl2jqoh"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_root_b5qenyw22g" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_retry_ladders_input_wllyl2jqoh","__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_retry_root_b5qenyw22g" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 0::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."retry_ladders_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."retry_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 0::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_ladders_input_in_retry_root_5nchmv4mqh'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_ladders_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_ladders_input_rvyvp655kl"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_build_input_f7w2cjex5n"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_sync_build_input_iz6gouj37l"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_sync_copy_input_thhapw3pvf"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_build_input_iz6gouj37l","__delta_news_sync_copy_input_thhapw3pvf"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_oj4vnywvws" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_build_input_iz6gouj37l","__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_step_oj4vnywvws" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_build_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."sync_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_build_input_in_sync_step_n7adainwnp'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_build_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_copy_input_thhapw3pvf","__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_step_oj4vnywvws" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_copy_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."sync_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_copy_input_in_sync_step_vskkdhyrbe'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_copy_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_build_input_f7w2cjex5n"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_done_e44hnpqjcl"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_sync_done_5jpjleov7i"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_sync_failed_ntyxjjhl7h"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_done_5jpjleov7i","__delta_news_sync_failed_ntyxjjhl7h"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_oogmb2mroq" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_done_5jpjleov7i","__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_result_oogmb2mroq" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."sync_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_done_in_sync_result_vbj33bqeiu'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_failed_ntyxjjhl7h","__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."text", "r4"."c6"::"pg_catalog"."text" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."text", "r9"."c17"::"pg_catalog"."text" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_result_oogmb2mroq" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."sync_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_failed_in_sync_result_lkpjlmf7gp'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_failed'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_done_e44hnpqjcl"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_gold_input_gc453e6dwy"("__written" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__rowed" "pg_catalog"."text"[];
BEGIN
  "__rowed" := '{}'::"pg_catalog"."text"[];
  IF "__written" @> '{"__delta_news_sync_gold_input_4uoos2vt25"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_news_sync_sync_run_input_osudnnsu7o"}'::"pg_catalog"."text"[] THEN
    DELETE FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r1"
    WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
    ;
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r1") THEN
      "__rowed" := "__rowed" || '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" @> '{"__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    "__rowed" := "__rowed" || '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text";
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_gold_input_4uoos2vt25","__delta_news_sync_sync_run_input_osudnnsu7o"}'::"pg_catalog"."text"[] THEN
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_root_34gftivok2" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_gold_input_4uoos2vt25","__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_sync_root_34gftivok2" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 0::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."sync_gold_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."sync_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 0::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_gold_input_in_sync_root_cddey6bzlv'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_gold_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__rowed" && '{"__delta_news_sync_sync_run_input_osudnnsu7o","__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c28" FROM (SELECT DISTINCT "r23"."c27" FROM (SELECT "r11"."c12", "r22"."c25" FROM (SELECT "r10"."c11" FROM ((SELECT "r4"."c3"::"pg_catalog"."text" FROM (SELECT "r3"."c2" FROM (SELECT "r2"."c1" FROM (SELECT "r1"."scope" FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r1") AS "r2"("c1")) AS "r3"("c2")) AS "r4"("c3") UNION SELECT "r9"."c10"::"pg_catalog"."text" FROM (SELECT "r8"."c8" FROM (SELECT "r7"."c6", "r7"."c7" FROM (SELECT "r6"."c5", "r6"."c4" FROM (SELECT "r5"."kind", "r5"."scope" FROM "pg_temp"."__delta_olds_sync_root_34gftivok2" AS "r5") AS "r6"("c4", "c5")) AS "r7"("c6", "c7") WHERE "r7"."c7" = 1::smallint) AS "r8"("c8", "c9")) AS "r9"("c10"))) AS "r10"("c11") OFFSET 0) AS "r11"("c12"), LATERAL (SELECT "r21"."c24" FROM (SELECT "r15"."c16" FROM (SELECT "r14"."c15" FROM (SELECT "r11"."c12" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."sync_sync_run_input" AS "r12") AS "r13"("c13", "c14") WHERE "r13"."c14" = "r11"."c12") AS "r14"("c15")) AS "r15"("c16") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c21" FROM (SELECT "r18"."c19", "r18"."c20" FROM (SELECT "r17"."c18", "r17"."c17" FROM (SELECT "r16"."kind", "r16"."scope" FROM "slice"."sync_root" AS "r16") AS "r17"("c17", "c18")) AS "r18"("c19", "c20") WHERE "r18"."c20" = 1::smallint) AS "r19"("c21", "c22")) AS "r20"("c23") WHERE "r20"."c23" = "r15"."c16")) AS "r21"("c24") OFFSET 0) AS "r22"("c25")) AS "r23"("c26", "c27")) AS "r24"("c28")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_sync_run_input_in_sync_root_burfhxpjwz'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_root'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_gold_input_gc453e6dwy"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := (SELECT "r1"."__written" FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1");
  DELETE FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1"
  ;
  IF "__written" && '{"__delta_news_assign_assignment_input_denblf4gm6","__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt","__delta_olds_assign_assignment_input_mode_within_jln5vvbnma","__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_assignment_input_wuew75ls3w"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl","__delta_news_assign_assignment_input_mode_within_dxw55vocvh","__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_assignment_input_mode_nearest_26q24qxvlk"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_s4zvullm7n","__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw","__delta_olds_assign_decide_input_mode_within_dil526qf3j","__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_input_jsjoaq6p3w"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw","__delta_news_assign_decide_input_mode_within_5mdl5gjbtu","__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_input_mode_nearest_j32k5tsmaz"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_5rdjmbf6p5","__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg","__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_output_iez77fjrkx"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq","__delta_news_assign_decide_output_stage_serve_vj7fc2mlab","__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_output_stage_rest_dl4rc34gos"("__written");
  END IF;
  IF "__written" && '{"__delta_news_assign_done_e56dn6i6we","__delta_news_assign_failed_zxyyypjj4h","__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_done_4pcl2f7b3b"("__written");
  END IF;
  IF "__written" && '{"__delta_news_chain_chain_run_input_n52na7fbei","__delta_news_chain_ordered_input_zjw2fbv22r","__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_chain_run_input_uxohggxxkj"("__written");
  END IF;
  IF "__written" && '{"__delta_news_chain_done_kma7mybieg","__delta_news_chain_failed_qydpblratn","__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_done_bny4tyogt6"("__written");
  END IF;
  IF "__written" && '{"__delta_news_chain_page_input_hakxswds3h","__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_page_input_q2evszpml3"("__written");
  END IF;
  IF "__written" && '{"__delta_news_fan_batch_input_gzmilspc2n","__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_batch_input_ahcbwfepfq"("__written");
  END IF;
  IF "__written" && '{"__delta_news_fan_done_f4t5mqdjck","__delta_news_fan_failed_4vwjcia7pd","__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_done_l6g3p6tb2e"("__written");
  END IF;
  IF "__written" && '{"__delta_news_fan_fan_run_input_rt4ehlub4b","__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_fan_run_input_o2iprmqu62"("__written");
  END IF;
  IF "__written" && '{"__delta_news_fan_hold_5yqbrcgkyv","__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_hold_kyuaetdhtj"("__written");
  END IF;
  IF "__written" && '{"__delta_news_fan_square_input_qbcgxymh4m","__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_square_input_zpxf6iizzy"("__written");
  END IF;
  IF "__written" && '{"__delta_news_retry_brittle_input_nl76wgehgl","__delta_news_retry_steadfast_input_4le3o7ctyk","__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_brittle_input_e4oxym4quk"("__written");
  END IF;
  IF "__written" && '{"__delta_news_retry_done_gl4uribtvf","__delta_news_retry_failed_pqelqrzkgz","__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_done_exdy4mgpv7"("__written");
  END IF;
  IF "__written" && '{"__delta_news_retry_ladders_input_wllyl2jqoh","__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_ladders_input_rvyvp655kl"("__written");
  END IF;
  IF "__written" && '{"__delta_news_sync_build_input_iz6gouj37l","__delta_news_sync_copy_input_thhapw3pvf","__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_build_input_f7w2cjex5n"("__written");
  END IF;
  IF "__written" && '{"__delta_news_sync_done_5jpjleov7i","__delta_news_sync_failed_ntyxjjhl7h","__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_done_e44hnpqjcl"("__written");
  END IF;
  IF "__written" && '{"__delta_news_sync_gold_input_4uoos2vt25","__delta_news_sync_sync_run_input_osudnnsu7o","__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_gold_input_gc453e6dwy"("__written");
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_denblf4gm6"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" ("learner", "missed", "mode", "root", "scope", "topic")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" ("learner", "missed", "mode", "root", "scope", "topic")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_voahq3vkpy" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_voahq3vkpy'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_voahq3vkpy"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_denblf4gm6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_assignment_input_denblf4gm6'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
        SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_denblf4gm6" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root", "scope", "__count")
      SELECT "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root", "scope", "__count")
      SELECT "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root", "scope", "__count")
      SELECT "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" ("root", "scope")
      SELECT "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" ("root", "scope")
      SELECT "r1"."root", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_mode_nearest_qkqr6bpavt"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" ("root", "scope", "__count")
        SELECT "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_a5x4wzabsl" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius", "root", "scope", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_mode_within_dxw55vocvh"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius", "root", "scope", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius", "root", "scope", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_assignment_input_mode_within_dxw55vocvh"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" ("radius", "root", "scope")
      SELECT "r1"."radius", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" ("radius", "root", "scope")
      SELECT "r1"."radius", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_within_jln5vvbnma" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_assignment_input_mode_within_jln5vvbnma'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_assignment_input_mode_within_jln5vvbnma"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_assignment_input_mode_within_dxw55vocvh'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" ("radius", "root", "scope", "__count")
        SELECT "r1"."radius", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_dxw55vocvh" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner", "missed", "mode", "root", "step", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner", "missed", "mode", "root", "step", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner", "missed", "mode", "root", "step", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_s4zvullm7n"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" ("learner", "missed", "mode", "root", "step", "topic")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" ("learner", "missed", "mode", "root", "step", "topic")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_kc4dxtoi4a" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_kc4dxtoi4a'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_kc4dxtoi4a"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_s4zvullm7n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_input_s4zvullm7n'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" ("learner", "missed", "mode", "root", "step", "topic", "__count")
        SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_s4zvullm7n" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" ("root", "step")
      SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" ("root", "step")
      SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_mode_nearest_evhrmr4mcw"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_j4kpqvprhw" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius", "root", "step", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius", "root", "step", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius", "root", "step", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" ("radius", "root", "step")
      SELECT "r1"."radius", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_mode_within_dil526qf3j"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" ("radius" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" ("radius", "root", "step")
      SELECT "r1"."radius", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_within_dil526qf3j" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_input_mode_within_dil526qf3j'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_input_mode_within_dil526qf3j"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_input_mode_within_5mdl5gjbtu'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" ("radius", "root", "step", "__count")
        SELECT "r1"."radius", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_5mdl5gjbtu" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence", "root", "stage", "step", "__count")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_5rdjmbf6p5"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence", "root", "stage", "step", "__count")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence", "root", "stage", "step", "__count")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_5rdjmbf6p5"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" ("confidence", "root", "stage", "step")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" ("confidence" double precision, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "stage" smallint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" ("confidence", "root", "stage", "step")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_jl7hz3xgm3" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_jl7hz3xgm3'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_jl7hz3xgm3"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_output_5rdjmbf6p5'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" ("confidence", "root", "stage", "step", "__count")
        SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_5rdjmbf6p5" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_stage_rest_mo6acl2raq"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" ("root", "step")
      SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" ("root", "step")
      SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_stage_rest_6l3t7lh6xg"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_output_stage_rest_mo6acl2raq'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_mo6acl2raq" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance", "passage", "root", "step", "__count")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance", "passage", "root", "step", "__count")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance", "passage", "root", "step", "__count")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" ("distance", "passage", "root", "step")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" ("distance", "passage", "root", "step")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_serve_ryt6muefw6" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_decide_output_stage_serve_ryt6muefw6'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_decide_output_stage_serve_ryt6muefw6"}'::"pg_catalog"."text"[]
        ;
      END IF;
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_decide_output_stage_serve_vj7fc2mlab'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" ("distance", "passage", "root", "step", "__count")
        SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_vj7fc2mlab" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_done_e56dn6i6we"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_done_e56dn6i6we"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_e56dn6i6we"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_done_e56dn6i6we'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_done_e56dn6i6we" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_e56dn6i6we" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_failed_zxyyypjj4h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_assign_failed_zxyyypjj4h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zxyyypjj4h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_assign_failed_zxyyypjj4h'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zxyyypjj4h" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_7o35ioebal" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_result_7o35ioebal" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_result_7o35ioebal" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_7o35ioebal" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_7o35ioebal"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_result_7o35ioebal" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_result_7o35ioebal" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_result_7o35ioebal'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_result_7o35ioebal"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_root_yoxtxfb74a"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_root_yoxtxfb74a" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_root_yoxtxfb74a'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_root_yoxtxfb74a"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_xkmnkyfyio"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_step_xkmnkyfyio" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_assign_step_xkmnkyfyio'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_assign_step_xkmnkyfyio"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_chain_run_input_n52na7fbei"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_chain_run_input_n52na7fbei"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_chain_chain_run_input_n52na7fbei'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" ("feed", "pages", "root", "scope", "__count")
        SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_n52na7fbei" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_done_kma7mybieg"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_done_kma7mybieg"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_kma7mybieg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_chain_done_kma7mybieg'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_chain_done_kma7mybieg" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_kma7mybieg" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_failed_qydpblratn"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_failed_qydpblratn"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_qydpblratn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_chain_failed_qydpblratn'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_chain_failed_qydpblratn" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_qydpblratn" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_ordered_input_zjw2fbv22r"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_ordered_input_zjw2fbv22r"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_chain_ordered_input_zjw2fbv22r'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" ("feed", "pages", "root", "scope", "__count")
        SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_zjw2fbv22r" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "seq" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed", "pages", "root", "seq", "step", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_page_input_hakxswds3h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "seq" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed", "pages", "root", "seq", "step", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed", "pages", "root", "seq", "step", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_chain_page_input_hakxswds3h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_hakxswds3h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_chain_page_input_hakxswds3h'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_chain_page_input_hakxswds3h" ("feed", "pages", "root", "seq", "step", "__count")
        SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_hakxswds3h" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_wgz7eayk2l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_result_wgz7eayk2l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_result_wgz7eayk2l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_result_wgz7eayk2l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_root_3cootamwgf"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_root_7puxcgcv7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_root_7puxcgcv7l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_root_7puxcgcv7l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_root_7puxcgcv7l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_root_3cootamwgf"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_c7mlc6wcvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_step_c7mlc6wcvi" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_chain_step_c7mlc6wcvi'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_chain_step_c7mlc6wcvi"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_batch_input_gzmilspc2n"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_batch_input_gzmilspc2n"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_gzmilspc2n"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_batch_input_gzmilspc2n'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" ("batch", "root", "scope", "size", "__count")
        SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_gzmilspc2n" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_done_f4t5mqdjck"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_done_f4t5mqdjck"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_f4t5mqdjck"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_done_f4t5mqdjck'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_done_f4t5mqdjck" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_f4t5mqdjck" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_failed_ecscfsee25"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_failed_4vwjcia7pd"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_failed_4vwjcia7pd"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_4vwjcia7pd"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_failed_4vwjcia7pd'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_4vwjcia7pd" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_failed_ecscfsee25"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_fan_run_input_rt4ehlub4b"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_fan_run_input_rt4ehlub4b"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_fan_run_input_rt4ehlub4b'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" ("batch", "root", "scope", "size", "__count")
        SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_rt4ehlub4b" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
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
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
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
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
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
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder", "resource", "seat", "turn", "until", "__count")
      SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_hold_5yqbrcgkyv"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder", "resource", "seat", "turn", "until", "__count")
      SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."resource" = "r1"."resource" AND "r2"."seat" = "r1"."seat" AND "r2"."turn" = "r1"."turn" AND "r2"."holder" = "r1"."holder" AND "r2"."until" = "r1"."until")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder", "resource", "seat", "turn", "until", "__count")
      SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."resource" = "r1"."resource" AND "r2"."seat" = "r1"."seat" AND "r2"."turn" = "r1"."turn" AND "r2"."holder" = "r1"."holder" AND "r2"."until" = "r1"."until") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_hold_5yqbrcgkyv"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_hold_5yqbrcgkyv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_hold_5yqbrcgkyv'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" ("holder", "resource", "seat", "turn", "until", "__count")
        SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_5yqbrcgkyv" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_result_tevufz2c53"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_plbq2iwpcu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_result_plbq2iwpcu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_result_plbq2iwpcu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_result_plbq2iwpcu"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_result_tevufz2c53"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_root_k2j5bt36bs"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_root_k2j5bt36bs" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_root_k2j5bt36bs'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_root_k2j5bt36bs"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch", "n", "root", "step", "__count")
      SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_square_input_qbcgxymh4m"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch", "n", "root", "step", "__count")
      SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch", "n", "root", "step", "__count")
      SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_fan_square_input_qbcgxymh4m"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_qbcgxymh4m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_fan_square_input_qbcgxymh4m'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" ("batch", "n", "root", "step", "__count")
        SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_qbcgxymh4m" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_eribsfky6x" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_step_eribsfky6x" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_step_eribsfky6x" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_eribsfky6x" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_eribsfky6x"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_step_eribsfky6x" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_step_eribsfky6x" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_step_eribsfky6x'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_step_eribsfky6x"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_within_pwsrdikydc"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_within_7xoagvzzet" ("kind" smallint, "parent" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_within_7xoagvzzet" ("kind", "parent", "root", "scope")
      SELECT "r1"."kind", "r1"."parent", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_within_7xoagvzzet" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_within_7xoagvzzet" ("kind" smallint, "parent" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_within_7xoagvzzet"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_fan_within_7xoagvzzet" ("kind", "parent", "root", "scope")
      SELECT "r1"."kind", "r1"."parent", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_within_7xoagvzzet" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_fan_within_7xoagvzzet'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_fan_within_7xoagvzzet"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_within_pwsrdikydc"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_brittle_input_nl76wgehgl"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_brittle_input_nl76wgehgl"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_retry_brittle_input_nl76wgehgl'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" ("key", "root", "step", "__count")
        SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_nl76wgehgl" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_done_gl4uribtvf"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_done_gl4uribtvf"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_gl4uribtvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_retry_done_gl4uribtvf'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_retry_done_gl4uribtvf" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_gl4uribtvf" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_failed_pqelqrzkgz"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_failed_pqelqrzkgz"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_pqelqrzkgz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_retry_failed_pqelqrzkgz'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_pqelqrzkgz" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle", "root", "scope", "steadfast", "__count")
      SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_ladders_input_wllyl2jqoh"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle", "root", "scope", "steadfast", "__count")
      SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle", "root", "scope", "steadfast", "__count")
      SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_ladders_input_wllyl2jqoh"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_retry_ladders_input_wllyl2jqoh'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" ("brittle", "root", "scope", "steadfast", "__count")
        SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_wllyl2jqoh" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_rhla2oyczu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_result_rhla2oyczu" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_result_rhla2oyczu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_rhla2oyczu" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_rhla2oyczu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_result_rhla2oyczu" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_result_rhla2oyczu" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_result_rhla2oyczu'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_result_rhla2oyczu"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_root_nujht4q2jp"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_root_b5qenyw22g" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_root_b5qenyw22g" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_root_b5qenyw22g" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_root_b5qenyw22g" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_root_b5qenyw22g"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_root_b5qenyw22g" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_root_b5qenyw22g" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_root_b5qenyw22g'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_root_b5qenyw22g"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_root_nujht4q2jp"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_steadfast_input_4le3o7ctyk"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_retry_steadfast_input_4le3o7ctyk"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_retry_steadfast_input_4le3o7ctyk'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" ("key", "root", "step", "__count")
        SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_4le3o7ctyk" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_step_gox3p6ldla"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_6cohs5hdw7"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_step_6cohs5hdw7" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_retry_step_6cohs5hdw7'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_retry_step_6cohs5hdw7"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_step_gox3p6ldla"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build", "root", "step", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_build_input_iz6gouj37l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build", "root", "step", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build", "root", "step", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_build_input_iz6gouj37l"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_iz6gouj37l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_build_input_iz6gouj37l'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" ("build", "root", "step", "__count")
        SELECT "r1"."build", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_iz6gouj37l" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation", "root", "run", "step", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_copy_input_thhapw3pvf"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation", "root", "run", "step", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation", "root", "run", "step", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_copy_input_thhapw3pvf"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_thhapw3pvf"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_copy_input_thhapw3pvf'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" ("relation", "root", "run", "step", "__count")
        SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_thhapw3pvf" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_done_5jpjleov7i"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_done_5jpjleov7i"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_5jpjleov7i"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_done_5jpjleov7i'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_done_5jpjleov7i" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_5jpjleov7i" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_failed_ntyxjjhl7h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_failed_ntyxjjhl7h"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_ntyxjjhl7h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_failed_ntyxjjhl7h'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" ("root", "step", "__count")
        SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_ntyxjjhl7h" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build", "root", "scope", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_gold_input_4uoos2vt25"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build" bigint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build", "root", "scope", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build", "root", "scope", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_gold_input_4uoos2vt25"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4uoos2vt25"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_gold_input_4uoos2vt25'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" ("build", "root", "scope", "__count")
        SELECT "r1"."build", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4uoos2vt25" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_result_led6m2o22r"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_oogmb2mroq" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_result_oogmb2mroq" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_result_oogmb2mroq" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_oogmb2mroq" ("outcome" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_oogmb2mroq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_result_oogmb2mroq" ("outcome", "root", "step")
      SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_result_oogmb2mroq" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_result_oogmb2mroq'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_result_oogmb2mroq"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_result_led6m2o22r"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_root_34gftivok2" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_root_34gftivok2" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_root_34gftivok2" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_root_34gftivok2" ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "retired" boolean, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_root_34gftivok2"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_root_34gftivok2" ("at", "key", "kind", "retired", "scope")
      SELECT "r1"."at", "r1"."key", "r1"."kind", "r1"."retired", "r1"."scope" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_root_34gftivok2" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_root_34gftivok2'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_root_34gftivok2"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_oj4vnywvws" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_step_oj4vnywvws" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_step_oj4vnywvws" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_oj4vnywvws" ("due" bigint, "kind" smallint, "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_oj4vnywvws"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_olds_sync_step_oj4vnywvws" ("due", "kind", "root", "scope", "step")
      SELECT "r1"."due", "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_step_oj4vnywvws" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_olds_sync_step_oj4vnywvws'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_olds_sync_step_oj4vnywvws"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP = 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation", "root", "run", "scope", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", 1::smallint FROM "news" AS "r1"
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_sync_run_input_osudnnsu7o"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'UPDATE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "news" AS "r4") THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__sentinel_53ts4wdrci" ("__written" "pg_catalog"."text"[]) ON COMMIT DELETE ROWS;
        CREATE CONSTRAINT TRIGGER "__sentinel_53ts4wdrci" AFTER INSERT ON "pg_temp"."__sentinel_53ts4wdrci" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_53ts4wdrci"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__sentinel_53ts4wdrci'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__sentinel_53ts4wdrci" ("__written")
      SELECT '{}'::"pg_catalog"."text"[] WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_53ts4wdrci" AS "r1")
      ;
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text")) THEN
        CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "run" bigint, "scope" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
      ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation", "root", "run", "scope", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
      ;
      INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation", "root", "run", "scope", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r3")
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r1") THEN
        UPDATE "pg_temp"."__sentinel_53ts4wdrci" AS "r2"
        SET "__written" = "r2"."__written" || '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text"
        WHERE NOT "r2"."__written" @> '{"__delta_news_sync_sync_run_input_osudnnsu7o"}'::"pg_catalog"."text"[]
        ;
      END IF;
    END IF;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "olds" AS "r4") THEN
      IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text")) THEN
        IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
          RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
            USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                  SCHEMA = 'pg_temp'::"pg_catalog"."text",
                  TABLE = '__delta_news_sync_sync_run_input_osudnnsu7o'::"pg_catalog"."text";
        END IF;
        INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" ("relation", "root", "run", "scope", "__count")
        SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_osudnnsu7o" AS "r3")
        ;
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"() FROM PUBLIC;

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_assignment_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_assignment_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_assignment_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_v4dsbpafdp"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_assignment_input_mode_nearest"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_assignment_input_mode_nearest"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_assignment_input_mode_nearest"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_cz7fec2bmo"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_assignment_input_mode_within"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_assignment_input_mode_within"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_assignment_input_mode_within"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_assignment_input_mode_within_zcwpiu2ek3"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_njdynt4fid"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_input_mode_nearest"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_input_mode_nearest"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_input_mode_nearest"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_wixai5r2vy"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_input_mode_within"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_input_mode_within"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_input_mode_within"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_input_mode_within_z4yiact3e2"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_output"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_output"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_output"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_ha3hhjgf66"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_output_stage_rest"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_output_stage_rest"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_output_stage_rest"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_rest_6zt5hnpimr"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_decide_output_stage_serve"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_decide_output_stage_serve"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_decide_output_stage_serve"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_decide_output_stage_serve_ksfwcs5uqr"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_done"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_done"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_done"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_failed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."assign_failed"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_failed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_result"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_result_3zix6jjqic"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_result"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_result_3zix6jjqic"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_root"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_root"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."assign_step"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_step_bxkkty5l67"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_step"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_step_bxkkty5l67"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_chain_run_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."chain_chain_run_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_chain_run_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_chain_run_input_22zniabfu6"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_done"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."chain_done"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_done"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_failed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."chain_failed"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_failed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_ordered_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."chain_ordered_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_ordered_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_ordered_input_gtvtheqcdu"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_page_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."chain_page_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_page_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_page_input_ct4d2gjnsb"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_result"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_result"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_root"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_root_3cootamwgf"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_root"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_root_3cootamwgf"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."chain_step"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_step"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_batch_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_batch_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_batch_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_batch_input_6csjqygwks"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_done"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_done"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_done"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_failed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_failed_ecscfsee25"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_failed"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_failed_ecscfsee25"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_failed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_failed_ecscfsee25"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_fan_run_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_fan_run_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_fan_run_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_fan_run_input_nhtoc6lxpa"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_freed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_freed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_hold"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_hold"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_hold"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_result"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_result_tevufz2c53"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_result"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_result_tevufz2c53"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_root"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_root"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_square_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."fan_square_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_square_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_step"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_step"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."fan_within"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_within_pwsrdikydc"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_within"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_within_pwsrdikydc"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_brittle_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."retry_brittle_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_brittle_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_done"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."retry_done"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_done"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_failed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."retry_failed"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_failed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_ladders_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."retry_ladders_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_ladders_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_ladders_input_omks52b5nc"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_result"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_result_oof7kiqgid"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_result"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_result_oof7kiqgid"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_root"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_root_nujht4q2jp"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_root"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_root_nujht4q2jp"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_steadfast_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."retry_steadfast_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_steadfast_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."retry_step"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_step_gox3p6ldla"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_step"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_step_gox3p6ldla"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_build_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_build_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_build_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_build_input_uauzzgsmyw"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_copy_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_copy_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_copy_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_copy_input_sm343um5xv"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_done"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_done"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_done"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_failed"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_failed"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_failed"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_gold_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_gold_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_gold_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_gold_input_tmd3fs2hx5"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_result"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_result_led6m2o22r"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_result"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_result_led6m2o22r"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_root"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_root"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_step"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_step_35gtwztkwz"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_step"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_step_35gtwztkwz"();

CREATE TRIGGER "__capture_delete"
  AFTER DELETE ON "slice"."sync_sync_run_input"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"();

CREATE TRIGGER "__capture_insert"
  AFTER INSERT ON "slice"."sync_sync_run_input"
  REFERENCING NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_sync_run_input"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_sync_run_input_foaz3a7y6q"();

-- The full violation query of law __fan_live_check_fan_seat_below_count_jcuojp5fnq.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r11"."c37", "r11"."c38", "r11"."c39", "r11"."c40", "r11"."c41" FROM (SELECT "r10"."c33", "r10"."c34", "r10"."c35", "r10"."c32", "r10"."c36" FROM (SELECT "r9"."c27", "r9"."c28", "r9"."c29", "r9"."c30", "r9"."c31" FROM (SELECT "r5"."c16", "r5"."c17", "r5"."c18", "r5"."c19", "r5"."c20" FROM (SELECT "r4"."c14", "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c15" FROM (SELECT "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c9", "r3"."c10" FROM (SELECT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10") WHERE CASE WHEN "r3"."c7" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r3"."c6" + 1, 1)::integer, 0) - 1 + 1] THEN false ELSE true END) AS "r4"("c11", "c12", "c13", "c14", "c15")) AS "r5"("c16", "c17", "c18", "c19", "c20") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c21", "r7"."c22", "r7"."c23" FROM (SELECT "r6"."resource", "r6"."seat", "r6"."turn" FROM "slice"."fan_freed" AS "r6") AS "r7"("c21", "c22", "c23")) AS "r8"("c24", "c25", "c26") WHERE "r8"."c24" = "r5"."c17" AND "r8"."c25" = "r5"."c18" AND "r8"."c26" = "r5"."c19")) AS "r9"("c27", "c28", "c29", "c30", "c31")) AS "r10"("c32", "c33", "c34", "c35", "c36")) AS "r11"("c37", "c38", "c39", "c40", "c41")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_live_check_fan_seat_below_count_jcuojp5fnq is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_live_check_fan_seat_below_count_jcuojp5fnq'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_in_assign_root_mklvt3wjts.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."assign_assignment_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."assign_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 0::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_in_assign_root_mklvt3wjts is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_in_assign_root_mklvt3wjts'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_mode_in_assign_assignment_eawcu4wa34.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "slice"."assign_assignment_input" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c4" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_mode_in_assign_assignment_eawcu4wa34 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_mode_in_assign_assignment_eawcu4wa34'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_mode_in_assign_assignment_v5nciwm3f3.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "slice"."assign_assignment_input" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c4" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_mode_in_assign_assignment_v5nciwm3f3 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_mode_in_assign_assignment_v5nciwm3f3'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_mode_nearest_in_assign_ttnyfcvx45.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "slice"."assign_assignment_input" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_mode_nearest_in_assign_ttnyfcvx45 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_mode_nearest_in_assign_ttnyfcvx45'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_mode_within_in_assign_3jwws6qm6z.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "slice"."assign_assignment_input" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_mode_within_in_assign_3jwws6qm6z is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_mode_within_in_assign_3jwws6qm6z'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_input_in_assign_step_p6wiyiis6o.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_decide_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."assign_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_input_in_assign_step_p6wiyiis6o is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_input_in_assign_step_p6wiyiis6o'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_input_mode_in_assign_decide_input_wr5lzyfmsd.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "slice"."assign_decide_input" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c4" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_input_mode_in_assign_decide_input_wr5lzyfmsd is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_input_mode_in_assign_decide_input_wr5lzyfmsd'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_input_mode_in_assign_decide_input_f7egwqxrav.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "slice"."assign_decide_input" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c4" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "slice"."assign_decide_input_mode_within" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_input_mode_in_assign_decide_input_f7egwqxrav is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_input_mode_in_assign_decide_input_f7egwqxrav'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_input_mode_nearest_in_assign_decide_smrv46ffer.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "slice"."assign_decide_input" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_input_mode_nearest_in_assign_decide_smrv46ffer is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_input_mode_nearest_in_assign_decide_smrv46ffer'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_input_mode_within_in_assign_decide_swubxjs4jd.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_decide_input_mode_within" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "slice"."assign_decide_input" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_input_mode_within_in_assign_decide_swubxjs4jd is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_input_mode_within_in_assign_decide_swubxjs4jd'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_output_stage_in_assign_decide_output_bcnqwwsctk.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c7" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "slice"."assign_decide_output" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c5" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_output_stage_in_assign_decide_output_bcnqwwsctk is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_output_stage_in_assign_decide_output_bcnqwwsctk'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_output_stage_in_assign_decide_output_kt2tjmhz7m.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c16", "r9"."c17" FROM (SELECT "r5"."c10", "r5"."c11" FROM (SELECT "r4"."c9", "r4"."c7" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "slice"."assign_decide_output" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c5" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15") WHERE "r8"."c14" = "r5"."c10" AND "r8"."c15" = "r5"."c11")) AS "r9"("c16", "c17")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_output_stage_in_assign_decide_output_kt2tjmhz7m is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_output_stage_in_assign_decide_output_kt2tjmhz7m'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_output_stage_rest_in_assign_decide_jaarn2q5oi.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "slice"."assign_decide_output" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_output_stage_rest_in_assign_decide_jaarn2q5oi is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_output_stage_rest_in_assign_decide_jaarn2q5oi'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_decide_output_stage_serve_in_assign_decide_s5dp3ai4wj.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "slice"."assign_decide_output" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_decide_output_stage_serve_in_assign_decide_s5dp3ai4wj is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_decide_output_stage_serve_in_assign_decide_s5dp3ai4wj'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_done_in_assign_result_ugagfnjgmb.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_done" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."assign_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_done_in_assign_result_ugagfnjgmb is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_done_in_assign_result_ugagfnjgmb'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_failed_in_assign_result_nnngibpxsc.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."assign_failed" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."assign_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_failed_in_assign_result_nnngibpxsc is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_failed_in_assign_result_nnngibpxsc'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_chain_run_input_in_chain_root_6kgstyioeo.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."chain_chain_run_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."chain_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 0::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_chain_run_input_in_chain_root_6kgstyioeo is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_chain_run_input_in_chain_root_6kgstyioeo'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_done_in_chain_result_hxnxjn4nw3.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."chain_done" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."chain_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_done_in_chain_result_hxnxjn4nw3 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_done_in_chain_result_hxnxjn4nw3'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_failed_in_chain_result_vya3y24kt7.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."chain_failed" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."chain_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_failed_in_chain_result_vya3y24kt7 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_failed_in_chain_result_vya3y24kt7'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_ordered_input_in_chain_root_5vqqezuzu4.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."chain_ordered_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."chain_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 1::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_ordered_input_in_chain_root_5vqqezuzu4 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_ordered_input_in_chain_root_5vqqezuzu4'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_page_input_in_chain_step_vnrubtwikd.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."chain_page_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."chain_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_page_input_in_chain_step_vnrubtwikd is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_page_input_in_chain_step_vnrubtwikd'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_batch_input_in_fan_within_sx7cuovskn.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."fan_batch_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "slice"."fan_within" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_batch_input_in_fan_within_sx7cuovskn is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_batch_input_in_fan_within_sx7cuovskn'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_done_in_fan_result_guvpmso3xz.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."fan_done" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."fan_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_done_in_fan_result_guvpmso3xz is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_done_in_fan_result_guvpmso3xz'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_failed_in_fan_result_2a7325eu5t.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."fan_failed" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."fan_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_failed_in_fan_result_2a7325eu5t is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_failed_in_fan_result_2a7325eu5t'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_fan_run_input_in_fan_root_z6cpi2vcoy.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."fan_fan_run_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."fan_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 0::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_fan_run_input_in_fan_root_z6cpi2vcoy is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_fan_run_input_in_fan_root_z6cpi2vcoy'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_square_input_in_fan_step_iv7dg4jma2.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."fan_square_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."fan_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_square_input_in_fan_step_iv7dg4jma2 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_square_input_in_fan_step_iv7dg4jma2'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_brittle_input_in_retry_step_ooialzszq4.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."retry_brittle_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."retry_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_brittle_input_in_retry_step_ooialzszq4 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_brittle_input_in_retry_step_ooialzszq4'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_done_in_retry_result_yeyzwj6db7.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."retry_done" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."retry_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_done_in_retry_result_yeyzwj6db7 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_done_in_retry_result_yeyzwj6db7'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_failed_in_retry_result_kdzwljgaeg.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."retry_failed" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."retry_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_failed_in_retry_result_kdzwljgaeg is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_failed_in_retry_result_kdzwljgaeg'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_ladders_input_in_retry_root_jbqul573mm.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."retry_ladders_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."retry_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 0::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_ladders_input_in_retry_root_jbqul573mm is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_ladders_input_in_retry_root_jbqul573mm'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_steadfast_input_in_retry_step_hx2xvxlsob.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."retry_steadfast_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."retry_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_steadfast_input_in_retry_step_hx2xvxlsob is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_steadfast_input_in_retry_step_hx2xvxlsob'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_build_input_in_sync_step_j6s5xq65os.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."sync_build_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."sync_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_build_input_in_sync_step_j6s5xq65os is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_build_input_in_sync_step_j6s5xq65os'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_copy_input_in_sync_step_nhvrrom3pv.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."sync_copy_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "slice"."sync_step" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_copy_input_in_sync_step_nhvrrom3pv is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_copy_input_in_sync_step_nhvrrom3pv'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_done_in_sync_result_tswlqm7hu6.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."sync_done" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."sync_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_done_in_sync_result_tswlqm7hu6 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_done_in_sync_result_tswlqm7hu6'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_failed_in_sync_result_f4xswckcbg.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c18", "r10"."c19" FROM (SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c4", "r3"."c3" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."step" FROM "slice"."sync_failed" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "slice"."sync_result" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17") WHERE "r9"."c16" = "r4"."c5" AND "r9"."c17" = "r4"."c6")) AS "r10"("c18", "c19")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_failed_in_sync_result_f4xswckcbg is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_failed_in_sync_result_f4xswckcbg'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_gold_input_in_sync_root_wntzudbkdm.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."sync_gold_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."sync_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 0::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_gold_input_in_sync_root_wntzudbkdm is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_gold_input_in_sync_root_wntzudbkdm'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_sync_run_input_in_sync_root_qadsh2ioyk.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r10"."c12" FROM (SELECT DISTINCT "r4"."c4" FROM (SELECT "r3"."c3" FROM (SELECT "r2"."c2" FROM (SELECT "r1"."root", "r1"."scope" FROM "slice"."sync_sync_run_input" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3")) AS "r4"("c4") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r8"."c9" FROM (SELECT "r7"."c7", "r7"."c8" FROM (SELECT "r6"."c6", "r6"."c5" FROM (SELECT "r5"."kind", "r5"."scope" FROM "slice"."sync_root" AS "r5") AS "r6"("c5", "c6")) AS "r7"("c7", "c8") WHERE "r7"."c8" = 1::smallint) AS "r8"("c9", "c10")) AS "r9"("c11") WHERE "r9"."c11" = "r4"."c4")) AS "r10"("c12")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_sync_run_input_in_sync_root_qadsh2ioyk is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_sync_run_input_in_sync_root_qadsh2ioyk'::"pg_catalog"."text";
  END IF;
END
$$;
