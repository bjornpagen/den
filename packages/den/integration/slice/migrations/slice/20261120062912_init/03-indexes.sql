CREATE INDEX "__assign_admitted_ix_root_pot3vpqjrt" ON "slice"."assign_admitted" USING btree ("root");

CREATE INDEX "__assign_assignment_input_ix_root_scope_ndn57wfv5p" ON "slice"."assign_assignment_input" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_scope_u_6_ypqf_45dew4mkec" ON "slice"."assign_assignment_input_exclude" USING btree ("__scope_u6ypqf2r2z", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

CREATE INDEX "__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" ON "slice"."assign_assignment_input_exclude" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_nearest_ix_root_scope_2jryb7pj2a" ON "slice"."assign_assignment_input_mode_nearest" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_within_ix_root_scope_yleeo72liv" ON "slice"."assign_assignment_input_mode_within" USING btree ("root", "scope");

CREATE INDEX "__assign_claim_ix_step_ouvkclqzzd_pred_attempt_x7szewvena" ON "slice"."assign_claim" USING btree ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz");

CREATE INDEX "__assign_claim_ix_root_wxxruhegpn" ON "slice"."assign_claim" USING btree ("root");

CREATE INDEX "__assign_decide_input_ix_root_step_erwflqvcsk" ON "slice"."assign_decide_input" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_exclude_ix_step_mjpuijzth_4_2wmsrdnp2v" ON "slice"."assign_decide_input_exclude" USING btree ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" ON "slice"."assign_decide_input_exclude" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_nearest_ix_root_step_v54e6no7cj" ON "slice"."assign_decide_input_mode_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_within_ix_root_step_trlkcqxcfp" ON "slice"."assign_decide_input_mode_within" USING btree ("root", "step");

CREATE INDEX "__assign_decide_nearest_read_ix_root_step_4c4574ihrx" ON "slice"."assign_decide_nearest_read" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_ix_root_step_uxq3vbvjoa" ON "slice"."assign_decide_output" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_rest_ix_root_step_hkqbk442cr" ON "slice"."assign_decide_output_stage_rest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_serve_ix_root_step_65h35vi6kz" ON "slice"."assign_decide_output_stage_serve" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_weighed_ix_step_mjpuijzth_4_6xa7a6vtga" ON "slice"."assign_decide_output_weighed" USING btree ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

CREATE INDEX "__assign_decide_output_weighed_ix_root_step_gncwdipl43" ON "slice"."assign_decide_output_weighed" USING btree ("root", "step");

CREATE INDEX "__assign_decide_seen_read_ix_root_step_ybtvecx7oy" ON "slice"."assign_decide_seen_read" USING btree ("root", "step");

CREATE INDEX "__assign_done_ix_root_step_edz2spjbbn" ON "slice"."assign_done" USING btree ("root", "step");

CREATE INDEX "__assign_ended_ix_root_dw6oimqu3h" ON "slice"."assign_ended" USING btree ("root");

CREATE INDEX "__assign_exhausted_ix_root_gsga5kdkq3" ON "slice"."assign_exhausted" USING btree ("root");

CREATE INDEX "__assign_failed_ix_root_step_i7nxwkjb5e" ON "slice"."assign_failed" USING btree ("root", "step");

CREATE INDEX "__assign_fenced_ix_root_jvlqbasn7e" ON "slice"."assign_fenced" USING btree ("root");

CREATE INDEX "__assign_finish_ix_root_ilehlpwnxm" ON "slice"."assign_finish" USING btree ("root");

CREATE INDEX "__assign_finish_ix_scope_step_53o4eorqpr" ON "slice"."assign_finish" USING btree ("scope", "step");

CREATE INDEX "__assign_held_ix_root_35l4gc35rc" ON "slice"."assign_held" USING btree ("root");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_refusal_ix_root_qadi23h44a" ON "slice"."assign_refusal" USING btree ("root");

CREATE INDEX "__assign_result_ix_root_step_yuug5el3pq" ON "slice"."assign_result" USING btree ("root", "step");

CREATE INDEX "__assign_result_ix_step_outcome_root_35vmqe5lxj" ON "slice"."assign_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__assign_retry_ix_root_oaojw2snch" ON "slice"."assign_retry" USING btree ("root");

CREATE INDEX "__assign_scope_ix_root_v6jmsbgzsq" ON "slice"."assign_scope" USING btree ("root");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_root_dzieud2d67" ON "slice"."assign_skipped" USING btree ("root");

CREATE INDEX "__assign_start_step_ix_root_scope_j5eqvalej3" ON "slice"."assign_start_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_root_scope_64vujnvoiu" ON "slice"."assign_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_scope_kind_step_xn2zxx73po" ON "slice"."assign_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_admitted_ix_root_3xhdqkpeqw" ON "slice"."chain_admitted" USING btree ("root");

CREATE INDEX "__chain_chain_run_input_ix_root_7abe6kcg67" ON "slice"."chain_chain_run_input" USING btree ("root");

CREATE INDEX "__chain_claim_ix_step_ouvkclqzzd_pred_attempt_dqbvoe_gdjkwebwlh" ON "slice"."chain_claim" USING btree ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz");

CREATE INDEX "__chain_claim_ix_root_i4kzudjuai" ON "slice"."chain_claim" USING btree ("root");

CREATE INDEX "__chain_done_ix_root_step_nymmh7bgnk" ON "slice"."chain_done" USING btree ("root", "step");

CREATE INDEX "__chain_ended_ix_root_e73xltety4" ON "slice"."chain_ended" USING btree ("root");

CREATE INDEX "__chain_exhausted_ix_root_fjn7tzhjc7" ON "slice"."chain_exhausted" USING btree ("root");

CREATE INDEX "__chain_failed_ix_root_step_bmwbd7vlrh" ON "slice"."chain_failed" USING btree ("root", "step");

CREATE INDEX "__chain_fenced_ix_root_mnawzvb34e" ON "slice"."chain_fenced" USING btree ("root");

CREATE INDEX "__chain_finish_ix_root_ypjcgcan7b" ON "slice"."chain_finish" USING btree ("root");

CREATE INDEX "__chain_finish_ix_scope_step_om6bljb56e" ON "slice"."chain_finish" USING btree ("scope", "step");

CREATE INDEX "__chain_held_ix_root_havzgkxex3" ON "slice"."chain_held" USING btree ("root");

CREATE INDEX "__chain_next_ix_root_from_5hhx2qutdl" ON "slice"."chain_next" USING btree ("root", "from");

CREATE INDEX "__chain_ordered_input_ix_root_wmmk2yqn4t" ON "slice"."chain_ordered_input" USING btree ("root");

CREATE INDEX "__chain_page_input_ix_root_step_25b4lmpnjr" ON "slice"."chain_page_input" USING btree ("root", "step");

CREATE INDEX "__chain_page_input_after_ix_root_hmbetlosxh" ON "slice"."chain_page_input_after" USING btree ("root");

CREATE INDEX "__chain_page_output_ix_root_g3alpbog4o" ON "slice"."chain_page_output" USING btree ("root");

CREATE INDEX "__chain_page_output_next_ix_root_r662e4fglp" ON "slice"."chain_page_output_next" USING btree ("root");

CREATE INDEX "__chain_page_weights_read_ix_root_step_qkx2asxvn7" ON "slice"."chain_page_weights_read" USING btree ("root", "step");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_refusal_ix_root_t2ancje4qy" ON "slice"."chain_refusal" USING btree ("root");

CREATE INDEX "__chain_result_ix_root_step_32kpfjvum5" ON "slice"."chain_result" USING btree ("root", "step");

CREATE INDEX "__chain_result_ix_step_outcome_root_ipaxj3wl7z" ON "slice"."chain_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__chain_retry_ix_root_nhtemmz6f2" ON "slice"."chain_retry" USING btree ("root");

CREATE INDEX "__chain_scope_ix_root_idrabjw6oz" ON "slice"."chain_scope" USING btree ("root");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_root_4knz5mxvl4" ON "slice"."chain_skipped" USING btree ("root");

CREATE INDEX "__chain_start_step_ix_root_scope_76rv5icpsa" ON "slice"."chain_start_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_root_scope_srrhrbyetn" ON "slice"."chain_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_scope_kind_step_tsdjtgaey5" ON "slice"."chain_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_step_ix_step_kind_root_2pdoze4bhr" ON "slice"."chain_step" USING btree ("step", "kind", "root");

CREATE INDEX "__fan_admitted_ix_root_cjavzjrmil" ON "slice"."fan_admitted" USING btree ("root");

CREATE INDEX "__fan_batch_input_ix_root_scope_24ynzsffio" ON "slice"."fan_batch_input" USING btree ("root", "scope");

CREATE INDEX "__fan_claim_ix_step_ouvkclqzzd_pred_attempt_dqbvoe_7_scbit3alr4" ON "slice"."fan_claim" USING btree ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz");

CREATE INDEX "__fan_claim_ix_root_step_t6nf6jsksj" ON "slice"."fan_claim" USING btree ("root", "step");

CREATE INDEX "__fan_done_ix_root_step_nrkfpkvyya" ON "slice"."fan_done" USING btree ("root", "step");

CREATE INDEX "__fan_ended_ix_root_step_unjzbpnw46" ON "slice"."fan_ended" USING btree ("root", "step");

CREATE INDEX "__fan_exhausted_ix_root_2diuxfgt5s" ON "slice"."fan_exhausted" USING btree ("root");

CREATE INDEX "__fan_failed_ix_root_step_ciyeplozai" ON "slice"."fan_failed" USING btree ("root", "step");

CREATE INDEX "__fan_fan_run_input_ix_root_25alzzoykh" ON "slice"."fan_fan_run_input" USING btree ("root");

CREATE INDEX "__fan_fenced_ix_root_3xl5uhzvmu" ON "slice"."fan_fenced" USING btree ("root");

CREATE INDEX "__fan_finish_ix_root_i6xnvwhwty" ON "slice"."fan_finish" USING btree ("root");

CREATE INDEX "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice"."fan_finish" USING btree ("scope", "step");

CREATE INDEX "__fan_held_ix_root_step_hgpfyg562f" ON "slice"."fan_held" USING btree ("root", "step");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_hold_ix_root_ral35akxi3" ON "slice"."fan_hold" USING btree ("root");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_refusal_ix_root_s5ydavkzd3" ON "slice"."fan_refusal" USING btree ("root");

CREATE INDEX "__fan_result_ix_root_step_zpvuqrugvb" ON "slice"."fan_result" USING btree ("root", "step");

CREATE INDEX "__fan_result_ix_step_outcome_root_udaij7stvj" ON "slice"."fan_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__fan_retry_ix_root_sirifasnll" ON "slice"."fan_retry" USING btree ("root");

CREATE INDEX "__fan_scope_ix_root_a5wtvynqul" ON "slice"."fan_scope" USING btree ("root");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_root_7ktlrax2wh" ON "slice"."fan_skipped" USING btree ("root");

CREATE INDEX "__fan_square_input_ix_root_step_dhgolhjnxl" ON "slice"."fan_square_input" USING btree ("root", "step");

CREATE INDEX "__fan_square_output_ix_root_vc5qn45ria" ON "slice"."fan_square_output" USING btree ("root");

CREATE INDEX "__fan_start_scope_ix_root_scope_t5ybmxw7ah" ON "slice"."fan_start_scope" USING btree ("root", "scope");

CREATE INDEX "__fan_start_step_ix_root_scope_vn7amkfoey" ON "slice"."fan_start_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_root_scope_aw525h7gua" ON "slice"."fan_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_scope_kind_step_5arz2gb4sb" ON "slice"."fan_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__fan_within_ix_parent_kind_scope_5ywepfmzj2" ON "slice"."fan_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__fan_within_ix_root_parent_ivgq62e3yc" ON "slice"."fan_within" USING btree ("root", "parent");

CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__retry_admitted_ix_root_ewgjxicsia" ON "slice"."retry_admitted" USING btree ("root");

CREATE INDEX "__retry_brittle_input_ix_root_step_hn2bnvkmi5" ON "slice"."retry_brittle_input" USING btree ("root", "step");

CREATE INDEX "__retry_brittle_output_ix_root_zbwyfvhpop" ON "slice"."retry_brittle_output" USING btree ("root");

CREATE INDEX "__retry_claim_ix_step_ouvkclqzzd_pred_attempt_dqbvoe_56kr6qlizb" ON "slice"."retry_claim" USING btree ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz");

CREATE INDEX "__retry_claim_ix_root_l2dmax44om" ON "slice"."retry_claim" USING btree ("root");

CREATE INDEX "__retry_done_ix_root_step_2l3rh6d5g6" ON "slice"."retry_done" USING btree ("root", "step");

CREATE INDEX "__retry_ended_ix_root_qdnd63ykxk" ON "slice"."retry_ended" USING btree ("root");

CREATE INDEX "__retry_exhausted_ix_root_zequtvgrfg" ON "slice"."retry_exhausted" USING btree ("root");

CREATE INDEX "__retry_failed_ix_root_step_7objnilm6u" ON "slice"."retry_failed" USING btree ("root", "step");

CREATE INDEX "__retry_fenced_ix_root_4x3i3cxxnz" ON "slice"."retry_fenced" USING btree ("root");

CREATE INDEX "__retry_finish_ix_root_sr33zcrg2m" ON "slice"."retry_finish" USING btree ("root");

CREATE INDEX "__retry_finish_ix_scope_step_6tswescc6v" ON "slice"."retry_finish" USING btree ("scope", "step");

CREATE INDEX "__retry_held_ix_root_ytwhkhubpt" ON "slice"."retry_held" USING btree ("root");

CREATE INDEX "__retry_ladders_input_ix_root_co4bnpgzm5" ON "slice"."retry_ladders_input" USING btree ("root");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_refusal_ix_root_7f4y3ykjiz" ON "slice"."retry_refusal" USING btree ("root");

CREATE INDEX "__retry_result_ix_root_step_n7qrlleymb" ON "slice"."retry_result" USING btree ("root", "step");

CREATE INDEX "__retry_result_ix_step_outcome_root_5x6caywnin" ON "slice"."retry_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__retry_retry_ix_root_pkjsumgznf" ON "slice"."retry_retry" USING btree ("root");

CREATE INDEX "__retry_scope_ix_root_7gpsngzwhs" ON "slice"."retry_scope" USING btree ("root");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_root_uaslhltkgy" ON "slice"."retry_skipped" USING btree ("root");

CREATE INDEX "__retry_start_step_ix_root_scope_f733eg3dwz" ON "slice"."retry_start_step" USING btree ("root", "scope");

CREATE INDEX "__retry_steadfast_input_ix_root_step_2oipswgr7i" ON "slice"."retry_steadfast_input" USING btree ("root", "step");

CREATE INDEX "__retry_steadfast_output_ix_root_sp7in5arxz" ON "slice"."retry_steadfast_output" USING btree ("root");

CREATE INDEX "__retry_step_ix_root_scope_ogbhay3han" ON "slice"."retry_step" USING btree ("root", "scope");

CREATE INDEX "__retry_step_ix_scope_kind_step_m6ufaqcqmk" ON "slice"."retry_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__sync_admitted_ix_root_vormyuqk5x" ON "slice"."sync_admitted" USING btree ("root");

CREATE INDEX "__sync_build_input_ix_root_step_azxcsmj373" ON "slice"."sync_build_input" USING btree ("root", "step");

CREATE INDEX "__sync_build_output_ix_root_amskeycb7k" ON "slice"."sync_build_output" USING btree ("root");

CREATE INDEX "__sync_claim_ix_step_ouvkclqzzd_pred_attempt_dqbvoe_jozknhvn35" ON "slice"."sync_claim" USING btree ("__step_ouvkclqzzd", "__pred_attempt_dqbvoe7dfs", "__root_yewsvvtcyz");

CREATE INDEX "__sync_claim_ix_root_rcsm3ggsvs" ON "slice"."sync_claim" USING btree ("root");

CREATE INDEX "__sync_copy_input_ix_root_step_42uulsghoj" ON "slice"."sync_copy_input" USING btree ("root", "step");

CREATE INDEX "__sync_copy_output_ix_root_k6ia72urcq" ON "slice"."sync_copy_output" USING btree ("root");

CREATE INDEX "__sync_done_ix_root_step_ionbtp5et7" ON "slice"."sync_done" USING btree ("root", "step");

CREATE INDEX "__sync_ended_ix_root_xi7qlk4cj4" ON "slice"."sync_ended" USING btree ("root");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_exclusive_key_ix_root_tfhjjf4qg2" ON "slice"."sync_exclusive_key" USING btree ("root");

CREATE INDEX "__sync_exhausted_ix_root_yqhpt7jtz4" ON "slice"."sync_exhausted" USING btree ("root");

CREATE INDEX "__sync_failed_ix_root_step_iieo2dpdbf" ON "slice"."sync_failed" USING btree ("root", "step");

CREATE INDEX "__sync_fenced_ix_root_peedftug4f" ON "slice"."sync_fenced" USING btree ("root");

CREATE INDEX "__sync_finish_ix_root_zrpyhvrere" ON "slice"."sync_finish" USING btree ("root");

CREATE INDEX "__sync_finish_ix_scope_step_owsw7m5w74" ON "slice"."sync_finish" USING btree ("scope", "step");

CREATE INDEX "__sync_gold_input_ix_root_fmnsnept43" ON "slice"."sync_gold_input" USING btree ("root");

CREATE INDEX "__sync_held_ix_root_yxqvodlkmy" ON "slice"."sync_held" USING btree ("root");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_refusal_ix_root_642sem4ijz" ON "slice"."sync_refusal" USING btree ("root");

CREATE INDEX "__sync_result_ix_root_step_t2jh3c7vsq" ON "slice"."sync_result" USING btree ("root", "step");

CREATE INDEX "__sync_retry_ix_root_j5nndics7d" ON "slice"."sync_retry" USING btree ("root");

CREATE INDEX "__sync_scope_ix_root_7f6s5dqo5t" ON "slice"."sync_scope" USING btree ("root");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_root_cjefss5pid" ON "slice"."sync_skipped" USING btree ("root");

CREATE INDEX "__sync_start_step_ix_root_scope_5d3x6uas5c" ON "slice"."sync_start_step" USING btree ("root", "scope");

CREATE INDEX "__sync_step_ix_root_scope_l4sfn7gzd3" ON "slice"."sync_step" USING btree ("root", "scope");

CREATE INDEX "__sync_step_ix_scope_qlsdbwk3lt" ON "slice"."sync_step" USING btree ("scope");

CREATE INDEX "__sync_sync_run_input_ix_root_bp43cbf2uj" ON "slice"."sync_sync_run_input" USING btree ("root");

CREATE STATISTICS "slice"."__assign_finish_stats_scope_step_ld6jyxztu6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."assign_finish";

CREATE STATISTICS "slice"."__assign_step_stats_kind_scope_wiztsdmmtf" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."assign_step";

CREATE STATISTICS "slice"."__chain_finish_stats_scope_step_z7lvm6j2l6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."chain_finish";

CREATE STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."chain_step";

CREATE STATISTICS "slice"."__fan_finish_stats_scope_step_4mm4p6zm66" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."fan_finish";

CREATE STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."fan_step";

CREATE STATISTICS "slice"."__fan_within_stats_kind_parent_3vvpgco4da" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice"."fan_within";

CREATE STATISTICS "slice"."__retry_finish_stats_scope_step_2nxi4d7tdj" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."retry_finish";

CREATE STATISTICS "slice"."__retry_step_stats_kind_scope_osnqmvpfhd" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."retry_step";

CREATE STATISTICS "slice"."__sync_exclusive_stats_key_kind_smed76p3zh" (ndistinct, dependencies, mcv) ON "key", "kind" FROM "slice"."sync_exclusive";

CREATE STATISTICS "slice"."__sync_finish_stats_scope_step_xiaq6np7mf" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."sync_finish";
