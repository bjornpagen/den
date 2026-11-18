DROP VIEW "slice_seats__loader"."assign_decide_output_chosen";

DROP VIEW "slice_seats__loader"."assign_decide_output";

DROP VIEW "slice_seats__loader"."assign_decide_input";

DROP VIEW "slice_seats__loader"."assign_assignment_input";

DROP VIEW "slice_seats__auditor"."assign_decide_output_chosen";

DROP VIEW "slice_seats__assign_den"."assign_decide_output_chosen";

DROP VIEW "slice_seats__assign_den"."assign_decide_output";

DROP VIEW "slice_seats__assign_den"."assign_decide_input";

DROP VIEW "slice_seats__assign_den"."assign_assignment_input";

DROP PUBLICATION "__live_wzkq6p2yii";

ALTER TABLE "slice"."assign_assignment_input"
  ADD COLUMN "mode" "slice"."assign_assignment_input_mode" DEFAULT 0 NOT NULL,
  ADD COLUMN "__scope_44i2s4kbue" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "scope" END) STORED,
  ADD COLUMN "__scope_3owcvq3eou" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "scope" END) STORED;
ALTER TABLE "slice"."assign_assignment_input" ALTER COLUMN "mode" DROP DEFAULT;

CREATE TABLE "slice"."assign_assignment_input_exclude" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" PRIMARY KEY ("scope", "ordinal")
);

CREATE TABLE "slice"."assign_assignment_input_mode_nearest" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assign_assignment_input_mode_within" (
  "scope" "slice"."__domain_jotafzuj2i" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" PRIMARY KEY ("scope"),
  CONSTRAINT "assign_assignment_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

ALTER TABLE "slice"."assign_decide_input"
  ADD COLUMN "mode" "slice"."assign_decide_input_mode" DEFAULT 0 NOT NULL,
  ADD COLUMN "__step_rbt3e5bpyf" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 0::smallint THEN "step" END) STORED,
  ADD COLUMN "__step_5ftuveszke" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "mode" = 1::smallint THEN "step" END) STORED;
ALTER TABLE "slice"."assign_decide_input" ALTER COLUMN "mode" DROP DEFAULT;

CREATE TABLE "slice"."assign_decide_input_exclude" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" PRIMARY KEY ("step", "ordinal")
);

CREATE TABLE "slice"."assign_decide_input_mode_nearest" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_decide_input_mode_within" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "radius" double precision NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" PRIMARY KEY ("step"),
  CONSTRAINT "assign_decide_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

ALTER TABLE "slice"."assign_decide_output"
  ADD COLUMN "confidence" double precision DEFAULT 0 NOT NULL,
  ADD COLUMN "stage" "slice"."assign_decide_output_stage" DEFAULT 0 NOT NULL,
  ADD COLUMN "__step_zqzc7m2bzh" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "stage" = 1::smallint THEN "step" END) STORED,
  ADD COLUMN "__step_7f435gey6a" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "stage" = 0::smallint THEN "step" END) STORED;
ALTER TABLE "slice"."assign_decide_output"
  ALTER COLUMN "confidence" DROP DEFAULT,
  ALTER COLUMN "stage" DROP DEFAULT;

CREATE TABLE "slice"."assign_decide_output_stage_rest" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."assign_decide_output_stage_serve" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" PRIMARY KEY ("step"),
  CONSTRAINT "assign_decide_output_stage_serve_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_output_weighed" (
  "step" "slice"."__domain_jotafzuj2i" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "passed" boolean NOT NULL,
  CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" PRIMARY KEY ("step", "ordinal"),
  CONSTRAINT "assign_decide_output_weighed_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."concluded" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "served" "slice"."__text_t4rwovzmqj" NOT NULL,
  "weighed" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__concluded_pk_b44jbktrki" PRIMARY KEY ("learner")
);

ALTER TABLE "slice"."assign_assignment_input_exclude"
  ADD COLUMN "__scope_u6ypqf2r2z" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "scope" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_decide_input_exclude"
  ADD COLUMN "__step_mjpuijzth4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_decide_output_weighed"
  ADD COLUMN "__step_mjpuijzth4" "pg_catalog"."uuid" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

SET CONSTRAINTS ALL IMMEDIATE;

ALTER TABLE "slice"."assign_decide_output"
  ADD CONSTRAINT "assign_decide_output_confidence_finite" CHECK (("confidence" > '-Infinity'::double precision AND "confidence" < 'Infinity'::double precision) IS TRUE) NOT VALID,
  ADD CONSTRAINT "__assign_decide_output_fk_step_6eza3ipk3z" FOREIGN KEY ("__step_zqzc7m2bzh") REFERENCES "slice"."assign_decide_output_stage_rest" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID,
  ADD CONSTRAINT "__assign_decide_output_fk_step_uf2quv342e" FOREIGN KEY ("__step_7f435gey6a") REFERENCES "slice"."assign_decide_output_stage_serve" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input"
  ADD CONSTRAINT "__assign_assignment_input_fk_scope_esvfiv3erb" FOREIGN KEY ("__scope_44i2s4kbue") REFERENCES "slice"."assign_assignment_input_mode_nearest" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID,
  ADD CONSTRAINT "__assign_assignment_input_fk_scope_ephkx6dc57" FOREIGN KEY ("__scope_3owcvq3eou") REFERENCES "slice"."assign_assignment_input_mode_within" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_assignment_input_exclude"
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_iphjwo2xrf" FOREIGN KEY ("scope") REFERENCES "slice"."assign_assignment_input" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_7ogcceo32v" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_rdz3ttleig") REFERENCES "slice"."assign_assignment_input_exclude" ("scope", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input"
  ADD CONSTRAINT "__assign_decide_input_fk_step_smeb6dksjy" FOREIGN KEY ("__step_rbt3e5bpyf") REFERENCES "slice"."assign_decide_input_mode_nearest" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID,
  ADD CONSTRAINT "__assign_decide_input_fk_step_vlinncoes5" FOREIGN KEY ("__step_5ftuveszke") REFERENCES "slice"."assign_decide_input_mode_within" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED NOT VALID;

ALTER TABLE "slice"."assign_decide_input_exclude"
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_py5qnbqlfp" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_input" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_uw3d7lbfy5" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig") REFERENCES "slice"."assign_decide_input_exclude" ("step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_output_weighed"
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_ii3cwlqbeg" FOREIGN KEY ("step") REFERENCES "slice"."assign_decide_output" ("step") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_nfcwpmjkm3" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig") REFERENCES "slice"."assign_decide_output_weighed" ("step", "ordinal") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input" ("scope", "learner", "topic", "near", "mode", "mode_name") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_exclude" ("scope", "ordinal", "value") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice"."assign_assignment_input_exclude" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input_exclude" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_nearest" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input_mode_nearest" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_assignment_input_mode_within" ("scope", "radius") AS
SELECT "r1"."scope", "r1"."radius"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_assignment_input_mode_within" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input" ("step", "learner", "topic", "near", "mode", "mode_name") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_exclude" ("step", "ordinal", "value") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice"."assign_decide_input_exclude" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input_exclude" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_nearest" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input_mode_nearest" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_input_mode_within" ("step", "radius") AS
SELECT "r1"."step", "r1"."radius"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_input_mode_within" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output" ("step", "confidence", "stage", "stage_name") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_vvnbi7fwx4"())["r1"."stage" + 1]::"pg_catalog"."text"
FROM "slice"."assign_decide_output" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_output" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_rest" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_output_stage_rest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_output_stage_rest" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_stage_serve" ("step", "passage", "distance") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_output_stage_serve" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__assign_den"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed"
FROM "slice"."assign_decide_output_weighed" AS "r1";

GRANT SELECT ON TABLE "slice_seats__assign_den"."assign_decide_output_weighed" TO :"slice_seats__assign_den";

CREATE VIEW "slice_seats__auditor"."assign_decide_output" ("step", "confidence", "stage", "stage_name") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_vvnbi7fwx4"())["r1"."stage" + 1]::"pg_catalog"."text"
FROM "slice"."assign_decide_output" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_output" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_stage_serve" ("step", "passage", "distance") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_output_stage_serve" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed"
FROM "slice"."assign_decide_output_weighed" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."assign_decide_output_weighed" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__auditor"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

GRANT SELECT ON TABLE "slice_seats__auditor"."concluded" TO :"slice_seats__auditor";

CREATE VIEW "slice_seats__loader"."assign_assignment_input" ("scope", "learner", "topic", "near", "mode", "mode_name") AS
SELECT "r1"."scope", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice"."assign_assignment_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_exclude" ("scope", "ordinal", "value") AS
SELECT "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice"."assign_assignment_input_exclude" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input_exclude" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_nearest" ("scope") AS
SELECT "r1"."scope"
FROM "slice"."assign_assignment_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input_mode_nearest" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_assignment_input_mode_within" ("scope", "radius") AS
SELECT "r1"."scope", "r1"."radius"
FROM "slice"."assign_assignment_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_assignment_input_mode_within" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input" ("step", "learner", "topic", "near", "mode", "mode_name") AS
SELECT "r1"."step", "r1"."learner", "r1"."topic", "r1"."near", "r1"."mode", ("slice"."__assign_decide_input_mode_names_zoydpw665o"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice"."assign_decide_input" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input_exclude" ("step", "ordinal", "value") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice"."assign_decide_input_exclude" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input_exclude" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_nearest" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_input_mode_nearest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input_mode_nearest" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_input_mode_within" ("step", "radius") AS
SELECT "r1"."step", "r1"."radius"
FROM "slice"."assign_decide_input_mode_within" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_input_mode_within" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output" ("step", "confidence", "stage", "stage_name") AS
SELECT "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_names_vvnbi7fwx4"())["r1"."stage" + 1]::"pg_catalog"."text"
FROM "slice"."assign_decide_output" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_rest" ("step") AS
SELECT "r1"."step"
FROM "slice"."assign_decide_output_stage_rest" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output_stage_rest" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output_stage_serve" ("step", "passage", "distance") AS
SELECT "r1"."step", "r1"."passage", "r1"."distance"
FROM "slice"."assign_decide_output_stage_serve" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output_stage_serve" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."assign_decide_output_weighed" ("step", "ordinal", "passage", "distance", "passed") AS
SELECT "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed"
FROM "slice"."assign_decide_output_weighed" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."assign_decide_output_weighed" TO :"slice_seats__loader";

CREATE VIEW "slice_seats__loader"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

GRANT SELECT ON TABLE "slice_seats__loader"."concluded" TO :"slice_seats__loader";
