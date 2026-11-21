CREATE INDEX "__assign_admitted_ix_root_pot3vpqjrt" ON "slice"."assign_admitted" USING btree ("root");

CREATE INDEX "__assign_asked_ix_root_from_tqt7dg3fxl" ON "slice"."assign_asked" USING btree ("root", "from");

CREATE INDEX "__assign_assignment_finish_output_ix_root_t2nmfubzxm" ON "slice"."assign_assignment_finish_output" USING btree ("root");

CREATE INDEX "__assign_assignment_input_ix_root_scope_ndn57wfv5p" ON "slice"."assign_assignment_input" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_root_scope_u_6_7ph7zpbtp2" ON "slice"."assign_assignment_input_exclude" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" ON "slice"."assign_assignment_input_exclude" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_nearest_ix_root_scope_2jryb7pj2a" ON "slice"."assign_assignment_input_mode_nearest" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_within_ix_root_scope_yleeo72liv" ON "slice"."assign_assignment_input_mode_within" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_near_ix_root_scope_u_6_eoy4ujrqzz" ON "slice"."assign_assignment_input_near" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_near_ix_root_scope_gswnizhczo" ON "slice"."assign_assignment_input_near" USING btree ("root", "scope");

CREATE INDEX "__assign_claim_ix_root_step_ouvkclqzzd_pred_attempt_wrkk7rllts" ON "slice"."assign_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__assign_decide_input_ix_root_step_erwflqvcsk" ON "slice"."assign_decide_input" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_exclude_ix_root_step_mjpuijzth_26rzz2ekud" ON "slice"."assign_decide_input_exclude" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" ON "slice"."assign_decide_input_exclude" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_nearest_ix_root_step_v54e6no7cj" ON "slice"."assign_decide_input_mode_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_within_ix_root_step_trlkcqxcfp" ON "slice"."assign_decide_input_mode_within" USING btree ("root", "step");

CREATE INDEX "__assign_decide_nearest_read_ix_root_digest_ahoyjoscuz" ON "slice"."assign_decide_nearest_read" USING btree ("root", "digest");

CREATE INDEX "__assign_decide_nearest_read_ix_root_step_4c4574ihrx" ON "slice"."assign_decide_nearest_read" USING btree ("root", "step");

CREATE INDEX "__assign_decide_nearest_row_ix_root_auwnhrklbq" ON "slice"."assign_decide_nearest_row" USING btree ("root");

CREATE INDEX "__assign_decide_output_ix_root_step_uxq3vbvjoa" ON "slice"."assign_decide_output" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_rest_ix_root_step_hkqbk442cr" ON "slice"."assign_decide_output_stage_rest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_serve_ix_root_step_65h35vi6kz" ON "slice"."assign_decide_output_stage_serve" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_weighed_ix_root_step_5pk2o2aayf" ON "slice"."assign_decide_output_weighed" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_output_weighed_ix_root_step_gncwdipl43" ON "slice"."assign_decide_output_weighed" USING btree ("root", "step");

CREATE INDEX "__assign_decide_seen_read_ix_root_digest_m6pnjyf3tl" ON "slice"."assign_decide_seen_read" USING btree ("root", "digest");

CREATE INDEX "__assign_decide_seen_read_ix_root_step_ybtvecx7oy" ON "slice"."assign_decide_seen_read" USING btree ("root", "step");

CREATE INDEX "__assign_decide_seen_row_ix_root_yq77kgv2h4" ON "slice"."assign_decide_seen_row" USING btree ("root");

CREATE INDEX "__assign_done_ix_root_step_edz2spjbbn" ON "slice"."assign_done" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_ix_root_step_5ltjxo25vr" ON "slice"."assign_embed_input" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_exclude_ix_root_step_mjpuijzth_7bmkgreoup" ON "slice"."assign_embed_input_exclude" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_exclude_ix_root_step_hkkmfupglo" ON "slice"."assign_embed_input_exclude" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_mode_nearest_ix_root_step_nyvoanaxpc" ON "slice"."assign_embed_input_mode_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_mode_within_ix_root_step_jaqihe4eqt" ON "slice"."assign_embed_input_mode_within" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_near_ix_root_step_mjpuijzth_4_p67hugda6z" ON "slice"."assign_embed_input_near" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_near_ix_root_step_lkjh7aey4z" ON "slice"."assign_embed_input_near" USING btree ("root", "step");

CREATE INDEX "__assign_embed_output_ix_root_qha7oj27r7" ON "slice"."assign_embed_output" USING btree ("root");

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

CREATE INDEX "__chain_chain_run_finish_output_ix_root_wb6phhwc2j" ON "slice"."chain_chain_run_finish_output" USING btree ("root");

CREATE INDEX "__chain_chain_run_input_ix_root_7abe6kcg67" ON "slice"."chain_chain_run_input" USING btree ("root");

CREATE INDEX "__chain_claim_ix_root_step_ouvkclqzzd_pred_attempt_azuejmwwty" ON "slice"."chain_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__chain_done_ix_root_step_nymmh7bgnk" ON "slice"."chain_done" USING btree ("root", "step");

CREATE INDEX "__chain_ended_ix_root_e73xltety4" ON "slice"."chain_ended" USING btree ("root");

CREATE INDEX "__chain_exhausted_ix_root_fjn7tzhjc7" ON "slice"."chain_exhausted" USING btree ("root");

CREATE INDEX "__chain_failed_ix_root_step_bmwbd7vlrh" ON "slice"."chain_failed" USING btree ("root", "step");

CREATE INDEX "__chain_fenced_ix_root_mnawzvb34e" ON "slice"."chain_fenced" USING btree ("root");

CREATE INDEX "__chain_finish_ix_root_ypjcgcan7b" ON "slice"."chain_finish" USING btree ("root");

CREATE INDEX "__chain_finish_ix_scope_step_om6bljb56e" ON "slice"."chain_finish" USING btree ("scope", "step");

CREATE INDEX "__chain_held_ix_root_havzgkxex3" ON "slice"."chain_held" USING btree ("root");

CREATE INDEX "__chain_next_ix_root_from_5hhx2qutdl" ON "slice"."chain_next" USING btree ("root", "from");

CREATE INDEX "__chain_ordered_finish_output_ix_root_hrdok3djgq" ON "slice"."chain_ordered_finish_output" USING btree ("root");

CREATE INDEX "__chain_ordered_input_ix_root_wmmk2yqn4t" ON "slice"."chain_ordered_input" USING btree ("root");

CREATE INDEX "__chain_page_earlier_read_ix_root_digest_fxiecdnqw4" ON "slice"."chain_page_earlier_read" USING btree ("root", "digest");

CREATE INDEX "__chain_page_earlier_read_ix_root_step_pi6qz5bfaw" ON "slice"."chain_page_earlier_read" USING btree ("root", "step");

CREATE INDEX "__chain_page_earlier_row_ix_root_r5voiiw2rg" ON "slice"."chain_page_earlier_row" USING btree ("root");

CREATE INDEX "__chain_page_input_ix_root_step_25b4lmpnjr" ON "slice"."chain_page_input" USING btree ("root", "step");

CREATE INDEX "__chain_page_input_after_ix_root_hmbetlosxh" ON "slice"."chain_page_input_after" USING btree ("root");

CREATE INDEX "__chain_page_output_ix_root_g3alpbog4o" ON "slice"."chain_page_output" USING btree ("root");

CREATE INDEX "__chain_page_output_next_ix_root_r662e4fglp" ON "slice"."chain_page_output_next" USING btree ("root");

CREATE INDEX "__chain_page_tree_first_ix_root_gxcpd2aguo" ON "slice"."chain_page_tree_first" USING btree ("root");

CREATE INDEX "__chain_page_tree_items_ix_root_digest_eiwkcq_6_olq_6yicp4cvau" ON "slice"."chain_page_tree_items" USING btree ("root", "__digest_eiwkcq6olq", "__pred_items_3qltx5cx27");

CREATE INDEX "__chain_page_tree_items_ix_root_digest_j4l2wg2mhr" ON "slice"."chain_page_tree_items" USING btree ("root", "digest");

CREATE INDEX "__chain_page_tree_read_ix_root_digest_q3zaabcene" ON "slice"."chain_page_tree_read" USING btree ("root", "digest");

CREATE INDEX "__chain_page_tree_read_ix_root_step_eh6ehvompc" ON "slice"."chain_page_tree_read" USING btree ("root", "step");

CREATE INDEX "__chain_page_tree_row_ix_root_nik5vzvev7" ON "slice"."chain_page_tree_row" USING btree ("root");

CREATE INDEX "__chain_page_weights_read_ix_root_digest_75flfwbh4w" ON "slice"."chain_page_weights_read" USING btree ("root", "digest");

CREATE INDEX "__chain_page_weights_read_ix_root_step_qkx2asxvn7" ON "slice"."chain_page_weights_read" USING btree ("root", "step");

CREATE INDEX "__chain_page_weights_row_ix_root_tbrq2r7f3p" ON "slice"."chain_page_weights_row" USING btree ("root");

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

CREATE INDEX "__clock_admitted_ix_root_s7zcjrj5vn" ON "slice"."clock_admitted" USING btree ("root");

CREATE INDEX "__clock_chime_input_ix_root_step_ctwanc2seb" ON "slice"."clock_chime_input" USING btree ("root", "step");

CREATE INDEX "__clock_chime_output_ix_root_ivn554pu5g" ON "slice"."clock_chime_output" USING btree ("root");

CREATE INDEX "__clock_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ndcvaxclz" ON "slice"."clock_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__clock_close_input_ix_root_step_3i3uxrbbrh" ON "slice"."clock_close_input" USING btree ("root", "step");

CREATE INDEX "__clock_close_output_ix_root_56kq4rywmc" ON "slice"."clock_close_output" USING btree ("root");

CREATE INDEX "__clock_done_ix_root_step_y7b7fracbz" ON "slice"."clock_done" USING btree ("root", "step");

CREATE INDEX "__clock_ended_ix_root_brohrxygrw" ON "slice"."clock_ended" USING btree ("root");

CREATE INDEX "__clock_exhausted_ix_root_mqjwzmnkg2" ON "slice"."clock_exhausted" USING btree ("root");

CREATE INDEX "__clock_failed_ix_root_step_h2u36dbqyr" ON "slice"."clock_failed" USING btree ("root", "step");

CREATE INDEX "__clock_fenced_ix_root_os2tzc4ej6" ON "slice"."clock_fenced" USING btree ("root");

CREATE INDEX "__clock_finish_ix_root_dig34tapz4" ON "slice"."clock_finish" USING btree ("root");

CREATE INDEX "__clock_finish_ix_scope_step_q2cyoxfrgy" ON "slice"."clock_finish" USING btree ("scope", "step");

CREATE INDEX "__clock_held_ix_root_x4d2isfem4" ON "slice"."clock_held" USING btree ("root");

CREATE INDEX "__clock_hourly_finish_output_ix_root_fcxtbzly5h" ON "slice"."clock_hourly_finish_output" USING btree ("root");

CREATE INDEX "__clock_hourly_input_ix_root_nsyqbwry4l" ON "slice"."clock_hourly_input" USING btree ("root");

CREATE INDEX "__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" ON "slice"."clock_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__clock_refusal_ix_root_xdxq3ho5kd" ON "slice"."clock_refusal" USING btree ("root");

CREATE INDEX "__clock_result_ix_root_step_vo4ykwoczk" ON "slice"."clock_result" USING btree ("root", "step");

CREATE INDEX "__clock_retry_ix_root_zejdeyf4de" ON "slice"."clock_retry" USING btree ("root");

CREATE INDEX "__clock_scope_ix_root_5jnjt75iyn" ON "slice"."clock_scope" USING btree ("root");

CREATE INDEX "__clock_sitting_finish_output_ix_root_lvaxizxoa5" ON "slice"."clock_sitting_finish_output" USING btree ("root");

CREATE INDEX "__clock_sitting_input_ix_root_zwyu7ep5i3" ON "slice"."clock_sitting_input" USING btree ("root");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_root_f3tj6hnqvq" ON "slice"."clock_skipped" USING btree ("root");

CREATE INDEX "__clock_start_step_ix_root_scope_xs5a3wv234" ON "slice"."clock_start_step" USING btree ("root", "scope");

CREATE INDEX "__clock_step_ix_root_scope_xautpoatwk" ON "slice"."clock_step" USING btree ("root", "scope");

CREATE INDEX "__clock_step_ix_scope_ttvc76thdq" ON "slice"."clock_step" USING btree ("scope");

CREATE INDEX "__fan_admitted_ix_root_cjavzjrmil" ON "slice"."fan_admitted" USING btree ("root");

CREATE INDEX "__fan_batch_finish_output_ix_root_xzmsfqk7gw" ON "slice"."fan_batch_finish_output" USING btree ("root");

CREATE INDEX "__fan_batch_input_ix_root_scope_24ynzsffio" ON "slice"."fan_batch_input" USING btree ("root", "scope");

CREATE INDEX "__fan_claim_ix_root_step_ouvkclqzzd_pred_attempt_oey_kkpmouft4i" ON "slice"."fan_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__fan_done_ix_root_step_nrkfpkvyya" ON "slice"."fan_done" USING btree ("root", "step");

CREATE INDEX "__fan_dust_input_ix_root_step_3aq67uii4u" ON "slice"."fan_dust_input" USING btree ("root", "step");

CREATE INDEX "__fan_dust_output_ix_root_72ib45pvnf" ON "slice"."fan_dust_output" USING btree ("root");

CREATE INDEX "__fan_ended_ix_root_step_unjzbpnw46" ON "slice"."fan_ended" USING btree ("root", "step");

CREATE INDEX "__fan_exhausted_ix_root_2diuxfgt5s" ON "slice"."fan_exhausted" USING btree ("root");

CREATE INDEX "__fan_failed_ix_root_step_ciyeplozai" ON "slice"."fan_failed" USING btree ("root", "step");

CREATE INDEX "__fan_fan_run_finish_output_ix_root_gol6fu3ini" ON "slice"."fan_fan_run_finish_output" USING btree ("root");

CREATE INDEX "__fan_fan_run_input_ix_root_25alzzoykh" ON "slice"."fan_fan_run_input" USING btree ("root");

CREATE INDEX "__fan_fenced_ix_root_3xl5uhzvmu" ON "slice"."fan_fenced" USING btree ("root");

CREATE INDEX "__fan_finish_ix_root_i6xnvwhwty" ON "slice"."fan_finish" USING btree ("root");

CREATE INDEX "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice"."fan_finish" USING btree ("scope", "step");

CREATE INDEX "__fan_held_ix_root_step_hgpfyg562f" ON "slice"."fan_held" USING btree ("root", "step");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_hold_ix_root_ral35akxi3" ON "slice"."fan_hold" USING btree ("root");

CREATE INDEX "__fan_mop_input_ix_root_step_fyigtnzcib" ON "slice"."fan_mop_input" USING btree ("root", "step");

CREATE INDEX "__fan_mop_output_ix_root_sl77vgnqfl" ON "slice"."fan_mop_output" USING btree ("root");

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

CREATE INDEX "__fan_sweep_finish_output_ix_root_xyklupvq4l" ON "slice"."fan_sweep_finish_output" USING btree ("root");

CREATE INDEX "__fan_sweep_input_ix_root_txcp3teesu" ON "slice"."fan_sweep_input" USING btree ("root");

CREATE INDEX "__fan_within_ix_parent_kind_scope_5ywepfmzj2" ON "slice"."fan_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__fan_within_ix_root_parent_ivgq62e3yc" ON "slice"."fan_within" USING btree ("root", "parent");

CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__retry_admitted_ix_root_ewgjxicsia" ON "slice"."retry_admitted" USING btree ("root");

CREATE INDEX "__retry_brittle_input_ix_root_step_hn2bnvkmi5" ON "slice"."retry_brittle_input" USING btree ("root", "step");

CREATE INDEX "__retry_brittle_output_ix_root_zbwyfvhpop" ON "slice"."retry_brittle_output" USING btree ("root");

CREATE INDEX "__retry_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ee63gc76g" ON "slice"."retry_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__retry_done_ix_root_step_2l3rh6d5g6" ON "slice"."retry_done" USING btree ("root", "step");

CREATE INDEX "__retry_ended_ix_root_qdnd63ykxk" ON "slice"."retry_ended" USING btree ("root");

CREATE INDEX "__retry_exhausted_ix_root_zequtvgrfg" ON "slice"."retry_exhausted" USING btree ("root");

CREATE INDEX "__retry_failed_ix_root_step_7objnilm6u" ON "slice"."retry_failed" USING btree ("root", "step");

CREATE INDEX "__retry_fenced_ix_root_4x3i3cxxnz" ON "slice"."retry_fenced" USING btree ("root");

CREATE INDEX "__retry_finish_ix_root_sr33zcrg2m" ON "slice"."retry_finish" USING btree ("root");

CREATE INDEX "__retry_finish_ix_scope_step_6tswescc6v" ON "slice"."retry_finish" USING btree ("scope", "step");

CREATE INDEX "__retry_held_ix_root_ytwhkhubpt" ON "slice"."retry_held" USING btree ("root");

CREATE INDEX "__retry_ladders_finish_output_ix_root_trnh6kkzim" ON "slice"."retry_ladders_finish_output" USING btree ("root");

CREATE INDEX "__retry_ladders_input_ix_root_co4bnpgzm5" ON "slice"."retry_ladders_input" USING btree ("root");

CREATE INDEX "__retry_patient_input_ix_root_step_ghlof24jma" ON "slice"."retry_patient_input" USING btree ("root", "step");

CREATE INDEX "__retry_patient_output_ix_root_zxxckjnki6" ON "slice"."retry_patient_output" USING btree ("root");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_polite_input_ix_root_step_begldsasuy" ON "slice"."retry_polite_input" USING btree ("root", "step");

CREATE INDEX "__retry_polite_output_ix_root_x5djpoz7ix" ON "slice"."retry_polite_output" USING btree ("root");

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

CREATE INDEX "__retry_throttled_finish_output_ix_root_tjndqsonfa" ON "slice"."retry_throttled_finish_output" USING btree ("root");

CREATE INDEX "__retry_throttled_input_ix_root_jl6ezw6jux" ON "slice"."retry_throttled_input" USING btree ("root");

CREATE INDEX "__retry_unhurried_finish_output_ix_root_32l3jvurao" ON "slice"."retry_unhurried_finish_output" USING btree ("root");

CREATE INDEX "__retry_unhurried_input_ix_root_fuypwcangl" ON "slice"."retry_unhurried_input" USING btree ("root");

CREATE INDEX "__review_admitted_ix_root_yaphj2wqrq" ON "slice"."review_admitted" USING btree ("root");

CREATE INDEX "__review_analyze_input_ix_root_step_bdsim6bffp" ON "slice"."review_analyze_input" USING btree ("root", "step");

CREATE INDEX "__review_analyze_output_ix_root_txmlnhynqs" ON "slice"."review_analyze_output" USING btree ("root");

CREATE INDEX "__review_claim_ix_root_step_ouvkclqzzd_pred_attempt_y5c5zv3vi7" ON "slice"."review_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__review_done_ix_root_step_wex3643ujb" ON "slice"."review_done" USING btree ("root", "step");

CREATE INDEX "__review_ended_ix_root_step_7lrp7igbee" ON "slice"."review_ended" USING btree ("root", "step");

CREATE INDEX "__review_exhausted_ix_root_a6onvxywcp" ON "slice"."review_exhausted" USING btree ("root");

CREATE INDEX "__review_failed_ix_root_step_cegc4opyjz" ON "slice"."review_failed" USING btree ("root", "step");

CREATE INDEX "__review_fenced_ix_root_hfika5dgn2" ON "slice"."review_fenced" USING btree ("root");

CREATE INDEX "__review_finish_ix_root_vnnzpwlvrw" ON "slice"."review_finish" USING btree ("root");

CREATE INDEX "__review_finish_ix_scope_step_4k6s2nqgyy" ON "slice"."review_finish" USING btree ("scope", "step");

CREATE INDEX "__review_gather_input_ix_review_f2zafhsmtj" ON "slice"."review_gather_input" USING btree ("review");

CREATE INDEX "__review_gather_input_ix_root_step_wsoyzlnuyr" ON "slice"."review_gather_input" USING btree ("root", "step");

CREATE INDEX "__review_gather_input_sizes_ix_root_step_mjpuijzth_4_kjg5fulkoq" ON "slice"."review_gather_input_sizes" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_gather_input_sizes_ix_root_step_dargnvbdje" ON "slice"."review_gather_input_sizes" USING btree ("root", "step");

CREATE INDEX "__review_gather_output_ix_root_5h75f2sreb" ON "slice"."review_gather_output" USING btree ("root");

CREATE INDEX "__review_held_ix_root_step_2vt6xmsrfi" ON "slice"."review_held" USING btree ("root", "step");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_hold_ix_root_escg5zeez6" ON "slice"."review_hold" USING btree ("root");

CREATE INDEX "__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" ON "slice"."review_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__review_questions_finish_output_ix_root_4nx3bn5p6q" ON "slice"."review_questions_finish_output" USING btree ("root");

CREATE INDEX "__review_questions_input_ix_root_scope_sy2ibbggdo" ON "slice"."review_questions_input" USING btree ("root", "scope");

CREATE INDEX "__review_refusal_ix_root_mlhjigotld" ON "slice"."review_refusal" USING btree ("root");

CREATE INDEX "__review_result_ix_root_step_h2vlej63gu" ON "slice"."review_result" USING btree ("root", "step");

CREATE INDEX "__review_result_ix_step_outcome_root_lbrp6nyb6i" ON "slice"."review_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__review_retry_ix_root_jzaljr6st4" ON "slice"."review_retry" USING btree ("root");

CREATE INDEX "__review_review_run_finish_output_ix_root_qafu34k5sc" ON "slice"."review_review_run_finish_output" USING btree ("root");

CREATE INDEX "__review_review_run_input_ix_root_abc3mheba4" ON "slice"."review_review_run_input" USING btree ("root");

CREATE INDEX "__review_review_run_input_sizes_ix_root_scope_u_6_4kpsy5wss6" ON "slice"."review_review_run_input_sizes" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_review_run_input_sizes_ix_root_scope_2dnx7skohl" ON "slice"."review_review_run_input_sizes" USING btree ("root", "scope");

CREATE INDEX "__review_save_input_ix_root_step_xd5keujf45" ON "slice"."review_save_input" USING btree ("root", "step");

CREATE INDEX "__review_save_output_ix_root_kjgtclpf33" ON "slice"."review_save_output" USING btree ("root");

CREATE INDEX "__review_saved_ix_root_from_v3hbuyomqf" ON "slice"."review_saved" USING btree ("root", "from");

CREATE INDEX "__review_scope_ix_root_riuyuqzrup" ON "slice"."review_scope" USING btree ("root");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_root_qms5trih4o" ON "slice"."review_skipped" USING btree ("root");

CREATE INDEX "__review_split_ix_root_from_p42z7fr7z4" ON "slice"."review_split" USING btree ("root", "from");

CREATE INDEX "__review_start_scope_ix_root_scope_nki37x7g5o" ON "slice"."review_start_scope" USING btree ("root", "scope");

CREATE INDEX "__review_start_step_ix_root_scope_hmuyhclidm" ON "slice"."review_start_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_root_scope_jvmzqg2kjy" ON "slice"."review_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_scope_kind_step_udhxex4i5c" ON "slice"."review_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__review_within_ix_parent_kind_scope_dtilr5xomp" ON "slice"."review_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__review_within_ix_root_parent_ah77vqo2bx" ON "slice"."review_within" USING btree ("root", "parent");

CREATE INDEX "__sync_admitted_ix_root_vormyuqk5x" ON "slice"."sync_admitted" USING btree ("root");

CREATE INDEX "__sync_build_input_ix_root_step_azxcsmj373" ON "slice"."sync_build_input" USING btree ("root", "step");

CREATE INDEX "__sync_build_output_ix_root_amskeycb7k" ON "slice"."sync_build_output" USING btree ("root");

CREATE INDEX "__sync_claim_ix_root_step_ouvkclqzzd_pred_attempt_f3q5xsae3q" ON "slice"."sync_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

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

CREATE INDEX "__sync_gold_finish_output_ix_root_gqwdl72ukv" ON "slice"."sync_gold_finish_output" USING btree ("root");

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

CREATE INDEX "__sync_sync_run_finish_output_ix_root_7lxs3t6qrm" ON "slice"."sync_sync_run_finish_output" USING btree ("root");

CREATE INDEX "__sync_sync_run_input_ix_root_bp43cbf2uj" ON "slice"."sync_sync_run_input" USING btree ("root");

CREATE INDEX "__writeback_admitted_ix_root_h3gyzivmzl" ON "slice"."writeback_admitted" USING btree ("root");

CREATE INDEX "__writeback_claim_ix_root_step_ouvkclqzzd_pred_vsh4c26q54" ON "slice"."writeback_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__writeback_deliver_input_ix_root_step_42hexztzwm" ON "slice"."writeback_deliver_input" USING btree ("root", "step");

CREATE INDEX "__writeback_deliver_output_ix_root_65uep5rbzs" ON "slice"."writeback_deliver_output" USING btree ("root");

CREATE INDEX "__writeback_done_ix_root_step_dxzcxsyzki" ON "slice"."writeback_done" USING btree ("root", "step");

CREATE INDEX "__writeback_ended_ix_root_22eyuup6mt" ON "slice"."writeback_ended" USING btree ("root");

CREATE INDEX "__writeback_exhausted_ix_root_cvj7pxcezh" ON "slice"."writeback_exhausted" USING btree ("root");

CREATE INDEX "__writeback_failed_ix_root_step_r27jysgea6" ON "slice"."writeback_failed" USING btree ("root", "step");

CREATE INDEX "__writeback_fenced_ix_root_jynr6i3m3n" ON "slice"."writeback_fenced" USING btree ("root");

CREATE INDEX "__writeback_finish_ix_root_7jp3nmlcxk" ON "slice"."writeback_finish" USING btree ("root");

CREATE INDEX "__writeback_finish_ix_scope_step_6ooh2ahmws" ON "slice"."writeback_finish" USING btree ("scope", "step");

CREATE INDEX "__writeback_held_ix_root_htj435svmc" ON "slice"."writeback_held" USING btree ("root");

CREATE INDEX "__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" ON "slice"."writeback_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__writeback_refusal_ix_root_rpqfuncax3" ON "slice"."writeback_refusal" USING btree ("root");

CREATE INDEX "__writeback_result_ix_root_step_m7c5flfb7z" ON "slice"."writeback_result" USING btree ("root", "step");

CREATE INDEX "__writeback_retry_ix_root_jksgr5toee" ON "slice"."writeback_retry" USING btree ("root");

CREATE INDEX "__writeback_scope_ix_root_kaxydmiokb" ON "slice"."writeback_scope" USING btree ("root");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_root_ss2ptzee7p" ON "slice"."writeback_skipped" USING btree ("root");

CREATE INDEX "__writeback_start_step_ix_root_scope_azon5ljjqq" ON "slice"."writeback_start_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_step_ix_root_scope_oebhktgfcr" ON "slice"."writeback_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_step_ix_scope_smnbmwitav" ON "slice"."writeback_step" USING btree ("scope");

CREATE INDEX "__writeback_writeback_finish_output_ix_root_4g3n3nyiax" ON "slice"."writeback_writeback_finish_output" USING btree ("root");

CREATE INDEX "__writeback_writeback_input_ix_root_fhpchifc4b" ON "slice"."writeback_writeback_input" USING btree ("root");

CREATE STATISTICS "slice"."__assign_finish_stats_scope_step_ld6jyxztu6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."assign_finish";

CREATE STATISTICS "slice"."__assign_step_stats_kind_scope_wiztsdmmtf" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."assign_step";

CREATE STATISTICS "slice"."__chain_finish_stats_scope_step_z7lvm6j2l6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."chain_finish";

CREATE STATISTICS "slice"."__chain_step_stats_kind_scope_tc5nmidpxu" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."chain_step";

CREATE STATISTICS "slice"."__clock_finish_stats_scope_step_ejqaucw3q4" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."clock_finish";

CREATE STATISTICS "slice"."__fan_finish_stats_scope_step_4mm4p6zm66" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."fan_finish";

CREATE STATISTICS "slice"."__fan_step_stats_kind_scope_xmuvugpu6n" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."fan_step";

CREATE STATISTICS "slice"."__fan_within_stats_kind_parent_3vvpgco4da" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice"."fan_within";

CREATE STATISTICS "slice"."__retry_finish_stats_scope_step_2nxi4d7tdj" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."retry_finish";

CREATE STATISTICS "slice"."__retry_step_stats_kind_scope_osnqmvpfhd" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."retry_step";

CREATE STATISTICS "slice"."__review_finish_stats_scope_step_ac6ft3yr6e" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."review_finish";

CREATE STATISTICS "slice"."__review_step_stats_kind_scope_kgaij4jpus" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice"."review_step";

CREATE STATISTICS "slice"."__review_within_stats_kind_parent_w3ajh3gekc" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice"."review_within";

CREATE STATISTICS "slice"."__sync_exclusive_stats_key_kind_smed76p3zh" (ndistinct, dependencies, mcv) ON "key", "kind" FROM "slice"."sync_exclusive";

CREATE STATISTICS "slice"."__sync_finish_stats_scope_step_xiaq6np7mf" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."sync_finish";

CREATE STATISTICS "slice"."__writeback_finish_stats_scope_step_3knpjnabow" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice"."writeback_finish";
