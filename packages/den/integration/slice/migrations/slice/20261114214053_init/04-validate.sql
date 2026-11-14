CREATE OR REPLACE FUNCTION "slice"."__rule_fan_freed_fan_live_check_fan_seat_below_count_jksgj45pcq"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP <> 'INSERT'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT "r9"."c27", "r9"."c28", "r9"."c29", "r9"."c30", "r9"."c31" FROM (SELECT "r5"."c16", "r5"."c17", "r5"."c18", "r5"."c19", "r5"."c20" FROM (SELECT "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c14", "r4"."c15" FROM (SELECT "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c9", "r3"."c10" FROM (SELECT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10") WHERE "r3"."c6" = OLD."resource"::smallint AND "r3"."c7" = OLD."seat"::"slice"."__domain_gfw43vigph" AND "r3"."c8" = OLD."turn"::"slice"."__domain_gfw43vigph" AND NOT "r3"."c7" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r3"."c6" + 1, 1)::integer, 0) - 1 + 1]) AS "r4"("c11", "c12", "c13", "c14", "c15")) AS "r5"("c16", "c17", "c18", "c19", "c20") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c21", "r7"."c22", "r7"."c23" FROM (SELECT "r6"."resource", "r6"."seat", "r6"."turn" FROM "slice"."fan_freed" AS "r6") AS "r7"("c21", "c22", "c23")) AS "r8"("c24", "c25", "c26") WHERE "r8"."c24" = "r5"."c16" AND "r8"."c25" = "r5"."c17" AND "r8"."c26" = "r5"."c18")) AS "r9"("c27", "c28", "c29", "c30", "c31")) THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'check_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
              SCHEMA = TG_TABLE_SCHEMA,
              TABLE = TG_TABLE_NAME;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__rule_fan_freed_fan_live_check_fan_seat_below_count_jksgj45pcq"() FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__rule_fan_hold_fan_live_check_fan_seat_below_count_zmpbuhqfcd"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF TG_OP <> 'DELETE'::"pg_catalog"."text" THEN
    IF EXISTS (SELECT "r9"."c27", "r9"."c28", "r9"."c29", "r9"."c30", "r9"."c31" FROM (SELECT "r5"."c16", "r5"."c17", "r5"."c18", "r5"."c19", "r5"."c20" FROM (SELECT "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c14", "r4"."c15" FROM (SELECT "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c9", "r3"."c10" FROM (SELECT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10") WHERE "r3"."c6" = NEW."resource"::smallint AND "r3"."c7" = NEW."seat"::"slice"."__domain_gfw43vigph" AND "r3"."c8" = NEW."turn"::"slice"."__domain_gfw43vigph" AND NOT "r3"."c7" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r3"."c6" + 1, 1)::integer, 0) - 1 + 1]) AS "r4"("c11", "c12", "c13", "c14", "c15")) AS "r5"("c16", "c17", "c18", "c19", "c20") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."c21", "r7"."c22", "r7"."c23" FROM (SELECT "r6"."resource", "r6"."seat", "r6"."turn" FROM "slice"."fan_freed" AS "r6") AS "r7"("c21", "c22", "c23")) AS "r8"("c24", "c25", "c26") WHERE "r8"."c24" = "r5"."c16" AND "r8"."c25" = "r5"."c17" AND "r8"."c26" = "r5"."c18")) AS "r9"("c27", "c28", "c29", "c30", "c31")) THEN
      RAISE EXCEPTION 'a write breaks a rule over a query'
        USING ERRCODE = 'check_violation'::"pg_catalog"."text",
              CONSTRAINT = '__rule_fan_live_check_fan_seat_below_count_yebtxevyos'::"pg_catalog"."text",
              SCHEMA = TG_TABLE_SCHEMA,
              TABLE = TG_TABLE_NAME;
    END IF;
  END IF;
  RETURN NEW;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__rule_fan_hold_fan_live_check_fan_seat_below_count_zmpbuhqfcd"() FROM PUBLIC;

CREATE CONSTRAINT TRIGGER "__rule_fan_live_check_fan_seat_below_count_yebtxevyos"
  AFTER DELETE OR UPDATE OF "resource", "seat", "turn" ON "slice"."fan_freed"
  DEFERRABLE INITIALLY DEFERRED
  FOR EACH ROW EXECUTE FUNCTION "slice"."__rule_fan_freed_fan_live_check_fan_seat_below_count_jksgj45pcq"();

CREATE CONSTRAINT TRIGGER "__rule_fan_live_check_fan_seat_below_count_yebtxevyos"
  AFTER INSERT OR UPDATE OF "holder", "resource", "seat", "turn", "until" ON "slice"."fan_hold"
  DEFERRABLE INITIALLY DEFERRED
  FOR EACH ROW EXECUTE FUNCTION "slice"."__rule_fan_hold_fan_live_check_fan_seat_below_count_zmpbuhqfcd"();

-- The full violation query of law __fan_live_check_fan_seat_below_count_jcuojp5fnq.
DO $$
BEGIN
  IF EXISTS (SELECT "r12"."c40" AS "t0", "r12"."c41" AS "t1", "r12"."c42" AS "t2", "r12"."c43" AS "t3", "r12"."c44" AS "t4" FROM (SELECT DISTINCT "r11"."c36", "r11"."c37", "r11"."c38", "r11"."c35", "r11"."c39" FROM (SELECT DISTINCT "r10"."c30", "r10"."c31", "r10"."c32", "r10"."c33", "r10"."c34" FROM (SELECT DISTINCT "r9"."c25", "r9"."c26", "r9"."c27", "r9"."c28", "r9"."c29" FROM (SELECT DISTINCT "r4"."c11", "r4"."c12", "r4"."c13", "r4"."c14", "r4"."c15" FROM (SELECT DISTINCT "r3"."c9", "r3"."c6", "r3"."c7", "r3"."c8", "r3"."c10" FROM (SELECT DISTINCT "r2"."c2", "r2"."c3", "r2"."c4", "r2"."c1", "r2"."c5" FROM (SELECT "r1"."holder", "r1"."resource", "r1"."seat", "r1"."turn", "r1"."until" FROM "slice"."fan_hold" AS "r1") AS "r2"("c1", "c2", "c3", "c4", "c5")) AS "r3"("c6", "c7", "c8", "c9", "c10")) AS "r4"("c11", "c12", "c13", "c14", "c15") WHERE NOT EXISTS (SELECT 1 FROM (SELECT DISTINCT "r7"."c19", "r7"."c20", "r7"."c21" FROM (SELECT DISTINCT "r6"."c16", "r6"."c17", "r6"."c18" FROM (SELECT "r5"."resource", "r5"."seat", "r5"."turn" FROM "slice"."fan_freed" AS "r5") AS "r6"("c16", "c17", "c18")) AS "r7"("c19", "c20", "c21")) AS "r8"("c22", "c23", "c24") WHERE "r8"."c22" = "r4"."c12" AND "r8"."c23" = "r4"."c13" AND "r8"."c24" = "r4"."c14")) AS "r9"("c25", "c26", "c27", "c28", "c29")) AS "r10"("c30", "c31", "c32", "c33", "c34") WHERE NOT "r10"."c32" < ("slice"."__constant_ejkw66w2je"())[NULLIF("pg_catalog"."substring"("slice"."__constant_ib5zplua3f"(), "r10"."c31" + 1, 1)::integer, 0) - 1 + 1]) AS "r11"("c35", "c36", "c37", "c38", "c39")) AS "r12"("c40", "c41", "c42", "c43", "c44")) THEN
    RAISE EXCEPTION 'law __fan_live_check_fan_seat_below_count_jcuojp5fnq is violated by existing rows'
      USING ERRCODE = 'integrity_constraint_violation'::"pg_catalog"."text",
            CONSTRAINT = '__fan_live_check_fan_seat_below_count_jcuojp5fnq'::"pg_catalog"."text";
  END IF;
END
$$;
