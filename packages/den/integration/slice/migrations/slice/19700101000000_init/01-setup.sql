CREATE SCHEMA "slice";

CREATE SCHEMA "slice_den";

CREATE SCHEMA "slice_seats";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
CREATE EXTENSION IF NOT EXISTS "vector" SCHEMA "vector_ext";

-- closed cells: 1 rows in 1 cells, content b24eeaa98f423c4c1d92f643c7554c1ce54596cc04a269d8fd1c350f7af5ff40
CREATE FUNCTION "slice"."__constant_eq577tindj"() RETURNS bigint[] LANGUAGE sql IMMUTABLE PARALLEL SAFE RETURN '{-1,0}'::bigint[];

REVOKE ALL ON FUNCTION "slice"."__constant_eq577tindj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__constant_ejkw66w2je"() RETURNS bigint[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"2"}'::bigint[];

REVOKE ALL ON FUNCTION "slice"."__constant_ejkw66w2je"() FROM PUBLIC;

CREATE FUNCTION "slice"."__closed_row_cq3qq2e2aa"("cells" bigint[], "first" bigint, "count" bigint, "empty" bit varying) RETURNS bit varying
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE
RETURN (SELECT COALESCE("pg_catalog"."bit_or"("pg_catalog"."set_bit"($4::bit varying, (($1::bigint[])["r1"."c1"] - $2::bigint)::integer, 1)), $4::bit varying) FROM "pg_catalog"."generate_series"("pg_catalog"."width_bucket"($2::bigint - 1::bigint, $1::bigint[]) + 1, "pg_catalog"."width_bucket"($2::bigint + $3::bigint - 1::bigint, $1::bigint[])) AS "r1"("c1"));

REVOKE ALL ON FUNCTION "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying) FROM PUBLIC;

CREATE FUNCTION "slice"."__text_digest_2x5x4iwe4m"("text" "pg_catalog"."text") RETURNS "pg_catalog"."bytea"
LANGUAGE sql IMMUTABLE STRICT PARALLEL SAFE
RETURN "pg_catalog"."sha256"("pg_catalog"."convert_to"($1::"pg_catalog"."text", 'UTF8'::"pg_catalog"."text"));

REVOKE ALL ON FUNCTION "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text") FROM PUBLIC;

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

CREATE FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"ChainRunFinish","OrderedFinish","Page"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__fan_kind_names_6jgkvuzg33"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"BatchFinish","Dust","FanRunFinish","Mop","Square","SweepFinish","WantedFinish"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_kind_names_6jgkvuzg33"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"done","failed"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_pausable_names_fpk6cvxfiv"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun","Pool","Sweep","Vendor","Wanted"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_pausable_names_fpk6cvxfiv"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Pool"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"later","spent","transient"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_root_kind_names_jqlbcidhe6"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"FanRun","Sweep","Wanted"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__fan_root_kind_names_jqlbcidhe6"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Rest","Serve"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"news","sport"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__fan_kind_live_wcuqzqhqwl"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'FE'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_kind_live_wcuqzqhqwl"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_pausable_live_m2rf37xwjt"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'F8'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_pausable_live_m2rf37xwjt"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'80'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() FROM PUBLIC;

CREATE FUNCTION "slice"."__fan_root_kind_live_zwogjm2ro3"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'E0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__fan_root_kind_live_zwogjm2ro3"() FROM PUBLIC;

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

CREATE FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"() FROM PUBLIC;

CREATE FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() RETURNS bit varying
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN X'C0'::bit varying;

REVOKE ALL ON FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() FROM PUBLIC;

CREATE DOMAIN "slice"."__sha256" AS "pg_catalog"."bytea" CONSTRAINT "check" CHECK (VALUE IS NULL OR ("pg_catalog"."octet_length"(VALUE) = 32) IS TRUE);

CREATE DOMAIN "slice"."feed" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__feed_live_pfwkvulieq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice"."__domain_gfw43vigph" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint) IS TRUE);

CREATE DOMAIN "slice"."__domain_mxhao3k6ss" AS bigint;

CREATE DOMAIN "slice"."__domain_e5fpjchj5r" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-\.0-9A-Z\_a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__domain_p7dj7oebtz" AS bigint CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE >= 0::bigint AND VALUE <= 9214147718838775808::bigint) IS TRUE);

CREATE DOMAIN "slice"."__text_t4rwovzmqj" AS "pg_catalog"."text" COLLATE "pg_catalog"."pg_c_utf8" CONSTRAINT "check" CHECK (VALUE IS NULL OR (VALUE ~ '\A[\-0-9a-z]{1,64}\Z'::"pg_catalog"."text") IS TRUE);

CREATE DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice"."__param_seen_learner_exdgowkpja" AS "slice"."__text_t4rwovzmqj";

CREATE DOMAIN "slice_den"."assign_assignment_input_mode_pgalmghonldnf" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_decide_input_mode_beoibaghjodnf" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_decide_output_stage_bjoijbfcegdbp" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_embed_input_mode_pblkjdhncepei" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_kind_live_epoonlekfm"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_outcome_live_3t7oirgwzl"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_pausable_live_spku342qp6"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_retry_why_live_qfzksuyq3m"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."assign_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__assign_root_kind_live_nccqmed4lq"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_chain_run_input_feed_dcnlhjpledlkf" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_kind_live_4t2tj7pchx"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_ordered_input_feed_hbpmfpphpfngm" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_outcome_live_azc7nb42gy"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_page_input_feed_nlhfmgjplihkf" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_pausable_live_ozpbw3gnsu"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_retry_why_live_m5qnitynhz"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."chain_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__chain_root_kind_live_mnlnztwbz2"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_kind_live_kem5uxahz7"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_outcome_live_q7vjmi72sr"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_pausable_live_waldzggn7s"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_retry_why_live_auqnukeed5"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."clock_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__clock_root_kind_live_dkya2k5nqw"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_child_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_child_kind_live_lzght2aqpn"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_kind_live_wcuqzqhqwl"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_outcome" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_outcome_live_nos3iqln54"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_pausable" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_pausable_live_m2rf37xwjt"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_resource" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_resource_live_yqyw4ee5fp"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_retry_why" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_retry_why_live_yom5egfb4x"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

CREATE DOMAIN "slice_den"."fan_root_kind" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (CASE WHEN VALUE >= 0 AND VALUE < 8 THEN "pg_catalog"."get_bit"("slice"."__fan_root_kind_live_zwogjm2ro3"(), VALUE::integer) = 1 ELSE false END) IS TRUE);

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
