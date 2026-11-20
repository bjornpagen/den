CREATE OR REPLACE FUNCTION "slice"."__judge_assign_assignment_input_mfctsotkjq"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_assignment_input_lw7cfgfvnr"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root", "r2"."mode") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root", "r2"."mode" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_scope_zqoacqpyux"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_scope_zqoacqpyux'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh","__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr","__delta_olds_assign_scope_zqoacqpyux"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_assignment_input_lw7cfgfvnr"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_scope_zqoacqpyux"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr","__delta_olds_assign_scope_zqoacqpyux"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."assign_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_in_assign_scope_rgmqtdjqzy'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr","__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_in_assign_spa2ewu36p'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr","__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_assignment_input_mfctsotkjq"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_gp4j43rmv4"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_assignment_input_khx4kjmyw6'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p","__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p","__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input_mode_nearest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."scope" FROM "slice"."assign_assignment_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_assignment_input_mode_nearest_in_d6kzlau6ya'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_assignment_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr","__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."assign_assignment_input_mode_within" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."scope" FROM "slice"."assign_assignment_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_gp4j43rmv4"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_input_cttk45jphq"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_decide_input_qayviv5irl"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."mode") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."mode" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_input_mode_nearest_ltccebku3q'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_input_mode_within_4lmirwj4hj'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_step_hjrcusfxfw"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_step_hjrcusfxfw'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_input_mode_nearest_ltccebku3q","__delta_olds_assign_decide_input_mode_within_4lmirwj4hj","__delta_olds_assign_step_hjrcusfxfw"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_input_qayviv5irl"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_step_hjrcusfxfw"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl","__delta_olds_assign_step_hjrcusfxfw"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."assign_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_in_assign_step_alw775jwbe'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl","__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_input_mode_within" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_in_assign_decide_a4fqevvlsj'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_qayviv5irl","__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c2", "r2"."c1" FROM (SELECT "r1"."mode", "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c22", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."mode", "r12"."root", "r12"."step" FROM "slice"."assign_decide_input" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c23" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_input_cttk45jphq"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_fx5bcrc2ao"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_decide_input_mode_nearest_iyocyinsng"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_assign_decide_input_mode_within_nflxraui6u"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_input_mmhrf72g5k'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_input_mode_nearest_iyocyinsng"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_input_mode_within_nflxraui6u"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_mode_nearest_iyocyinsng","__delta_news_assign_decide_input_mode_within_nflxraui6u"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_mode_nearest_iyocyinsng","__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input_mode_nearest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."step" FROM "slice"."assign_decide_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_input_mode_nearest_in_assign_iuixfzpvg7'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_input_mode_within_nflxraui6u","__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."mode", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_input_mode_within" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."mode", "r16"."root", "r16"."step" FROM "slice"."assign_decide_input" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_fx5bcrc2ao"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_output_mppefsithx"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_decide_output_xcqzeb6a2h"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."stage") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root", "r2"."stage" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_output_stage_rest_lohip5o2bv'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_output_stage_serve_a6x4rdivod'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_output_stage_rest_lohip5o2bv","__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_output_xcqzeb6a2h"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_xcqzeb6a2h"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_xcqzeb6a2h"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_xcqzeb6a2h","__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 1::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c23", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."stage", "r12"."step" FROM "slice"."assign_decide_output" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 1::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_in_assign_decide_d2rdvy7xmi'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_xcqzeb6a2h","__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r22"."c43", "r22"."c44" FROM (SELECT "r11"."c20", "r11"."c21", "r21"."c39", "r21"."c40" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r5"."c10"::"pg_catalog"."uuid", "r5"."c11"::"pg_catalog"."uuid" FROM (SELECT "r4"."c7", "r4"."c8" FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c3", "r2"."c1", "r2"."c2" FROM (SELECT "r1"."root", "r1"."stage", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6") WHERE "r3"."c6" = 0::smallint) AS "r4"("c7", "c8", "c9")) AS "r5"("c10", "c11") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c14", "r8"."c15" FROM (SELECT "r7"."c13", "r7"."c12" FROM (SELECT "r6"."root", "r6"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" AS "r6") AS "r7"("c12", "c13")) AS "r8"("c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r20"."c37", "r20"."c38" FROM (SELECT "r16"."c31", "r16"."c32" FROM (SELECT "r15"."c29", "r15"."c30" FROM (SELECT "r14"."c25", "r14"."c26", "r14"."c27" FROM (SELECT "r13"."c23", "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."stage", "r12"."step" FROM "slice"."assign_decide_output" AS "r12") AS "r13"("c22", "c23", "c24") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c24" = "r11"."c20") AS "r14"("c25", "c26", "c27") WHERE "r14"."c25" = 0::smallint) AS "r15"("c28", "c29", "c30")) AS "r16"("c31", "c32") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r18"."c34", "r18"."c33" FROM (SELECT "r17"."root", "r17"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r17") AS "r18"("c33", "c34")) AS "r19"("c35", "c36") WHERE "r19"."c35" = "r16"."c31" AND "r19"."c36" = "r16"."c32")) AS "r20"("c37", "c38") OFFSET 0) AS "r21"("c39", "c40")) AS "r22"("c41", "c42", "c43", "c44")) AS "r23"("c45", "c46")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_output_mppefsithx"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_decide_output_stage_rest_qlbend26ms"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_decide_output_stage_rest_6oiwwudavz"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_decide_output_kpd5rn2m2r'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_output_stage_rest_6oiwwudavz"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_stage_rest_6oiwwudavz","__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_stage_rest_6oiwwudavz","__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_output_stage_rest" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c28", "r17"."c29" FROM (SELECT "r16"."root", "r16"."stage", "r16"."step" FROM "slice"."assign_decide_output" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_decide_output_stage_rest_in_assign_yuewy7ndin'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_decide_output'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_decide_output_stage_serve_spw2gnwa7l","__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c7", "r6"."c8" FROM (SELECT "r5"."root", "r5"."stage", "r5"."step" FROM "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_decide_output_stage_serve" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c28", "r17"."c29" FROM (SELECT "r16"."root", "r16"."stage", "r16"."step" FROM "slice"."assign_decide_output" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_qlbend26ms"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_assign_done_uvgox4xms6"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_assign_done_zrcj6hmzzp"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_assign_failed_zmmymz64np"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r1") THEN
        "__written" := "__written" || '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_assign_result_ltrbxqrcde'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_done_zrcj6hmzzp"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_assign_failed_zmmymz64np"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_done_zrcj6hmzzp","__delta_news_assign_failed_zmmymz64np"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_done_zrcj6hmzzp","__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."assign_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_assign_done_in_assign_result_mccxlev75g'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'assign_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_assign_failed_zmmymz64np","__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."assign_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."assign_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_assign_done_uvgox4xms6"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_chain_run_input_6af3rz27sb"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_chain_chain_run_input_kn6uczzewn"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r1") THEN
        "__written" := "__written" || '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_chain_ordered_input_jcbr362nhm"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r1") THEN
        "__written" := "__written" || '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_chain_scope_27r3qyqi3x'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_chain_chain_run_input_kn6uczzewn"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_chain_ordered_input_jcbr362nhm"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_chain_run_input_kn6uczzewn","__delta_news_chain_ordered_input_jcbr362nhm"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_chain_run_input_kn6uczzewn","__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."chain_chain_run_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."chain_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_chain_run_input_in_chain_scope_h2pixcl54v'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_chain_run_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_ordered_input_jcbr362nhm","__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."chain_ordered_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."chain_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_ordered_input_in_chain_scope_bqv2e66aiu'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_ordered_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_chain_run_input_6af3rz27sb"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_done_dlqjjysn3f"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_chain_done_xz7j62xv2p"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r1") THEN
        "__written" := "__written" || '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_chain_failed_rw3b32rl3b"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r1") THEN
        "__written" := "__written" || '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_chain_result_c2y4qs76iu'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_chain_done_xz7j62xv2p"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_chain_failed_rw3b32rl3b"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_done_xz7j62xv2p","__delta_news_chain_failed_rw3b32rl3b"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_done_xz7j62xv2p","__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."chain_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_chain_done_in_chain_result_wo66ka6omy'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'chain_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_failed_rw3b32rl3b","__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."chain_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_done_dlqjjysn3f"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_chain_page_input_uxsnjvp5zl"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_chain_page_input_sek6i5g4fk"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r1") THEN
        "__written" := "__written" || '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_chain_step_5m7qppvk4p"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_chain_step_5m7qppvk4p'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_chain_step_5m7qppvk4p"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_chain_page_input_sek6i5g4fk"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "seq" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_page_input_sek6i5g4fk"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_chain_step_5m7qppvk4p"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_chain_page_input_sek6i5g4fk","__delta_olds_chain_step_5m7qppvk4p"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."chain_page_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."chain_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_chain_page_input_uxsnjvp5zl"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_batch_input_mrbtecwoza"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_fan_batch_input_ankhpanyaq"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_fan_fan_run_input_vbsdow3wli"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_fan_scope_2tqhhriuii'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_batch_input_ankhpanyaq"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_fan_run_input_vbsdow3wli"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_batch_input_ankhpanyaq","__delta_news_fan_fan_run_input_vbsdow3wli"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_batch_input_ankhpanyaq","__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."fan_batch_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."fan_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_batch_input_in_fan_scope_oqskhg76dt'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_batch_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_fan_run_input_vbsdow3wli","__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."fan_fan_run_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."fan_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_fan_run_input_in_fan_scope_teyj3a5mwv'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_fan_run_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_batch_input_mrbtecwoza"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_done_mflioj3j23"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_fan_done_zdcqqeht75"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_fan_failed_2zywggd5jt"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_result_fuazpryl5h" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_fan_result_fuazpryl5h'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_done_zdcqqeht75"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_failed_2zywggd5jt"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_done_zdcqqeht75","__delta_news_fan_failed_2zywggd5jt"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_fuazpryl5h" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_done_zdcqqeht75","__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_result_fuazpryl5h" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."fan_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_done_in_fan_result_dbzlqmyfjm'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'fan_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_failed_2zywggd5jt","__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_result_fuazpryl5h" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."fan_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_done_mflioj3j23"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_hold_hkncojanio"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_fan_hold_p5mgeiywqn"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."resource", "r2"."seat", "r2"."turn", "r2"."holder", "r2"."until" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_hold_p5mgeiywqn"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" ("holder" "pg_catalog"."uuid", "resource" smallint, "seat" bigint, "turn" bigint, "until" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_hold_p5mgeiywqn"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" ("resource" smallint, "seat" bigint, "turn" bigint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_freed_mwml6ea3za","__delta_news_fan_hold_p5mgeiywqn"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c79", "r24"."c80", "r24"."c81", "r24"."c82", "r24"."c83" FROM (SELECT "r23"."c74", "r23"."c75", "r23"."c76", "r23"."c77", "r23"."c78" FROM (SELECT "r10"."c22", "r10"."c23", "r10"."c24", "r22"."c66", "r22"."c67", "r22"."c68", "r22"."c69", "r22"."c70" FROM (SELECT "r9"."c19", "r9"."c20", "r9"."c21" FROM ((SELECT "r4"."c7", "r4"."c8"::bigint, "r4"."c9"::bigint FROM (SELECT "r3"."c4", "r3"."c5", "r3"."c6" FROM (SELECT "r2"."c1", "r2"."c2", "r2"."c3" FROM (SELECT "r1"."resource", "r1"."seat", "r1"."turn" FROM "pg_temp"."__delta_news_fan_hold_p5mgeiywqn" AS "r1") AS "r2"("c1", "c2", "c3")) AS "r3"("c4", "c5", "c6")) AS "r4"("c7", "c8", "c9") UNION SELECT "r8"."c16", "r8"."c17"::bigint, "r8"."c18"::bigint FROM (SELECT "r7"."c13", "r7"."c14", "r7"."c15" FROM (SELECT "r6"."c10", "r6"."c11", "r6"."c12" FROM (SELECT "r5"."resource", "r5"."seat", "r5"."turn" FROM "pg_temp"."__delta_olds_fan_freed_mwml6ea3za" AS "r5") AS "r6"("c10", "c11", "c12")) AS "r7"("c13", "c14", "c15")) AS "r8"("c16", "c17", "c18"))) AS "r9"("c19", "c20", "c21") OFFSET 0) AS "r10"("c22", "c23", "c24"), LATERAL (SELECT "r21"."c61", "r21"."c62", "r21"."c63", "r21"."c64", "r21"."c65" FROM (SELECT "r20"."c58", "r20"."c59", "r20"."c60", "r20"."c56", "r20"."c57" FROM (SELECT "r19"."c51", "r19"."c52", "r19"."c53", "r19"."c54", "r19"."c55" FROM (SELECT "r18"."c46", "r18"."c50", "r10"."c22", "r10"."c23", "r10"."c24" FROM (SELECT "r14"."c35", "r14"."c36", "r14"."c37", "r14"."c38", "r14"."c39" FROM (SELECT "r13"."c33", "r13"."c30", "r13"."c31", "r13"."c32", "r13"."c34" FROM (SELECT "r12"."c26", "r12"."c27", "r12"."c28", "r12"."c25", "r12"."c29" FROM (SELECT "r11"."holder", "r11"."resource", "r11"."seat", "r11"."turn", "r11"."until" FROM "slice"."fan_hold" AS "r11") AS "r12"("c25", "c26", "c27", "c28", "c29")) AS "r13"("c30", "c31", "c32", "c33", "c34")) AS "r14"("c35", "c36", "c37", "c38", "c39") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r16"."c40", "r16"."c41", "r16"."c42" FROM (SELECT "r15"."resource", "r15"."seat", "r15"."turn" FROM "slice"."fan_freed" AS "r15") AS "r16"("c40", "c41", "c42")) AS "r17"("c43", "c44", "c45") WHERE "r17"."c43" = "r14"."c36" AND "r17"."c44" = "r14"."c37" AND "r17"."c45" = "r14"."c38")) AS "r18"("c46", "c47", "c48", "c49", "c50") WHERE "r18"."c47" = "r10"."c22" AND "r18"."c48" = "r10"."c23" AND "r18"."c49" = "r10"."c24") AS "r19"("c51", "c52", "c53", "c54", "c55") WHERE CASE WHEN "r19"."c54" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r19"."c53" + 1, 1)::integer, 0) - 1 + 1] THEN false ELSE true END) AS "r20"("c56", "c57", "c58", "c59", "c60")) AS "r21"("c61", "c62", "c63", "c64", "c65") OFFSET 0) AS "r22"("c66", "c67", "c68", "c69", "c70")) AS "r23"("c71", "c72", "c73", "c74", "c75", "c76", "c77", "c78")) AS "r24"("c79", "c80", "c81", "c82", "c83")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_hold_hkncojanio"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_fan_square_input_stnzlfwyid"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_fan_square_input_hannxhtrcg"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r1") THEN
        "__written" := "__written" || '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_fan_step_bdikknewds"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_fan_step_bdikknewds" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_fan_step_bdikknewds'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_fan_step_bdikknewds"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_fan_square_input_hannxhtrcg"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_square_input_hannxhtrcg"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_fan_step_bdikknewds"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_bdikknewds" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_fan_square_input_hannxhtrcg","__delta_olds_fan_step_bdikknewds"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_fan_step_bdikknewds" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."fan_square_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."fan_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_fan_square_input_stnzlfwyid"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_brittle_input_z4jbgcxtaw"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_retry_brittle_input_zyzzsijlvi"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r1") THEN
        "__written" := "__written" || '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_retry_steadfast_input_24jog73c7m"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r1") THEN
        "__written" := "__written" || '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_retry_step_wq34lpx5y3'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_retry_brittle_input_zyzzsijlvi"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_retry_steadfast_input_24jog73c7m"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_brittle_input_zyzzsijlvi","__delta_news_retry_steadfast_input_24jog73c7m"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_brittle_input_zyzzsijlvi","__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_brittle_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."retry_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_brittle_input_in_retry_step_ayhgze3rfy'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_brittle_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_steadfast_input_24jog73c7m","__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 2::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_steadfast_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."retry_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 2::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_brittle_input_z4jbgcxtaw"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_done_qvurptzp5o"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_retry_done_bvmq7mg4tw"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r1") THEN
        "__written" := "__written" || '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_retry_failed_ouf7jeazd5"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r1") THEN
        "__written" := "__written" || '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_retry_result_vgpzb7irxx'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_retry_done_bvmq7mg4tw"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_retry_failed_ouf7jeazd5"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_done_bvmq7mg4tw","__delta_news_retry_failed_ouf7jeazd5"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_done_bvmq7mg4tw","__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."retry_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_done_in_retry_result_cluafk7ckl'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_failed_ouf7jeazd5","__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."retry_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."retry_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_done_qvurptzp5o"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_retry_ladders_input_3c7y32vdti"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_retry_ladders_input_r267sjjms6"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r1") THEN
        "__written" := "__written" || '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_retry_scope_ee3njtef5r"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_retry_scope_ee3njtef5r'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_retry_scope_ee3njtef5r"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_retry_ladders_input_r267sjjms6"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_ladders_input_r267sjjms6"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_retry_scope_ee3njtef5r"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_retry_ladders_input_r267sjjms6","__delta_olds_retry_scope_ee3njtef5r"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."retry_ladders_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."retry_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_retry_ladders_input_in_retry_scope_4iwv2r2ity'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'retry_ladders_input'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_retry_ladders_input_3c7y32vdti"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_build_input_bqat4atnho"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_sync_build_input_y2kmchrx43"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_sync_copy_input_fsjrueonz3"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_sync_step_nqm6emzmzn'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_build_input_y2kmchrx43"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_copy_input_fsjrueonz3"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_build_input_y2kmchrx43","__delta_news_sync_copy_input_fsjrueonz3"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_build_input_y2kmchrx43","__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_build_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."sync_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_build_input_in_sync_step_n7adainwnp'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_build_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_copy_input_fsjrueonz3","__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_copy_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."step" FROM "slice"."sync_step" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_build_input_bqat4atnho"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_done_aojyv7p4ap"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_sync_done_zk36v55j5b"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_sync_failed_cx6wsiesyx"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."step", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."step", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_sync_result_s33bt3lj5g'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_done_zk36v55j5b"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_failed_cx6wsiesyx"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_done_zk36v55j5b","__delta_news_sync_failed_cx6wsiesyx"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_done_zk36v55j5b","__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_done" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."sync_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_done_in_sync_result_vbj33bqeiu'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_done'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_failed_cx6wsiesyx","__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."step" FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."outcome", "r5"."root", "r5"."step" FROM "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."step" FROM "slice"."sync_failed" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."outcome", "r16"."root", "r16"."step" FROM "slice"."sync_result" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
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

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_done_aojyv7p4ap"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge_sync_gold_input_qcj64en4sx"("__held" "pg_catalog"."text"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__written" "pg_catalog"."text"[];
BEGIN
  "__written" := '{}'::"pg_catalog"."text"[];
  IF "__held" @> '{"__delta_news_sync_gold_input_4tvuzpo7yp"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_news_sync_sync_run_input_dafcymdmlh"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r1") THEN
      DELETE FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r1"
      WHERE "r1"."ctid" IN (SELECT "r3"."c1" FROM (SELECT "r2"."ctid" AS "c1", "pg_catalog"."sum"("r2"."__count") OVER (PARTITION BY "r2"."scope", "r2"."root") AS "c2", "pg_catalog"."row_number"() OVER (PARTITION BY "r2"."scope", "r2"."root" ORDER BY "r2"."__count" DESC) AS "c3" FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r2") AS "r3"("c1", "c2", "c3") WHERE "r3"."c2" <= 0::bigint OR "r3"."c3" > 1::bigint)
      ;
      IF EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r1") THEN
        "__written" := "__written" || '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text";
      END IF;
    END IF;
  END IF;
  IF "__held" @> '{"__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    IF EXISTS (SELECT FROM "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" AS "r1") THEN
      "__written" := "__written" || '__delta_olds_sync_scope_vzbfllajyc'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_gold_input_4tvuzpo7yp"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_news_sync_sync_run_input_dafcymdmlh"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_gold_input_4tvuzpo7yp","__delta_news_sync_sync_run_input_dafcymdmlh"}'::"pg_catalog"."text"[] THEN
    IF NOT "__held" @> '{"__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_gold_input_4tvuzpo7yp","__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 0::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."sync_gold_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."sync_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 0::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_gold_input_in_sync_scope_3rmhvd7ytq'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_gold_input'::"pg_catalog"."text";
    END IF;
  END IF;
  IF "__written" && '{"__delta_news_sync_sync_run_input_dafcymdmlh","__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    PERFORM 1 FROM (SELECT "r24"."c47", "r24"."c48" FROM (SELECT "r23"."c45", "r23"."c46" FROM (SELECT "r11"."c20", "r11"."c21", "r22"."c41", "r22"."c42" FROM (SELECT "r10"."c18", "r10"."c19" FROM ((SELECT "r4"."c5"::"pg_catalog"."uuid", "r4"."c6"::"pg_catalog"."uuid" FROM (SELECT "r3"."c3", "r3"."c4" FROM (SELECT "r2"."c2", "r2"."c1" FROM (SELECT "r1"."root", "r1"."scope" FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6") UNION SELECT "r9"."c16"::"pg_catalog"."uuid", "r9"."c17"::"pg_catalog"."uuid" FROM (SELECT "r8"."c13", "r8"."c14" FROM (SELECT "r7"."c10", "r7"."c11", "r7"."c12" FROM (SELECT "r6"."c9", "r6"."c8", "r6"."c7" FROM (SELECT "r5"."kind", "r5"."root", "r5"."scope" FROM "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" AS "r5") AS "r6"("c7", "c8", "c9")) AS "r7"("c10", "c11", "c12") WHERE "r7"."c12" = 1::smallint) AS "r8"("c13", "c14", "c15")) AS "r9"("c16", "c17"))) AS "r10"("c18", "c19") OFFSET 0) AS "r11"("c20", "c21"), LATERAL (SELECT "r21"."c39", "r21"."c40" FROM (SELECT "r15"."c26", "r15"."c27" FROM (SELECT "r14"."c24", "r14"."c25" FROM (SELECT "r11"."c20", "r11"."c21" FROM (SELECT "r12"."root", "r12"."scope" FROM "slice"."sync_sync_run_input" AS "r12") AS "r13"("c22", "c23") WHERE "r13"."c22" = "r11"."c21" AND "r13"."c23" = "r11"."c20") AS "r14"("c24", "c25")) AS "r15"("c26", "c27") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r19"."c34", "r19"."c35" FROM (SELECT "r18"."c31", "r18"."c32", "r18"."c33" FROM (SELECT "r17"."c30", "r17"."c29", "r17"."c28" FROM (SELECT "r16"."kind", "r16"."root", "r16"."scope" FROM "slice"."sync_scope" AS "r16") AS "r17"("c28", "c29", "c30")) AS "r18"("c31", "c32", "c33") WHERE "r18"."c33" = 1::smallint) AS "r19"("c34", "c35", "c36")) AS "r20"("c37", "c38") WHERE "r20"."c37" = "r15"."c26" AND "r20"."c38" = "r15"."c27")) AS "r21"("c39", "c40") OFFSET 0) AS "r22"("c41", "c42")) AS "r23"("c43", "c44", "c45", "c46")) AS "r24"("c47", "c48")) AS "found";
    IF FOUND THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'foreign_key_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_sync_sync_run_input_in_sync_scope_4z7ete6flg'::"pg_catalog"."text",
              SCHEMA = 'slice'::"pg_catalog"."text",
              TABLE = 'sync_scope'::"pg_catalog"."text";
    END IF;
  END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__judge_sync_gold_input_qcj64en4sx"("pg_catalog"."text"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__judge"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "__foreign" "pg_catalog"."text";
  "__held" "pg_catalog"."text"[];
BEGIN
  DELETE FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1"
  ;
  FOR "__foreign" IN SELECT "r1"."relname"::"pg_catalog"."text" AS "c1" FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."relnamespace" = "pg_catalog"."pg_my_temp_schema"() AND "r1"."relname"::"pg_catalog"."text" IN ('__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text", '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text", '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text", '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text", '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text", '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text", '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text", '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text", '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text", '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text", '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text", '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text", '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text", '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text", '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text", '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text", '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text", '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text", '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text", '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text", '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text", '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text", '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text", '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text", '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text", '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text", '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text", '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text", '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text", '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text", '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text", '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text", '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_khx4kjmyw6'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mmhrf72g5k'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mode_nearest_ltccebku3q'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mode_within_4lmirwj4hj'::"pg_catalog"."text", '__delta_olds_assign_decide_output_kpd5rn2m2r'::"pg_catalog"."text", '__delta_olds_assign_decide_output_stage_rest_lohip5o2bv'::"pg_catalog"."text", '__delta_olds_assign_decide_output_stage_serve_a6x4rdivod'::"pg_catalog"."text", '__delta_olds_assign_result_ltrbxqrcde'::"pg_catalog"."text", '__delta_olds_assign_scope_zqoacqpyux'::"pg_catalog"."text", '__delta_olds_assign_step_hjrcusfxfw'::"pg_catalog"."text", '__delta_olds_chain_result_c2y4qs76iu'::"pg_catalog"."text", '__delta_olds_chain_scope_27r3qyqi3x'::"pg_catalog"."text", '__delta_olds_chain_step_5m7qppvk4p'::"pg_catalog"."text", '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text", '__delta_olds_fan_result_fuazpryl5h'::"pg_catalog"."text", '__delta_olds_fan_scope_2tqhhriuii'::"pg_catalog"."text", '__delta_olds_fan_step_bdikknewds'::"pg_catalog"."text", '__delta_olds_retry_result_vgpzb7irxx'::"pg_catalog"."text", '__delta_olds_retry_scope_ee3njtef5r'::"pg_catalog"."text", '__delta_olds_retry_step_wq34lpx5y3'::"pg_catalog"."text", '__delta_olds_sync_result_s33bt3lj5g'::"pg_catalog"."text", '__delta_olds_sync_scope_vzbfllajyc'::"pg_catalog"."text", '__delta_olds_sync_step_nqm6emzmzn'::"pg_catalog"."text") AND NOT ("pg_catalog"."pg_get_userbyid"("r1"."relowner") = CURRENT_USER AND "r1"."relpersistence" = 't'::"pg_catalog"."text") ORDER BY "r1"."relname"::"pg_catalog"."text" LOOP
    RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
      USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
            SCHEMA = 'pg_temp'::"pg_catalog"."text",
            TABLE = "__foreign";
  END LOOP;
  "__held" := ARRAY(SELECT "r1"."relname"::"pg_catalog"."text" AS "c1" FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."relnamespace" = "pg_catalog"."pg_my_temp_schema"() AND "r1"."relname"::"pg_catalog"."text" IN ('__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text", '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text", '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text", '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text", '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text", '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text", '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text", '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text", '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text", '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text", '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text", '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text", '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text", '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text", '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text", '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text", '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text", '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text", '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text", '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text", '__delta_news_fan_hold_p5mgeiywqn'::"pg_catalog"."text", '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text", '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text", '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text", '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text", '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text", '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text", '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text", '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text", '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text", '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text", '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text", '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_khx4kjmyw6'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh'::"pg_catalog"."text", '__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mmhrf72g5k'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mode_nearest_ltccebku3q'::"pg_catalog"."text", '__delta_olds_assign_decide_input_mode_within_4lmirwj4hj'::"pg_catalog"."text", '__delta_olds_assign_decide_output_kpd5rn2m2r'::"pg_catalog"."text", '__delta_olds_assign_decide_output_stage_rest_lohip5o2bv'::"pg_catalog"."text", '__delta_olds_assign_decide_output_stage_serve_a6x4rdivod'::"pg_catalog"."text", '__delta_olds_assign_result_ltrbxqrcde'::"pg_catalog"."text", '__delta_olds_assign_scope_zqoacqpyux'::"pg_catalog"."text", '__delta_olds_assign_step_hjrcusfxfw'::"pg_catalog"."text", '__delta_olds_chain_result_c2y4qs76iu'::"pg_catalog"."text", '__delta_olds_chain_scope_27r3qyqi3x'::"pg_catalog"."text", '__delta_olds_chain_step_5m7qppvk4p'::"pg_catalog"."text", '__delta_olds_fan_freed_mwml6ea3za'::"pg_catalog"."text", '__delta_olds_fan_result_fuazpryl5h'::"pg_catalog"."text", '__delta_olds_fan_scope_2tqhhriuii'::"pg_catalog"."text", '__delta_olds_fan_step_bdikknewds'::"pg_catalog"."text", '__delta_olds_retry_result_vgpzb7irxx'::"pg_catalog"."text", '__delta_olds_retry_scope_ee3njtef5r'::"pg_catalog"."text", '__delta_olds_retry_step_wq34lpx5y3'::"pg_catalog"."text", '__delta_olds_sync_result_s33bt3lj5g'::"pg_catalog"."text", '__delta_olds_sync_scope_vzbfllajyc'::"pg_catalog"."text", '__delta_olds_sync_step_nqm6emzmzn'::"pg_catalog"."text") AND ("pg_catalog"."pg_get_userbyid"("r1"."relowner") = CURRENT_USER AND "r1"."relpersistence" = 't'::"pg_catalog"."text"));
  IF "__held" && '{"__delta_news_assign_assignment_input_lw7cfgfvnr","__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh","__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr","__delta_olds_assign_scope_zqoacqpyux"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_assignment_input_mfctsotkjq"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p","__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr","__delta_olds_assign_assignment_input_khx4kjmyw6"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_assignment_input_mode_nearest_gp4j43rmv4"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_decide_input_qayviv5irl","__delta_olds_assign_decide_input_mode_nearest_ltccebku3q","__delta_olds_assign_decide_input_mode_within_4lmirwj4hj","__delta_olds_assign_step_hjrcusfxfw"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_input_cttk45jphq"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_decide_input_mode_nearest_iyocyinsng","__delta_news_assign_decide_input_mode_within_nflxraui6u","__delta_olds_assign_decide_input_mmhrf72g5k"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_input_mode_nearest_fx5bcrc2ao"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_decide_output_xcqzeb6a2h","__delta_olds_assign_decide_output_stage_rest_lohip5o2bv","__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_output_mppefsithx"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_decide_output_stage_rest_6oiwwudavz","__delta_news_assign_decide_output_stage_serve_spw2gnwa7l","__delta_olds_assign_decide_output_kpd5rn2m2r"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_decide_output_stage_rest_qlbend26ms"("__held");
  END IF;
  IF "__held" && '{"__delta_news_assign_done_zrcj6hmzzp","__delta_news_assign_failed_zmmymz64np","__delta_olds_assign_result_ltrbxqrcde"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_assign_done_uvgox4xms6"("__held");
  END IF;
  IF "__held" && '{"__delta_news_chain_chain_run_input_kn6uczzewn","__delta_news_chain_ordered_input_jcbr362nhm","__delta_olds_chain_scope_27r3qyqi3x"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_chain_run_input_6af3rz27sb"("__held");
  END IF;
  IF "__held" && '{"__delta_news_chain_done_xz7j62xv2p","__delta_news_chain_failed_rw3b32rl3b","__delta_olds_chain_result_c2y4qs76iu"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_done_dlqjjysn3f"("__held");
  END IF;
  IF "__held" && '{"__delta_news_chain_page_input_sek6i5g4fk","__delta_olds_chain_step_5m7qppvk4p"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_chain_page_input_uxsnjvp5zl"("__held");
  END IF;
  IF "__held" && '{"__delta_news_fan_batch_input_ankhpanyaq","__delta_news_fan_fan_run_input_vbsdow3wli","__delta_olds_fan_scope_2tqhhriuii"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_batch_input_mrbtecwoza"("__held");
  END IF;
  IF "__held" && '{"__delta_news_fan_done_zdcqqeht75","__delta_news_fan_failed_2zywggd5jt","__delta_olds_fan_result_fuazpryl5h"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_done_mflioj3j23"("__held");
  END IF;
  IF "__held" && '{"__delta_news_fan_hold_p5mgeiywqn","__delta_olds_fan_freed_mwml6ea3za"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_hold_hkncojanio"("__held");
  END IF;
  IF "__held" && '{"__delta_news_fan_square_input_hannxhtrcg","__delta_olds_fan_step_bdikknewds"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_fan_square_input_stnzlfwyid"("__held");
  END IF;
  IF "__held" && '{"__delta_news_retry_brittle_input_zyzzsijlvi","__delta_news_retry_steadfast_input_24jog73c7m","__delta_olds_retry_step_wq34lpx5y3"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_brittle_input_z4jbgcxtaw"("__held");
  END IF;
  IF "__held" && '{"__delta_news_retry_done_bvmq7mg4tw","__delta_news_retry_failed_ouf7jeazd5","__delta_olds_retry_result_vgpzb7irxx"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_done_qvurptzp5o"("__held");
  END IF;
  IF "__held" && '{"__delta_news_retry_ladders_input_r267sjjms6","__delta_olds_retry_scope_ee3njtef5r"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_retry_ladders_input_3c7y32vdti"("__held");
  END IF;
  IF "__held" && '{"__delta_news_sync_build_input_y2kmchrx43","__delta_news_sync_copy_input_fsjrueonz3","__delta_olds_sync_step_nqm6emzmzn"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_build_input_bqat4atnho"("__held");
  END IF;
  IF "__held" && '{"__delta_news_sync_done_zk36v55j5b","__delta_news_sync_failed_cx6wsiesyx","__delta_olds_sync_result_s33bt3lj5g"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_done_aojyv7p4ap"("__held");
  END IF;
  IF "__held" && '{"__delta_news_sync_gold_input_4tvuzpo7yp","__delta_news_sync_sync_run_input_dafcymdmlh","__delta_olds_sync_scope_vzbfllajyc"}'::"pg_catalog"."text"[] THEN
    PERFORM "slice"."__judge_sync_gold_input_qcj64en4sx"("__held");
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_khx4kjmyw6'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" ("learner", "missed", "mode", "root", "scope", "topic")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_khx4kjmyw6'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_khx4kjmyw6" ("learner", "missed", "mode", "root", "scope", "topic")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_lw7cfgfvnr'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" ("learner", "missed", "mode", "root", "scope", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."scope", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_lw7cfgfvnr" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root", "scope", "__count")
    SELECT "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root", "scope", "__count")
    SELECT "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root", "scope", "__count")
    SELECT "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" ("root", "scope")
    SELECT "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" ("root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_nearest_vk7fu2lqsh" ("root", "scope")
    SELECT "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" ("root", "scope", "__count")
      SELECT "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_nearest_p4q24ddx4p" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius", "root", "scope", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius", "root", "scope", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius", "root", "scope", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" ("radius", "root", "scope")
    SELECT "r1"."radius", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" ("radius" double precision, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_assignment_input_mode_within_zkpkil5tyr" ("radius", "root", "scope")
    SELECT "r1"."radius", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" ("radius", "root", "scope", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_assignment_input_mode_within_rb6bd7gwhr" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner", "missed", "mode", "root", "step", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner", "missed", "mode", "root", "step", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner", "missed", "mode", "root", "step", "topic", "__count")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mmhrf72g5k'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" ("learner", "missed", "mode", "root", "step", "topic")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."mode" = "r1"."mode")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mmhrf72g5k'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mmhrf72g5k" ("learner", "missed", "mode", "root", "step", "topic")
    SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_qayviv5irl"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_qayviv5irl'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" ("learner", "missed", "mode", "root", "step", "topic", "__count")
      SELECT "r1"."learner", "r1"."missed", "r1"."mode", "r1"."root", "r1"."step", "r1"."topic", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_qayviv5irl" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_nearest_ltccebku3q'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" ("root", "step")
    SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_nearest_ltccebku3q'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_nearest_ltccebku3q" ("root", "step")
    SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_nearest_iyocyinsng'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_nearest_iyocyinsng" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius", "root", "step", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius", "root", "step", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius", "root", "step", "__count")
    SELECT "r1"."radius", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_within_4lmirwj4hj'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" ("radius", "root", "step")
    SELECT "r1"."radius", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" ("radius" double precision, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_input_mode_within_4lmirwj4hj'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_input_mode_within_4lmirwj4hj" ("radius", "root", "step")
    SELECT "r1"."radius", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_input_mode_within_nflxraui6u'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" ("radius", "root", "step", "__count")
      SELECT "r1"."radius", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_input_mode_within_nflxraui6u" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence", "root", "stage", "step", "__count")
    SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence", "root", "stage", "step", "__count")
    SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence", "root", "stage", "step", "__count")
    SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_kpd5rn2m2r'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" ("confidence", "root", "stage", "step")
    SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."stage" = "r1"."stage")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" ("confidence" double precision, "root" "pg_catalog"."uuid", "stage" smallint, "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_kpd5rn2m2r'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_kpd5rn2m2r" ("confidence", "root", "stage", "step")
    SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_xcqzeb6a2h'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" ("confidence", "root", "stage", "step", "__count")
      SELECT "r1"."confidence", "r1"."root", "r1"."stage", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_xcqzeb6a2h" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_rest_lohip5o2bv'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" ("root", "step")
    SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_rest_lohip5o2bv'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_rest_lohip5o2bv" ("root", "step")
    SELECT "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_rest_6oiwwudavz'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_rest_6oiwwudavz" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance", "passage", "root", "step", "__count")
    SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance", "passage", "root", "step", "__count")
    SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance", "passage", "root", "step", "__count")
    SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r3")
    ;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_serve_a6x4rdivod'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" ("distance", "passage", "root", "step")
    SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_decide_output_stage_serve_a6x4rdivod'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_decide_output_stage_serve_a6x4rdivod" ("distance", "passage", "root", "step")
    SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_decide_output_stage_serve_spw2gnwa7l'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" ("distance", "passage", "root", "step", "__count")
      SELECT "r1"."distance", "r1"."passage", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_decide_output_stage_serve_spw2gnwa7l" AS "r3")
      ;
    END IF;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_done_zrcj6hmzzp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_done_zrcj6hmzzp'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_done_zrcj6hmzzp" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_assign_failed_zmmymz64np"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_assign_failed_zmmymz64np'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_assign_failed_zmmymz64np" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_assign_failed_zmmymz64np" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_ltrbxqrcde"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_ltrbxqrcde"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_result_ltrbxqrcde'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_ltrbxqrcde"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_result_ltrbxqrcde"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_result_ltrbxqrcde'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_result_ltrbxqrcde" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_scope_dsaojegcma"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_scope_zqoacqpyux"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_scope_zqoacqpyux"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_scope_zqoacqpyux'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_scope_zqoacqpyux"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_scope_zqoacqpyux"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_scope_zqoacqpyux'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_scope_zqoacqpyux" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_assign_scope_dsaojegcma"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_hjrcusfxfw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_hjrcusfxfw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_step_hjrcusfxfw'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_hjrcusfxfw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_assign_step_hjrcusfxfw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_assign_step_hjrcusfxfw'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_assign_step_hjrcusfxfw" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_chain_run_input_kn6uczzewn'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_chain_run_input_kn6uczzewn" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_done_xz7j62xv2p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_done_xz7j62xv2p'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_done_xz7j62xv2p" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_done_xz7j62xv2p" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_failed_rw3b32rl3b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_failed_rw3b32rl3b'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_failed_rw3b32rl3b" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed", "pages", "root", "scope", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_ordered_input_jcbr362nhm'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" ("feed", "pages", "root", "scope", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_ordered_input_jcbr362nhm" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "seq" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed", "pages", "root", "seq", "step", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed" smallint, "pages" bigint, "root" "pg_catalog"."uuid", "seq" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed", "pages", "root", "seq", "step", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed", "pages", "root", "seq", "step", "__count")
    SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_chain_page_input_sek6i5g4fk"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_chain_page_input_sek6i5g4fk'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" ("feed", "pages", "root", "seq", "step", "__count")
      SELECT "r1"."feed", "r1"."pages", "r1"."root", "r1"."seq", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_chain_page_input_sek6i5g4fk" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_c2y4qs76iu"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_c2y4qs76iu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_result_c2y4qs76iu'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_c2y4qs76iu"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_result_c2y4qs76iu"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_result_c2y4qs76iu'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_result_c2y4qs76iu" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_scope_c23ru2pmuw"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_scope_27r3qyqi3x"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_scope_27r3qyqi3x"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_scope_27r3qyqi3x'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_scope_27r3qyqi3x"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_scope_27r3qyqi3x"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_scope_27r3qyqi3x'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_scope_27r3qyqi3x" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_chain_scope_c23ru2pmuw"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_5m7qppvk4p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_5m7qppvk4p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_step_5m7qppvk4p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_5m7qppvk4p"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_chain_step_5m7qppvk4p"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_chain_step_5m7qppvk4p'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_chain_step_5m7qppvk4p" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_batch_input_ankhpanyaq"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_batch_input_ankhpanyaq'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_batch_input_ankhpanyaq" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_done_zdcqqeht75"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_done_zdcqqeht75'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_done_zdcqqeht75" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_done_zdcqqeht75" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_failed_2zywggd5jt"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_failed_2zywggd5jt'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_failed_2zywggd5jt" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_failed_2zywggd5jt" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "size" bigint, "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch", "root", "scope", "size", "__count")
    SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_fan_run_input_vbsdow3wli'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" ("batch", "root", "scope", "size", "__count")
      SELECT "r1"."batch", "r1"."root", "r1"."scope", "r1"."size", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_fan_run_input_vbsdow3wli" AS "r3")
      ;
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

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_result_tevufz2c53"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_fuazpryl5h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_fuazpryl5h" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_fuazpryl5h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_result_fuazpryl5h'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_result_fuazpryl5h" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_fuazpryl5h"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_result_fuazpryl5h" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_result_fuazpryl5h"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_result_fuazpryl5h'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_result_fuazpryl5h" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_result_tevufz2c53"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_scope_3akxafcmy4"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_scope_2tqhhriuii"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_scope_2tqhhriuii"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_scope_2tqhhriuii'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_scope_2tqhhriuii"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_scope_2tqhhriuii"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_scope_2tqhhriuii'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_scope_2tqhhriuii" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_scope_3akxafcmy4"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_fan_square_input_x66yegc6bz"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch", "n", "root", "step", "__count")
    SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch", "n", "root", "step", "__count")
    SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch", "n", "root", "step", "__count")
    SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_fan_square_input_hannxhtrcg"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_fan_square_input_hannxhtrcg'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" ("batch", "n", "root", "step", "__count")
      SELECT "r1"."batch", "r1"."n", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_fan_square_input_hannxhtrcg" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_bdikknewds"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_bdikknewds" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_bdikknewds"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_step_bdikknewds'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_step_bdikknewds" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_bdikknewds"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_fan_step_bdikknewds" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_fan_step_bdikknewds"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_fan_step_bdikknewds'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_fan_step_bdikknewds" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_brittle_input_ngy5ff2dfr"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_brittle_input_zyzzsijlvi'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_brittle_input_zyzzsijlvi" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_done_bvmq7mg4tw"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_done_bvmq7mg4tw'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_done_bvmq7mg4tw" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_failed_ouf7jeazd5"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_failed_ouf7jeazd5'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_failed_ouf7jeazd5" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle", "root", "scope", "steadfast", "__count")
    SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle", "root", "scope", "steadfast", "__count")
    SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle", "root", "scope", "steadfast", "__count")
    SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_ladders_input_r267sjjms6"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_ladders_input_r267sjjms6'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" ("brittle", "root", "scope", "steadfast", "__count")
      SELECT "r1"."brittle", "r1"."root", "r1"."scope", "r1"."steadfast", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_ladders_input_r267sjjms6" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_vgpzb7irxx"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_vgpzb7irxx"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_result_vgpzb7irxx'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_vgpzb7irxx"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_result_vgpzb7irxx"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_result_vgpzb7irxx'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_result_vgpzb7irxx" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_scope_m6j2niepek"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_scope_ee3njtef5r"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_scope_ee3njtef5r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_scope_ee3njtef5r'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_scope_ee3njtef5r"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_scope_ee3njtef5r"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_scope_ee3njtef5r'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_scope_ee3njtef5r" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_retry_scope_m6j2niepek"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_retry_steadfast_input_iqvn32jr3j"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key", "root", "step", "__count")
    SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_retry_steadfast_input_24jog73c7m'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" ("key", "root", "step", "__count")
      SELECT "r1"."key", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_retry_steadfast_input_24jog73c7m" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_wq34lpx5y3"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_wq34lpx5y3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_step_wq34lpx5y3'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_wq34lpx5y3"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_retry_step_wq34lpx5y3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_retry_step_wq34lpx5y3'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_retry_step_wq34lpx5y3" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build", "root", "step", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build" bigint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build", "root", "step", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build", "root", "step", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_build_input_y2kmchrx43"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_build_input_y2kmchrx43'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" ("build", "root", "step", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_build_input_y2kmchrx43" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation", "root", "run", "step", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation", "root", "run", "step", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation", "root", "run", "step", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_copy_input_fsjrueonz3"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_copy_input_fsjrueonz3'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" ("relation", "root", "run", "step", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_copy_input_fsjrueonz3" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_done_zk36v55j5b"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_done_zk36v55j5b'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_done_zk36v55j5b" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_done_zk36v55j5b" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root", "step", "__count")
    SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_failed_cx6wsiesyx"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_failed_cx6wsiesyx'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" ("root", "step", "__count")
      SELECT "r1"."root", "r1"."step", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_failed_cx6wsiesyx" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build", "root", "scope", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build" bigint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build", "root", "scope", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build", "root", "scope", "__count")
    SELECT "r1"."build", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_gold_input_4tvuzpo7yp'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" ("build", "root", "scope", "__count")
      SELECT "r1"."build", "r1"."root", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_gold_input_4tvuzpo7yp" AS "r3")
      ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_s33bt3lj5g"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_s33bt3lj5g"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_result_s33bt3lj5g'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."outcome" = "r1"."outcome")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_s33bt3lj5g"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" ("outcome" smallint, "root" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_result_s33bt3lj5g"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_result_s33bt3lj5g'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_result_s33bt3lj5g" ("outcome", "root", "step")
    SELECT "r1"."outcome", "r1"."root", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_result_led6m2o22r"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_scope_wpivtwoeh6"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_scope_vzbfllajyc"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_scope_vzbfllajyc"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_scope_vzbfllajyc'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_scope_vzbfllajyc"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_scope_vzbfllajyc"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_scope_vzbfllajyc'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_scope_vzbfllajyc" ("kind", "root", "scope")
    SELECT "r1"."kind", "r1"."root", "r1"."scope" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__capture_sync_scope_wpivtwoeh6"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() RETURNS "pg_catalog"."trigger"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_nqm6emzmzn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_nqm6emzmzn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_step_nqm6emzmzn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."step" = "r1"."step" AND "r2"."root" = "r1"."root" AND "r2"."kind" = "r1"."kind")
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_nqm6emzmzn"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" ("kind" smallint, "root" "pg_catalog"."uuid", "scope" "pg_catalog"."uuid", "step" "pg_catalog"."uuid") ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_olds_sync_step_nqm6emzmzn"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_olds_sync_step_nqm6emzmzn'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_olds_sync_step_nqm6emzmzn" ("kind", "root", "scope", "step")
    SELECT "r1"."kind", "r1"."root", "r1"."scope", "r1"."step" FROM "olds" AS "r1"
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__sentinel_g7mqw4mu4u" () ON COMMIT DELETE ROWS;
      CREATE CONSTRAINT TRIGGER "__sentinel_g7mqw4mu4u" AFTER INSERT ON "pg_temp"."__sentinel_g7mqw4mu4u" DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION "slice"."__judge"();
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2", "pg_catalog"."pg_trigger" AS "r3" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__sentinel_g7mqw4mu4u"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text" AND "r3"."tgrelid" = "r2"."oid" AND "r3"."tgfoid" = "pg_catalog"."to_regprocedure"('"slice"."__judge"()'::"pg_catalog"."text")) THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__sentinel_g7mqw4mu4u'::"pg_catalog"."text";
    END IF;
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation", "root", "run", "scope", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", 1::smallint FROM "news" AS "r1"
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
    IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text")) THEN
      CREATE TEMPORARY TABLE "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."uuid", "run" bigint, "scope" "pg_catalog"."uuid", "__count" smallint) ON COMMIT DELETE ROWS;
    ELSIF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
      RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
        USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
              SCHEMA = 'pg_temp'::"pg_catalog"."text",
              TABLE = '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text";
    END IF;
    INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation", "root", "run", "scope", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", 1::smallint FROM "news" AS "r1" WHERE NOT EXISTS (SELECT FROM "olds" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root")
    ;
    INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation", "root", "run", "scope", "__count")
    SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE NOT EXISTS (SELECT FROM "news" AS "r2" WHERE "r2"."scope" = "r1"."scope" AND "r2"."root" = "r1"."root") AND EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r3")
    ;
    INSERT INTO "pg_temp"."__sentinel_g7mqw4mu4u"
    SELECT WHERE NOT EXISTS (SELECT FROM "pg_temp"."__sentinel_g7mqw4mu4u" AS "r1")
    ;
  ELSIF TG_OP = 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r1" WHERE "r1"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text")) THEN
      IF NOT EXISTS (SELECT FROM "pg_catalog"."pg_class" AS "r2" WHERE "r2"."oid" = "pg_catalog"."to_regclass"('"pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh"'::"pg_catalog"."text") AND "pg_catalog"."pg_get_userbyid"("r2"."relowner") = CURRENT_USER AND "r2"."relpersistence" = 't'::"pg_catalog"."text") THEN
        RAISE EXCEPTION 'a session table of the rule judge that the judge''s definer does not own'
          USING ERRCODE = 'insufficient_privilege'::"pg_catalog"."text",
                SCHEMA = 'pg_temp'::"pg_catalog"."text",
                TABLE = '__delta_news_sync_sync_run_input_dafcymdmlh'::"pg_catalog"."text";
      END IF;
      INSERT INTO "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" ("relation", "root", "run", "scope", "__count")
      SELECT "r1"."relation", "r1"."root", "r1"."run", "r1"."scope", (-1)::smallint FROM "olds" AS "r1" WHERE EXISTS (SELECT FROM "pg_temp"."__delta_news_sync_sync_run_input_dafcymdmlh" AS "r3")
      ;
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
  AFTER DELETE ON "slice"."assign_scope"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_scope_dsaojegcma"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."assign_scope"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_assign_scope_dsaojegcma"();

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
  AFTER DELETE ON "slice"."chain_scope"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_scope_c23ru2pmuw"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."chain_scope"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_chain_scope_c23ru2pmuw"();

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
  AFTER DELETE ON "slice"."fan_scope"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_scope_3akxafcmy4"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."fan_scope"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_fan_scope_3akxafcmy4"();

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
  AFTER DELETE ON "slice"."retry_scope"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_scope_m6j2niepek"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."retry_scope"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_retry_scope_m6j2niepek"();

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
  AFTER DELETE ON "slice"."sync_scope"
  REFERENCING OLD TABLE AS "olds"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_scope_wpivtwoeh6"();

CREATE TRIGGER "__capture_update"
  AFTER UPDATE ON "slice"."sync_scope"
  REFERENCING OLD TABLE AS "olds" NEW TABLE AS "news"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__capture_sync_scope_wpivtwoeh6"();

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
  PERFORM 1 FROM (SELECT "r12"."c40" AS "t0", "r12"."c41" AS "t1", "r12"."c42" AS "t2", "r12"."c43" AS "t3", "r12"."c44" AS "t4" FROM (SELECT "r11"."c36", "r11"."c37", "r11"."c38", "r11"."c35", "r11"."c39" FROM (SELECT "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT "r9"."c25", "r9"."c26", "r9"."c27", "r9"."c28", "r9"."c29" FROM (SELECT DISTINCT "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c14", "r4"."c15" FROM (SELECT "r3"."c9", "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c10" FROM (SELECT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10")) AS "r4"("c11", "c12", "c13", "c14", "c15") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c19", "r7"."c20", "r7"."c21" FROM (SELECT "r6"."c16", "r6"."c17", "r6"."c18" FROM (SELECT "r5"."resource", "r5"."seat", "r5"."turn" FROM "slice"."fan_freed" AS "r5") AS "r6"("c16", "c17", "c18")) AS "r7"("c19", "c20", "c21")) AS "r8"("c22", "c23", "c24") WHERE "r8"."c22" = "r4"."c12" AND "r8"."c23" = "r4"."c13" AND "r8"."c24" = "r4"."c14")) AS "r9"("c25", "c26", "c27", "c28", "c29")) AS "r10"("c30", "c31", "c32", "c33", "c34") WHERE CASE WHEN "r10"."c32" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r10"."c31" + 1, 1)::integer, 0) - 1 + 1] THEN false ELSE true END) AS "r11"("c35", "c36", "c37", "c38", "c39")) AS "r12"("c40", "c41", "c42", "c43", "c44")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_live_check_fan_seat_below_count_jcuojp5fnq is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_live_check_fan_seat_below_count_jcuojp5fnq'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_in_assign_scope_voihzx3sj5.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."assign_assignment_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."assign_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_assignment_input_in_assign_scope_voihzx3sj5 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_assignment_input_in_assign_scope_voihzx3sj5'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __assign_assignment_input_mode_in_assign_assignment_eawcu4wa34.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."mode", "r5"."root" FROM "slice"."assign_assignment_input" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 0::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."scope", "r1"."root" FROM "slice"."assign_assignment_input_mode_nearest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."mode", "r5"."root" FROM "slice"."assign_assignment_input" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 1::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."scope", "r1"."root" FROM "slice"."assign_assignment_input_mode_within" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."assign_assignment_input_mode_nearest" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."mode", "r1"."root" FROM "slice"."assign_assignment_input" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."assign_assignment_input_mode_within" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."mode", "r1"."root" FROM "slice"."assign_assignment_input" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_decide_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."assign_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."step", "r5"."mode", "r5"."root" FROM "slice"."assign_decide_input" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 0::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."step", "r1"."root" FROM "slice"."assign_decide_input_mode_nearest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."step", "r5"."mode", "r5"."root" FROM "slice"."assign_decide_input" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 1::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."step", "r1"."root" FROM "slice"."assign_decide_input_mode_within" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_decide_input_mode_nearest" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."mode", "r1"."root" FROM "slice"."assign_decide_input" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_decide_input_mode_within" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."mode", "r1"."root" FROM "slice"."assign_decide_input" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."step", "r5"."stage", "r5"."root" FROM "slice"."assign_decide_output" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 0::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."step", "r1"."root" FROM "slice"."assign_decide_output_stage_rest" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c7", "r6"."c9" FROM (SELECT "r5"."step", "r5"."stage", "r5"."root" FROM "slice"."assign_decide_output" AS "r5") AS "r6"("c7", "c8", "c9") WHERE "r6"."c8" = 1::smallint) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c5", "r4"."c6" FROM (SELECT "r3"."c3"::"pg_catalog"."uuid", "r3"."c4"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c2" FROM (SELECT "r1"."step", "r1"."root" FROM "slice"."assign_decide_output_stage_serve" AS "r1") AS "r2"("c1", "c2")) AS "r3"("c3", "c4")) AS "r4"("c5", "c6")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_decide_output_stage_rest" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."stage", "r1"."root" FROM "slice"."assign_decide_output" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_decide_output_stage_serve" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."stage", "r1"."root" FROM "slice"."assign_decide_output" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_done" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."assign_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."assign_failed" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."assign_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __assign_failed_in_assign_result_nnngibpxsc is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__assign_failed_in_assign_result_nnngibpxsc'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_chain_run_input_in_chain_scope_rwiwgl6wca.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."chain_chain_run_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."chain_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_chain_run_input_in_chain_scope_rwiwgl6wca is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_chain_run_input_in_chain_scope_rwiwgl6wca'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_done_in_chain_result_hxnxjn4nw3.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."chain_done" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."chain_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."chain_failed" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."chain_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_failed_in_chain_result_vya3y24kt7 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_failed_in_chain_result_vya3y24kt7'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_ordered_input_in_chain_scope_clmpikijzh.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."chain_ordered_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."chain_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_ordered_input_in_chain_scope_clmpikijzh is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_ordered_input_in_chain_scope_clmpikijzh'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __chain_page_input_in_chain_step_vnrubtwikd.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."chain_page_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."chain_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 2::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __chain_page_input_in_chain_step_vnrubtwikd is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__chain_page_input_in_chain_step_vnrubtwikd'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_batch_input_in_fan_scope_pnkgban2ix.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."fan_batch_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."fan_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_batch_input_in_fan_scope_pnkgban2ix is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_batch_input_in_fan_scope_pnkgban2ix'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_done_in_fan_result_guvpmso3xz.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."fan_done" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."fan_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."fan_failed" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."fan_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_failed_in_fan_result_2a7325eu5t is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_failed_in_fan_result_2a7325eu5t'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_fan_run_input_in_fan_scope_tqfwf3l6wh.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."fan_fan_run_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."fan_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __fan_fan_run_input_in_fan_scope_tqfwf3l6wh is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_fan_run_input_in_fan_scope_tqfwf3l6wh'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __fan_square_input_in_fan_step_iv7dg4jma2.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."fan_square_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."fan_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 2::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."retry_brittle_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."retry_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."retry_done" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."retry_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."retry_failed" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."retry_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_failed_in_retry_result_kdzwljgaeg is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_failed_in_retry_result_kdzwljgaeg'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_ladders_input_in_retry_scope_xauizqr2su.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."retry_ladders_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."retry_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __retry_ladders_input_in_retry_scope_xauizqr2su is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__retry_ladders_input_in_retry_scope_xauizqr2su'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __retry_steadfast_input_in_retry_step_hx2xvxlsob.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."retry_steadfast_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."retry_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 2::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."sync_build_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."sync_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."sync_copy_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."kind", "r1"."root" FROM "slice"."sync_step" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."sync_done" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."sync_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
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
  PERFORM 1 FROM (SELECT "r9"."c14" AS "step", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."step", "r5"."root" FROM "slice"."sync_failed" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."step", "r1"."outcome", "r1"."root" FROM "slice"."sync_result" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_failed_in_sync_result_f4xswckcbg is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_failed_in_sync_result_f4xswckcbg'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_gold_input_in_sync_scope_4sfm4viab3.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."sync_gold_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."sync_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 0::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_gold_input_in_sync_scope_4sfm4viab3 is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_gold_input_in_sync_scope_4sfm4viab3'::"pg_catalog"."text";
  END IF;
END
$$;

-- The full violation query of law __sync_sync_run_input_in_sync_scope_pmhdowao4r.
DO $$
BEGIN
  PERFORM 1 FROM (SELECT "r9"."c14" AS "scope", "r9"."c15" AS "root" FROM (SELECT "r8"."c12", "r8"."c13" FROM (SELECT "r7"."c10"::"pg_catalog"."uuid", "r7"."c11"::"pg_catalog"."uuid" FROM (SELECT "r6"."c8", "r6"."c9" FROM (SELECT "r5"."scope", "r5"."root" FROM "slice"."sync_sync_run_input" AS "r5") AS "r6"("c8", "c9")) AS "r7"("c10", "c11")) AS "r8"("c12", "c13") EXCEPT SELECT "r4"."c6", "r4"."c7" FROM (SELECT "r3"."c4"::"pg_catalog"."uuid", "r3"."c5"::"pg_catalog"."uuid" FROM (SELECT "r2"."c1", "r2"."c3" FROM (SELECT "r1"."scope", "r1"."kind", "r1"."root" FROM "slice"."sync_scope" AS "r1") AS "r2"("c1", "c2", "c3") WHERE "r2"."c2" = 1::smallint) AS "r3"("c4", "c5")) AS "r4"("c6", "c7")) AS "r9"("c14", "c15")) AS "found";
  IF FOUND THEN
    RAISE EXCEPTION 'law __sync_sync_run_input_in_sync_scope_pmhdowao4r is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__sync_sync_run_input_in_sync_scope_pmhdowao4r'::"pg_catalog"."text";
  END IF;
END
$$;
