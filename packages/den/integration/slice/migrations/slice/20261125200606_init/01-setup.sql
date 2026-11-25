CREATE SCHEMA "slice";

CREATE SCHEMA "slice_den";

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

CREATE FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_names_dxuyhzkiur"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__fan_kind_names_rrax7ylsix"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"BatchFinish","Dust","FanRunFinish","Mop","Square","SweepFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_kind_names_rrax7ylsix"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_pausable_names_7t2samsp7b"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun","Pool","Sweep","Vendor"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_pausable_names_7t2samsp7b"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Pool"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_root_kind_names_nagupzc3sq"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun","Sweep"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_root_kind_names_nagupzc3sq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__feed_names_azjbqebc6i"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__feed_names_azjbqebc6i"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_kind_names_yg2tu5rejg"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Brittle","LaddersFinish","Patient","Polite","Steadfast","ThrottledFinish","UnhurriedFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_kind_names_yg2tu5rejg"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_pausable_names_hen5ycf77m"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Ladders","Throttled","Unhurried"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_pausable_names_hen5ycf77m"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_root_kind_names_bhf4onc7wq"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Ladders","Throttled","Unhurried"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__retry_root_kind_names_bhf4onc7wq"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_assignment_input_mode_live_nvlduwhvfs"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_decide_input_mode_live_bpk4ps2tf3"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_output_stage_live_j54g2pdkhy"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_decide_output_stage_live_j54g2pdkhy"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_embed_input_mode_live_r26iyj4yp6"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_embed_input_mode_live_r26iyj4yp6"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_kind_live_epoonlekfm"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_kind_live_epoonlekfm"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_outcome_live_3t7oirgwzl"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_outcome_live_3t7oirgwzl"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_pausable_live_spku342qp6"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_pausable_live_spku342qp6"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_retry_why_live_qfzksuyq3m"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_retry_why_live_qfzksuyq3m"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_root_kind_live_nccqmed4lq"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_root_kind_live_nccqmed4lq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__bell_live_bk7zau3khi"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__bell_live_bk7zau3khi"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_chain_run_input_feed_live_iopwed3csj"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_chain_run_input_feed_live_iopwed3csj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_input_feed_live_zxgp5dub6j"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_live_zxgp5dub6j"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_pausable_live_ozpbw3gnsu"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_pausable_live_ozpbw3gnsu"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_retry_why_live_m5qnitynhz"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_retry_why_live_m5qnitynhz"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_root_kind_live_mnlnztwbz2"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_root_kind_live_mnlnztwbz2"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_chime_input_bell_live_vs2eypgl4v"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_chime_input_bell_live_vs2eypgl4v"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_chime_output_bell_live_ikpwkv25mh"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_chime_output_bell_live_ikpwkv25mh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_hourly_input_bell_live_yfdtebn7na"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_hourly_input_bell_live_yfdtebn7na"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_kind_live_kem5uxahz7"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'F0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_kind_live_kem5uxahz7"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_outcome_live_q7vjmi72sr"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_outcome_live_q7vjmi72sr"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_pausable_live_waldzggn7s"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_pausable_live_waldzggn7s"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_retry_why_live_auqnukeed5"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_retry_why_live_auqnukeed5"() FROM PUBLIC;

CREATE FUNCTION "slice"."__clock_root_kind_live_dkya2k5nqw"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__clock_root_kind_live_dkya2k5nqw"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_child_kind_live_lzght2aqpn"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_child_kind_live_lzght2aqpn"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_kind_live_mosnikz3yn"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'FC'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_kind_live_mosnikz3yn"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_pausable_live_uymd2oabeh"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'F0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_pausable_live_uymd2oabeh"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_root_kind_live_sx7vmfeklj"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_root_kind_live_sx7vmfeklj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__feed_live_pfwkvulieq"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__feed_live_pfwkvulieq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_kind_live_lujs5xc25d"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'FE'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__retry_kind_live_lujs5xc25d"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_outcome_live_fdo5qezp4f"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__retry_outcome_live_fdo5qezp4f"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_pausable_live_buioe34fit"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__retry_pausable_live_buioe34fit"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_retry_why_live_p4et7ysqjo"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__retry_retry_why_live_p4et7ysqjo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__retry_root_kind_live_euautuyuhd"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__retry_root_kind_live_euautuyuhd"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_child_kind_live_xb5v52t6gq"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_child_kind_live_xb5v52t6gq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_kind_live_3egbkjww5a"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'F8'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_kind_live_3egbkjww5a"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_outcome_live_svq4irpcsp"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_outcome_live_svq4irpcsp"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_pausable_live_at7bdrj2is"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_pausable_live_at7bdrj2is"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_resource_live_bbskolaran"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_resource_live_bbskolaran"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_retry_why_live_sp7od4pwim"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_retry_why_live_sp7od4pwim"() FROM PUBLIC;

CREATE FUNCTION "slice"."__review_root_kind_live_vkjzjpusnp"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__review_root_kind_live_vkjzjpusnp"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_kind_live_mrzzgu2rqf"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'F0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__sync_kind_live_mrzzgu2rqf"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_outcome_live_7gndrvrenw"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__sync_outcome_live_7gndrvrenw"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_pausable_live_7gx4kdgs6e"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__sync_pausable_live_7gx4kdgs6e"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_retry_why_live_t6r5ysh2pa"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__sync_retry_why_live_t6r5ysh2pa"() FROM PUBLIC;

CREATE FUNCTION "slice"."__sync_root_kind_live_vi4cdymudd"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__sync_root_kind_live_vi4cdymudd"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_kind_live_gxqp25qbem"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__writeback_kind_live_gxqp25qbem"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_outcome_live_haxkgy2wa4"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__writeback_outcome_live_haxkgy2wa4"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_pausable_live_rwjxemvunq"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__writeback_pausable_live_rwjxemvunq"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_retry_why_live_6vffrr6k2o"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__writeback_retry_why_live_6vffrr6k2o"() FROM PUBLIC;

CREATE FUNCTION "slice"."__writeback_root_kind_live_ifibfl2f7i"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__writeback_root_kind_live_ifibfl2f7i"() FROM PUBLIC;

CREATE DOMAIN "slice"."__sha256" AS "pg_catalog"."bytea" CONSTRAINT "check" CHECK (VALUE IS NULL OR ("pg_catalog"."octet_length"(VALUE) = 32) IS TRUE);

CREATE DOMAIN "slice"."bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__bell_live_bk7zau3khi"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice"."feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__feed_live_pfwkvulieq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice"."__domain_gfw43vigph" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint) IS TRUE);

CREATE DOMAIN "slice"."__domain_mxhao3k6ss" AS bigint;

CREATE DOMAIN "slice"."__domain_e5fpjchj5r" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-\.0-9A-Z\_a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__domain_p7dj7oebtz" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint AND VALUE <= 9214147718838775808::bigint) IS TRUE);

CREATE DOMAIN "slice"."__text_t4rwovzmqj" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-0-9a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice"."__param_seen_learner_exdgowkpja" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice_den"."assign_assignment_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_assignment_input_mode_live_nvlduwhvfs"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_decide_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_decide_input_mode_live_bpk4ps2tf3"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_decide_output_stage" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_decide_output_stage_live_j54g2pdkhy"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_embed_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_embed_input_mode_live_r26iyj4yp6"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_kind_live_epoonlekfm"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_outcome_live_3t7oirgwzl"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_pausable_live_spku342qp6"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_retry_why_live_qfzksuyq3m"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_root_kind_live_nccqmed4lq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_chain_run_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_chain_run_input_feed_live_iopwed3csj"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_kind_live_4t2tj7pchx"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_ordered_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_ordered_input_feed_live_4rmnc5y7hz"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_outcome_live_azc7nb42gy"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_page_input_feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_page_input_feed_live_zxgp5dub6j"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_pausable_live_ozpbw3gnsu"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_retry_why_live_m5qnitynhz"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_root_kind_live_mnlnztwbz2"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_chime_input_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_chime_input_bell_live_vs2eypgl4v"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_chime_output_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_chime_output_bell_live_ikpwkv25mh"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_hourly_input_bell" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_hourly_input_bell_live_yfdtebn7na"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_kind_live_kem5uxahz7"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_outcome_live_q7vjmi72sr"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_pausable_live_waldzggn7s"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_retry_why_live_auqnukeed5"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_root_kind_live_dkya2k5nqw"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_child_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_child_kind_live_lzght2aqpn"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_kind_live_mosnikz3yn"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_outcome_live_nos3iqln54"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_pausable_live_uymd2oabeh"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_resource" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_resource_live_yqyw4ee5fp"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_retry_why_live_yom5egfb4x"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_root_kind_live_sx7vmfeklj"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."retry_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__retry_kind_live_lujs5xc25d"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."retry_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__retry_outcome_live_fdo5qezp4f"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."retry_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__retry_pausable_live_buioe34fit"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."retry_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__retry_retry_why_live_p4et7ysqjo"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."retry_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__retry_root_kind_live_euautuyuhd"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_child_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_child_kind_live_xb5v52t6gq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_kind_live_3egbkjww5a"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_outcome_live_svq4irpcsp"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_pausable_live_at7bdrj2is"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_resource" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_resource_live_bbskolaran"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_retry_why_live_sp7od4pwim"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."review_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__review_root_kind_live_vkjzjpusnp"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."sync_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__sync_kind_live_mrzzgu2rqf"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."sync_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__sync_outcome_live_7gndrvrenw"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."sync_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__sync_pausable_live_7gx4kdgs6e"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."sync_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__sync_retry_why_live_t6r5ysh2pa"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."sync_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__sync_root_kind_live_vi4cdymudd"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."writeback_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__writeback_kind_live_gxqp25qbem"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."writeback_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__writeback_outcome_live_haxkgy2wa4"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."writeback_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__writeback_pausable_live_rwjxemvunq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."writeback_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__writeback_retry_why_live_6vffrr6k2o"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."writeback_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__writeback_root_kind_live_ifibfl2f7i"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE TYPE "slice"."__row_news_assign_assignment_input_lznek7z3du" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_news_assign_assignment_input_lznek7z3du" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_assignment_input_wdttr53scw" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_assignment_input_wdttr53scw" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_assignment_input_mode_nearest_pyupadvtv2" AS ("root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_assignment_input_mode_nearest_pyupadvtv2" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_assignment_input_mode_nearest_b5quid2s5d" AS ("root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_assignment_input_mode_nearest_b5quid2s5d" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_assignment_input_mode_within_oeznxymcws" AS ("radius" double precision, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_assignment_input_mode_within_oeznxymcws" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_assignment_input_mode_within_36u3nuqbae" AS ("radius" double precision, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_assignment_input_mode_within_36u3nuqbae" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_input_5m3wrrmet4" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "vector" "vector_ext"."vector"(4));

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_input_5m3wrrmet4" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_input_f2jcgvtjac" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "vector" "vector_ext"."vector"(4));

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_input_f2jcgvtjac" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_input_mode_nearest_cprjb2hbu2" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_input_mode_nearest_cprjb2hbu2" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_input_mode_nearest_ec6iwlipow" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_input_mode_nearest_ec6iwlipow" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_input_mode_within_ihopx5v773" AS ("radius" double precision, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_input_mode_within_ihopx5v773" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_input_mode_within_hr4hmenptp" AS ("radius" double precision, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_input_mode_within_hr4hmenptp" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_output_oxbktxq2qm" AS ("confidence" double precision, "root" "pg_catalog"."bytea", "stage" smallint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_output_oxbktxq2qm" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_output_h4e5chlp62" AS ("confidence" double precision, "root" "pg_catalog"."bytea", "stage" smallint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_output_h4e5chlp62" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_output_stage_rest_gygfjwjnji" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_output_stage_rest_gygfjwjnji" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_output_stage_rest_tqv3wuzdwv" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_output_stage_rest_tqv3wuzdwv" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_decide_output_stage_serve_kbo2spylsa" AS ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_decide_output_stage_serve_kbo2spylsa" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_decide_output_stage_serve_rsiololngr" AS ("distance" double precision, "passage" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_decide_output_stage_serve_rsiololngr" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_done_ccijo7hiah" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_done_ccijo7hiah" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_embed_input_dwxj6bdcbx" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_news_assign_embed_input_dwxj6bdcbx" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_embed_input_sxmwptaczg" AS ("learner" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "mode" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "topic" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_embed_input_sxmwptaczg" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_embed_input_mode_nearest_ux5e4fp7sl" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_embed_input_mode_nearest_ux5e4fp7sl" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_embed_input_mode_nearest_vvtc3n4nsg" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_embed_input_mode_nearest_vvtc3n4nsg" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_embed_input_mode_within_7gysq5v2nb" AS ("radius" double precision, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_embed_input_mode_within_7gysq5v2nb" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_embed_input_mode_within_2ubf7bqv7n" AS ("radius" double precision, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_embed_input_mode_within_2ubf7bqv7n" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_failed_lpxnyexx73" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_failed_lpxnyexx73" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_requested_with_du6qh7hi2e" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_requested_with_du6qh7hi2e" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_result_y6xdg27a27" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_result_y6xdg27a27" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_assign_root_mlgojh5hbk" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_assign_root_mlgojh5hbk" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_assign_step_zrm5kjcsbb" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_assign_step_zrm5kjcsbb" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_chain_done_ipbxekr3jk" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_chain_done_ipbxekr3jk" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_chain_failed_4o3dxe5oq4" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_chain_failed_4o3dxe5oq4" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_chain_page_input_5vfsi4iuxb" AS ("feed" smallint, "pages" bigint, "root" "pg_catalog"."bytea", "seq" bigint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_chain_page_input_5vfsi4iuxb" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_chain_requested_with_chzxikdtnl" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_chain_requested_with_chzxikdtnl" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_chain_result_zhxr3n3y5v" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_chain_result_zhxr3n3y5v" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_chain_root_3rdxqpnika" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_chain_root_3rdxqpnika" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_chain_step_a4auuc4j32" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_chain_step_a4auuc4j32" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_clock_chime_input_rfzc5ysow2" AS ("bell" smallint, "hour" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_clock_chime_input_rfzc5ysow2" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_clock_close_input_f7grz5pq5d" AS ("deadline" bigint, "root" "pg_catalog"."bytea", "sitting" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_clock_close_input_f7grz5pq5d" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_clock_done_f4gq5vnwiu" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_clock_done_f4gq5vnwiu" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_clock_failed_banad75ik7" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_clock_failed_banad75ik7" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_clock_requested_with_3fdps2cdvj" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_clock_requested_with_3fdps2cdvj" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_clock_result_xmvy6bruki" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_clock_result_xmvy6bruki" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_clock_root_77gtrqv5vx" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_clock_root_77gtrqv5vx" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_clock_step_ro3hcnnd7q" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_clock_step_ro3hcnnd7q" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_batch_input_zpegwpv2iw" AS ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "size" bigint);

REVOKE ALL ON TYPE "slice"."__row_news_fan_batch_input_zpegwpv2iw" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_claim_7nx4hyfgum" AS ("attempt" bigint, "holds" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "until" bigint);

REVOKE ALL ON TYPE "slice"."__row_news_fan_claim_7nx4hyfgum" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_done_bm2pdkfeew" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_fan_done_bm2pdkfeew" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_dust_input_eirsjaffsy" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_news_fan_dust_input_eirsjaffsy" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_ended_fjp3muqjpi" AS ("attempt" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_ended_fjp3muqjpi" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_failed_wcom3bevi4" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_fan_failed_wcom3bevi4" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_held_6pxeeuxzx5" AS ("attempt" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_held_6pxeeuxzx5" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_hold_fiz7xnswto" AS ("at" bigint, "attempt" bigint, "resource" smallint, "root" "pg_catalog"."bytea", "seat" bigint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_fan_hold_fiz7xnswto" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_mop_input_vkauufcv3s" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "sweep" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8");

REVOKE ALL ON TYPE "slice"."__row_news_fan_mop_input_vkauufcv3s" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_requested_with_vvlswsw6at" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_requested_with_vvlswsw6at" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_result_cfwjurochh" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_result_cfwjurochh" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_root_pek322ray3" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_fan_root_pek322ray3" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_fan_square_input_oooc5jrvqp" AS ("batch" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "n" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_fan_square_input_oooc5jrvqp" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_step_e5cdd74oi6" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_step_e5cdd74oi6" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_fan_within_igrko3tlla" AS ("kind" smallint, "parent" "pg_catalog"."bytea", "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_fan_within_igrko3tlla" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_brittle_input_gi4pw323hl" AS ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_brittle_input_gi4pw323hl" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_done_3xnhmplocl" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_done_3xnhmplocl" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_failed_ht6i2dxi6i" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_failed_ht6i2dxi6i" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_patient_input_ujn3j6okjm" AS ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_patient_input_ujn3j6okjm" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_polite_input_6z54vs4crc" AS ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_polite_input_6z54vs4crc" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_retry_requested_with_pwesmz6aqt" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_retry_requested_with_pwesmz6aqt" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_retry_result_sawexe6rws" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_retry_result_sawexe6rws" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_root_bpmsp2lmj3" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_root_bpmsp2lmj3" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_retry_steadfast_input_6gk4r2it4l" AS ("key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_retry_steadfast_input_6gk4r2it4l" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_retry_step_7e2dops6yg" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_retry_step_7e2dops6yg" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_analyze_input_ahzjb4juuh" AS ("group" bigint, "question" bigint, "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_analyze_input_ahzjb4juuh" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_claim_ku2calk2a4" AS ("attempt" bigint, "holds" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "until" bigint);

REVOKE ALL ON TYPE "slice"."__row_news_review_claim_ku2calk2a4" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_done_i5yrctmmrt" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_done_i5yrctmmrt" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_ended_3vbje7ziry" AS ("attempt" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_ended_3vbje7ziry" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_failed_o2i2xvx3ox" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_failed_o2i2xvx3ox" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_gather_input_3xhqgy4d4y" AS ("review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_gather_input_3xhqgy4d4y" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_held_aio2rgomle" AS ("attempt" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_held_aio2rgomle" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_hold_s3lo4pqs6u" AS ("at" bigint, "attempt" bigint, "resource" smallint, "root" "pg_catalog"."bytea", "seat" bigint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_hold_s3lo4pqs6u" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_questions_input_xqapos33bv" AS ("group" bigint, "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "size" bigint);

REVOKE ALL ON TYPE "slice"."__row_news_review_questions_input_xqapos33bv" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_requested_with_d4ep53ociv" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_requested_with_d4ep53ociv" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_result_4edqg37cfx" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_result_4edqg37cfx" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_root_eshmunzwn4" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_review_root_eshmunzwn4" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_review_save_input_g4felfy764" AS ("count" bigint, "group" bigint, "review" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea", "total" bigint);

REVOKE ALL ON TYPE "slice"."__row_news_review_save_input_g4felfy764" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_step_5ly7sn3crk" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_step_5ly7sn3crk" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_review_within_7w5djnlfoo" AS ("kind" smallint, "parent" "pg_catalog"."bytea", "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_review_within_7w5djnlfoo" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_sync_build_input_7gtarvuzgd" AS ("build" bigint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_sync_build_input_7gtarvuzgd" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_sync_copy_input_cmgovnrtbu" AS ("relation" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "run" bigint, "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_sync_copy_input_cmgovnrtbu" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_sync_done_srwysx2oys" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_sync_done_srwysx2oys" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_sync_failed_uo7agxnsp7" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_sync_failed_uo7agxnsp7" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_sync_requested_with_7xi5vgtjja" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_sync_requested_with_7xi5vgtjja" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_sync_result_5yd36qoig4" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_sync_result_5yd36qoig4" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_sync_root_zdr2x363tg" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_sync_root_zdr2x363tg" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_sync_step_24id3jri34" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_sync_step_24id3jri34" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_writeback_deliver_input_fl5m4s5p77" AS ("attempt" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_writeback_deliver_input_fl5m4s5p77" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_writeback_done_l54jw73tg7" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_writeback_done_l54jw73tg7" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_writeback_failed_o2vuzrgz2y" AS ("root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_writeback_failed_o2vuzrgz2y" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_writeback_requested_with_bmpjgxjpa7" AS ("fingerprint" "pg_catalog"."bytea", "input" "pg_catalog"."bytea", "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_writeback_requested_with_bmpjgxjpa7" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_writeback_result_ctqblben4u" AS ("outcome" smallint, "root" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_writeback_result_ctqblben4u" FROM PUBLIC;

CREATE TYPE "slice"."__row_news_writeback_root_gtduy6k6pr" AS ("at" bigint, "key" "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8", "kind" smallint, "root" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_news_writeback_root_gtduy6k6pr" FROM PUBLIC;

CREATE TYPE "slice"."__row_olds_writeback_step_rvrwqy67gp" AS ("due" bigint, "kind" smallint, "root" "pg_catalog"."bytea", "scope" "pg_catalog"."bytea", "step" "pg_catalog"."bytea");

REVOKE ALL ON TYPE "slice"."__row_olds_writeback_step_rvrwqy67gp" FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__refuse"("state" "pg_catalog"."text", "constraint_name" "pg_catalog"."text", "detail" "pg_catalog"."text") RETURNS boolean
LANGUAGE plpgsql VOLATILE PARALLEL SAFE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
BEGIN
  RAISE EXCEPTION 'grizzle refused the statement' USING ERRCODE = "state", CONSTRAINT = "constraint_name", DETAIL = "detail";
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") FROM PUBLIC;

CREATE OR REPLACE FUNCTION "slice"."__borrow"("ids" bigint[], "exclusive" boolean[]) RETURNS "pg_catalog"."void"
LANGUAGE plpgsql VOLATILE SECURITY DEFINER SET search_path = "pg_catalog", "pg_temp"
AS $$
DECLARE
  "at" integer;
BEGIN
  FOR "at" IN SELECT DISTINCT "r1"."c1" FROM "pg_catalog"."generate_subscripts"("ids", 1) AS "r1"("c1") ORDER BY "r1"."c1" LOOP IF ("exclusive")["at"] THEN PERFORM "pg_catalog"."pg_advisory_xact_lock"(("ids")["at"]); ELSE PERFORM "pg_catalog"."pg_advisory_xact_lock_shared"(("ids")["at"]); END IF; END LOOP;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) FROM PUBLIC;

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
  "source" "slice"."__sha256" NOT NULL,
  "target" "slice"."__sha256" NOT NULL,
  "files" integer NOT NULL,
  "digest" "slice"."__sha256" NOT NULL,
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
  "ddl" "slice"."__sha256" NOT NULL,
  "description" "slice"."__sha256" NOT NULL,
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
  IF NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r3" WHERE "r3"."ordinal" = 0 AND "r3"."target" = "pg_catalog"."decode"("fingerprint", 'hex'::"pg_catalog"."text") AND NOT EXISTS (SELECT 1 FROM "slice"."__ledger" AS "r4" WHERE "r4"."ordinal" = 0 AND "r4"."folder" > "r3"."folder")) THEN RAISE EXCEPTION 'the latest grizzle migration of this schema is not the snapshot of this Db' USING ERRCODE = '55Z01'::"pg_catalog"."text"; END IF;
END
$$;

REVOKE EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") FROM PUBLIC;
