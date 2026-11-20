CREATE TABLE "slice"."assign_admitted" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."assign_assignment_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice"."assign_assignment_input_mode" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_assignment_input_pk_rhoa22jovt" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."assign_assignment_input_exclude" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_assignment_input_exclude_pk_53cp6tgi7q" PRIMARY KEY ("scope", "ordinal", "root")
);

CREATE TABLE "slice"."assign_assignment_input_mode_nearest" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_nearest_pk_fztb2eqo2a" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."assign_assignment_input_mode_within" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "radius" double precision NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_assignment_input_mode_within_pk_udozvnjxuq" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "assign_assignment_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_claim" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_claim_pk_gy4yhzk2me" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice"."assign_decide_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "missed" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "mode" "slice"."assign_decide_input_mode" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_input_pk_phi7dovwvq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_decide_input_exclude" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_input_exclude_pk_emksiazulk" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice"."assign_decide_input_mode_nearest" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_nearest_pk_ajsecg3xwl" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_decide_input_mode_within" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "radius" double precision NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_input_mode_within_pk_5ir7rapaar" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_input_mode_within_radius_finite" CHECK (("radius" > '-Infinity'::double precision AND "radius" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_nearest_read" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "distance" double precision NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_nearest_read_pk_jc4zqvfwss" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice"."assign_decide_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "confidence" double precision NOT NULL,
  "stage" "slice"."assign_decide_output_stage" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_output_pk_tf6r7wtfse" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_output_confidence_finite" CHECK (("confidence" > '-Infinity'::double precision AND "confidence" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_output_stage_rest" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_rest_pk_6ufjdcdzhx" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_decide_output_stage_serve" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_output_stage_serve_pk_g54atpshow" PRIMARY KEY ("step", "root"),
  CONSTRAINT "assign_decide_output_stage_serve_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_output_weighed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "distance" double precision NOT NULL,
  "passed" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_output_weighed_pk_gf74rfsfbw" PRIMARY KEY ("step", "ordinal", "root"),
  CONSTRAINT "assign_decide_output_weighed_distance_finite" CHECK (("distance" > '-Infinity'::double precision AND "distance" < 'Infinity'::double precision) IS TRUE)
);

CREATE TABLE "slice"."assign_decide_seen_read" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_decide_seen_read_pk_sczf2f7gz7" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice"."assign_done" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_done_pk_gzil7jvxpz" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_ended" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_ended_pk_nriwwbcneu" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."assign_exhausted" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_failed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_failed_pk_ygxslcya4o" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_fenced" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_fenced_pk_y6jyfviepa" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."assign_finish" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__assign_finish_key_step_root_4woj5zibbd" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."assign_held" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_held_pk_by245z7t45" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_paused" (
  "target" "slice"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_paused_pk_ulo4grv4e2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."assign_refusal" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_result" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "outcome" "slice"."assign_outcome" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_result_pk_i2yxmpkyzr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assign_resumed" (
  "target" "slice"."assign_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."assign_retry" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."assign_root" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."assign_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  CONSTRAINT "__assign_root_pk_b23qqyryx4" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."assign_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_scope_pk_xytntbncid" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."assign_skipped" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "by" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_skipped_pk_5qhgbueof7" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."assign_start_step" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__assign_start_step_key_step_root_k27j2tutjj" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."assign_step" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."assign_kind" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__assign_step_pk_2oc4ehvfzd" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."assigned" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__assigned_pk_72xowecbf7" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."audit" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  "note" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__audit_pk_dcvpvv5cjz" PRIMARY KEY ("step")
);

CREATE TABLE "slice"."built" (
  "build" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__built_pk_5tj25hcq6k" PRIMARY KEY ("build")
);

CREATE TABLE "slice"."chain_admitted" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."chain_chain_run_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "feed" "slice"."chain_chain_run_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_chain_run_input_pk_ezbgzw4jha" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."chain_claim" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_claim_pk_nrr2rn3gui" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice"."chain_done" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_done_pk_tyyx2hmu3r" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_ended" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_ended_pk_wusc7vjjx6" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."chain_exhausted" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_failed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_fenced" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."chain_finish" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_finish_pk_ebe75jmnzy" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__chain_finish_key_step_root_5aj26igjty" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."chain_held" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_held_pk_73idl7oo5c" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_next" (
  "from" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "to" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_next_pk_qeumlilvtk" PRIMARY KEY ("from", "ordinal", "root"),
  CONSTRAINT "__chain_next_key_to_root_qxqaughmvp" UNIQUE NULLS DISTINCT ("to", "root")
);

CREATE TABLE "slice"."chain_ordered_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "feed" "slice"."chain_ordered_input_feed" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_ordered_input_pk_iv2357obqh" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."chain_page_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "feed" "slice"."chain_page_input_feed" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "pages" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_page_input_pk_xuafsbu5vz" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_page_input_after" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_page_input_after_pk_zsdylv6pam" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_page_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "seq" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "items" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_page_output_pk_whwnpdfgmi" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_page_output_next" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "value" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_page_output_next_pk_h55uzx4bbq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_page_weights_read" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_page_weights_read_pk_mvr5jc4gry" PRIMARY KEY ("step", "ordinal", "root")
);

CREATE TABLE "slice"."chain_paused" (
  "target" "slice"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_paused_pk_oorovhvyps" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."chain_refusal" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_result" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "outcome" "slice"."chain_outcome" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_result_pk_btw3jzlkgl" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."chain_resumed" (
  "target" "slice"."chain_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."chain_retry" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_retry_pk_522nodru3s" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."chain_root" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."chain_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  CONSTRAINT "__chain_root_pk_wqfycdg3x5" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."chain_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_scope_pk_fxzt444lf6" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."chain_skipped" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "by" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."chain_start_step" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_start_step_pk_dgda7shxb4" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__chain_start_step_key_step_root_sgonmabfyw" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."chain_step" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."chain_kind" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__chain_step_pk_u6x5wnvfbv" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."concluded" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "served" "slice"."__text_t4rwovzmqj" NOT NULL,
  "weighed" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__concluded_pk_b44jbktrki" PRIMARY KEY ("learner")
);

CREATE TABLE "slice"."copied" (
  "relation" "slice"."__text_t4rwovzmqj" NOT NULL,
  "run" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__copied_pk_6dsi4gohbu" PRIMARY KEY ("relation", "run")
);

CREATE TABLE "slice"."cursor" (
  "feed" "slice"."feed" NOT NULL,
  "position" bigint NOT NULL,
  CONSTRAINT "__cursor_pk_wl2ngqny4j" PRIMARY KEY ("feed", "position")
);

CREATE TABLE "slice"."fan_admitted" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."fan_batch_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_batch_input_pk_bmhyfuy2bw" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."fan_claim" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "holds" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_claim_pk_e7zimqppco" PRIMARY KEY ("step", "root", "attempt"),
  CONSTRAINT "__fan_claim_key_step_root_attempt_holds_iqkydblyix" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "holds")
);

CREATE TABLE "slice"."fan_done" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_done_pk_5u65252q52" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_ended" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_ended_pk_23aeteyyv7" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."fan_exhausted" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_failed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_failed_pk_z4etp5dmax" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_fan_run_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "size" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_fan_run_input_pk_tbzpgbwe7g" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."fan_fenced" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_fenced_pk_6tkvirerez" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."fan_finish" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_finish_pk_6mb33urjra" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__fan_finish_key_step_root_xshxj2rwb2" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."fan_held" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_held_pk_4ic6tjvac4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_hold" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_gfw43vigph" NOT NULL,
  "resource" "slice"."fan_resource" NOT NULL,
  "seat" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_hold_pk_avuqdkljvb" PRIMARY KEY ("step", "root", "attempt", "at")
);

CREATE TABLE "slice"."fan_paused" (
  "target" "slice"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."fan_refusal" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_refusal_pk_7va55wo2wj" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_result" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "outcome" "slice"."fan_outcome" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_result_pk_yeear352sx" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_resumed" (
  "target" "slice"."fan_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."fan_retry" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_retry_pk_7xubce4v66" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."fan_root" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."fan_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  CONSTRAINT "__fan_root_pk_jesu7xtefn" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."fan_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_scope_pk_7bvjfihnef" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."fan_skipped" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "by" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_skipped_pk_22erbmfzer" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."fan_square_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "n" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_square_input_pk_uzumoizv53" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_square_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "square" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_square_output_pk_wcgarjqvhr" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_start_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "child" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__fan_start_scope_key_child_root_twylnvawre" UNIQUE NULLS DISTINCT ("child", "root")
);

CREATE TABLE "slice"."fan_start_step" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_start_step_pk_7e247xk4mz" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__fan_start_step_key_step_root_h32wwrpq3c" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."fan_step" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."fan_kind" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_step_pk_2f4tcxnofk" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."fan_within" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "parent" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."fan_child_kind" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__fan_within_pk_g5tswgjfa6" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."item" (
  "feed" "slice"."feed" NOT NULL,
  "seq" bigint NOT NULL,
  "n" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__item_pk_ai4obgmq4k" PRIMARY KEY ("feed", "seq", "n")
);

CREATE TABLE "slice"."missed" (
  "question" "slice"."__text_t4rwovzmqj" NOT NULL,
  "embedding" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__missed_pk_yzhoj6jwnt" PRIMARY KEY ("question"),
  CONSTRAINT "__missed_norm_embedding_q23vgxiv6r" CHECK (("vector_ext"."vector_norm"("embedding") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."order" (
  "order" "slice"."__text_t4rwovzmqj" NOT NULL,
  "feed" "slice"."feed" NOT NULL,
  CONSTRAINT "__order_pk_qodq3est7o" PRIMARY KEY ("order")
);

CREATE TABLE "slice"."passage" (
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  "topic" "slice"."__text_t4rwovzmqj" NOT NULL,
  "embedding" "vector_ext"."vector"(4) NOT NULL,
  CONSTRAINT "__passage_pk_kayjlxd3gv" PRIMARY KEY ("passage"),
  CONSTRAINT "__passage_norm_embedding_d2siyt575a" CHECK (("vector_ext"."vector_norm"("embedding") BETWEEN '3.3881317890172014e-21'::double precision AND '9223372036854776000'::double precision) IS TRUE)
);

CREATE TABLE "slice"."retry_admitted" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_admitted_pk_qyp7cminjx" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."retry_brittle_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_brittle_input_pk_tlqssexohy" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_brittle_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_brittle_output_pk_oecjcng2s4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_claim" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_claim_pk_aayzt5ni6z" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice"."retry_done" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_done_pk_vtkpce7rkq" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_ended" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_ended_pk_hq35r7u2t2" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."retry_exhausted" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_exhausted_pk_v56c23krid" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_failed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_failed_pk_mygc4onczp" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_fenced" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_fenced_pk_umzicmiruo" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."retry_finish" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__retry_finish_key_step_root_a7vhiwagne" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."retry_held" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_held_pk_nvgeylmjp2" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_ladders_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "steadfast" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "brittle" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_ladders_input_pk_5cdnkfgg3x" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."retry_paused" (
  "target" "slice"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_paused_pk_umm2nscqny" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."retry_refusal" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_refusal_pk_nifndsd6pp" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_result" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "outcome" "slice"."retry_outcome" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_result_pk_5fegihvmml" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_resumed" (
  "target" "slice"."retry_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."retry_retry" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_retry_pk_slrwn4rt5d" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."retry_root" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."retry_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  CONSTRAINT "__retry_root_pk_qi2iw36jky" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."retry_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_scope_pk_fgji2phvxy" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."retry_skipped" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "by" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_skipped_pk_au5z33ql7a" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."retry_start_step" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_start_step_pk_mp77csmi26" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__retry_start_step_key_step_root_fudt2vk7zs" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."retry_steadfast_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_steadfast_input_pk_omubooh2k3" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_steadfast_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_steadfast_output_pk_xyvfgnpd5w" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."retry_step" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."retry_kind" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__retry_step_pk_opjqidwhzg" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."seen" (
  "learner" "slice"."__text_t4rwovzmqj" NOT NULL,
  "passage" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__seen_pk_g4ptcxwowb" PRIMARY KEY ("learner", "passage")
);

CREATE TABLE "slice"."settled" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  CONSTRAINT "__settled_pk_yitdz6z3ts" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."sync_admitted" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_admitted_pk_ral53o3fpi" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."sync_build_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_build_input_pk_wtjr2xzecg" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_build_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_build_output_pk_rhnco3epch" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_claim" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "until" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_claim_pk_s2tqnziq4u" PRIMARY KEY ("step", "root", "attempt")
);

CREATE TABLE "slice"."sync_copy_input" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_copy_input_pk_nzsbbbp6o5" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_copy_output" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_copy_output_pk_x6s2tcx7ot" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_done" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_done_pk_nllomjb7og" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_ended" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_ended_pk_uxijjz7koz" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."sync_exclusive" (
  "kind" "slice"."sync_root_kind" NOT NULL,
  "key" "slice"."__domain_jevqauzmw6" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice"."sync_exclusive_key" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "id" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."sync_exhausted" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_failed" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_failed_pk_gqykngewxb" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_fenced" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."sync_finish" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_finish_pk_hn7tmx25xc" PRIMARY KEY ("scope", "root"),
  CONSTRAINT "__sync_finish_key_step_root_kpt2idultt" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."sync_gold_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "build" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_gold_input_pk_wp7hfx6n2e" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."sync_held" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_held_pk_wsme4moka4" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_paused" (
  "target" "slice"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_paused_pk_tstk2okngj" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."sync_refusal" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "law" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_refusal_pk_mbmfornc5c" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_released" (
  "kind" "slice"."sync_root_kind" NOT NULL,
  "key" "slice"."__domain_jevqauzmw6" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_released_pk_k7qaw2iram" PRIMARY KEY ("kind", "key", "turn")
);

CREATE TABLE "slice"."sync_result" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "outcome" "slice"."sync_outcome" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_result_pk_jmwy2p3mqf" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_resumed" (
  "target" "slice"."sync_pausable" NOT NULL,
  "turn" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" PRIMARY KEY ("target", "turn")
);

CREATE TABLE "slice"."sync_retry" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "attempt" "slice"."__domain_gfw43vigph" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "spent" boolean NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_retry_pk_6q52red7iw" PRIMARY KEY ("step", "attempt", "root")
);

CREATE TABLE "slice"."sync_root" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."sync_root_kind" NOT NULL,
  "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "at" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "retired" boolean DEFAULT false NOT NULL,
  CONSTRAINT "__sync_root_pk_daktpubfe2" PRIMARY KEY ("scope")
);

CREATE TABLE "slice"."sync_scope" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_scope_pk_bg72sm6p4z" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."sync_skipped" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "by" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_skipped_pk_yutjqacvws" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."sync_start_step" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "ordinal" "slice"."__domain_gfw43vigph" NOT NULL,
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" PRIMARY KEY ("scope", "ordinal", "root"),
  CONSTRAINT "__sync_start_step_key_step_root_rkceslwobo" UNIQUE NULLS DISTINCT ("step", "root")
);

CREATE TABLE "slice"."sync_step" (
  "step" "slice"."__domain_jevqauzmw6" NOT NULL,
  "kind" "slice"."sync_kind" NOT NULL,
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "due" "slice"."__domain_mxhao3k6ss" NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_step_pk_wfgcxdvbwo" PRIMARY KEY ("step", "root")
);

CREATE TABLE "slice"."sync_sync_run_input" (
  "scope" "slice"."__domain_jevqauzmw6" NOT NULL,
  "relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "run" bigint NOT NULL,
  "root" "slice"."__domain_jevqauzmw6" NOT NULL,
  CONSTRAINT "__sync_sync_run_input_pk_cpbaujyjwv" PRIMARY KEY ("scope", "root")
);

CREATE TABLE "slice"."tally" (
  "batch" "slice"."__text_t4rwovzmqj" NOT NULL,
  "count" "slice"."__domain_gfw43vigph" NOT NULL,
  "total" bigint NOT NULL,
  CONSTRAINT "__tally_pk_7jc66uxxx4" PRIMARY KEY ("batch")
);

CREATE TABLE "slice"."weight" (
  "feed" "slice"."feed" NOT NULL,
  "factor" "slice"."__domain_gfw43vigph" NOT NULL,
  CONSTRAINT "__weight_pk_p77rl634io" PRIMARY KEY ("feed", "factor")
);

CREATE TABLE "slice"."__live_secret" ("secret") AS SELECT "pg_catalog"."sha256"("pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()) || "pg_catalog"."uuid_send"("pg_catalog"."gen_random_uuid"()));

REVOKE ALL ON TABLE "slice"."__live_secret" FROM PUBLIC;

ALTER TABLE "slice"."assign_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."chain_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."fan_within" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."passage" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."retry_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."sync_step" REPLICA IDENTITY FULL;

ALTER TABLE "slice"."assign_assignment_input_exclude"
  ADD COLUMN "__root_yjobx7uyrd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__scope_u6ypqf2r2z" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "scope" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_claim"
  ADD COLUMN "__root_yewsvvtcyz" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_ouvkclqzzd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_dqbvoe7dfs" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_decide_input_exclude"
  ADD COLUMN "__root_yjobx7uyrd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_mjpuijzth4" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_decide_output_weighed"
  ADD COLUMN "__root_yjobx7uyrd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_mjpuijzth4" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_ordinal_rdz3ttleig" bigint GENERATED ALWAYS AS (CASE WHEN "ordinal" >= 1::bigint AND "ordinal" > 0::bigint THEN "ordinal"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."assign_root"
  ADD COLUMN "__scope_jdl7uajdrr" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  ADD CONSTRAINT "__assign_root_key_scope_77r36z7vhn" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr");

ALTER TABLE "slice"."chain_claim"
  ADD COLUMN "__root_yewsvvtcyz" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_ouvkclqzzd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_dqbvoe7dfs" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."chain_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."chain_root"
  ADD COLUMN "__scope_jdl7uajdrr" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  ADD CONSTRAINT "__chain_root_key_scope_prbadyie6j" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr");

ALTER TABLE "slice"."fan_claim"
  ADD COLUMN "__root_yewsvvtcyz" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_ouvkclqzzd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_dqbvoe7dfs" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED,
  ADD COLUMN "__pred_holds_lq7itfruzz" bigint GENERATED ALWAYS AS (CASE WHEN "holds" > 0::bigint THEN "holds"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_hold"
  ADD COLUMN "__copy_holds_c6hi2i2kfb" bigint NOT NULL,
  ADD COLUMN "__pred_at_xktcobhsti" bigint GENERATED ALWAYS AS (CASE WHEN "at" > 0::bigint THEN "at"::numeric - (1::bigint)::numeric END) STORED,
  ADD CONSTRAINT "__fan_hold_key_step_root_attempt_pred_at_kgbxki2ddu" UNIQUE NULLS DISTINCT ("step", "root", "attempt", "__pred_at_xktcobhsti"),
  ADD CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_bb3ww7vxet" CHECK (("at" < "__copy_holds_c6hi2i2kfb") IS TRUE);

ALTER TABLE "slice"."fan_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."fan_root"
  ADD COLUMN "__scope_jdl7uajdrr" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  ADD CONSTRAINT "__fan_root_key_scope_i3qel4nyj5" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr");

ALTER TABLE "slice"."retry_claim"
  ADD COLUMN "__root_yewsvvtcyz" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_ouvkclqzzd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_dqbvoe7dfs" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."retry_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."retry_root"
  ADD COLUMN "__scope_jdl7uajdrr" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  ADD CONSTRAINT "__retry_root_key_scope_yc7em5k35u" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr");

ALTER TABLE "slice"."sync_claim"
  ADD COLUMN "__root_yewsvvtcyz" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "root" END) STORED,
  ADD COLUMN "__step_ouvkclqzzd" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint THEN "step" END) STORED,
  ADD COLUMN "__pred_attempt_dqbvoe7dfs" bigint GENERATED ALWAYS AS (CASE WHEN "attempt" >= 1::bigint AND "attempt" > 0::bigint THEN "attempt"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_exclusive" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_paused" ADD COLUMN "__pred_turn_qryngij6c4" bigint GENERATED ALWAYS AS (CASE WHEN "turn" > 0::bigint THEN "turn"::numeric - (1::bigint)::numeric END) STORED;

ALTER TABLE "slice"."sync_root"
  ADD COLUMN "__scope_jdl7uajdrr" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" GENERATED ALWAYS AS (CASE WHEN "retired" = false THEN "scope" END) STORED,
  ADD CONSTRAINT "__sync_root_key_scope_lxj4sb3mcx" UNIQUE NULLS DISTINCT ("__scope_jdl7uajdrr");

CREATE OR REPLACE FUNCTION "slice"."__hold_assign_root_rwboli77cc"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."assign_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__assign_admitted_in_assign_root_56frawwv2n'::"pg_catalog"."text", 'k["AssignAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice"."assign_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__hold_assign_root_rwboli77cc"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."chain_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__chain_admitted_in_chain_root_dumegkr74f'::"pg_catalog"."text", 'k["ChainAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice"."chain_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__hold_chain_root_wgndggnfwf"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."fan_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__fan_admitted_in_fan_root_27wekwjj25'::"pg_catalog"."text", 'k["FanAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice"."fan_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__hold_fan_root_4vwfxofrxw"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."retry_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__retry_admitted_in_retry_root_unbzuajlb3'::"pg_catalog"."text", 'k["RetryAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice"."retry_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__hold_retry_root_54bybhkxg6"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."sync_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR KEY SHARE OF "r1";
  PERFORM "slice"."__refuse"('23000'::"pg_catalog"."text", '__sync_admitted_in_sync_root_epwog5czvj'::"pg_catalog"."text", 'k["SyncAdmitted",["root"],['::"pg_catalog"."text" || "pg_catalog"."to_jsonb"("r1"."c1"::"pg_catalog"."text")::"pg_catalog"."text" || ']]'::"pg_catalog"."text") FROM (SELECT DISTINCT "r2"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r2"("c1")) AS "r1"("c1") WHERE NOT EXISTS (SELECT 1 FROM "slice"."sync_root" AS "r3" WHERE "r3"."scope" = "r1"."c1" AND NOT "r3"."retired") ORDER BY "r1"."c1" LIMIT 1::bigint;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__hold_sync_root_6ita6q5wxi"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."assign_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY
  WITH "r1"("c1") AS MATERIALIZED (
    SELECT "r2"."scope" AS "c1" FROM "slice"."assign_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired"
  ),
  "r5" AS (
    DELETE FROM "slice"."assign_admitted" AS "r6"
    USING "r1" AS "r7"
    WHERE "r6"."root" = "r7"."c1"
    RETURNING 1 AS "c1"
  ),
  "r8" AS (
    DELETE FROM "slice"."assign_assignment_input" AS "r9"
    USING "r1" AS "r10"
    WHERE "r9"."root" = "r10"."c1"
    RETURNING 1 AS "c1"
  ),
  "r11" AS (
    DELETE FROM "slice"."assign_assignment_input_exclude" AS "r12"
    USING "r1" AS "r13"
    WHERE "r12"."root" = "r13"."c1"
    RETURNING 1 AS "c1"
  ),
  "r14" AS (
    DELETE FROM "slice"."assign_assignment_input_mode_nearest" AS "r15"
    USING "r1" AS "r16"
    WHERE "r15"."root" = "r16"."c1"
    RETURNING 1 AS "c1"
  ),
  "r17" AS (
    DELETE FROM "slice"."assign_assignment_input_mode_within" AS "r18"
    USING "r1" AS "r19"
    WHERE "r18"."root" = "r19"."c1"
    RETURNING 1 AS "c1"
  ),
  "r20" AS (
    DELETE FROM "slice"."assign_claim" AS "r21"
    USING "r1" AS "r22"
    WHERE "r21"."root" = "r22"."c1"
    RETURNING 1 AS "c1"
  ),
  "r23" AS (
    DELETE FROM "slice"."assign_decide_input" AS "r24"
    USING "r1" AS "r25"
    WHERE "r24"."root" = "r25"."c1"
    RETURNING 1 AS "c1"
  ),
  "r26" AS (
    DELETE FROM "slice"."assign_decide_input_exclude" AS "r27"
    USING "r1" AS "r28"
    WHERE "r27"."root" = "r28"."c1"
    RETURNING 1 AS "c1"
  ),
  "r29" AS (
    DELETE FROM "slice"."assign_decide_input_mode_nearest" AS "r30"
    USING "r1" AS "r31"
    WHERE "r30"."root" = "r31"."c1"
    RETURNING 1 AS "c1"
  ),
  "r32" AS (
    DELETE FROM "slice"."assign_decide_input_mode_within" AS "r33"
    USING "r1" AS "r34"
    WHERE "r33"."root" = "r34"."c1"
    RETURNING 1 AS "c1"
  ),
  "r35" AS (
    DELETE FROM "slice"."assign_decide_nearest_read" AS "r36"
    USING "r1" AS "r37"
    WHERE "r36"."root" = "r37"."c1"
    RETURNING 1 AS "c1"
  ),
  "r38" AS (
    DELETE FROM "slice"."assign_decide_output" AS "r39"
    USING "r1" AS "r40"
    WHERE "r39"."root" = "r40"."c1"
    RETURNING 1 AS "c1"
  ),
  "r41" AS (
    DELETE FROM "slice"."assign_decide_output_stage_rest" AS "r42"
    USING "r1" AS "r43"
    WHERE "r42"."root" = "r43"."c1"
    RETURNING 1 AS "c1"
  ),
  "r44" AS (
    DELETE FROM "slice"."assign_decide_output_stage_serve" AS "r45"
    USING "r1" AS "r46"
    WHERE "r45"."root" = "r46"."c1"
    RETURNING 1 AS "c1"
  ),
  "r47" AS (
    DELETE FROM "slice"."assign_decide_output_weighed" AS "r48"
    USING "r1" AS "r49"
    WHERE "r48"."root" = "r49"."c1"
    RETURNING 1 AS "c1"
  ),
  "r50" AS (
    DELETE FROM "slice"."assign_decide_seen_read" AS "r51"
    USING "r1" AS "r52"
    WHERE "r51"."root" = "r52"."c1"
    RETURNING 1 AS "c1"
  ),
  "r53" AS (
    DELETE FROM "slice"."assign_done" AS "r54"
    USING "r1" AS "r55"
    WHERE "r54"."root" = "r55"."c1"
    RETURNING 1 AS "c1"
  ),
  "r56" AS (
    DELETE FROM "slice"."assign_ended" AS "r57"
    USING "r1" AS "r58"
    WHERE "r57"."root" = "r58"."c1"
    RETURNING 1 AS "c1"
  ),
  "r59" AS (
    DELETE FROM "slice"."assign_exhausted" AS "r60"
    USING "r1" AS "r61"
    WHERE "r60"."root" = "r61"."c1"
    RETURNING 1 AS "c1"
  ),
  "r62" AS (
    DELETE FROM "slice"."assign_failed" AS "r63"
    USING "r1" AS "r64"
    WHERE "r63"."root" = "r64"."c1"
    RETURNING 1 AS "c1"
  ),
  "r65" AS (
    DELETE FROM "slice"."assign_fenced" AS "r66"
    USING "r1" AS "r67"
    WHERE "r66"."root" = "r67"."c1"
    RETURNING 1 AS "c1"
  ),
  "r68" AS (
    DELETE FROM "slice"."assign_finish" AS "r69"
    USING "r1" AS "r70"
    WHERE "r69"."root" = "r70"."c1"
    RETURNING 1 AS "c1"
  ),
  "r71" AS (
    DELETE FROM "slice"."assign_held" AS "r72"
    USING "r1" AS "r73"
    WHERE "r72"."root" = "r73"."c1"
    RETURNING 1 AS "c1"
  ),
  "r74" AS (
    DELETE FROM "slice"."assign_refusal" AS "r75"
    USING "r1" AS "r76"
    WHERE "r75"."root" = "r76"."c1"
    RETURNING 1 AS "c1"
  ),
  "r77" AS (
    DELETE FROM "slice"."assign_result" AS "r78"
    USING "r1" AS "r79"
    WHERE "r78"."root" = "r79"."c1"
    RETURNING 1 AS "c1"
  ),
  "r80" AS (
    DELETE FROM "slice"."assign_retry" AS "r81"
    USING "r1" AS "r82"
    WHERE "r81"."root" = "r82"."c1"
    RETURNING 1 AS "c1"
  ),
  "r83" AS (
    DELETE FROM "slice"."assign_scope" AS "r84"
    USING "r1" AS "r85"
    WHERE "r84"."root" = "r85"."c1"
    RETURNING 1 AS "c1"
  ),
  "r86" AS (
    DELETE FROM "slice"."assign_skipped" AS "r87"
    USING "r1" AS "r88"
    WHERE "r87"."root" = "r88"."c1"
    RETURNING 1 AS "c1"
  ),
  "r89" AS (
    DELETE FROM "slice"."assign_start_step" AS "r90"
    USING "r1" AS "r91"
    WHERE "r90"."root" = "r91"."c1"
    RETURNING 1 AS "c1"
  ),
  "r92" AS (
    DELETE FROM "slice"."assign_step" AS "r93"
    USING "r1" AS "r94"
    WHERE "r93"."root" = "r94"."c1"
    RETURNING 1 AS "c1"
  ),
  "r95" AS (
    UPDATE "slice"."assign_root" AS "r96"
    SET "retired" = true
    FROM "r1" AS "r97"
    WHERE "r96"."scope" = "r97"."c1"
    RETURNING 1 AS "c1"
  )
  SELECT "r99"."c1" AS "c1"
  FROM (SELECT "pg_catalog"."array_agg"("r98"."c2" ORDER BY "r98"."c1") AS "c1", "r98"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r95" AS "r100" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r101" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r102" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r103" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r104" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r105" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r106" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r107" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r108" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r109" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r110" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r111" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r112" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r113" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r114" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r115" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r116" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r117" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r118" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r119" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r120" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r121" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r122" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r123" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r124" UNION ALL SELECT 25 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r125" UNION ALL SELECT 26 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r80" AS "r126" UNION ALL SELECT 27 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r83" AS "r127" UNION ALL SELECT 28 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r86" AS "r128" UNION ALL SELECT 29 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r89" AS "r129" UNION ALL SELECT 30 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r92" AS "r130") AS "r98"("c1", "c2", "c3") GROUP BY "r98"."c3") AS "r99"("c1", "c2")
  LIMIT 1::bigint
  ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__retire_assign_root_hwbj4sewrx"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."chain_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY
  WITH "r1"("c1") AS MATERIALIZED (
    SELECT "r2"."scope" AS "c1" FROM "slice"."chain_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired"
  ),
  "r5" AS (
    DELETE FROM "slice"."chain_admitted" AS "r6"
    USING "r1" AS "r7"
    WHERE "r6"."root" = "r7"."c1"
    RETURNING 1 AS "c1"
  ),
  "r8" AS (
    DELETE FROM "slice"."chain_chain_run_input" AS "r9"
    USING "r1" AS "r10"
    WHERE "r9"."root" = "r10"."c1"
    RETURNING 1 AS "c1"
  ),
  "r11" AS (
    DELETE FROM "slice"."chain_claim" AS "r12"
    USING "r1" AS "r13"
    WHERE "r12"."root" = "r13"."c1"
    RETURNING 1 AS "c1"
  ),
  "r14" AS (
    DELETE FROM "slice"."chain_done" AS "r15"
    USING "r1" AS "r16"
    WHERE "r15"."root" = "r16"."c1"
    RETURNING 1 AS "c1"
  ),
  "r17" AS (
    DELETE FROM "slice"."chain_ended" AS "r18"
    USING "r1" AS "r19"
    WHERE "r18"."root" = "r19"."c1"
    RETURNING 1 AS "c1"
  ),
  "r20" AS (
    DELETE FROM "slice"."chain_exhausted" AS "r21"
    USING "r1" AS "r22"
    WHERE "r21"."root" = "r22"."c1"
    RETURNING 1 AS "c1"
  ),
  "r23" AS (
    DELETE FROM "slice"."chain_failed" AS "r24"
    USING "r1" AS "r25"
    WHERE "r24"."root" = "r25"."c1"
    RETURNING 1 AS "c1"
  ),
  "r26" AS (
    DELETE FROM "slice"."chain_fenced" AS "r27"
    USING "r1" AS "r28"
    WHERE "r27"."root" = "r28"."c1"
    RETURNING 1 AS "c1"
  ),
  "r29" AS (
    DELETE FROM "slice"."chain_finish" AS "r30"
    USING "r1" AS "r31"
    WHERE "r30"."root" = "r31"."c1"
    RETURNING 1 AS "c1"
  ),
  "r32" AS (
    DELETE FROM "slice"."chain_held" AS "r33"
    USING "r1" AS "r34"
    WHERE "r33"."root" = "r34"."c1"
    RETURNING 1 AS "c1"
  ),
  "r35" AS (
    DELETE FROM "slice"."chain_next" AS "r36"
    USING "r1" AS "r37"
    WHERE "r36"."root" = "r37"."c1"
    RETURNING 1 AS "c1"
  ),
  "r38" AS (
    DELETE FROM "slice"."chain_ordered_input" AS "r39"
    USING "r1" AS "r40"
    WHERE "r39"."root" = "r40"."c1"
    RETURNING 1 AS "c1"
  ),
  "r41" AS (
    DELETE FROM "slice"."chain_page_input" AS "r42"
    USING "r1" AS "r43"
    WHERE "r42"."root" = "r43"."c1"
    RETURNING 1 AS "c1"
  ),
  "r44" AS (
    DELETE FROM "slice"."chain_page_input_after" AS "r45"
    USING "r1" AS "r46"
    WHERE "r45"."root" = "r46"."c1"
    RETURNING 1 AS "c1"
  ),
  "r47" AS (
    DELETE FROM "slice"."chain_page_output" AS "r48"
    USING "r1" AS "r49"
    WHERE "r48"."root" = "r49"."c1"
    RETURNING 1 AS "c1"
  ),
  "r50" AS (
    DELETE FROM "slice"."chain_page_output_next" AS "r51"
    USING "r1" AS "r52"
    WHERE "r51"."root" = "r52"."c1"
    RETURNING 1 AS "c1"
  ),
  "r53" AS (
    DELETE FROM "slice"."chain_page_weights_read" AS "r54"
    USING "r1" AS "r55"
    WHERE "r54"."root" = "r55"."c1"
    RETURNING 1 AS "c1"
  ),
  "r56" AS (
    DELETE FROM "slice"."chain_refusal" AS "r57"
    USING "r1" AS "r58"
    WHERE "r57"."root" = "r58"."c1"
    RETURNING 1 AS "c1"
  ),
  "r59" AS (
    DELETE FROM "slice"."chain_result" AS "r60"
    USING "r1" AS "r61"
    WHERE "r60"."root" = "r61"."c1"
    RETURNING 1 AS "c1"
  ),
  "r62" AS (
    DELETE FROM "slice"."chain_retry" AS "r63"
    USING "r1" AS "r64"
    WHERE "r63"."root" = "r64"."c1"
    RETURNING 1 AS "c1"
  ),
  "r65" AS (
    DELETE FROM "slice"."chain_scope" AS "r66"
    USING "r1" AS "r67"
    WHERE "r66"."root" = "r67"."c1"
    RETURNING 1 AS "c1"
  ),
  "r68" AS (
    DELETE FROM "slice"."chain_skipped" AS "r69"
    USING "r1" AS "r70"
    WHERE "r69"."root" = "r70"."c1"
    RETURNING 1 AS "c1"
  ),
  "r71" AS (
    DELETE FROM "slice"."chain_start_step" AS "r72"
    USING "r1" AS "r73"
    WHERE "r72"."root" = "r73"."c1"
    RETURNING 1 AS "c1"
  ),
  "r74" AS (
    DELETE FROM "slice"."chain_step" AS "r75"
    USING "r1" AS "r76"
    WHERE "r75"."root" = "r76"."c1"
    RETURNING 1 AS "c1"
  ),
  "r77" AS (
    UPDATE "slice"."chain_root" AS "r78"
    SET "retired" = true
    FROM "r1" AS "r79"
    WHERE "r78"."scope" = "r79"."c1"
    RETURNING 1 AS "c1"
  )
  SELECT "r81"."c1" AS "c1"
  FROM (SELECT "pg_catalog"."array_agg"("r80"."c2" ORDER BY "r80"."c1") AS "c1", "r80"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r77" AS "r82" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r83" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r84" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r85" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r86" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r87" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r88" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r89" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r90" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r91" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r92" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r93" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r94" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r95" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r96" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r97" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r98" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r99" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r100" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r101" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r102" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r103" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r104" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r105" UNION ALL SELECT 24 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r106") AS "r80"("c1", "c2", "c3") GROUP BY "r80"."c3") AS "r81"("c1", "c2")
  LIMIT 1::bigint
  ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__retire_chain_root_ji6nmac7of"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__retire_fan_root_niesya7vcd"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."fan_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY
  WITH "r1"("c1") AS MATERIALIZED (
    SELECT "r2"."scope" AS "c1" FROM "slice"."fan_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired"
  ),
  "r5" AS (
    DELETE FROM "slice"."fan_admitted" AS "r6"
    USING "r1" AS "r7"
    WHERE "r6"."root" = "r7"."c1"
    RETURNING 1 AS "c1"
  ),
  "r8" AS (
    DELETE FROM "slice"."fan_batch_input" AS "r9"
    USING "r1" AS "r10"
    WHERE "r9"."root" = "r10"."c1"
    RETURNING 1 AS "c1"
  ),
  "r11" AS (
    DELETE FROM "slice"."fan_claim" AS "r12"
    USING "r1" AS "r13"
    WHERE "r12"."root" = "r13"."c1"
    RETURNING 1 AS "c1"
  ),
  "r14" AS (
    DELETE FROM "slice"."fan_done" AS "r15"
    USING "r1" AS "r16"
    WHERE "r15"."root" = "r16"."c1"
    RETURNING 1 AS "c1"
  ),
  "r17" AS (
    DELETE FROM "slice"."fan_ended" AS "r18"
    USING "r1" AS "r19"
    WHERE "r18"."root" = "r19"."c1"
    RETURNING 1 AS "c1"
  ),
  "r20" AS (
    DELETE FROM "slice"."fan_exhausted" AS "r21"
    USING "r1" AS "r22"
    WHERE "r21"."root" = "r22"."c1"
    RETURNING 1 AS "c1"
  ),
  "r23" AS (
    DELETE FROM "slice"."fan_failed" AS "r24"
    USING "r1" AS "r25"
    WHERE "r24"."root" = "r25"."c1"
    RETURNING 1 AS "c1"
  ),
  "r26" AS (
    DELETE FROM "slice"."fan_fan_run_input" AS "r27"
    USING "r1" AS "r28"
    WHERE "r27"."root" = "r28"."c1"
    RETURNING 1 AS "c1"
  ),
  "r29" AS (
    DELETE FROM "slice"."fan_fenced" AS "r30"
    USING "r1" AS "r31"
    WHERE "r30"."root" = "r31"."c1"
    RETURNING 1 AS "c1"
  ),
  "r32" AS (
    DELETE FROM "slice"."fan_finish" AS "r33"
    USING "r1" AS "r34"
    WHERE "r33"."root" = "r34"."c1"
    RETURNING 1 AS "c1"
  ),
  "r35" AS (
    DELETE FROM "slice"."fan_held" AS "r36"
    USING "r1" AS "r37"
    WHERE "r36"."root" = "r37"."c1"
    RETURNING 1 AS "c1"
  ),
  "r38" AS (
    DELETE FROM "slice"."fan_hold" AS "r39"
    USING "r1" AS "r40"
    WHERE "r39"."root" = "r40"."c1"
    RETURNING 1 AS "c1"
  ),
  "r41" AS (
    DELETE FROM "slice"."fan_refusal" AS "r42"
    USING "r1" AS "r43"
    WHERE "r42"."root" = "r43"."c1"
    RETURNING 1 AS "c1"
  ),
  "r44" AS (
    DELETE FROM "slice"."fan_result" AS "r45"
    USING "r1" AS "r46"
    WHERE "r45"."root" = "r46"."c1"
    RETURNING 1 AS "c1"
  ),
  "r47" AS (
    DELETE FROM "slice"."fan_retry" AS "r48"
    USING "r1" AS "r49"
    WHERE "r48"."root" = "r49"."c1"
    RETURNING 1 AS "c1"
  ),
  "r50" AS (
    DELETE FROM "slice"."fan_scope" AS "r51"
    USING "r1" AS "r52"
    WHERE "r51"."root" = "r52"."c1"
    RETURNING 1 AS "c1"
  ),
  "r53" AS (
    DELETE FROM "slice"."fan_skipped" AS "r54"
    USING "r1" AS "r55"
    WHERE "r54"."root" = "r55"."c1"
    RETURNING 1 AS "c1"
  ),
  "r56" AS (
    DELETE FROM "slice"."fan_square_input" AS "r57"
    USING "r1" AS "r58"
    WHERE "r57"."root" = "r58"."c1"
    RETURNING 1 AS "c1"
  ),
  "r59" AS (
    DELETE FROM "slice"."fan_square_output" AS "r60"
    USING "r1" AS "r61"
    WHERE "r60"."root" = "r61"."c1"
    RETURNING 1 AS "c1"
  ),
  "r62" AS (
    DELETE FROM "slice"."fan_start_scope" AS "r63"
    USING "r1" AS "r64"
    WHERE "r63"."root" = "r64"."c1"
    RETURNING 1 AS "c1"
  ),
  "r65" AS (
    DELETE FROM "slice"."fan_start_step" AS "r66"
    USING "r1" AS "r67"
    WHERE "r66"."root" = "r67"."c1"
    RETURNING 1 AS "c1"
  ),
  "r68" AS (
    DELETE FROM "slice"."fan_step" AS "r69"
    USING "r1" AS "r70"
    WHERE "r69"."root" = "r70"."c1"
    RETURNING 1 AS "c1"
  ),
  "r71" AS (
    DELETE FROM "slice"."fan_within" AS "r72"
    USING "r1" AS "r73"
    WHERE "r72"."root" = "r73"."c1"
    RETURNING 1 AS "c1"
  ),
  "r74" AS (
    UPDATE "slice"."fan_root" AS "r75"
    SET "retired" = true
    FROM "r1" AS "r76"
    WHERE "r75"."scope" = "r76"."c1"
    RETURNING 1 AS "c1"
  )
  SELECT "r78"."c1" AS "c1"
  FROM (SELECT "pg_catalog"."array_agg"("r77"."c2" ORDER BY "r77"."c1") AS "c1", "r77"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r79" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r80" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r81" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r82" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r83" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r84" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r85" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r86" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r87" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r88" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r89" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r90" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r91" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r92" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r93" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r94" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r95" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r96" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r97" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r98" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r99" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r100" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r101" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r102") AS "r77"("c1", "c2", "c3") GROUP BY "r77"."c3") AS "r78"("c1", "c2")
  LIMIT 1::bigint
  ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__retire_fan_root_niesya7vcd"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."retry_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY
  WITH "r1"("c1") AS MATERIALIZED (
    SELECT "r2"."scope" AS "c1" FROM "slice"."retry_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired"
  ),
  "r5" AS (
    DELETE FROM "slice"."retry_admitted" AS "r6"
    USING "r1" AS "r7"
    WHERE "r6"."root" = "r7"."c1"
    RETURNING 1 AS "c1"
  ),
  "r8" AS (
    DELETE FROM "slice"."retry_brittle_input" AS "r9"
    USING "r1" AS "r10"
    WHERE "r9"."root" = "r10"."c1"
    RETURNING 1 AS "c1"
  ),
  "r11" AS (
    DELETE FROM "slice"."retry_brittle_output" AS "r12"
    USING "r1" AS "r13"
    WHERE "r12"."root" = "r13"."c1"
    RETURNING 1 AS "c1"
  ),
  "r14" AS (
    DELETE FROM "slice"."retry_claim" AS "r15"
    USING "r1" AS "r16"
    WHERE "r15"."root" = "r16"."c1"
    RETURNING 1 AS "c1"
  ),
  "r17" AS (
    DELETE FROM "slice"."retry_done" AS "r18"
    USING "r1" AS "r19"
    WHERE "r18"."root" = "r19"."c1"
    RETURNING 1 AS "c1"
  ),
  "r20" AS (
    DELETE FROM "slice"."retry_ended" AS "r21"
    USING "r1" AS "r22"
    WHERE "r21"."root" = "r22"."c1"
    RETURNING 1 AS "c1"
  ),
  "r23" AS (
    DELETE FROM "slice"."retry_exhausted" AS "r24"
    USING "r1" AS "r25"
    WHERE "r24"."root" = "r25"."c1"
    RETURNING 1 AS "c1"
  ),
  "r26" AS (
    DELETE FROM "slice"."retry_failed" AS "r27"
    USING "r1" AS "r28"
    WHERE "r27"."root" = "r28"."c1"
    RETURNING 1 AS "c1"
  ),
  "r29" AS (
    DELETE FROM "slice"."retry_fenced" AS "r30"
    USING "r1" AS "r31"
    WHERE "r30"."root" = "r31"."c1"
    RETURNING 1 AS "c1"
  ),
  "r32" AS (
    DELETE FROM "slice"."retry_finish" AS "r33"
    USING "r1" AS "r34"
    WHERE "r33"."root" = "r34"."c1"
    RETURNING 1 AS "c1"
  ),
  "r35" AS (
    DELETE FROM "slice"."retry_held" AS "r36"
    USING "r1" AS "r37"
    WHERE "r36"."root" = "r37"."c1"
    RETURNING 1 AS "c1"
  ),
  "r38" AS (
    DELETE FROM "slice"."retry_ladders_input" AS "r39"
    USING "r1" AS "r40"
    WHERE "r39"."root" = "r40"."c1"
    RETURNING 1 AS "c1"
  ),
  "r41" AS (
    DELETE FROM "slice"."retry_refusal" AS "r42"
    USING "r1" AS "r43"
    WHERE "r42"."root" = "r43"."c1"
    RETURNING 1 AS "c1"
  ),
  "r44" AS (
    DELETE FROM "slice"."retry_result" AS "r45"
    USING "r1" AS "r46"
    WHERE "r45"."root" = "r46"."c1"
    RETURNING 1 AS "c1"
  ),
  "r47" AS (
    DELETE FROM "slice"."retry_retry" AS "r48"
    USING "r1" AS "r49"
    WHERE "r48"."root" = "r49"."c1"
    RETURNING 1 AS "c1"
  ),
  "r50" AS (
    DELETE FROM "slice"."retry_scope" AS "r51"
    USING "r1" AS "r52"
    WHERE "r51"."root" = "r52"."c1"
    RETURNING 1 AS "c1"
  ),
  "r53" AS (
    DELETE FROM "slice"."retry_skipped" AS "r54"
    USING "r1" AS "r55"
    WHERE "r54"."root" = "r55"."c1"
    RETURNING 1 AS "c1"
  ),
  "r56" AS (
    DELETE FROM "slice"."retry_start_step" AS "r57"
    USING "r1" AS "r58"
    WHERE "r57"."root" = "r58"."c1"
    RETURNING 1 AS "c1"
  ),
  "r59" AS (
    DELETE FROM "slice"."retry_steadfast_input" AS "r60"
    USING "r1" AS "r61"
    WHERE "r60"."root" = "r61"."c1"
    RETURNING 1 AS "c1"
  ),
  "r62" AS (
    DELETE FROM "slice"."retry_steadfast_output" AS "r63"
    USING "r1" AS "r64"
    WHERE "r63"."root" = "r64"."c1"
    RETURNING 1 AS "c1"
  ),
  "r65" AS (
    DELETE FROM "slice"."retry_step" AS "r66"
    USING "r1" AS "r67"
    WHERE "r66"."root" = "r67"."c1"
    RETURNING 1 AS "c1"
  ),
  "r68" AS (
    UPDATE "slice"."retry_root" AS "r69"
    SET "retired" = true
    FROM "r1" AS "r70"
    WHERE "r69"."scope" = "r70"."c1"
    RETURNING 1 AS "c1"
  )
  SELECT "r72"."c1" AS "c1"
  FROM (SELECT "pg_catalog"."array_agg"("r71"."c2" ORDER BY "r71"."c1") AS "c1", "r71"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r73" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r74" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r75" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r76" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r77" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r78" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r79" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r80" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r81" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r82" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r83" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r84" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r85" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r86" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r87" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r88" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r89" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r90" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r91" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r92" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r93" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r94") AS "r71"("c1", "c2", "c3") GROUP BY "r71"."c3") AS "r72"("c1", "c2")
  LIMIT 1::bigint
  ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__retire_retry_root_kays5vv5ic"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("keys_1" "slice"."__domain_jevqauzmw6"[]) RETURNS SETOF bigint[]
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  PERFORM 1 FROM "slice"."sync_root" AS "r1" JOIN (SELECT DISTINCT "r3"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r3"("c1")) AS "r2"("c1") ON "r1"."scope" = "r2"."c1" WHERE NOT "r1"."retired" ORDER BY "r1"."scope" FOR UPDATE OF "r1";
  RETURN QUERY
  WITH "r1"("c1") AS MATERIALIZED (
    SELECT "r2"."scope" AS "c1" FROM "slice"."sync_root" AS "r2" JOIN (SELECT DISTINCT "r4"."c1" AS "c1" FROM "pg_catalog"."unnest"("keys_1") AS "r4"("c1")) AS "r3"("c1") ON "r2"."scope" = "r3"."c1" WHERE NOT "r2"."retired"
  ),
  "r5" AS (
    DELETE FROM "slice"."sync_admitted" AS "r6"
    USING "r1" AS "r7"
    WHERE "r6"."root" = "r7"."c1"
    RETURNING 1 AS "c1"
  ),
  "r8" AS (
    DELETE FROM "slice"."sync_build_input" AS "r9"
    USING "r1" AS "r10"
    WHERE "r9"."root" = "r10"."c1"
    RETURNING 1 AS "c1"
  ),
  "r11" AS (
    DELETE FROM "slice"."sync_build_output" AS "r12"
    USING "r1" AS "r13"
    WHERE "r12"."root" = "r13"."c1"
    RETURNING 1 AS "c1"
  ),
  "r14" AS (
    DELETE FROM "slice"."sync_claim" AS "r15"
    USING "r1" AS "r16"
    WHERE "r15"."root" = "r16"."c1"
    RETURNING 1 AS "c1"
  ),
  "r17" AS (
    DELETE FROM "slice"."sync_copy_input" AS "r18"
    USING "r1" AS "r19"
    WHERE "r18"."root" = "r19"."c1"
    RETURNING 1 AS "c1"
  ),
  "r20" AS (
    DELETE FROM "slice"."sync_copy_output" AS "r21"
    USING "r1" AS "r22"
    WHERE "r21"."root" = "r22"."c1"
    RETURNING 1 AS "c1"
  ),
  "r23" AS (
    DELETE FROM "slice"."sync_done" AS "r24"
    USING "r1" AS "r25"
    WHERE "r24"."root" = "r25"."c1"
    RETURNING 1 AS "c1"
  ),
  "r26" AS (
    DELETE FROM "slice"."sync_ended" AS "r27"
    USING "r1" AS "r28"
    WHERE "r27"."root" = "r28"."c1"
    RETURNING 1 AS "c1"
  ),
  "r29" AS (
    DELETE FROM "slice"."sync_exclusive_key" AS "r30"
    USING "r1" AS "r31"
    WHERE "r30"."root" = "r31"."c1"
    RETURNING 1 AS "c1"
  ),
  "r32" AS (
    DELETE FROM "slice"."sync_exhausted" AS "r33"
    USING "r1" AS "r34"
    WHERE "r33"."root" = "r34"."c1"
    RETURNING 1 AS "c1"
  ),
  "r35" AS (
    DELETE FROM "slice"."sync_failed" AS "r36"
    USING "r1" AS "r37"
    WHERE "r36"."root" = "r37"."c1"
    RETURNING 1 AS "c1"
  ),
  "r38" AS (
    DELETE FROM "slice"."sync_fenced" AS "r39"
    USING "r1" AS "r40"
    WHERE "r39"."root" = "r40"."c1"
    RETURNING 1 AS "c1"
  ),
  "r41" AS (
    DELETE FROM "slice"."sync_finish" AS "r42"
    USING "r1" AS "r43"
    WHERE "r42"."root" = "r43"."c1"
    RETURNING 1 AS "c1"
  ),
  "r44" AS (
    DELETE FROM "slice"."sync_gold_input" AS "r45"
    USING "r1" AS "r46"
    WHERE "r45"."root" = "r46"."c1"
    RETURNING 1 AS "c1"
  ),
  "r47" AS (
    DELETE FROM "slice"."sync_held" AS "r48"
    USING "r1" AS "r49"
    WHERE "r48"."root" = "r49"."c1"
    RETURNING 1 AS "c1"
  ),
  "r50" AS (
    DELETE FROM "slice"."sync_refusal" AS "r51"
    USING "r1" AS "r52"
    WHERE "r51"."root" = "r52"."c1"
    RETURNING 1 AS "c1"
  ),
  "r53" AS (
    DELETE FROM "slice"."sync_result" AS "r54"
    USING "r1" AS "r55"
    WHERE "r54"."root" = "r55"."c1"
    RETURNING 1 AS "c1"
  ),
  "r56" AS (
    DELETE FROM "slice"."sync_retry" AS "r57"
    USING "r1" AS "r58"
    WHERE "r57"."root" = "r58"."c1"
    RETURNING 1 AS "c1"
  ),
  "r59" AS (
    DELETE FROM "slice"."sync_scope" AS "r60"
    USING "r1" AS "r61"
    WHERE "r60"."root" = "r61"."c1"
    RETURNING 1 AS "c1"
  ),
  "r62" AS (
    DELETE FROM "slice"."sync_skipped" AS "r63"
    USING "r1" AS "r64"
    WHERE "r63"."root" = "r64"."c1"
    RETURNING 1 AS "c1"
  ),
  "r65" AS (
    DELETE FROM "slice"."sync_start_step" AS "r66"
    USING "r1" AS "r67"
    WHERE "r66"."root" = "r67"."c1"
    RETURNING 1 AS "c1"
  ),
  "r68" AS (
    DELETE FROM "slice"."sync_step" AS "r69"
    USING "r1" AS "r70"
    WHERE "r69"."root" = "r70"."c1"
    RETURNING 1 AS "c1"
  ),
  "r71" AS (
    DELETE FROM "slice"."sync_sync_run_input" AS "r72"
    USING "r1" AS "r73"
    WHERE "r72"."root" = "r73"."c1"
    RETURNING 1 AS "c1"
  ),
  "r74" AS (
    UPDATE "slice"."sync_root" AS "r75"
    SET "retired" = true
    FROM "r1" AS "r76"
    WHERE "r75"."scope" = "r76"."c1"
    RETURNING 1 AS "c1"
  )
  SELECT "r78"."c1" AS "c1"
  FROM (SELECT "pg_catalog"."array_agg"("r77"."c2" ORDER BY "r77"."c1") AS "c1", "r77"."c3" AS "c2" FROM (SELECT 0 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r74" AS "r79" UNION ALL SELECT 1 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r5" AS "r80" UNION ALL SELECT 2 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r8" AS "r81" UNION ALL SELECT 3 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r11" AS "r82" UNION ALL SELECT 4 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r14" AS "r83" UNION ALL SELECT 5 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r17" AS "r84" UNION ALL SELECT 6 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r20" AS "r85" UNION ALL SELECT 7 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r23" AS "r86" UNION ALL SELECT 8 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r26" AS "r87" UNION ALL SELECT 9 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r29" AS "r88" UNION ALL SELECT 10 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r32" AS "r89" UNION ALL SELECT 11 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r35" AS "r90" UNION ALL SELECT 12 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r38" AS "r91" UNION ALL SELECT 13 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r41" AS "r92" UNION ALL SELECT 14 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r44" AS "r93" UNION ALL SELECT 15 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r47" AS "r94" UNION ALL SELECT 16 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r50" AS "r95" UNION ALL SELECT 17 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r53" AS "r96" UNION ALL SELECT 18 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r56" AS "r97" UNION ALL SELECT 19 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r59" AS "r98" UNION ALL SELECT 20 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r62" AS "r99" UNION ALL SELECT 21 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r65" AS "r100" UNION ALL SELECT 22 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r68" AS "r101" UNION ALL SELECT 23 AS "c1", "pg_catalog"."count"(*) AS "c2", 0 AS "c3" FROM "r71" AS "r102") AS "r77"("c1", "c2", "c3") GROUP BY "r77"."c3") AS "r78"("c1", "c2")
  LIMIT 1::bigint
  ;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__retire_sync_root_ygktrpeohu"("slice"."__domain_jevqauzmw6"[]) FROM PUBLIC;

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_assignment_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_assignment_input_exclude"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_assignment_input_mode_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_assignment_input_mode_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_input_exclude"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_input_mode_nearest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_input_mode_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_nearest_read"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_output_stage_rest"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_output_stage_serve"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_output_weighed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_decide_seen_read"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assign_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."assigned"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."built"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_chain_run_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_next"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_ordered_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_page_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_page_input_after"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_page_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_page_output_next"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_page_weights_read"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."chain_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."concluded"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."copied"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."cursor"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_batch_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_fan_run_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_hold"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_square_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_square_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_start_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."fan_within"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."item"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."missed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."order"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."passage"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_brittle_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_brittle_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_ladders_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_steadfast_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_steadfast_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."retry_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."seen"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."settled"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_admitted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_build_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_build_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_claim"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_copy_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_copy_output"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_done"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_ended"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_exclusive_key"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_exhausted"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_failed"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_fenced"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_finish"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_gold_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_held"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_refusal"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_result"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_retry"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_root"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_scope"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_skipped"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_start_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_step"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."sync_sync_run_input"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."tally"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."weight"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

ALTER TABLE "slice"."assign_admitted"
  ADD CONSTRAINT "__assign_admitted_fk_root_a4ab52rbpf" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_admitted_fk_scope_root_axpol5zgcd" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_assignment_input" ADD CONSTRAINT "__assign_assignment_input_fk_root_7vcxtkof42" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_assignment_input_exclude"
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_root_kuvjl3s6t5" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_root_z5moccsgvx" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_assignment_input" ("scope", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_assignment_input_exclude_fk_scope_pred_gg2bohya6p" FOREIGN KEY ("__scope_u6ypqf2r2z", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_assignment_input_exclude" ("scope", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_assignment_input_mode_nearest" ADD CONSTRAINT "__assign_assignment_input_mode_nearest_fk_root_t23ef5vjhv" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_assignment_input_mode_within" ADD CONSTRAINT "__assign_assignment_input_mode_within_fk_root_jimtsl3pcm" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_claim"
  ADD CONSTRAINT "__assign_claim_fk_root_tccogfd3gj" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_step_root_i4wvemd6lc" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_claim_fk_step_pred_attempt_root_xr7gdduz2s" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz") REFERENCES "slice"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input" ADD CONSTRAINT "__assign_decide_input_fk_root_2ru7zbrfcg" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input_exclude"
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_root_ms4jvh65c5" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_root_in6yyrl43w" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_input_exclude_fk_step_pred_ordinal_7st2gu5z77" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_decide_input_exclude" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input_mode_nearest" ADD CONSTRAINT "__assign_decide_input_mode_nearest_fk_root_vgxth6ulqd" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_input_mode_within" ADD CONSTRAINT "__assign_decide_input_mode_within_fk_root_5fhvbm7o2j" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_nearest_read"
  ADD CONSTRAINT "__assign_decide_nearest_read_fk_root_bofoevlhaq" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_nearest_read_fk_step_root_bdcjrgm56g" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_output"
  ADD CONSTRAINT "__assign_decide_output_fk_root_keez6pmczm" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_step_root_oxey3s55bw" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_fk_step_root_b4qrx4ukam" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_decide_output_stage_rest" ADD CONSTRAINT "__assign_decide_output_stage_rest_fk_root_emwjzdjgvs" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_output_stage_serve" ADD CONSTRAINT "__assign_decide_output_stage_serve_fk_root_nv2zgv5hrt" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_output_weighed"
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_root_tymno4wjr4" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_root_nkudthcgg2" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_decide_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_output_weighed_fk_step_pred_ordinal_zt6dalxe4q" FOREIGN KEY ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd") REFERENCES "slice"."assign_decide_output_weighed" ("step", "ordinal", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_decide_seen_read"
  ADD CONSTRAINT "__assign_decide_seen_read_fk_root_padlqqdvnt" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_decide_seen_read_fk_step_root_lfxhtzprjs" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_done" ADD CONSTRAINT "__assign_done_fk_root_bm6oxygwbu" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_ended"
  ADD CONSTRAINT "__assign_ended_fk_root_snn64so4y5" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_ended_fk_step_attempt_root_6glu7zitw6" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_exhausted"
  ADD CONSTRAINT "__assign_exhausted_fk_root_vljhubi73b" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_exhausted_fk_step_root_juabgscovy" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_failed" ADD CONSTRAINT "__assign_failed_fk_root_oyplqvhznf" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_fenced"
  ADD CONSTRAINT "__assign_fenced_fk_root_53vovdvcd2" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_fenced_fk_step_attempt_root_ibfrwtujam" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_finish"
  ADD CONSTRAINT "__assign_finish_fk_root_6bbfqqziln" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_finish_fk_scope_root_fasrssafod" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_finish_fk_step_root_uqhlnaqgqc" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_held"
  ADD CONSTRAINT "__assign_held_fk_root_ugjqx6ie3f" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_step_attempt_root_5ffh4ch5vo" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_held_fk_step_root_yvbigkwvhi" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_paused" ADD CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."assign_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_refusal"
  ADD CONSTRAINT "__assign_refusal_fk_root_ikkkxnypbg" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_refusal_fk_step_root_4pwostl6w4" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_result"
  ADD CONSTRAINT "__assign_result_fk_root_mbig2yym5s" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_result_fk_step_root_ie57r22uco" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_resumed" ADD CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" FOREIGN KEY ("target", "turn") REFERENCES "slice"."assign_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_retry"
  ADD CONSTRAINT "__assign_retry_fk_root_g7cxz6uouh" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_retry_fk_step_attempt_root_gsye2j667t" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."assign_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."assign_scope" ADD CONSTRAINT "__assign_scope_fk_root_aqbd5fs63t" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_skipped"
  ADD CONSTRAINT "__assign_skipped_fk_by_yi4ixsfumz" FOREIGN KEY ("by") REFERENCES "slice"."assign_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_skipped_fk_root_uyud3yb6zy" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_skipped_fk_scope_6ks53lak4r" FOREIGN KEY ("scope") REFERENCES "slice"."assign_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_start_step"
  ADD CONSTRAINT "__assign_start_step_fk_root_me4zj64243" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_start_step_fk_scope_root_grairzt42v" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__assign_start_step_fk_step_root_2bw3dd6v6d" FOREIGN KEY ("step", "root") REFERENCES "slice"."assign_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."assign_step"
  ADD CONSTRAINT "__assign_step_fk_root_qky3m5h2ys" FOREIGN KEY ("root") REFERENCES "slice"."assign_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__assign_step_fk_scope_root_rr5jplc2ua" FOREIGN KEY ("scope", "root") REFERENCES "slice"."assign_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."audit" ADD CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_admitted"
  ADD CONSTRAINT "__chain_admitted_fk_root_abvywhprzd" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_admitted_fk_scope_root_ee5yuzxero" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."chain_chain_run_input" ADD CONSTRAINT "__chain_chain_run_input_fk_root_eyhkir2ten" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_claim"
  ADD CONSTRAINT "__chain_claim_fk_root_e4z56epu62" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_step_root_dz35k5kajb" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_claim_fk_step_pred_attempt_root_zhusgp55bz" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz") REFERENCES "slice"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_done" ADD CONSTRAINT "__chain_done_fk_root_p5unbx53ay" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_ended"
  ADD CONSTRAINT "__chain_ended_fk_root_mzyjkgh7kn" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_ended_fk_step_attempt_root_hqs5hboik5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_exhausted"
  ADD CONSTRAINT "__chain_exhausted_fk_root_az7it7tady" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_exhausted_fk_step_root_x7otp3oe7t" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."chain_failed" ADD CONSTRAINT "__chain_failed_fk_root_ku7hd36hr4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_fenced"
  ADD CONSTRAINT "__chain_fenced_fk_root_dpd2zsy45p" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_fenced_fk_step_attempt_root_wtvf2kpo3y" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."chain_finish"
  ADD CONSTRAINT "__chain_finish_fk_root_b4s3b6gb4a" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_finish_fk_scope_root_bm7lzlvp35" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_finish_fk_step_root_7gwsgngr6z" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_held"
  ADD CONSTRAINT "__chain_held_fk_root_7gjoucbs6t" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_step_attempt_root_aqmobtk3xc" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_held_fk_step_root_mrcpyhmlko" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_next"
  ADD CONSTRAINT "__chain_next_fk_from_root_ohfyewhufb" FOREIGN KEY ("from", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_root_ymhq5qkp7g" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_next_fk_to_root_juwf5tsgbs" FOREIGN KEY ("to", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_ordered_input" ADD CONSTRAINT "__chain_ordered_input_fk_root_yo2fvi6v6v" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_input" ADD CONSTRAINT "__chain_page_input_fk_root_s74r6jkeai" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_input_after"
  ADD CONSTRAINT "__chain_page_input_after_fk_root_uksq5ttkd4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_input_after_fk_step_root_pqhheaahab" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output"
  ADD CONSTRAINT "__chain_page_output_fk_root_ez5wgbipj5" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_fk_step_root_nesuhzkml5" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_page_output_fk_step_root_gyxfrq7ubp" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_output_next"
  ADD CONSTRAINT "__chain_page_output_next_fk_root_x6esxudkux" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_output_next_fk_step_root_srapg45mao" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_page_output" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_page_weights_read"
  ADD CONSTRAINT "__chain_page_weights_read_fk_root_jeksctdxbs" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_page_weights_read_fk_step_root_cs5oeb2hng" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_paused" ADD CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."chain_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_refusal"
  ADD CONSTRAINT "__chain_refusal_fk_root_np3fiq6hlf" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_refusal_fk_step_root_2xohwjf6ov" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."chain_result"
  ADD CONSTRAINT "__chain_result_fk_root_cqy7fgz6gd" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_result_fk_step_root_rytllwqxot" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_resumed" ADD CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" FOREIGN KEY ("target", "turn") REFERENCES "slice"."chain_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_retry"
  ADD CONSTRAINT "__chain_retry_fk_root_mrtnq2ndso" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_retry_fk_step_attempt_root_mwa5szmjq5" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."chain_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."chain_scope" ADD CONSTRAINT "__chain_scope_fk_root_5dnilqnmua" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_skipped"
  ADD CONSTRAINT "__chain_skipped_fk_by_zwz72yquyv" FOREIGN KEY ("by") REFERENCES "slice"."chain_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_skipped_fk_root_yi73nwhhy4" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_skipped_fk_scope_ozicxyda6o" FOREIGN KEY ("scope") REFERENCES "slice"."chain_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_start_step"
  ADD CONSTRAINT "__chain_start_step_fk_root_gh44bcwmwg" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_start_step_fk_scope_root_eab47owgce" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__chain_start_step_fk_step_root_llhvckjbu2" FOREIGN KEY ("step", "root") REFERENCES "slice"."chain_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."chain_step"
  ADD CONSTRAINT "__chain_step_fk_root_n4wedmpzhn" FOREIGN KEY ("root") REFERENCES "slice"."chain_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__chain_step_fk_scope_root_jmx7nw7i4f" FOREIGN KEY ("scope", "root") REFERENCES "slice"."chain_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_admitted"
  ADD CONSTRAINT "__fan_admitted_fk_root_ui6p5vdrhk" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_admitted_fk_scope_root_zj52ntgcx6" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_batch_input" ADD CONSTRAINT "__fan_batch_input_fk_root_d4g2u2spvl" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_claim"
  ADD CONSTRAINT "__fan_claim_fk_root_t3hwth6mh7" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_root_6jsjsejmab" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_root_attempt_pred_holds_jqx7ma7cam" FOREIGN KEY ("step", "root", "attempt", "__pred_holds_lq7itfruzz") REFERENCES "slice"."fan_hold" ("step", "root", "attempt", "at") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_claim_fk_step_pred_attempt_root_b62fsp2zir" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz") REFERENCES "slice"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_done" ADD CONSTRAINT "__fan_done_fk_root_cfizuozacw" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_ended"
  ADD CONSTRAINT "__fan_ended_fk_root_uaaz527dex" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_ended_fk_step_attempt_root_guai42fujd" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_exhausted"
  ADD CONSTRAINT "__fan_exhausted_fk_root_mlbxyrjdjk" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_exhausted_fk_step_root_jyggt4fgpd" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_failed" ADD CONSTRAINT "__fan_failed_fk_root_3gq7ifprza" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_fan_run_input" ADD CONSTRAINT "__fan_fan_run_input_fk_root_oztqak3s27" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_fenced"
  ADD CONSTRAINT "__fan_fenced_fk_root_2vu32qtss5" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_fenced_fk_step_attempt_root_resahyn2ym" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_finish"
  ADD CONSTRAINT "__fan_finish_fk_root_evgrt3slao" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_finish_fk_scope_root_xpvycdjjiy" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_finish_fk_step_root_bpqxxtu4ab" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_held"
  ADD CONSTRAINT "__fan_held_fk_root_cnpqjrp534" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_step_attempt_root_c33imj7zo6" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_held_fk_step_root_ob2yj5i5h3" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_hold"
  ADD CONSTRAINT "__fan_hold_fk_root_4at7ny23la" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_hold_fk_step_root_attempt_copy_holds_jzk5g7klso" FOREIGN KEY ("step", "root", "attempt", "__copy_holds_c6hi2i2kfb") REFERENCES "slice"."fan_claim" ("step", "root", "attempt", "holds") MATCH SIMPLE ON UPDATE CASCADE,
  ADD CONSTRAINT "__fan_hold_fk_step_root_attempt_pred_at_p4adu554h3" FOREIGN KEY ("step", "root", "attempt", "__pred_at_xktcobhsti") REFERENCES "slice"."fan_hold" ("step", "root", "attempt", "at") MATCH SIMPLE;

ALTER TABLE "slice"."fan_paused" ADD CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."fan_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_refusal"
  ADD CONSTRAINT "__fan_refusal_fk_root_zep5evjd2e" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_refusal_fk_step_root_5qjei2ie7w" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_result"
  ADD CONSTRAINT "__fan_result_fk_root_m233bhejob" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_result_fk_step_root_kkph4igmst" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_resumed" ADD CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" FOREIGN KEY ("target", "turn") REFERENCES "slice"."fan_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_retry"
  ADD CONSTRAINT "__fan_retry_fk_root_hoqgudhhyh" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_retry_fk_step_attempt_root_jw7ijf5nre" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."fan_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_scope" ADD CONSTRAINT "__fan_scope_fk_root_3c5fvemkr6" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_skipped"
  ADD CONSTRAINT "__fan_skipped_fk_by_o76cwxye2w" FOREIGN KEY ("by") REFERENCES "slice"."fan_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_skipped_fk_root_j6gpqvvx57" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_skipped_fk_scope_eomkgfbxwj" FOREIGN KEY ("scope") REFERENCES "slice"."fan_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_input" ADD CONSTRAINT "__fan_square_input_fk_root_gpj7rrapja" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_square_output"
  ADD CONSTRAINT "__fan_square_output_fk_root_dpyr2dahw3" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_square_output_fk_step_root_ibp6l2tkc5" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_square_output_fk_step_root_kilcbg5jn4" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_square_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_start_scope"
  ADD CONSTRAINT "__fan_start_scope_fk_child_root_dn65r3vwqt" FOREIGN KEY ("child", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_scope_fk_root_24pfkxnibn" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_start_scope_fk_scope_root_clsa2be3m7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_start_step"
  ADD CONSTRAINT "__fan_start_step_fk_root_4rwp7q56wg" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_start_step_fk_scope_root_vh2ut5ssmk" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_start_step_fk_step_root_din6bp4kp3" FOREIGN KEY ("step", "root") REFERENCES "slice"."fan_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."fan_step"
  ADD CONSTRAINT "__fan_step_fk_root_eueisdyp32" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_step_fk_scope_root_dyjpxhnjhz" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."fan_within"
  ADD CONSTRAINT "__fan_within_fk_parent_root_uep5w6udoh" FOREIGN KEY ("parent", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__fan_within_fk_root_k7476egnhf" FOREIGN KEY ("root") REFERENCES "slice"."fan_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__fan_within_fk_scope_root_ej3crstjip" FOREIGN KEY ("scope", "root") REFERENCES "slice"."fan_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_admitted"
  ADD CONSTRAINT "__retry_admitted_fk_root_n65ucxnw7g" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_admitted_fk_scope_root_kufu5v4g3v" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_brittle_input" ADD CONSTRAINT "__retry_brittle_input_fk_root_3kdpo5sepg" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_brittle_output"
  ADD CONSTRAINT "__retry_brittle_output_fk_root_baznemh4df" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_step_root_o5pt3hukix" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_brittle_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_brittle_output_fk_step_root_jnbgyogqxn" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_claim"
  ADD CONSTRAINT "__retry_claim_fk_root_ilxn6ulsuq" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_step_root_zffmzj357l" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_claim_fk_step_pred_attempt_root_d5bu2ekplv" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz") REFERENCES "slice"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_done" ADD CONSTRAINT "__retry_done_fk_root_eegigvha5p" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_ended"
  ADD CONSTRAINT "__retry_ended_fk_root_h23o2xvf4e" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_ended_fk_step_attempt_root_25duapnk22" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_exhausted"
  ADD CONSTRAINT "__retry_exhausted_fk_root_fetyfw4rhv" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_exhausted_fk_step_root_pj2owyq2rw" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_failed" ADD CONSTRAINT "__retry_failed_fk_root_uy6ypbkhl7" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_fenced"
  ADD CONSTRAINT "__retry_fenced_fk_root_q2hes57bil" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_fenced_fk_step_attempt_root_laqomvgkpu" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_finish"
  ADD CONSTRAINT "__retry_finish_fk_root_iv6szs7lco" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_finish_fk_scope_root_odh4hpe5hc" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_finish_fk_step_root_o54jpsxlmy" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_held"
  ADD CONSTRAINT "__retry_held_fk_root_3v46rzikqg" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_step_attempt_root_cnveo6n2ex" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_held_fk_step_root_m5b3t566ya" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_ladders_input" ADD CONSTRAINT "__retry_ladders_input_fk_root_cnlwmpha3w" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_paused" ADD CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."retry_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_refusal"
  ADD CONSTRAINT "__retry_refusal_fk_root_jr53wy3j5v" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_refusal_fk_step_root_sqt67v76ib" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_result"
  ADD CONSTRAINT "__retry_result_fk_root_zoskj252jz" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_result_fk_step_root_ulmjckkvmq" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_resumed" ADD CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" FOREIGN KEY ("target", "turn") REFERENCES "slice"."retry_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_retry"
  ADD CONSTRAINT "__retry_retry_fk_root_gfdc3bi7a3" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_retry_fk_step_attempt_root_xrpolbmg32" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."retry_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."retry_scope" ADD CONSTRAINT "__retry_scope_fk_root_veata66enh" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_skipped"
  ADD CONSTRAINT "__retry_skipped_fk_by_iokgypc6cl" FOREIGN KEY ("by") REFERENCES "slice"."retry_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_skipped_fk_root_rfxaxqegr7" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_skipped_fk_scope_q4224gzqrl" FOREIGN KEY ("scope") REFERENCES "slice"."retry_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_start_step"
  ADD CONSTRAINT "__retry_start_step_fk_root_lgh6lskept" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_start_step_fk_scope_root_va3ypig5rc" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_start_step_fk_step_root_wftarsumzh" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_steadfast_input" ADD CONSTRAINT "__retry_steadfast_input_fk_root_4xkwhc353t" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_steadfast_output"
  ADD CONSTRAINT "__retry_steadfast_output_fk_root_ypuiq33fkv" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_3x6tbszpyw" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_done" ("step", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__retry_steadfast_output_fk_step_root_y3we3qusrs" FOREIGN KEY ("step", "root") REFERENCES "slice"."retry_steadfast_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."retry_step"
  ADD CONSTRAINT "__retry_step_fk_root_zww4hkltkz" FOREIGN KEY ("root") REFERENCES "slice"."retry_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__retry_step_fk_scope_root_xl7rht6tyq" FOREIGN KEY ("scope", "root") REFERENCES "slice"."retry_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_admitted"
  ADD CONSTRAINT "__sync_admitted_fk_root_pazobscutb" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_admitted_fk_scope_root_ieiyxemub7" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_build_input" ADD CONSTRAINT "__sync_build_input_fk_root_qlycqp6gk2" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_build_output"
  ADD CONSTRAINT "__sync_build_output_fk_root_grwezm3fcr" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_step_root_o3zx5hom3t" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_build_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_build_output_fk_step_root_aksn6onpma" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_claim"
  ADD CONSTRAINT "__sync_claim_fk_root_4qbs7pxn2t" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_step_root_gvtcn764xc" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_claim_fk_step_pred_attempt_root_ogqckwblbr" FOREIGN KEY ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz") REFERENCES "slice"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_copy_input" ADD CONSTRAINT "__sync_copy_input_fk_root_d7u63yuxxs" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_copy_output"
  ADD CONSTRAINT "__sync_copy_output_fk_root_x2xt2l75vg" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_step_root_65fyg7xb6t" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_copy_input" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_copy_output_fk_step_root_gfjlcri22w" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_done" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_done" ADD CONSTRAINT "__sync_done_fk_root_kbt6t66k7r" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_ended"
  ADD CONSTRAINT "__sync_ended_fk_root_6yfa76vqgo" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_ended_fk_step_attempt_root_43aj3jw3bk" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_exclusive" ADD CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" FOREIGN KEY ("kind", "key", "__pred_turn_qryngij6c4") REFERENCES "slice"."sync_released" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_exclusive_key"
  ADD CONSTRAINT "__sync_exclusive_key_fk_root_jfvgxfgxk7" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_exclusive_key_fk_scope_root_cl36evoxyb" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_scope" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_exhausted"
  ADD CONSTRAINT "__sync_exhausted_fk_root_w5rujdfs5u" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_exhausted_fk_step_root_vd7jhdnvet" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_failed" ADD CONSTRAINT "__sync_failed_fk_root_utdobwjqln" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_fenced"
  ADD CONSTRAINT "__sync_fenced_fk_root_pft7kt3u6c" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_fenced_fk_step_attempt_root_ddezsoici7" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_finish"
  ADD CONSTRAINT "__sync_finish_fk_root_jesvnqpmqt" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_finish_fk_scope_root_bjgk4nxo7e" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_finish_fk_step_root_mmscezhzyq" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_gold_input" ADD CONSTRAINT "__sync_gold_input_fk_root_dearji3wtq" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_held"
  ADD CONSTRAINT "__sync_held_fk_root_62s5pmsoqa" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_step_attempt_root_46zydmfnyy" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_claim" ("step", "attempt", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_held_fk_step_root_waydyqivsc" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_result" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_paused" ADD CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" FOREIGN KEY ("target", "__pred_turn_qryngij6c4") REFERENCES "slice"."sync_resumed" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_refusal"
  ADD CONSTRAINT "__sync_refusal_fk_root_3f2zmczqcu" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_refusal_fk_step_root_igzyfxl4o3" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_failed" ("step", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_released" ADD CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" FOREIGN KEY ("kind", "key", "turn") REFERENCES "slice"."sync_exclusive" ("kind", "key", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_result"
  ADD CONSTRAINT "__sync_result_fk_root_vnymla3qhz" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_result_fk_step_root_x2umddyh22" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_resumed" ADD CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" FOREIGN KEY ("target", "turn") REFERENCES "slice"."sync_paused" ("target", "turn") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_retry"
  ADD CONSTRAINT "__sync_retry_fk_root_wl34w4vs2m" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_retry_fk_step_attempt_root_wr6wrg43i4" FOREIGN KEY ("step", "attempt", "root") REFERENCES "slice"."sync_ended" ("step", "attempt", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_scope" ADD CONSTRAINT "__sync_scope_fk_root_whqzszw2jj" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_skipped"
  ADD CONSTRAINT "__sync_skipped_fk_by_zsxc5osgwh" FOREIGN KEY ("by") REFERENCES "slice"."sync_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_skipped_fk_root_33hfwafoud" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_skipped_fk_scope_33qsksdlcc" FOREIGN KEY ("scope") REFERENCES "slice"."sync_root" ("scope") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_start_step"
  ADD CONSTRAINT "__sync_start_step_fk_root_2jg4xkdldt" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_start_step_fk_scope_root_vedcbu54xe" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE,
  ADD CONSTRAINT "__sync_start_step_fk_step_root_jas4o3xkqs" FOREIGN KEY ("step", "root") REFERENCES "slice"."sync_step" ("step", "root") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE "slice"."sync_step"
  ADD CONSTRAINT "__sync_step_fk_root_rmc4nivt3i" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED,
  ADD CONSTRAINT "__sync_step_fk_scope_root_sfdyvsar2y" FOREIGN KEY ("scope", "root") REFERENCES "slice"."sync_admitted" ("scope", "root") MATCH SIMPLE;

ALTER TABLE "slice"."sync_sync_run_input" ADD CONSTRAINT "__sync_sync_run_input_fk_root_ifd4bfberz" FOREIGN KEY ("root") REFERENCES "slice"."sync_root" ("__scope_jdl7uajdrr") MATCH SIMPLE DEFERRABLE INITIALLY DEFERRED;
