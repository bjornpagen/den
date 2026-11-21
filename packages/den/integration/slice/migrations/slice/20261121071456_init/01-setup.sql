SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
DO $$
BEGIN
  EXECUTE "pg_catalog"."format"('ALTER DATABASE %I SET default_transaction_isolation = %L'::"pg_catalog"."text", "pg_catalog"."current_database"(), 'serializable'::"pg_catalog"."text");
END
$$;

CREATE SCHEMA "slice";

CREATE SCHEMA "slice_seats";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
CREATE EXTENSION IF NOT EXISTS "vector" SCHEMA "vector_ext";

CREATE FUNCTION "slice"."__constant_ejkw66w2je"() RETURNS bigint[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"2"}'::bigint[];

REVOKE ALL ON FUNCTION "slice"."__constant_ejkw66w2je"() FROM PUBLIC;

-- closed constant: 1 rows in 1 cells of 1 bits, content e74e8afa12f9482972f8c3a277d42e6adeba09f7057c2e49ce81978193dcd5e4
CREATE FUNCTION "slice"."__constant_ib5zplua3f"() RETURNS bit varying LANGUAGE sql IMMUTABLE PARALLEL SAFE RETURN X'8'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__constant_ib5zplua3f"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_output_stage_names_ehhgk5bunv"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Rest","Serve"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_output_stage_names_ehhgk5bunv"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_embed_input_mode_names_5jkwmsqq3r"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_kind_names_rtvscvwquk"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"AssignmentFinish","Decide","Embed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_kind_names_rtvscvwquk"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Assignment"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_retry_why_names_5ckzenntb2"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_retry_why_names_5ckzenntb2"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_root_kind_names_opbaefdfbo"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Assignment"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_root_kind_names_opbaefdfbo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__bell_names_aiqi4uostx"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"east","west"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__bell_names_aiqi4uostx"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_chain_run_input_feed_names_byxgsvzik7"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ChainRunFinish","OrderedFinish","Page"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_ordered_input_feed_names_dwtixlgyrd"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_weights_row_feed_names_awtorq4cfe"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ChainRun","Ordered"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_retry_why_names_zmog33hzfy"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_retry_why_names_zmog33hzfy"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_root_kind_names_ndmuh43zki"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ChainRun","Ordered"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_root_kind_names_ndmuh43zki"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_chime_input_bell_names_nkzi4dgaig"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"east","west"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_chime_input_bell_names_nkzi4dgaig"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_chime_output_bell_names_tzmx63kpb4"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"east","west"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_chime_output_bell_names_tzmx63kpb4"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_hourly_input_bell_names_vugtqsvsug"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"east","west"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_hourly_input_bell_names_vugtqsvsug"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_kind_names_7yqk67pwg5"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Chime","Close","HourlyFinish","SittingFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_kind_names_7yqk67pwg5"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_outcome_names_rqtqczot4q"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_outcome_names_rqtqczot4q"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_pausable_names_phjbr2fipl"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Hourly","Sitting"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_pausable_names_phjbr2fipl"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_retry_why_names_pjdgx4s6a4"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_retry_why_names_pjdgx4s6a4"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_root_kind_names_3kro23qfv4"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Hourly","Sitting"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__clock_root_kind_names_3kro23qfv4"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_child_kind_names_i6k53d3e2e"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Batch"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_child_kind_names_i6k53d3e2e"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_kind_names_6uewr4lsds"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"BatchFinish","FanRunFinish","Square"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_kind_names_6uewr4lsds"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_pausable_names_vkzkvll2se"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun","Pool"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_pausable_names_vkzkvll2se"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Pool"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_root_kind_names_ylamx7vjxv"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_root_kind_names_ylamx7vjxv"() FROM PUBLIC;

CREATE FUNCTION "slice"."__feed_names_azjbqebc6i"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__feed_names_azjbqebc6i"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_kind_names_u27pzc64cs"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Brittle","LaddersFinish","Polite","Steadfast","ThrottledFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_kind_names_u27pzc64cs"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_pausable_names_45xmb45n2n"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Ladders","Throttled"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_pausable_names_45xmb45n2n"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_root_kind_names_iq4cq3dwf2"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Ladders","Throttled"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_root_kind_names_iq4cq3dwf2"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_child_kind_names_jn3iwx7yal"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Questions"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_child_kind_names_jn3iwx7yal"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_kind_names_j4pukr2klj"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Analyze","Gather","QuestionsFinish","ReviewRunFinish","Save"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_kind_names_j4pukr2klj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_outcome_names_nlfaf7zb7f"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_outcome_names_nlfaf7zb7f"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_pausable_names_uhujnxcsz6"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Anthropic","ReviewRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_pausable_names_uhujnxcsz6"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_resource_names_ixi3gnpcnp"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Anthropic"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_resource_names_ixi3gnpcnp"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_retry_why_names_4ux5dj2mh3"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_retry_why_names_4ux5dj2mh3"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_root_kind_names_uvxmjcavxb"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ReviewRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__review_root_kind_names_uvxmjcavxb"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_kind_names_oq6b66cstu"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Build","Copy","GoldFinish","SyncRunFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__sync_kind_names_oq6b66cstu"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_outcome_names_xzb4y4xgki"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__sync_outcome_names_xzb4y4xgki"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_pausable_names_3hzpsqgfjl"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Gold","SyncRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__sync_pausable_names_3hzpsqgfjl"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_retry_why_names_o3uvvn3247"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__sync_retry_why_names_o3uvvn3247"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_root_kind_names_drp422srbk"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Gold","SyncRun"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__sync_root_kind_names_drp422srbk"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_kind_names_dbe6fofbjq"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Deliver","WritebackFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__writeback_kind_names_dbe6fofbjq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_outcome_names_oq43xsnmec"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__writeback_outcome_names_oq43xsnmec"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_pausable_names_mqzeerbulh"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Writeback"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__writeback_pausable_names_mqzeerbulh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_retry_why_names_7a7eowjbic"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__writeback_retry_why_names_7a7eowjbic"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_root_kind_names_bz7cmi256x"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Writeback"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__writeback_root_kind_names_bz7cmi256x"() FROM PUBLIC;

CREATE DOMAIN "slice"."assign_assignment_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_decide_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_decide_input_mode_names_zoydpw665o"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_decide_output_stage" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_decide_output_stage_names_ehhgk5bunv"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_embed_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_embed_input_mode_names_5jkwmsqq3r"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_kind_names_rtvscvwquk"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_outcome_names_2mccfiah6k"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_pausable_names_r7pjdx7o42"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_retry_why_names_5ckzenntb2"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_root_kind_names_opbaefdfbo"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__bell_names_aiqi4uostx"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_chain_run_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_chain_run_input_feed_names_byxgsvzik7"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_kind_names_oubqrwjyau"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_ordered_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_ordered_input_feed_names_dwtixlgyrd"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_outcome_names_vo4tgqx6qh"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_page_earlier_row_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_page_earlier_row_feed_names_tmqqz3lel4"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_page_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_page_input_feed_names_dxuyhzkiur"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_page_tree_row_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_page_tree_row_feed_names_w5f7gjcjkc"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_page_weights_row_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_page_weights_row_feed_names_awtorq4cfe"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_pausable_names_vjdoymenyq"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_retry_why_names_zmog33hzfy"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."chain_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__chain_root_kind_names_ndmuh43zki"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_chime_input_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_chime_input_bell_names_nkzi4dgaig"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_chime_output_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_chime_output_bell_names_tzmx63kpb4"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_hourly_input_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_hourly_input_bell_names_vugtqsvsug"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_kind_names_7yqk67pwg5"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_outcome_names_rqtqczot4q"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_pausable_names_phjbr2fipl"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_retry_why_names_pjdgx4s6a4"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."clock_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__clock_root_kind_names_3kro23qfv4"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_child_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_child_kind_names_i6k53d3e2e"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_kind_names_6uewr4lsds"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_outcome_names_7pbhseigfj"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_pausable_names_vkzkvll2se"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_resource" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_resource_names_tugc7yp6xo"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_retry_why_names_shpypqrqhk"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."fan_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__fan_root_kind_names_ylamx7vjxv"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__feed_names_azjbqebc6i"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."retry_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__retry_kind_names_u27pzc64cs"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."retry_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__retry_outcome_names_zzz2kawwsa"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."retry_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__retry_pausable_names_45xmb45n2n"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."retry_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__retry_retry_why_names_pwmdyzqghs"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."retry_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__retry_root_kind_names_iq4cq3dwf2"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_child_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_child_kind_names_jn3iwx7yal"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_kind_names_j4pukr2klj"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_outcome_names_nlfaf7zb7f"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_pausable_names_uhujnxcsz6"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_resource" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_resource_names_ixi3gnpcnp"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_retry_why_names_4ux5dj2mh3"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."review_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__review_root_kind_names_uvxmjcavxb"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."sync_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__sync_kind_names_oq6b66cstu"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."sync_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__sync_outcome_names_xzb4y4xgki"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."sync_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__sync_pausable_names_3hzpsqgfjl"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."sync_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__sync_retry_why_names_o3uvvn3247"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."sync_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__sync_root_kind_names_drp422srbk"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."writeback_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__writeback_kind_names_dbe6fofbjq"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."writeback_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__writeback_outcome_names_oq43xsnmec"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."writeback_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__writeback_pausable_names_mqzeerbulh"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."writeback_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__writeback_retry_why_names_7a7eowjbic"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."writeback_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__writeback_root_kind_names_bz7cmi256x"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."__domain_gfw43vigph" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint) IS TRUE);

CREATE DOMAIN "slice"."__domain_jevqauzmw6" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[0-9a-f]{64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__domain_mxhao3k6ss" AS bigint;

CREATE DOMAIN "slice"."__domain_p7dj7oebtz" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint AND VALUE <= 9214147718838775808::bigint) IS TRUE);

CREATE DOMAIN "slice"."__text_t4rwovzmqj" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-0-9a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice"."__param_seen_learner_exdgowkpja" AS "slice"."__text_t4rwovzmqj";

CREATE OR REPLACE FUNCTION "slice"."__refuse"("state" "pg_catalog"."text", "constraint_name" "pg_catalog"."text", "detail" "pg_catalog"."text") RETURNS boolean
LANGUAGE plpgsql VOLATILE PARALLEL SAFE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RAISE EXCEPTION 'grizzle refused the statement' USING ERRCODE = "state", CONSTRAINT = "constraint_name", DETAIL = "detail";
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__require_serializable"() RETURNS "pg_catalog"."trigger"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF "pg_catalog"."current_setting"('transaction_isolation'::"pg_catalog"."text") <> 'serializable'::"pg_catalog"."text" THEN RAISE EXCEPTION 'a write to a grizzle table requires SERIALIZABLE' USING ERRCODE = 'invalid_transaction_state'::"pg_catalog"."text", SCHEMA = TG_TABLE_SCHEMA, TABLE = TG_TABLE_NAME, HINT = 'write at SERIALIZABLE'::"pg_catalog"."text"; END IF;
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

CREATE TABLE "slice"."__drift_proofs" (
  "object" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "ddl" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  "description" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" NOT NULL,
  CONSTRAINT "__drift_proofs_pk" PRIMARY KEY ("object")
);

REVOKE ALL ON TABLE "slice"."__drift_proofs" FROM PUBLIC;

CREATE TRIGGER "__isolation"
  BEFORE INSERT OR UPDATE OR DELETE OR TRUNCATE ON "slice"."__drift_proofs"
  FOR EACH STATEMENT EXECUTE FUNCTION "slice"."__require_serializable"();

CREATE OR REPLACE FUNCTION "slice"."__snapshot_guard"("fingerprint" "pg_catalog"."text") RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r1" WHERE "r1"."ordinal" = 0 AND "r1"."files" <> (SELECT "pg_catalog"."count"(*) FROM "slice"."__ledger" AS "r2" WHERE "r2"."folder" = "r1"."folder" AND "r2"."ordinal" <> 0)) THEN RAISE EXCEPTION 'a grizzle migration of this schema is running or stopped part-way' USING ERRCODE = '55Z02'::"pg_catalog"."text"; END IF;
  IF NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r3" WHERE "r3"."ordinal" = 0 AND "r3"."target" = "fingerprint" AND NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r4" WHERE "r4"."ordinal" = 0 AND "r4"."folder" > "r3"."folder")) THEN RAISE EXCEPTION 'the latest grizzle migration of this schema is not the snapshot of this Db' USING ERRCODE = '55Z01'::"pg_catalog"."text"; END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") FROM PUBLIC;
