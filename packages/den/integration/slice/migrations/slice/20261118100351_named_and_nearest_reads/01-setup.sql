ALTER TABLE "slice"."chain_page_read" RENAME TO "__aside_chain_page_read_qpfj5vixbd";

ALTER TABLE "slice"."__aside_chain_page_read_qpfj5vixbd" RENAME CONSTRAINT "__chain_page_read_pk_yets7gftg6" TO "__aside_chain_page_read_pk_yets_7_gftg_6_bvdorysqpl";

ALTER TABLE "slice"."__aside_chain_page_read_qpfj5vixbd" RENAME TO "chain_page_weights_read";

ALTER TABLE "slice"."chain_page_weights_read" RENAME CONSTRAINT "__chain_page_read_fk_step_wj2fe2lazd" TO "__aside_chain_page_read_fk_step_wj_2_fe_2_lazd_mypx6swxhu";

ALTER TABLE "slice"."chain_page_weights_read" RENAME CONSTRAINT "__aside_chain_page_read_pk_yets_7_gftg_6_bvdorysqpl" TO "__chain_page_weights_read_pk_mvr5jc4gry";

ALTER TABLE "slice"."chain_page_weights_read" RENAME CONSTRAINT "__aside_chain_page_read_fk_step_wj_2_fe_2_lazd_mypx6swxhu" TO "__chain_page_weights_read_fk_step_gpovo4cp33";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
CREATE EXTENSION IF NOT EXISTS "vector" SCHEMA "vector_ext";

CREATE FUNCTION "slice"."__assign_join_names_cks63qswdh"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Assignment"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_join_names_cks63qswdh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_kind_names_nlpfxx2ign"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Decide","AssignmentFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_kind_names_nlpfxx2ign"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Assignment"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() FROM PUBLIC;

CREATE DOMAIN "slice"."assign_join" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_join_names_cks63qswdh"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_kind_names_nlpfxx2ign"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_outcome_names_2mccfiah6k"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_pausable_names_r7pjdx7o42"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."__param_learner_um3dilfdml" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice"."__param_topic_q7i3hfsnkd" AS "slice"."__text_t4rwovzmqj";
