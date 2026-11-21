CREATE INDEX "__passage_ix_topic_lzh6djzwn4" ON "slice"."passage" USING btree ("topic");

CREATE INDEX "__passage_ix_embedding_ujugi77ft2" ON "slice"."passage" USING hnsw ("embedding" "vector_ext"."vector_cosine_ops");

CREATE INDEX "__assign_admitted_ix_root_pot3vpqjrt" ON "slice_den"."assign_admitted" USING btree ("root");

CREATE INDEX "__assign_asked_ix_root_from_tqt7dg3fxl" ON "slice_den"."assign_asked" USING btree ("root", "from");

CREATE INDEX "__assign_assignment_finish_output_ix_root_t2nmfubzxm" ON "slice_den"."assign_assignment_finish_output" USING btree ("root");

CREATE INDEX "__assign_assignment_input_ix_root_scope_ndn57wfv5p" ON "slice_den"."assign_assignment_input" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_exclude_ix_root_scope_u_6_7ph7zpbtp2" ON "slice_den"."assign_assignment_input_exclude" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" ON "slice_den"."assign_assignment_input_exclude" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_nearest_ix_root_scope_2jryb7pj2a" ON "slice_den"."assign_assignment_input_mode_nearest" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_mode_within_ix_root_scope_yleeo72liv" ON "slice_den"."assign_assignment_input_mode_within" USING btree ("root", "scope");

CREATE INDEX "__assign_assignment_input_near_ix_root_scope_u_6_eoy4ujrqzz" ON "slice_den"."assign_assignment_input_near" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_assignment_input_near_ix_root_scope_gswnizhczo" ON "slice_den"."assign_assignment_input_near" USING btree ("root", "scope");

CREATE INDEX "__assign_claim_ix_root_step_ouvkclqzzd_pred_attempt_wrkk7rllts" ON "slice_den"."assign_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__assign_decide_input_ix_root_step_erwflqvcsk" ON "slice_den"."assign_decide_input" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_exclude_ix_root_step_mjpuijzth_26rzz2ekud" ON "slice_den"."assign_decide_input_exclude" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" ON "slice_den"."assign_decide_input_exclude" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_nearest_ix_root_step_v54e6no7cj" ON "slice_den"."assign_decide_input_mode_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_input_mode_within_ix_root_step_trlkcqxcfp" ON "slice_den"."assign_decide_input_mode_within" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_ix_root_step_uxq3vbvjoa" ON "slice_den"."assign_decide_output" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_rest_ix_root_step_hkqbk442cr" ON "slice_den"."assign_decide_output_stage_rest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_stage_serve_ix_root_step_65h35vi6kz" ON "slice_den"."assign_decide_output_stage_serve" USING btree ("root", "step");

CREATE INDEX "__assign_decide_output_weighed_ix_root_step_5pk2o2aayf" ON "slice_den"."assign_decide_output_weighed" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_decide_output_weighed_ix_root_step_gncwdipl43" ON "slice_den"."assign_decide_output_weighed" USING btree ("root", "step");

CREATE INDEX "__assign_decide_read_nearest_ix_root_digest_lyw5vgtwuc" ON "slice_den"."assign_decide_read_nearest" USING btree ("root", "digest");

CREATE INDEX "__assign_decide_read_nearest_ix_root_step_6br7o7z6sz" ON "slice_den"."assign_decide_read_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_decide_read_nearest_row_ix_root_bgnf4xd3lb" ON "slice_den"."assign_decide_read_nearest_row" USING btree ("root");

CREATE INDEX "__assign_decide_read_seen_ix_root_digest_f7oxnddmn4" ON "slice_den"."assign_decide_read_seen" USING btree ("root", "digest");

CREATE INDEX "__assign_decide_read_seen_ix_root_step_d6mfz7qi6f" ON "slice_den"."assign_decide_read_seen" USING btree ("root", "step");

CREATE INDEX "__assign_decide_read_seen_row_ix_root_wt2vstqtp7" ON "slice_den"."assign_decide_read_seen_row" USING btree ("root");

CREATE INDEX "__assign_done_ix_root_step_edz2spjbbn" ON "slice_den"."assign_done" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_ix_root_step_5ltjxo25vr" ON "slice_den"."assign_embed_input" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_exclude_ix_root_step_mjpuijzth_7bmkgreoup" ON "slice_den"."assign_embed_input_exclude" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_exclude_ix_root_step_hkkmfupglo" ON "slice_den"."assign_embed_input_exclude" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_mode_nearest_ix_root_step_nyvoanaxpc" ON "slice_den"."assign_embed_input_mode_nearest" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_mode_within_ix_root_step_jaqihe4eqt" ON "slice_den"."assign_embed_input_mode_within" USING btree ("root", "step");

CREATE INDEX "__assign_embed_input_near_ix_root_step_mjpuijzth_4_p67hugda6z" ON "slice_den"."assign_embed_input_near" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__assign_embed_input_near_ix_root_step_lkjh7aey4z" ON "slice_den"."assign_embed_input_near" USING btree ("root", "step");

CREATE INDEX "__assign_embed_output_ix_root_qha7oj27r7" ON "slice_den"."assign_embed_output" USING btree ("root");

CREATE INDEX "__assign_ended_ix_root_dw6oimqu3h" ON "slice_den"."assign_ended" USING btree ("root");

CREATE INDEX "__assign_exhausted_ix_root_gsga5kdkq3" ON "slice_den"."assign_exhausted" USING btree ("root");

CREATE INDEX "__assign_failed_ix_root_step_i7nxwkjb5e" ON "slice_den"."assign_failed" USING btree ("root", "step");

CREATE INDEX "__assign_fenced_ix_root_jvlqbasn7e" ON "slice_den"."assign_fenced" USING btree ("root");

CREATE INDEX "__assign_finish_ix_root_ilehlpwnxm" ON "slice_den"."assign_finish" USING btree ("root");

CREATE INDEX "__assign_finish_ix_scope_step_53o4eorqpr" ON "slice_den"."assign_finish" USING btree ("scope", "step");

CREATE INDEX "__assign_held_ix_root_35l4gc35rc" ON "slice_den"."assign_held" USING btree ("root");

CREATE INDEX "__assign_paused_ix_target_pred_turn_qryngij_6_c_4_u3nbuiteko" ON "slice_den"."assign_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__assign_refusal_ix_root_qadi23h44a" ON "slice_den"."assign_refusal" USING btree ("root");

CREATE INDEX "__assign_result_ix_root_step_yuug5el3pq" ON "slice_den"."assign_result" USING btree ("root", "step");

CREATE INDEX "__assign_result_ix_step_outcome_root_35vmqe5lxj" ON "slice_den"."assign_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__assign_retry_ix_root_oaojw2snch" ON "slice_den"."assign_retry" USING btree ("root");

CREATE INDEX "__assign_scope_ix_root_v6jmsbgzsq" ON "slice_den"."assign_scope" USING btree ("root");

CREATE INDEX "__assign_skipped_ix_by_phe5rdziqg" ON "slice_den"."assign_skipped" USING btree ("by");

CREATE INDEX "__assign_skipped_ix_root_dzieud2d67" ON "slice_den"."assign_skipped" USING btree ("root");

CREATE INDEX "__assign_start_step_ix_root_scope_j5eqvalej3" ON "slice_den"."assign_start_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_root_scope_64vujnvoiu" ON "slice_den"."assign_step" USING btree ("root", "scope");

CREATE INDEX "__assign_step_ix_scope_kind_step_xn2zxx73po" ON "slice_den"."assign_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_admitted_ix_root_3xhdqkpeqw" ON "slice_den"."chain_admitted" USING btree ("root");

CREATE INDEX "__chain_chain_run_finish_output_ix_root_wb6phhwc2j" ON "slice_den"."chain_chain_run_finish_output" USING btree ("root");

CREATE INDEX "__chain_chain_run_input_ix_root_7abe6kcg67" ON "slice_den"."chain_chain_run_input" USING btree ("root");

CREATE INDEX "__chain_claim_ix_root_step_ouvkclqzzd_pred_attempt_azuejmwwty" ON "slice_den"."chain_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__chain_done_ix_root_step_nymmh7bgnk" ON "slice_den"."chain_done" USING btree ("root", "step");

CREATE INDEX "__chain_ended_ix_root_e73xltety4" ON "slice_den"."chain_ended" USING btree ("root");

CREATE INDEX "__chain_exhausted_ix_root_fjn7tzhjc7" ON "slice_den"."chain_exhausted" USING btree ("root");

CREATE INDEX "__chain_failed_ix_root_step_bmwbd7vlrh" ON "slice_den"."chain_failed" USING btree ("root", "step");

CREATE INDEX "__chain_fenced_ix_root_mnawzvb34e" ON "slice_den"."chain_fenced" USING btree ("root");

CREATE INDEX "__chain_finish_ix_root_ypjcgcan7b" ON "slice_den"."chain_finish" USING btree ("root");

CREATE INDEX "__chain_finish_ix_scope_step_om6bljb56e" ON "slice_den"."chain_finish" USING btree ("scope", "step");

CREATE INDEX "__chain_held_ix_root_havzgkxex3" ON "slice_den"."chain_held" USING btree ("root");

CREATE INDEX "__chain_next_ix_root_from_5hhx2qutdl" ON "slice_den"."chain_next" USING btree ("root", "from");

CREATE INDEX "__chain_ordered_finish_output_ix_root_hrdok3djgq" ON "slice_den"."chain_ordered_finish_output" USING btree ("root");

CREATE INDEX "__chain_ordered_input_ix_root_wmmk2yqn4t" ON "slice_den"."chain_ordered_input" USING btree ("root");

CREATE INDEX "__chain_page_input_ix_root_step_25b4lmpnjr" ON "slice_den"."chain_page_input" USING btree ("root", "step");

CREATE INDEX "__chain_page_input_after_ix_root_hmbetlosxh" ON "slice_den"."chain_page_input_after" USING btree ("root");

CREATE INDEX "__chain_page_output_ix_root_g3alpbog4o" ON "slice_den"."chain_page_output" USING btree ("root");

CREATE INDEX "__chain_page_output_next_ix_root_r662e4fglp" ON "slice_den"."chain_page_output_next" USING btree ("root");

CREATE INDEX "__chain_page_read_earlier_ix_root_digest_gojfmd3bma" ON "slice_den"."chain_page_read_earlier" USING btree ("root", "digest");

CREATE INDEX "__chain_page_read_earlier_ix_root_step_x3sjcqoydn" ON "slice_den"."chain_page_read_earlier" USING btree ("root", "step");

CREATE INDEX "__chain_page_read_earlier_row_ix_root_32kkfs3j5x" ON "slice_den"."chain_page_read_earlier_row" USING btree ("root");

CREATE INDEX "__chain_page_read_tree_ix_root_digest_mcyjtam44d" ON "slice_den"."chain_page_read_tree" USING btree ("root", "digest");

CREATE INDEX "__chain_page_read_tree_ix_root_step_dahkztzxnh" ON "slice_den"."chain_page_read_tree" USING btree ("root", "step");

CREATE INDEX "__chain_page_read_tree_first_ix_root_hlrd2ekev5" ON "slice_den"."chain_page_read_tree_first" USING btree ("root");

CREATE INDEX "__chain_page_read_tree_items_ix_root_d6klicrgbz" ON "slice_den"."chain_page_read_tree_items" USING btree ("root");

CREATE INDEX "__chain_page_read_tree_row_ix_root_b6oxxqmide" ON "slice_den"."chain_page_read_tree_row" USING btree ("root");

CREATE INDEX "__chain_page_read_weights_ix_root_digest_3wano4wdsf" ON "slice_den"."chain_page_read_weights" USING btree ("root", "digest");

CREATE INDEX "__chain_page_read_weights_ix_root_step_ukdzwgkuna" ON "slice_den"."chain_page_read_weights" USING btree ("root", "step");

CREATE INDEX "__chain_page_read_weights_row_ix_root_7eqsjiaue7" ON "slice_den"."chain_page_read_weights_row" USING btree ("root");

CREATE INDEX "__chain_paused_ix_target_pred_turn_qryngij_6_c_4_azkairtri3" ON "slice_den"."chain_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__chain_refusal_ix_root_t2ancje4qy" ON "slice_den"."chain_refusal" USING btree ("root");

CREATE INDEX "__chain_result_ix_root_step_32kpfjvum5" ON "slice_den"."chain_result" USING btree ("root", "step");

CREATE INDEX "__chain_result_ix_step_outcome_root_ipaxj3wl7z" ON "slice_den"."chain_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__chain_retry_ix_root_nhtemmz6f2" ON "slice_den"."chain_retry" USING btree ("root");

CREATE INDEX "__chain_scope_ix_root_idrabjw6oz" ON "slice_den"."chain_scope" USING btree ("root");

CREATE INDEX "__chain_skipped_ix_by_2c45vyfwzy" ON "slice_den"."chain_skipped" USING btree ("by");

CREATE INDEX "__chain_skipped_ix_root_4knz5mxvl4" ON "slice_den"."chain_skipped" USING btree ("root");

CREATE INDEX "__chain_start_step_ix_root_scope_76rv5icpsa" ON "slice_den"."chain_start_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_root_scope_srrhrbyetn" ON "slice_den"."chain_step" USING btree ("root", "scope");

CREATE INDEX "__chain_step_ix_scope_kind_step_tsdjtgaey5" ON "slice_den"."chain_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__chain_step_ix_step_kind_root_2pdoze4bhr" ON "slice_den"."chain_step" USING btree ("step", "kind", "root");

CREATE INDEX "__clock_admitted_ix_root_s7zcjrj5vn" ON "slice_den"."clock_admitted" USING btree ("root");

CREATE INDEX "__clock_chime_input_ix_root_step_ctwanc2seb" ON "slice_den"."clock_chime_input" USING btree ("root", "step");

CREATE INDEX "__clock_chime_output_ix_root_ivn554pu5g" ON "slice_den"."clock_chime_output" USING btree ("root");

CREATE INDEX "__clock_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ndcvaxclz" ON "slice_den"."clock_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__clock_close_input_ix_root_step_3i3uxrbbrh" ON "slice_den"."clock_close_input" USING btree ("root", "step");

CREATE INDEX "__clock_close_output_ix_root_56kq4rywmc" ON "slice_den"."clock_close_output" USING btree ("root");

CREATE INDEX "__clock_done_ix_root_step_y7b7fracbz" ON "slice_den"."clock_done" USING btree ("root", "step");

CREATE INDEX "__clock_ended_ix_root_brohrxygrw" ON "slice_den"."clock_ended" USING btree ("root");

CREATE INDEX "__clock_exhausted_ix_root_mqjwzmnkg2" ON "slice_den"."clock_exhausted" USING btree ("root");

CREATE INDEX "__clock_failed_ix_root_step_h2u36dbqyr" ON "slice_den"."clock_failed" USING btree ("root", "step");

CREATE INDEX "__clock_fenced_ix_root_os2tzc4ej6" ON "slice_den"."clock_fenced" USING btree ("root");

CREATE INDEX "__clock_finish_ix_root_dig34tapz4" ON "slice_den"."clock_finish" USING btree ("root");

CREATE INDEX "__clock_finish_ix_scope_step_q2cyoxfrgy" ON "slice_den"."clock_finish" USING btree ("scope", "step");

CREATE INDEX "__clock_held_ix_root_x4d2isfem4" ON "slice_den"."clock_held" USING btree ("root");

CREATE INDEX "__clock_hourly_finish_output_ix_root_fcxtbzly5h" ON "slice_den"."clock_hourly_finish_output" USING btree ("root");

CREATE INDEX "__clock_hourly_input_ix_root_nsyqbwry4l" ON "slice_den"."clock_hourly_input" USING btree ("root");

CREATE INDEX "__clock_paused_ix_target_pred_turn_qryngij_6_c_4_la4ocjtto2" ON "slice_den"."clock_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__clock_refusal_ix_root_xdxq3ho5kd" ON "slice_den"."clock_refusal" USING btree ("root");

CREATE INDEX "__clock_result_ix_root_step_vo4ykwoczk" ON "slice_den"."clock_result" USING btree ("root", "step");

CREATE INDEX "__clock_retry_ix_root_zejdeyf4de" ON "slice_den"."clock_retry" USING btree ("root");

CREATE INDEX "__clock_scope_ix_root_5jnjt75iyn" ON "slice_den"."clock_scope" USING btree ("root");

CREATE INDEX "__clock_sitting_finish_output_ix_root_lvaxizxoa5" ON "slice_den"."clock_sitting_finish_output" USING btree ("root");

CREATE INDEX "__clock_sitting_input_ix_root_zwyu7ep5i3" ON "slice_den"."clock_sitting_input" USING btree ("root");

CREATE INDEX "__clock_skipped_ix_by_252vuphujb" ON "slice_den"."clock_skipped" USING btree ("by");

CREATE INDEX "__clock_skipped_ix_root_f3tj6hnqvq" ON "slice_den"."clock_skipped" USING btree ("root");

CREATE INDEX "__clock_start_step_ix_root_scope_xs5a3wv234" ON "slice_den"."clock_start_step" USING btree ("root", "scope");

CREATE INDEX "__clock_step_ix_root_scope_xautpoatwk" ON "slice_den"."clock_step" USING btree ("root", "scope");

CREATE INDEX "__clock_step_ix_scope_ttvc76thdq" ON "slice_den"."clock_step" USING btree ("scope");

CREATE INDEX "__fan_admitted_ix_root_cjavzjrmil" ON "slice_den"."fan_admitted" USING btree ("root");

CREATE INDEX "__fan_batch_finish_output_ix_root_xzmsfqk7gw" ON "slice_den"."fan_batch_finish_output" USING btree ("root");

CREATE INDEX "__fan_batch_input_ix_root_scope_24ynzsffio" ON "slice_den"."fan_batch_input" USING btree ("root", "scope");

CREATE INDEX "__fan_claim_ix_root_step_ouvkclqzzd_pred_attempt_oey_kkpmouft4i" ON "slice_den"."fan_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__fan_done_ix_root_step_nrkfpkvyya" ON "slice_den"."fan_done" USING btree ("root", "step");

CREATE INDEX "__fan_dust_input_ix_root_step_3aq67uii4u" ON "slice_den"."fan_dust_input" USING btree ("root", "step");

CREATE INDEX "__fan_dust_output_ix_root_72ib45pvnf" ON "slice_den"."fan_dust_output" USING btree ("root");

CREATE INDEX "__fan_ended_ix_root_step_unjzbpnw46" ON "slice_den"."fan_ended" USING btree ("root", "step");

CREATE INDEX "__fan_exhausted_ix_root_2diuxfgt5s" ON "slice_den"."fan_exhausted" USING btree ("root");

CREATE INDEX "__fan_failed_ix_root_step_ciyeplozai" ON "slice_den"."fan_failed" USING btree ("root", "step");

CREATE INDEX "__fan_fan_run_finish_output_ix_root_gol6fu3ini" ON "slice_den"."fan_fan_run_finish_output" USING btree ("root");

CREATE INDEX "__fan_fan_run_input_ix_root_25alzzoykh" ON "slice_den"."fan_fan_run_input" USING btree ("root");

CREATE INDEX "__fan_fenced_ix_root_3xl5uhzvmu" ON "slice_den"."fan_fenced" USING btree ("root");

CREATE INDEX "__fan_finish_ix_root_i6xnvwhwty" ON "slice_den"."fan_finish" USING btree ("root");

CREATE INDEX "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice_den"."fan_finish" USING btree ("scope", "step");

CREATE INDEX "__fan_held_ix_root_step_hgpfyg562f" ON "slice_den"."fan_held" USING btree ("root", "step");

CREATE INDEX "__fan_hold_ix_resource_seat_s7bnw22355" ON "slice_den"."fan_hold" USING btree ("resource", "seat");

CREATE INDEX "__fan_hold_ix_root_ral35akxi3" ON "slice_den"."fan_hold" USING btree ("root");

CREATE INDEX "__fan_mop_input_ix_root_step_fyigtnzcib" ON "slice_den"."fan_mop_input" USING btree ("root", "step");

CREATE INDEX "__fan_mop_output_ix_root_sl77vgnqfl" ON "slice_den"."fan_mop_output" USING btree ("root");

CREATE INDEX "__fan_paused_ix_target_pred_turn_qryngij_6_c_4_526conssyj" ON "slice_den"."fan_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__fan_refusal_ix_root_s5ydavkzd3" ON "slice_den"."fan_refusal" USING btree ("root");

CREATE INDEX "__fan_result_ix_root_step_zpvuqrugvb" ON "slice_den"."fan_result" USING btree ("root", "step");

CREATE INDEX "__fan_result_ix_step_outcome_root_udaij7stvj" ON "slice_den"."fan_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__fan_retry_ix_root_sirifasnll" ON "slice_den"."fan_retry" USING btree ("root");

CREATE INDEX "__fan_scope_ix_root_a5wtvynqul" ON "slice_den"."fan_scope" USING btree ("root");

CREATE INDEX "__fan_skipped_ix_by_3aejofkhor" ON "slice_den"."fan_skipped" USING btree ("by");

CREATE INDEX "__fan_skipped_ix_root_7ktlrax2wh" ON "slice_den"."fan_skipped" USING btree ("root");

CREATE INDEX "__fan_square_input_ix_root_step_dhgolhjnxl" ON "slice_den"."fan_square_input" USING btree ("root", "step");

CREATE INDEX "__fan_square_output_ix_root_vc5qn45ria" ON "slice_den"."fan_square_output" USING btree ("root");

CREATE INDEX "__fan_start_scope_ix_root_scope_t5ybmxw7ah" ON "slice_den"."fan_start_scope" USING btree ("root", "scope");

CREATE INDEX "__fan_start_step_ix_root_scope_vn7amkfoey" ON "slice_den"."fan_start_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_root_scope_aw525h7gua" ON "slice_den"."fan_step" USING btree ("root", "scope");

CREATE INDEX "__fan_step_ix_scope_kind_step_5arz2gb4sb" ON "slice_den"."fan_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__fan_sweep_finish_output_ix_root_xyklupvq4l" ON "slice_den"."fan_sweep_finish_output" USING btree ("root");

CREATE INDEX "__fan_sweep_input_ix_root_txcp3teesu" ON "slice_den"."fan_sweep_input" USING btree ("root");

CREATE INDEX "__fan_within_ix_parent_kind_scope_5ywepfmzj2" ON "slice_den"."fan_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__fan_within_ix_root_parent_ivgq62e3yc" ON "slice_den"."fan_within" USING btree ("root", "parent");

CREATE INDEX "__retry_admitted_ix_root_ewgjxicsia" ON "slice_den"."retry_admitted" USING btree ("root");

CREATE INDEX "__retry_brittle_input_ix_root_step_hn2bnvkmi5" ON "slice_den"."retry_brittle_input" USING btree ("root", "step");

CREATE INDEX "__retry_brittle_output_ix_root_zbwyfvhpop" ON "slice_den"."retry_brittle_output" USING btree ("root");

CREATE INDEX "__retry_claim_ix_root_step_ouvkclqzzd_pred_attempt_4ee63gc76g" ON "slice_den"."retry_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__retry_done_ix_root_step_2l3rh6d5g6" ON "slice_den"."retry_done" USING btree ("root", "step");

CREATE INDEX "__retry_ended_ix_root_qdnd63ykxk" ON "slice_den"."retry_ended" USING btree ("root");

CREATE INDEX "__retry_exhausted_ix_root_zequtvgrfg" ON "slice_den"."retry_exhausted" USING btree ("root");

CREATE INDEX "__retry_failed_ix_root_step_7objnilm6u" ON "slice_den"."retry_failed" USING btree ("root", "step");

CREATE INDEX "__retry_fenced_ix_root_4x3i3cxxnz" ON "slice_den"."retry_fenced" USING btree ("root");

CREATE INDEX "__retry_finish_ix_root_sr33zcrg2m" ON "slice_den"."retry_finish" USING btree ("root");

CREATE INDEX "__retry_finish_ix_scope_step_6tswescc6v" ON "slice_den"."retry_finish" USING btree ("scope", "step");

CREATE INDEX "__retry_held_ix_root_ytwhkhubpt" ON "slice_den"."retry_held" USING btree ("root");

CREATE INDEX "__retry_ladders_finish_output_ix_root_trnh6kkzim" ON "slice_den"."retry_ladders_finish_output" USING btree ("root");

CREATE INDEX "__retry_ladders_input_ix_root_co4bnpgzm5" ON "slice_den"."retry_ladders_input" USING btree ("root");

CREATE INDEX "__retry_patient_input_ix_root_step_ghlof24jma" ON "slice_den"."retry_patient_input" USING btree ("root", "step");

CREATE INDEX "__retry_patient_output_ix_root_zxxckjnki6" ON "slice_den"."retry_patient_output" USING btree ("root");

CREATE INDEX "__retry_paused_ix_target_pred_turn_qryngij_6_c_4_5kkljt6kwu" ON "slice_den"."retry_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__retry_polite_input_ix_root_step_begldsasuy" ON "slice_den"."retry_polite_input" USING btree ("root", "step");

CREATE INDEX "__retry_polite_output_ix_root_x5djpoz7ix" ON "slice_den"."retry_polite_output" USING btree ("root");

CREATE INDEX "__retry_refusal_ix_root_7f4y3ykjiz" ON "slice_den"."retry_refusal" USING btree ("root");

CREATE INDEX "__retry_result_ix_root_step_n7qrlleymb" ON "slice_den"."retry_result" USING btree ("root", "step");

CREATE INDEX "__retry_result_ix_step_outcome_root_5x6caywnin" ON "slice_den"."retry_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__retry_retry_ix_root_pkjsumgznf" ON "slice_den"."retry_retry" USING btree ("root");

CREATE INDEX "__retry_scope_ix_root_7gpsngzwhs" ON "slice_den"."retry_scope" USING btree ("root");

CREATE INDEX "__retry_skipped_ix_by_s7pekf7xtg" ON "slice_den"."retry_skipped" USING btree ("by");

CREATE INDEX "__retry_skipped_ix_root_uaslhltkgy" ON "slice_den"."retry_skipped" USING btree ("root");

CREATE INDEX "__retry_start_step_ix_root_scope_f733eg3dwz" ON "slice_den"."retry_start_step" USING btree ("root", "scope");

CREATE INDEX "__retry_steadfast_input_ix_root_step_2oipswgr7i" ON "slice_den"."retry_steadfast_input" USING btree ("root", "step");

CREATE INDEX "__retry_steadfast_output_ix_root_sp7in5arxz" ON "slice_den"."retry_steadfast_output" USING btree ("root");

CREATE INDEX "__retry_step_ix_root_scope_ogbhay3han" ON "slice_den"."retry_step" USING btree ("root", "scope");

CREATE INDEX "__retry_step_ix_scope_kind_step_m6ufaqcqmk" ON "slice_den"."retry_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__retry_throttled_finish_output_ix_root_tjndqsonfa" ON "slice_den"."retry_throttled_finish_output" USING btree ("root");

CREATE INDEX "__retry_throttled_input_ix_root_jl6ezw6jux" ON "slice_den"."retry_throttled_input" USING btree ("root");

CREATE INDEX "__retry_unhurried_finish_output_ix_root_32l3jvurao" ON "slice_den"."retry_unhurried_finish_output" USING btree ("root");

CREATE INDEX "__retry_unhurried_input_ix_root_fuypwcangl" ON "slice_den"."retry_unhurried_input" USING btree ("root");

CREATE INDEX "__review_admitted_ix_root_yaphj2wqrq" ON "slice_den"."review_admitted" USING btree ("root");

CREATE INDEX "__review_analyze_input_ix_root_step_bdsim6bffp" ON "slice_den"."review_analyze_input" USING btree ("root", "step");

CREATE INDEX "__review_analyze_output_ix_root_txmlnhynqs" ON "slice_den"."review_analyze_output" USING btree ("root");

CREATE INDEX "__review_claim_ix_root_step_ouvkclqzzd_pred_attempt_y5c5zv3vi7" ON "slice_den"."review_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__review_done_ix_root_step_wex3643ujb" ON "slice_den"."review_done" USING btree ("root", "step");

CREATE INDEX "__review_ended_ix_root_step_7lrp7igbee" ON "slice_den"."review_ended" USING btree ("root", "step");

CREATE INDEX "__review_exhausted_ix_root_a6onvxywcp" ON "slice_den"."review_exhausted" USING btree ("root");

CREATE INDEX "__review_failed_ix_root_step_cegc4opyjz" ON "slice_den"."review_failed" USING btree ("root", "step");

CREATE INDEX "__review_fenced_ix_root_hfika5dgn2" ON "slice_den"."review_fenced" USING btree ("root");

CREATE INDEX "__review_finish_ix_root_vnnzpwlvrw" ON "slice_den"."review_finish" USING btree ("root");

CREATE INDEX "__review_finish_ix_scope_step_4k6s2nqgyy" ON "slice_den"."review_finish" USING btree ("scope", "step");

CREATE INDEX "__review_gather_input_ix_review_f2zafhsmtj" ON "slice_den"."review_gather_input" USING btree ("review");

CREATE INDEX "__review_gather_input_ix_root_step_wsoyzlnuyr" ON "slice_den"."review_gather_input" USING btree ("root", "step");

CREATE INDEX "__review_gather_input_sizes_ix_root_step_mjpuijzth_4_kjg5fulkoq" ON "slice_den"."review_gather_input_sizes" USING btree ("root", "__step_mjpuijzth4", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_gather_input_sizes_ix_root_step_dargnvbdje" ON "slice_den"."review_gather_input_sizes" USING btree ("root", "step");

CREATE INDEX "__review_gather_output_ix_root_5h75f2sreb" ON "slice_den"."review_gather_output" USING btree ("root");

CREATE INDEX "__review_held_ix_root_step_2vt6xmsrfi" ON "slice_den"."review_held" USING btree ("root", "step");

CREATE INDEX "__review_hold_ix_resource_seat_3p66dnxzad" ON "slice_den"."review_hold" USING btree ("resource", "seat");

CREATE INDEX "__review_hold_ix_root_escg5zeez6" ON "slice_den"."review_hold" USING btree ("root");

CREATE INDEX "__review_paused_ix_target_pred_turn_qryngij_6_c_4_sdt7yco6va" ON "slice_den"."review_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__review_questions_finish_output_ix_root_4nx3bn5p6q" ON "slice_den"."review_questions_finish_output" USING btree ("root");

CREATE INDEX "__review_questions_input_ix_root_scope_sy2ibbggdo" ON "slice_den"."review_questions_input" USING btree ("root", "scope");

CREATE INDEX "__review_refusal_ix_root_mlhjigotld" ON "slice_den"."review_refusal" USING btree ("root");

CREATE INDEX "__review_result_ix_root_step_h2vlej63gu" ON "slice_den"."review_result" USING btree ("root", "step");

CREATE INDEX "__review_result_ix_step_outcome_root_lbrp6nyb6i" ON "slice_den"."review_result" USING btree ("step", "outcome", "root");

CREATE INDEX "__review_retry_ix_root_jzaljr6st4" ON "slice_den"."review_retry" USING btree ("root");

CREATE INDEX "__review_review_run_finish_output_ix_root_qafu34k5sc" ON "slice_den"."review_review_run_finish_output" USING btree ("root");

CREATE INDEX "__review_review_run_input_ix_root_abc3mheba4" ON "slice_den"."review_review_run_input" USING btree ("root");

CREATE INDEX "__review_review_run_input_sizes_ix_root_scope_u_6_4kpsy5wss6" ON "slice_den"."review_review_run_input_sizes" USING btree ("root", "__scope_u6ypqf2r2z", "__pred_ordinal_e545zctcav");

CREATE INDEX "__review_review_run_input_sizes_ix_root_scope_2dnx7skohl" ON "slice_den"."review_review_run_input_sizes" USING btree ("root", "scope");

CREATE INDEX "__review_save_input_ix_root_step_xd5keujf45" ON "slice_den"."review_save_input" USING btree ("root", "step");

CREATE INDEX "__review_save_output_ix_root_kjgtclpf33" ON "slice_den"."review_save_output" USING btree ("root");

CREATE INDEX "__review_saved_ix_root_from_v3hbuyomqf" ON "slice_den"."review_saved" USING btree ("root", "from");

CREATE INDEX "__review_scope_ix_root_riuyuqzrup" ON "slice_den"."review_scope" USING btree ("root");

CREATE INDEX "__review_skipped_ix_by_6z5g634njq" ON "slice_den"."review_skipped" USING btree ("by");

CREATE INDEX "__review_skipped_ix_root_qms5trih4o" ON "slice_den"."review_skipped" USING btree ("root");

CREATE INDEX "__review_split_ix_root_from_p42z7fr7z4" ON "slice_den"."review_split" USING btree ("root", "from");

CREATE INDEX "__review_start_scope_ix_root_scope_nki37x7g5o" ON "slice_den"."review_start_scope" USING btree ("root", "scope");

CREATE INDEX "__review_start_step_ix_root_scope_hmuyhclidm" ON "slice_den"."review_start_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_root_scope_jvmzqg2kjy" ON "slice_den"."review_step" USING btree ("root", "scope");

CREATE INDEX "__review_step_ix_scope_kind_step_udhxex4i5c" ON "slice_den"."review_step" USING btree ("scope", "kind", "step");

CREATE INDEX "__review_within_ix_parent_kind_scope_dtilr5xomp" ON "slice_den"."review_within" USING btree ("parent", "kind", "scope");

CREATE INDEX "__review_within_ix_root_parent_ah77vqo2bx" ON "slice_den"."review_within" USING btree ("root", "parent");

CREATE INDEX "__sync_admitted_ix_root_vormyuqk5x" ON "slice_den"."sync_admitted" USING btree ("root");

CREATE INDEX "__sync_build_input_ix_root_step_azxcsmj373" ON "slice_den"."sync_build_input" USING btree ("root", "step");

CREATE INDEX "__sync_build_output_ix_root_amskeycb7k" ON "slice_den"."sync_build_output" USING btree ("root");

CREATE INDEX "__sync_claim_ix_root_step_ouvkclqzzd_pred_attempt_f3q5xsae3q" ON "slice_den"."sync_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__sync_copy_input_ix_root_step_42uulsghoj" ON "slice_den"."sync_copy_input" USING btree ("root", "step");

CREATE INDEX "__sync_copy_output_ix_root_k6ia72urcq" ON "slice_den"."sync_copy_output" USING btree ("root");

CREATE INDEX "__sync_done_ix_root_step_ionbtp5et7" ON "slice_den"."sync_done" USING btree ("root", "step");

CREATE INDEX "__sync_ended_ix_root_xi7qlk4cj4" ON "slice_den"."sync_ended" USING btree ("root");

CREATE INDEX "__sync_exclusive_ix_kind_key_pred_turn_qryngij_6_c_4_xscx3i4mti" ON "slice_den"."sync_exclusive" USING btree ("kind", "key", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_exclusive_key_ix_root_tfhjjf4qg2" ON "slice_den"."sync_exclusive_key" USING btree ("root");

CREATE INDEX "__sync_exhausted_ix_root_yqhpt7jtz4" ON "slice_den"."sync_exhausted" USING btree ("root");

CREATE INDEX "__sync_failed_ix_root_step_iieo2dpdbf" ON "slice_den"."sync_failed" USING btree ("root", "step");

CREATE INDEX "__sync_fenced_ix_root_peedftug4f" ON "slice_den"."sync_fenced" USING btree ("root");

CREATE INDEX "__sync_finish_ix_root_zrpyhvrere" ON "slice_den"."sync_finish" USING btree ("root");

CREATE INDEX "__sync_finish_ix_scope_step_owsw7m5w74" ON "slice_den"."sync_finish" USING btree ("scope", "step");

CREATE INDEX "__sync_gold_finish_output_ix_root_gqwdl72ukv" ON "slice_den"."sync_gold_finish_output" USING btree ("root");

CREATE INDEX "__sync_gold_input_ix_root_fmnsnept43" ON "slice_den"."sync_gold_input" USING btree ("root");

CREATE INDEX "__sync_held_ix_root_yxqvodlkmy" ON "slice_den"."sync_held" USING btree ("root");

CREATE INDEX "__sync_paused_ix_target_pred_turn_qryngij_6_c_4_xfnff46zel" ON "slice_den"."sync_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__sync_refusal_ix_root_642sem4ijz" ON "slice_den"."sync_refusal" USING btree ("root");

CREATE INDEX "__sync_result_ix_root_step_t2jh3c7vsq" ON "slice_den"."sync_result" USING btree ("root", "step");

CREATE INDEX "__sync_retry_ix_root_j5nndics7d" ON "slice_den"."sync_retry" USING btree ("root");

CREATE INDEX "__sync_scope_ix_root_7f6s5dqo5t" ON "slice_den"."sync_scope" USING btree ("root");

CREATE INDEX "__sync_skipped_ix_by_ttq6dm55n2" ON "slice_den"."sync_skipped" USING btree ("by");

CREATE INDEX "__sync_skipped_ix_root_cjefss5pid" ON "slice_den"."sync_skipped" USING btree ("root");

CREATE INDEX "__sync_start_step_ix_root_scope_5d3x6uas5c" ON "slice_den"."sync_start_step" USING btree ("root", "scope");

CREATE INDEX "__sync_step_ix_root_scope_l4sfn7gzd3" ON "slice_den"."sync_step" USING btree ("root", "scope");

CREATE INDEX "__sync_step_ix_scope_qlsdbwk3lt" ON "slice_den"."sync_step" USING btree ("scope");

CREATE INDEX "__sync_sync_run_finish_output_ix_root_7lxs3t6qrm" ON "slice_den"."sync_sync_run_finish_output" USING btree ("root");

CREATE INDEX "__sync_sync_run_input_ix_root_bp43cbf2uj" ON "slice_den"."sync_sync_run_input" USING btree ("root");

CREATE INDEX "__writeback_admitted_ix_root_h3gyzivmzl" ON "slice_den"."writeback_admitted" USING btree ("root");

CREATE INDEX "__writeback_claim_ix_root_step_ouvkclqzzd_pred_vsh4c26q54" ON "slice_den"."writeback_claim" USING btree ("root", "__step_ouvkclqzzd", "__pred_attempt_oey4tm5xyl");

CREATE INDEX "__writeback_deliver_input_ix_root_step_42hexztzwm" ON "slice_den"."writeback_deliver_input" USING btree ("root", "step");

CREATE INDEX "__writeback_deliver_output_ix_root_65uep5rbzs" ON "slice_den"."writeback_deliver_output" USING btree ("root");

CREATE INDEX "__writeback_done_ix_root_step_dxzcxsyzki" ON "slice_den"."writeback_done" USING btree ("root", "step");

CREATE INDEX "__writeback_ended_ix_root_22eyuup6mt" ON "slice_den"."writeback_ended" USING btree ("root");

CREATE INDEX "__writeback_exhausted_ix_root_cvj7pxcezh" ON "slice_den"."writeback_exhausted" USING btree ("root");

CREATE INDEX "__writeback_failed_ix_root_step_r27jysgea6" ON "slice_den"."writeback_failed" USING btree ("root", "step");

CREATE INDEX "__writeback_fenced_ix_root_jynr6i3m3n" ON "slice_den"."writeback_fenced" USING btree ("root");

CREATE INDEX "__writeback_finish_ix_root_7jp3nmlcxk" ON "slice_den"."writeback_finish" USING btree ("root");

CREATE INDEX "__writeback_finish_ix_scope_step_6ooh2ahmws" ON "slice_den"."writeback_finish" USING btree ("scope", "step");

CREATE INDEX "__writeback_held_ix_root_htj435svmc" ON "slice_den"."writeback_held" USING btree ("root");

CREATE INDEX "__writeback_paused_ix_target_pred_turn_qryngij_6_c_4_j2yz63n2im" ON "slice_den"."writeback_paused" USING btree ("target", "__pred_turn_qryngij6c4");

CREATE INDEX "__writeback_refusal_ix_root_rpqfuncax3" ON "slice_den"."writeback_refusal" USING btree ("root");

CREATE INDEX "__writeback_result_ix_root_step_m7c5flfb7z" ON "slice_den"."writeback_result" USING btree ("root", "step");

CREATE INDEX "__writeback_retry_ix_root_jksgr5toee" ON "slice_den"."writeback_retry" USING btree ("root");

CREATE INDEX "__writeback_scope_ix_root_kaxydmiokb" ON "slice_den"."writeback_scope" USING btree ("root");

CREATE INDEX "__writeback_skipped_ix_by_3ei4k4fj53" ON "slice_den"."writeback_skipped" USING btree ("by");

CREATE INDEX "__writeback_skipped_ix_root_ss2ptzee7p" ON "slice_den"."writeback_skipped" USING btree ("root");

CREATE INDEX "__writeback_start_step_ix_root_scope_azon5ljjqq" ON "slice_den"."writeback_start_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_step_ix_root_scope_oebhktgfcr" ON "slice_den"."writeback_step" USING btree ("root", "scope");

CREATE INDEX "__writeback_step_ix_scope_smnbmwitav" ON "slice_den"."writeback_step" USING btree ("scope");

CREATE INDEX "__writeback_writeback_finish_output_ix_root_4g3n3nyiax" ON "slice_den"."writeback_writeback_finish_output" USING btree ("root");

CREATE INDEX "__writeback_writeback_input_ix_root_fhpchifc4b" ON "slice_den"."writeback_writeback_input" USING btree ("root");

CREATE STATISTICS "slice_den"."__assign_finish_stats_scope_step_ld6jyxztu6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."assign_finish";

CREATE STATISTICS "slice_den"."__assign_step_stats_kind_scope_wiztsdmmtf" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."assign_step";

CREATE STATISTICS "slice_den"."__chain_finish_stats_scope_step_z7lvm6j2l6" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."chain_finish";

CREATE STATISTICS "slice_den"."__chain_page_read_tree_items_stats_digest_root_r3h7bzft5p" (ndistinct, dependencies, mcv) ON "digest", "root" FROM "slice_den"."chain_page_read_tree_items";

CREATE STATISTICS "slice_den"."__chain_step_stats_kind_scope_tc5nmidpxu" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."chain_step";

CREATE STATISTICS "slice_den"."__clock_finish_stats_scope_step_ejqaucw3q4" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."clock_finish";

CREATE STATISTICS "slice_den"."__fan_finish_stats_scope_step_4mm4p6zm66" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."fan_finish";

CREATE STATISTICS "slice_den"."__fan_step_stats_kind_scope_xmuvugpu6n" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."fan_step";

CREATE STATISTICS "slice_den"."__fan_within_stats_kind_parent_3vvpgco4da" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice_den"."fan_within";

CREATE STATISTICS "slice_den"."__retry_finish_stats_scope_step_2nxi4d7tdj" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."retry_finish";

CREATE STATISTICS "slice_den"."__retry_step_stats_kind_scope_osnqmvpfhd" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."retry_step";

CREATE STATISTICS "slice_den"."__review_finish_stats_scope_step_ac6ft3yr6e" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."review_finish";

CREATE STATISTICS "slice_den"."__review_step_stats_kind_scope_kgaij4jpus" (ndistinct, dependencies, mcv) ON "kind", "scope" FROM "slice_den"."review_step";

CREATE STATISTICS "slice_den"."__review_within_stats_kind_parent_w3ajh3gekc" (ndistinct, dependencies, mcv) ON "kind", "parent" FROM "slice_den"."review_within";

CREATE STATISTICS "slice_den"."__sync_exclusive_stats_key_kind_smed76p3zh" (ndistinct, dependencies, mcv) ON "key", "kind" FROM "slice_den"."sync_exclusive";

CREATE STATISTICS "slice_den"."__sync_finish_stats_scope_step_xiaq6np7mf" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."sync_finish";

CREATE STATISTICS "slice_den"."__writeback_finish_stats_scope_step_3knpjnabow" (ndistinct, dependencies, mcv) ON "scope", "step" FROM "slice_den"."writeback_finish";
