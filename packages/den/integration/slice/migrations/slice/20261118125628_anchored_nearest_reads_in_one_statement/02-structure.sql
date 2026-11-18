DROP VIEW "slice_seats__loader"."assign_decide_input_mode_within";

DROP VIEW "slice_seats__loader"."assign_decide_input_mode_nearest";

DROP VIEW "slice_seats__loader"."assign_decide_input";

DROP VIEW "slice_seats__loader"."assign_assignment_input_mode_within";

DROP VIEW "slice_seats__loader"."assign_assignment_input_mode_nearest";

DROP VIEW "slice_seats__loader"."assign_assignment_input";

DROP VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_within";

DROP VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_nearest";

DROP VIEW "slice_seats__assign_retirer"."assign_decide_input";

DROP VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_within";

DROP VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest";

DROP VIEW "slice_seats__assign_retirer"."assign_assignment_input";

DROP VIEW "slice_seats__assign_den"."assign_decide_input_mode_within";

DROP VIEW "slice_seats__assign_den"."assign_decide_input_mode_nearest";

DROP VIEW "slice_seats__assign_den"."assign_decide_input";

DROP VIEW "slice_seats__assign_den"."assign_assignment_input_mode_within";

DROP VIEW "slice_seats__assign_den"."assign_assignment_input_mode_nearest";

DROP VIEW "slice_seats__assign_den"."assign_assignment_input";

DROP PUBLICATION "__live_wzkq6p2yii";

ALTER TABLE "slice"."assign_assignment_input"
  DROP CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv",
  DROP CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme",
  ADD COLUMN "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" DEFAULT '' NOT NULL,
  ADD COLUMN "__root_h2ohpjyioe" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "root" END) STORED,
  ADD COLUMN "__root_i3j5qytpxw" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "root" END) STORED,
  ADD COLUMN "__scope_44i2s4kbue" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "scope" END) STORED,
  ADD COLUMN "__scope_3owcvq3eou" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "scope" END) STORED;
ALTER TABLE "slice"."assign_assignment_input" ALTER COLUMN "missed" DROP DEFAULT;

ALTER TABLE "slice"."assign_decide_input"
  DROP CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz",
  DROP CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4",
  ADD COLUMN "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" DEFAULT '' NOT NULL,
  ADD COLUMN "__root_h2ohpjyioe" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "root" END) STORED,
  ADD COLUMN "__root_i3j5qytpxw" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "root" END) STORED,
  ADD COLUMN "__step_rbt3e5bpyf" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "step" END) STORED,
  ADD COLUMN "__step_5ftuveszke" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "step" END) STORED;
ALTER TABLE "slice"."assign_decide_input" ALTER COLUMN "missed" DROP DEFAULT;

CREATE TABLE "slice"."missed" (
  "question" "slice"."__text_t4rwovzmqj" NOT NULL,
  "embedding" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__missed_pk_yzhoj6jwnt" PRIMARY KEY ("question"),
  CONSTRAINT "__missed_norm_embedding_q23vgxiv6r" CHECK (("vector_ext"."vector_norm"("embedding") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" DROP CONSTRAINT "__assign_assignment_input_mode_nearest_fk_scope_root_znjzoj5sqp";

ALTER TABLE "slice"."assign_assignment_input_mode_within" DROP CONSTRAINT "__assign_assignment_input_mode_within_fk_scope_root_lqrytrymw7";

ALTER TABLE "slice"."assign_decide_input_mode_nearest" DROP CONSTRAINT "__assign_decide_input_mode_nearest_fk_step_root_qz3rvpvaf2";

ALTER TABLE "slice"."assign_decide_input_mode_within" DROP CONSTRAINT "__assign_decide_input_mode_within_fk_step_root_pzugpauw4o";

SET CONSTRAINTS ALL IMMEDIATE;

ALTER TABLE "slice"."assign_assignment_input"
  ADD CONSTRAINT "__assign_assignment_input_fk_scope_root_tncpy5cmvv" FOREIGN KEY ("__scope_44i2s4kbue", "__root_h2ohpjyioe") REFERENCES "slice"."assign_assignment_input_mode_nearest" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID,
  ADD CONSTRAINT "__assign_assignment_input_fk_scope_root_aoqws6tmme" FOREIGN KEY ("__scope_3owcvq3eou", "__root_i3j5qytpxw") REFERENCES "slice"."assign_assignment_input_mode_within" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input"
  ADD CONSTRAINT "__assign_decide_input_fk_step_root_r5raxgv3qz" FOREIGN KEY ("__step_rbt3e5bpyf", "__root_h2ohpjyioe") REFERENCES "slice"."assign_decide_input_mode_nearest" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID,
  ADD CONSTRAINT "__assign_decide_input_fk_step_root_3ri6rctgq4" FOREIGN KEY ("__step_5ftuveszke", "__root_i3j5qytpxw") REFERENCES "slice"."assign_decide_input_mode_within" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input" ("scope", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input_mode_within" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input" ("step", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input_mode_within" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input" ("scope", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_assignment_input" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_assignment_input_mode_within" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input" ("step", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_decide_input" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__assign_retirer"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_retirer"."assign_decide_input_mode_within" TO :"slice_seats__assign_retirer";

CREATE VIEW "slice_seats__loader"."assign_assignment_input" ("scope", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_nearest" ("scope", "root") AS
SELECT "r1"."scope", "r1"."root"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input_mode_nearest" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_within" ("scope", "radius", "root") AS
SELECT "r1"."scope", "r1"."radius", "r1"."root"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input_mode_within" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input" ("step", "learner", "topic", "missed", "mode", "mode_name", "root") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."missed", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text", "r1"."root"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_nearest" ("step", "root") AS
SELECT "r1"."step", "r1"."root"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input_mode_nearest" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_within" ("step", "radius", "root") AS
SELECT "r1"."step", "r1"."radius", "r1"."root"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input_mode_within" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."missed" ("question", "embedding") AS
SELECT "r1"."question", "r1"."embedding"
FROM "slice"."missed" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."missed" TO :"slice_seats__loader";
