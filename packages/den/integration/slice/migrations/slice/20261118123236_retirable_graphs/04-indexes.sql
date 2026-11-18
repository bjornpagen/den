-- grizzle: no-transaction

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_admitted_pk_gj_2_obtfaxk_r6nkp6jlax";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_admitted_pk_gj_2_obtfaxk_r6nkp6jlax" ON "slice"."assign_admitted" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_pk_rhoa_22_jovt_rpkdozy74w";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_pk_rhoa_22_jovt_rpkdozy74w" ON "slice"."assign_assignment_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_exclude_pk_53_cp_6_hxpu7oe4qj";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_exclude_pk_53_cp_6_hxpu7oe4qj" ON "slice"."assign_assignment_input_exclude" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_mode_nearest_pk_fztb_c7fgo56eze";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_mode_nearest_pk_fztb_c7fgo56eze" ON "slice"."assign_assignment_input_mode_nearest" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_assignment_input_mode_within_pk_76ouhj4gal";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_assignment_input_mode_within_pk_76ouhj4gal" ON "slice"."assign_assignment_input_mode_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_claim_pk_gy_4_yhzk_2_me_k5nze6oexc";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_claim_pk_gy_4_yhzk_2_me_k5nze6oexc" ON "slice"."assign_claim" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_pk_phi_7_dovwvq_iuisqncnlg";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_pk_phi_7_dovwvq_iuisqncnlg" ON "slice"."assign_decide_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_exclude_pk_emksiazulk_qsw5gqo4sr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_exclude_pk_emksiazulk_qsw5gqo4sr" ON "slice"."assign_decide_input_exclude" USING btree ("step", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_mode_nearest_pk_ajsecg_3_f4jglsk665";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_mode_nearest_pk_ajsecg_3_f4jglsk665" ON "slice"."assign_decide_input_mode_nearest" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_input_mode_within_pk_5_ir_7_6wdu23bkum";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_input_mode_within_pk_5_ir_7_6wdu23bkum" ON "slice"."assign_decide_input_mode_within" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_nearest_read_pk_jc_4_zqvfwss_todllgmp5u";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_nearest_read_pk_jc_4_zqvfwss_todllgmp5u" ON "slice"."assign_decide_nearest_read" USING btree ("step", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_output_pk_tf_6_r_7_wtfse_ejgjhnm3f3";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_output_pk_tf_6_r_7_wtfse_ejgjhnm3f3" ON "slice"."assign_decide_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_output_stage_rest_pk_6_5th4lnxe3o";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_output_stage_rest_pk_6_5th4lnxe3o" ON "slice"."assign_decide_output_stage_rest" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_output_stage_serve_pk_g_54_mny6ekiahm";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_output_stage_serve_pk_g_54_mny6ekiahm" ON "slice"."assign_decide_output_stage_serve" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_output_weighed_pk_gf_74_rfsfbw_lneyws3bf7";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_output_weighed_pk_gf_74_rfsfbw_lneyws3bf7" ON "slice"."assign_decide_output_weighed" USING btree ("step", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_decide_seen_read_pk_sczf_2_f_7_gz_7_wsnkukw3db";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_decide_seen_read_pk_sczf_2_f_7_gz_7_wsnkukw3db" ON "slice"."assign_decide_seen_read" USING btree ("step", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_done_pk_gzil_7_jvxpz_tumphahf2d";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_done_pk_gzil_7_jvxpz_tumphahf2d" ON "slice"."assign_done" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_due_pk_mgahvzt_6_eh_wrism7vtg6";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_due_pk_mgahvzt_6_eh_wrism7vtg6" ON "slice"."assign_due" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_exhausted_pk_utz_6_lwqgv_6_n3voajeii6";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_exhausted_pk_utz_6_lwqgv_6_n3voajeii6" ON "slice"."assign_exhausted" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_failed_pk_ygxslcya_4_o_ogr4rqnhss";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_failed_pk_ygxslcya_4_o_ogr4rqnhss" ON "slice"."assign_failed" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_fenced_pk_y_6_jyfviepa_7tussjtcok";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_fenced_pk_y_6_jyfviepa_7tussjtcok" ON "slice"."assign_fenced" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_finish_pk_kfe_2_ztwv_2_z_kir232nazl";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_finish_pk_kfe_2_ztwv_2_z_kir232nazl" ON "slice"."assign_finish" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_held_pk_by_245_z_7_t_45_flsdzhzvhb";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_held_pk_by_245_z_7_t_45_flsdzhzvhb" ON "slice"."assign_held" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_refusal_pk_xs_5_e_4_ryh_4_k_ug5p642czq";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_refusal_pk_xs_5_e_4_ryh_4_k_ug5p642czq" ON "slice"."assign_refusal" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_result_pk_i_2_yxmpkyzr_owvl6l7upy";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_result_pk_i_2_yxmpkyzr_owvl6l7upy" ON "slice"."assign_result" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_retry_pk_4_dcm_5_yzzhe_6cxpia4id6";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_retry_pk_4_dcm_5_yzzhe_6cxpia4id6" ON "slice"."assign_retry" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_scope_pk_xytntbncid_zr6m2djm3z";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_scope_pk_xytntbncid_zr6m2djm3z" ON "slice"."assign_scope" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_skipped_pk_5_qhgbueof_7_wozhwh5jwy";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_skipped_pk_5_qhgbueof_7_wozhwh5jwy" ON "slice"."assign_skipped" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_start_scope_pk_ldqdb_5_b_25_z_mir2frb354";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_start_scope_pk_ldqdb_5_b_25_z_mir2frb354" ON "slice"."assign_start_scope" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_start_step_pk_jjcfkvptmp_4l342htmfl";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_start_step_pk_jjcfkvptmp_4l342htmfl" ON "slice"."assign_start_step" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_step_pk_2_oc_4_ehvfzd_no4wpymyzk";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_step_pk_2_oc_4_ehvfzd_no4wpymyzk" ON "slice"."assign_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_assign_within_pk_vvbm_6_qryed_53p4acsm5f";

CREATE UNIQUE INDEX CONCURRENTLY "__next_assign_within_pk_vvbm_6_qryed_53p4acsm5f" ON "slice"."assign_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_admitted_pk_iexc_6_ruxuv_yfnhkc7vbn";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_admitted_pk_iexc_6_ruxuv_yfnhkc7vbn" ON "slice"."chain_admitted" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_chain_run_input_pk_ezbgzw_4_jha_p4qhm7ld2m";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_chain_run_input_pk_ezbgzw_4_jha_p4qhm7ld2m" ON "slice"."chain_chain_run_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_claim_pk_nrr_2_rn_3_gui_logsrbsawm";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_claim_pk_nrr_2_rn_3_gui_logsrbsawm" ON "slice"."chain_claim" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_done_pk_tyyx_2_hmu_3_r_wk4pbvrfpr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_done_pk_tyyx_2_hmu_3_r_wk4pbvrfpr" ON "slice"."chain_done" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_due_pk_d_5_xdvmzepr_knnqkt7k57";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_due_pk_d_5_xdvmzepr_knnqkt7k57" ON "slice"."chain_due" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_exhausted_pk_nc_4_gvildnw_rhk45e5ux3";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_exhausted_pk_nc_4_gvildnw_rhk45e5ux3" ON "slice"."chain_exhausted" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_failed_pk_m_7_o_5_m_3_xzrr_wywxmvfkvi";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_failed_pk_m_7_o_5_m_3_xzrr_wywxmvfkvi" ON "slice"."chain_failed" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_fenced_pk_wwbie_4_qq_5_k_i764llhws5";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_fenced_pk_wwbie_4_qq_5_k_i764llhws5" ON "slice"."chain_fenced" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_finish_pk_ebe_75_jmnzy_fmqbr6l3ew";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_finish_pk_ebe_75_jmnzy_fmqbr6l3ew" ON "slice"."chain_finish" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_held_pk_73_idl_7_oo_5_c_lui2ma4hdr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_held_pk_73_idl_7_oo_5_c_lui2ma4hdr" ON "slice"."chain_held" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_next_pk_qeumlilvtk_ry6l537iaa";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_next_pk_qeumlilvtk_ry6l537iaa" ON "slice"."chain_next" USING btree ("from", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_ordered_input_pk_iv_2357_obqh_vcv4s3qpi5";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_ordered_input_pk_iv_2357_obqh_vcv4s3qpi5" ON "slice"."chain_ordered_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_page_input_pk_xuafsbu_5_vz_e35pwm5ak5";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_page_input_pk_xuafsbu_5_vz_e35pwm5ak5" ON "slice"."chain_page_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_page_input_after_pk_zsdylv_6_pam_yxkl75qgwr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_page_input_after_pk_zsdylv_6_pam_yxkl75qgwr" ON "slice"."chain_page_input_after" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_page_output_pk_whwnpdfgmi_wsb3rozbog";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_page_output_pk_whwnpdfgmi_wsb3rozbog" ON "slice"."chain_page_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_page_output_next_pk_h_55_uzx_4_bbq_utflmtrj57";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_page_output_next_pk_h_55_uzx_4_bbq_utflmtrj57" ON "slice"."chain_page_output_next" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_page_weights_read_pk_mvr_5_jc_4_gry_rdormzdjxp";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_page_weights_read_pk_mvr_5_jc_4_gry_rdormzdjxp" ON "slice"."chain_page_weights_read" USING btree ("step", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_refusal_pk_4_j_4_yw_3_qc_6_m_krtuhw7rfi";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_refusal_pk_4_j_4_yw_3_qc_6_m_krtuhw7rfi" ON "slice"."chain_refusal" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_result_pk_btw_3_jzlkgl_75h5bzjaa5";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_result_pk_btw_3_jzlkgl_75h5bzjaa5" ON "slice"."chain_result" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_retry_pk_522_nodru_3_s_v5ybqv3nqa";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_retry_pk_522_nodru_3_s_v5ybqv3nqa" ON "slice"."chain_retry" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_scope_pk_fxzt_444_lf_6_6ewfaalfo2";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_scope_pk_fxzt_444_lf_6_6ewfaalfo2" ON "slice"."chain_scope" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_skipped_pk_cjdtdttlyx_ts5b2sb76v";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_skipped_pk_cjdtdttlyx_ts5b2sb76v" ON "slice"."chain_skipped" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_start_scope_pk_t_4_giphzblt_yqmw5vzcvc";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_start_scope_pk_t_4_giphzblt_yqmw5vzcvc" ON "slice"."chain_start_scope" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_start_step_pk_dgda_7_shxb_4_njtzbizh7y";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_start_step_pk_dgda_7_shxb_4_njtzbizh7y" ON "slice"."chain_start_step" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_step_pk_u_6_x_5_wnvfbv_kiwhmbg2dj";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_step_pk_u_6_x_5_wnvfbv_kiwhmbg2dj" ON "slice"."chain_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_chain_within_pk_ihqzjavdib_j4ty3djyan";

CREATE UNIQUE INDEX CONCURRENTLY "__next_chain_within_pk_ihqzjavdib_j4ty3djyan" ON "slice"."chain_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_admitted_pk_jzt_7_rtrzny_4occmtmhby";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_admitted_pk_jzt_7_rtrzny_4occmtmhby" ON "slice"."fan_admitted" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_batch_input_pk_bmhyfuy_2_bw_a3dyetngo7";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_batch_input_pk_bmhyfuy_2_bw_a3dyetngo7" ON "slice"."fan_batch_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_claim_pk_e_7_zimqppco_wd2r22gtdx";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_claim_pk_e_7_zimqppco_wd2r22gtdx" ON "slice"."fan_claim" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_done_pk_5_u_65252_q_52_x35qewdgik";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_done_pk_5_u_65252_q_52_x35qewdgik" ON "slice"."fan_done" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_due_pk_yc_6_ppd_3_zm_6_ejwpua64px";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_due_pk_yc_6_ppd_3_zm_6_ejwpua64px" ON "slice"."fan_due" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_exhausted_pk_4_t_3_sxjskvd_rzonpmsquw";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_exhausted_pk_4_t_3_sxjskvd_rzonpmsquw" ON "slice"."fan_exhausted" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_failed_pk_z_4_etp_5_dmax_vq6g4s7drn";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_failed_pk_z_4_etp_5_dmax_vq6g4s7drn" ON "slice"."fan_failed" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_fan_run_input_pk_tbzpgbwe_7_g_jkk6zqiq2m";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_fan_run_input_pk_tbzpgbwe_7_g_jkk6zqiq2m" ON "slice"."fan_fan_run_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_fenced_pk_6_tkvirerez_i6gld6nw6y";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_fenced_pk_6_tkvirerez_i6gld6nw6y" ON "slice"."fan_fenced" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_finish_pk_6_mb_33_urjra_l4vrua653d";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_finish_pk_6_mb_33_urjra_l4vrua653d" ON "slice"."fan_finish" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_held_pk_4_ic_6_tjvac_4_yzywgzje3m";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_held_pk_4_ic_6_tjvac_4_yzywgzje3m" ON "slice"."fan_held" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_refusal_pk_7_va_55_wo_2_wj_taxxdxrkly";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_refusal_pk_7_va_55_wo_2_wj_taxxdxrkly" ON "slice"."fan_refusal" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_result_pk_yeear_352_sx_nm6k4cpp6q";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_result_pk_yeear_352_sx_nm6k4cpp6q" ON "slice"."fan_result" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_retry_pk_7_xubce_4_v_66_lpkm4qrqyy";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_retry_pk_7_xubce_4_v_66_lpkm4qrqyy" ON "slice"."fan_retry" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_scope_pk_7_bvjfihnef_oum4pftayh";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_scope_pk_7_bvjfihnef_oum4pftayh" ON "slice"."fan_scope" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_skipped_pk_22_erbmfzer_i5liagvcdz";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_skipped_pk_22_erbmfzer_i5liagvcdz" ON "slice"."fan_skipped" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_square_input_pk_uzumoizv_53_f37444ig4s";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_square_input_pk_uzumoizv_53_f37444ig4s" ON "slice"."fan_square_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_square_output_pk_wcgarjqvhr_2qjhagbcxj";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_square_output_pk_wcgarjqvhr_2qjhagbcxj" ON "slice"."fan_square_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_start_scope_pk_nnms_2_gjwyi_dnceza3fyk";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_start_scope_pk_nnms_2_gjwyi_dnceza3fyk" ON "slice"."fan_start_scope" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_start_step_pk_7_e_247_xk_4_mz_fyyq7wd6bc";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_start_step_pk_7_e_247_xk_4_mz_fyyq7wd6bc" ON "slice"."fan_start_step" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_step_pk_2_f_4_tcxnofk_cungsdj5b7";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_step_pk_2_f_4_tcxnofk_cungsdj5b7" ON "slice"."fan_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_fan_within_pk_g_5_tswgjfa_6_mtvh3ujn6r";

CREATE UNIQUE INDEX CONCURRENTLY "__next_fan_within_pk_g_5_tswgjfa_6_mtvh3ujn6r" ON "slice"."fan_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_admitted_pk_qyp_7_cminjx_y676yq5k3c";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_admitted_pk_qyp_7_cminjx_y676yq5k3c" ON "slice"."retry_admitted" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_brittle_input_pk_tlqssexohy_ffiepmjqji";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_brittle_input_pk_tlqssexohy_ffiepmjqji" ON "slice"."retry_brittle_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_brittle_output_pk_oecjcng_2_s_4_qq75ygrffl";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_brittle_output_pk_oecjcng_2_s_4_qq75ygrffl" ON "slice"."retry_brittle_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_claim_pk_aayzt_5_ni_6_z_sizwgqso2m";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_claim_pk_aayzt_5_ni_6_z_sizwgqso2m" ON "slice"."retry_claim" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_done_pk_vtkpce_7_rkq_ravfi7ys5s";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_done_pk_vtkpce_7_rkq_ravfi7ys5s" ON "slice"."retry_done" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_due_pk_lerzzlnz_7_o_xaqozki5sj";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_due_pk_lerzzlnz_7_o_xaqozki5sj" ON "slice"."retry_due" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_exhausted_pk_v_56_c_23_krid_kzqwgsjled";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_exhausted_pk_v_56_c_23_krid_kzqwgsjled" ON "slice"."retry_exhausted" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_failed_pk_mygc_4_onczp_c6tdy4fyky";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_failed_pk_mygc_4_onczp_c6tdy4fyky" ON "slice"."retry_failed" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_fenced_pk_umzicmiruo_z2u7j6tffr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_fenced_pk_umzicmiruo_z2u7j6tffr" ON "slice"."retry_fenced" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_finish_pk_yhwp_5_uk_5_cg_wvcqqgrfxv";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_finish_pk_yhwp_5_uk_5_cg_wvcqqgrfxv" ON "slice"."retry_finish" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_held_pk_nvgeylmjp_2_kndueoje3k";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_held_pk_nvgeylmjp_2_kndueoje3k" ON "slice"."retry_held" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_ladders_input_pk_5_cdnkfgg_3_x_iu3jln2r4c";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_ladders_input_pk_5_cdnkfgg_3_x_iu3jln2r4c" ON "slice"."retry_ladders_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_refusal_pk_nifndsd_6_pp_ce2d3o7kzt";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_refusal_pk_nifndsd_6_pp_ce2d3o7kzt" ON "slice"."retry_refusal" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_result_pk_5_fegihvmml_islnkiwgnn";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_result_pk_5_fegihvmml_islnkiwgnn" ON "slice"."retry_result" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_retry_pk_slrwn_4_rt_5_d_zzpxy24l2h";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_retry_pk_slrwn_4_rt_5_d_zzpxy24l2h" ON "slice"."retry_retry" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_scope_pk_fgji_2_phvxy_mxzaotwdeo";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_scope_pk_fgji_2_phvxy_mxzaotwdeo" ON "slice"."retry_scope" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_skipped_pk_au_5_z_33_ql_7_a_hnifjhyl5r";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_skipped_pk_au_5_z_33_ql_7_a_hnifjhyl5r" ON "slice"."retry_skipped" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_start_scope_pk_wsif_6_notdn_5cwuhxwemo";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_start_scope_pk_wsif_6_notdn_5cwuhxwemo" ON "slice"."retry_start_scope" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_start_step_pk_mp_77_csmi_26_2hxzwfntrz";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_start_step_pk_mp_77_csmi_26_2hxzwfntrz" ON "slice"."retry_start_step" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_steadfast_input_pk_omubooh_2_k_3_uedajitrb7";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_steadfast_input_pk_omubooh_2_k_3_uedajitrb7" ON "slice"."retry_steadfast_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_steadfast_output_pk_xyvfgnpd_5_w_4nowqhrcyf";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_steadfast_output_pk_xyvfgnpd_5_w_4nowqhrcyf" ON "slice"."retry_steadfast_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_step_pk_opjqidwhzg_ta5l4l4no3";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_step_pk_opjqidwhzg_ta5l4l4no3" ON "slice"."retry_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_retry_within_pk_t_64_odgwbuc_dtiykwjbvn";

CREATE UNIQUE INDEX CONCURRENTLY "__next_retry_within_pk_t_64_odgwbuc_dtiykwjbvn" ON "slice"."retry_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_admitted_pk_ral_53_o_3_fpi_ubj7y5obpo";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_admitted_pk_ral_53_o_3_fpi_ubj7y5obpo" ON "slice"."sync_admitted" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_build_input_pk_wtjr_2_xzecg_oxvpf6i7hn";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_build_input_pk_wtjr_2_xzecg_oxvpf6i7hn" ON "slice"."sync_build_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_build_output_pk_rhnco_3_epch_p3wzjgxi6a";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_build_output_pk_rhnco_3_epch_p3wzjgxi6a" ON "slice"."sync_build_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_claim_pk_s_2_tqnziq_4_u_qgk4pa6qme";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_claim_pk_s_2_tqnziq_4_u_qgk4pa6qme" ON "slice"."sync_claim" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_copy_input_pk_nzsbbbp_6_o_5_asg6pxtkol";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_copy_input_pk_nzsbbbp_6_o_5_asg6pxtkol" ON "slice"."sync_copy_input" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_copy_output_pk_x_6_s_2_tcx_7_ot_kn75k3yrbz";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_copy_output_pk_x_6_s_2_tcx_7_ot_kn75k3yrbz" ON "slice"."sync_copy_output" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_done_pk_nllomjb_7_og_2qo565fjkq";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_done_pk_nllomjb_7_og_2qo565fjkq" ON "slice"."sync_done" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_due_pk_hkeoswqthe_bqewzb3vvm";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_due_pk_hkeoswqthe_bqewzb3vvm" ON "slice"."sync_due" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_exclusive_key_pk_dba_4_nxbky_5_p4k5o6ech7";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_exclusive_key_pk_dba_4_nxbky_5_p4k5o6ech7" ON "slice"."sync_exclusive_key" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_exhausted_pk_ek_6_zxvo_6_it_skpvwhgnfk";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_exhausted_pk_ek_6_zxvo_6_it_skpvwhgnfk" ON "slice"."sync_exhausted" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_failed_pk_gqykngewxb_y3blwwzwj6";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_failed_pk_gqykngewxb_y3blwwzwj6" ON "slice"."sync_failed" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_fenced_pk_tszx_4_qm_2_gz_ow2enoaeev";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_fenced_pk_tszx_4_qm_2_gz_ow2enoaeev" ON "slice"."sync_fenced" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_finish_pk_hn_7_tmx_25_xc_e2rjd6fplz";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_finish_pk_hn_7_tmx_25_xc_e2rjd6fplz" ON "slice"."sync_finish" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_gold_input_pk_wp_7_hfx_6_n_2_e_uihp4hwegr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_gold_input_pk_wp_7_hfx_6_n_2_e_uihp4hwegr" ON "slice"."sync_gold_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_held_pk_wsme_4_moka_4_j44mgbptjy";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_held_pk_wsme_4_moka_4_j44mgbptjy" ON "slice"."sync_held" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_refusal_pk_mbmfornc_5_c_tbpuehnvrs";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_refusal_pk_mbmfornc_5_c_tbpuehnvrs" ON "slice"."sync_refusal" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_result_pk_jmwy_2_p_3_mqf_jfwanxwupk";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_result_pk_jmwy_2_p_3_mqf_jfwanxwupk" ON "slice"."sync_result" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_retry_pk_6_q_52_red_7_iw_k7hoxbj4ma";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_retry_pk_6_q_52_red_7_iw_k7hoxbj4ma" ON "slice"."sync_retry" USING btree ("step", "attempt", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_scope_pk_bg_72_sm_6_p_4_z_d4f6i3du6f";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_scope_pk_bg_72_sm_6_p_4_z_d4f6i3du6f" ON "slice"."sync_scope" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_skipped_pk_yutjqacvws_k2llylfnku";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_skipped_pk_yutjqacvws_k2llylfnku" ON "slice"."sync_skipped" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_start_scope_pk_zsezuom_4_ll_rw7bjkogpt";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_start_scope_pk_zsezuom_4_ll_rw7bjkogpt" ON "slice"."sync_start_scope" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_start_step_pk_4_dv_7_h_6_kuu_3_6jsqwisqnr";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_start_step_pk_4_dv_7_h_6_kuu_3_6jsqwisqnr" ON "slice"."sync_start_step" USING btree ("scope", "ordinal", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_step_pk_wfgcxdvbwo_pwisdojpmy";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_step_pk_wfgcxdvbwo_pwisdojpmy" ON "slice"."sync_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_sync_run_input_pk_cpbaujyjwv_hnztsb6spm";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_sync_run_input_pk_cpbaujyjwv_hnztsb6spm" ON "slice"."sync_sync_run_input" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__next_sync_within_pk_xcfutikja_2_j3537ifkfz";

CREATE UNIQUE INDEX CONCURRENTLY "__next_sync_within_pk_xcfutikja_2_j3537ifkfz" ON "slice"."sync_within" USING btree ("scope", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_key_scope_root_bchsw4ix2g";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_assignment_input_key_scope_root_bchsw4ix2g" ON "slice"."assign_assignment_input" USING btree ("__scope_44i2s4kbue", "__root_h2ohpjyioe");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_key_scope_root_gibc2wxiel";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_assignment_input_key_scope_root_gibc2wxiel" ON "slice"."assign_assignment_input" USING btree ("__scope_3owcvq3eou", "__root_i3j5qytpxw");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_key_step_root_wkkmcf3pki";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_input_key_step_root_wkkmcf3pki" ON "slice"."assign_decide_input" USING btree ("__step_rbt3e5bpyf", "__root_h2ohpjyioe");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_key_step_root_kr2gl2vduy";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_input_key_step_root_kr2gl2vduy" ON "slice"."assign_decide_input" USING btree ("__step_5ftuveszke", "__root_i3j5qytpxw");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_key_step_root_wxkoynzs3a";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_output_key_step_root_wxkoynzs3a" ON "slice"."assign_decide_output" USING btree ("__step_zqzc7m2bzh", "__root_safjiw7jol");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_key_step_root_vlmv6k3h4l";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_decide_output_key_step_root_vlmv6k3h4l" ON "slice"."assign_decide_output" USING btree ("__step_7f435gey6a", "__root_dp4c6pzr4n");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_finish_key_step_root_4woj5zibbd";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_finish_key_step_root_4woj5zibbd" ON "slice"."assign_finish" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_result_key_step_root_outcome_abohxidqgh";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_result_key_step_root_outcome_abohxidqgh" ON "slice"."assign_result" USING btree ("step", "root", "outcome");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_root_key_scope_77r36z7vhn";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_root_key_scope_77r36z7vhn" ON "slice"."assign_root" USING btree ("__scope_jdl7uajdrr");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_scope_key_scope_root_kind_r44d3akhzm";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_scope_key_scope_root_kind_r44d3akhzm" ON "slice"."assign_scope" USING btree ("scope", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_start_scope_key_child_root_dlh7bpcpep";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_start_scope_key_child_root_dlh7bpcpep" ON "slice"."assign_start_scope" USING btree ("child", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_start_step_key_step_root_k27j2tutjj";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_start_step_key_step_root_k27j2tutjj" ON "slice"."assign_start_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_step_key_step_root_kind_gglnf6zhrr";

CREATE UNIQUE INDEX CONCURRENTLY "__assign_step_key_step_root_kind_gglnf6zhrr" ON "slice"."assign_step" USING btree ("step", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_finish_key_step_root_5aj26igjty";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_finish_key_step_root_5aj26igjty" ON "slice"."chain_finish" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_next_key_to_root_qxqaughmvp";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_next_key_to_root_qxqaughmvp" ON "slice"."chain_next" USING btree ("to", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_result_key_step_root_outcome_gzg5dgd4yf";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_result_key_step_root_outcome_gzg5dgd4yf" ON "slice"."chain_result" USING btree ("step", "root", "outcome");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_root_key_scope_prbadyie6j";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_root_key_scope_prbadyie6j" ON "slice"."chain_root" USING btree ("__scope_jdl7uajdrr");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_scope_key_scope_root_kind_f66lrzuxpl";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_scope_key_scope_root_kind_f66lrzuxpl" ON "slice"."chain_scope" USING btree ("scope", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_start_scope_key_child_root_qaucku2a5l";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_start_scope_key_child_root_qaucku2a5l" ON "slice"."chain_start_scope" USING btree ("child", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_start_step_key_step_root_sgonmabfyw";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_start_step_key_step_root_sgonmabfyw" ON "slice"."chain_start_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_step_key_step_root_kind_5usafjldb4";

CREATE UNIQUE INDEX CONCURRENTLY "__chain_step_key_step_root_kind_5usafjldb4" ON "slice"."chain_step" USING btree ("step", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_finish_key_step_root_xshxj2rwb2";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_finish_key_step_root_xshxj2rwb2" ON "slice"."fan_finish" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_result_key_step_root_outcome_pigdtsfrtf";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_result_key_step_root_outcome_pigdtsfrtf" ON "slice"."fan_result" USING btree ("step", "root", "outcome");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_root_key_scope_i3qel4nyj5";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_root_key_scope_i3qel4nyj5" ON "slice"."fan_root" USING btree ("__scope_jdl7uajdrr");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_scope_key_scope_root_kind_4tsq5wlw2m";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_scope_key_scope_root_kind_4tsq5wlw2m" ON "slice"."fan_scope" USING btree ("scope", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_start_scope_key_child_root_twylnvawre";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_start_scope_key_child_root_twylnvawre" ON "slice"."fan_start_scope" USING btree ("child", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_start_step_key_step_root_h32wwrpq3c";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_start_step_key_step_root_h32wwrpq3c" ON "slice"."fan_start_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_step_key_step_root_kind_ybszf77kal";

CREATE UNIQUE INDEX CONCURRENTLY "__fan_step_key_step_root_kind_ybszf77kal" ON "slice"."fan_step" USING btree ("step", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_finish_key_step_root_a7vhiwagne";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_finish_key_step_root_a7vhiwagne" ON "slice"."retry_finish" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_result_key_step_root_outcome_rartod3xj4";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_result_key_step_root_outcome_rartod3xj4" ON "slice"."retry_result" USING btree ("step", "root", "outcome");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_root_key_scope_yc7em5k35u";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_root_key_scope_yc7em5k35u" ON "slice"."retry_root" USING btree ("__scope_jdl7uajdrr");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_scope_key_scope_root_kind_pcegt2scnb";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_scope_key_scope_root_kind_pcegt2scnb" ON "slice"."retry_scope" USING btree ("scope", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_start_scope_key_child_root_yq5q4xexcm";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_start_scope_key_child_root_yq5q4xexcm" ON "slice"."retry_start_scope" USING btree ("child", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_start_step_key_step_root_fudt2vk7zs";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_start_step_key_step_root_fudt2vk7zs" ON "slice"."retry_start_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_step_key_step_root_kind_xonebqedgz";

CREATE UNIQUE INDEX CONCURRENTLY "__retry_step_key_step_root_kind_xonebqedgz" ON "slice"."retry_step" USING btree ("step", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_finish_key_step_root_kpt2idultt";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_finish_key_step_root_kpt2idultt" ON "slice"."sync_finish" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_result_key_step_root_outcome_c673vsbm4i";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_result_key_step_root_outcome_c673vsbm4i" ON "slice"."sync_result" USING btree ("step", "root", "outcome");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_root_key_scope_lxj4sb3mcx";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_root_key_scope_lxj4sb3mcx" ON "slice"."sync_root" USING btree ("__scope_jdl7uajdrr");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_scope_key_scope_root_kind_hda5oz5d4v";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_scope_key_scope_root_kind_hda5oz5d4v" ON "slice"."sync_scope" USING btree ("scope", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_start_scope_key_child_root_bqxek2fkcn";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_start_scope_key_child_root_bqxek2fkcn" ON "slice"."sync_start_scope" USING btree ("child", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_start_step_key_step_root_rkceslwobo";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_start_step_key_step_root_rkceslwobo" ON "slice"."sync_start_step" USING btree ("step", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_step_key_step_root_kind_6xdmzwacqb";

CREATE UNIQUE INDEX CONCURRENTLY "__sync_step_key_step_root_kind_6xdmzwacqb" ON "slice"."sync_step" USING btree ("step", "root", "kind");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_admitted_ix_root_pot3vpqjrt";

CREATE INDEX CONCURRENTLY "__assign_admitted_ix_root_pot3vpqjrt" ON "slice"."assign_admitted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_ix_root_gup4vjwekt";

CREATE INDEX CONCURRENTLY "__assign_assignment_input_ix_root_gup4vjwekt" ON "slice"."assign_assignment_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_exclude_ix_scope_u_6_ypqf_45dew4mkec";

CREATE INDEX CONCURRENTLY "__assign_assignment_input_exclude_ix_scope_u_6_ypqf_45dew4mkec" ON "slice"."assign_assignment_input_exclude" USING btree ("__scope_u6ypqf2r2z", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb";

CREATE INDEX CONCURRENTLY "__assign_assignment_input_exclude_ix_root_scope_s3ar3mqhyb" ON "slice"."assign_assignment_input_exclude" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_mode_nearest_ix_root_geksrwbvbt";

CREATE INDEX CONCURRENTLY "__assign_assignment_input_mode_nearest_ix_root_geksrwbvbt" ON "slice"."assign_assignment_input_mode_nearest" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_assignment_input_mode_within_ix_root_4mo3ngsp77";

CREATE INDEX CONCURRENTLY "__assign_assignment_input_mode_within_ix_root_4mo3ngsp77" ON "slice"."assign_assignment_input_mode_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_gr25qcsssc";

CREATE INDEX CONCURRENTLY "__assign_claim_ix_step_fxyms_236_d_4_pred_attempt_gr25qcsssc" ON "slice"."assign_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_claim_ix_root_step_xwit6s2vsb";

CREATE INDEX CONCURRENTLY "__assign_claim_ix_root_step_xwit6s2vsb" ON "slice"."assign_claim" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_ix_root_p3wqyck24p";

CREATE INDEX CONCURRENTLY "__assign_decide_input_ix_root_p3wqyck24p" ON "slice"."assign_decide_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_exclude_ix_step_mjpuijzth_4_2wmsrdnp2v";

CREATE INDEX CONCURRENTLY "__assign_decide_input_exclude_ix_step_mjpuijzth_4_2wmsrdnp2v" ON "slice"."assign_decide_input_exclude" USING btree ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_exclude_ix_root_step_ksgou2rpv4";

CREATE INDEX CONCURRENTLY "__assign_decide_input_exclude_ix_root_step_ksgou2rpv4" ON "slice"."assign_decide_input_exclude" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_mode_nearest_ix_root_cwtrrsp2t6";

CREATE INDEX CONCURRENTLY "__assign_decide_input_mode_nearest_ix_root_cwtrrsp2t6" ON "slice"."assign_decide_input_mode_nearest" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_input_mode_within_ix_root_cv2vov6qoa";

CREATE INDEX CONCURRENTLY "__assign_decide_input_mode_within_ix_root_cv2vov6qoa" ON "slice"."assign_decide_input_mode_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_nearest_read_ix_root_step_4c4574ihrx";

CREATE INDEX CONCURRENTLY "__assign_decide_nearest_read_ix_root_step_4c4574ihrx" ON "slice"."assign_decide_nearest_read" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_ix_root_zj6f5mecax";

CREATE INDEX CONCURRENTLY "__assign_decide_output_ix_root_zj6f5mecax" ON "slice"."assign_decide_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_stage_rest_ix_root_yrhjqr3wmn";

CREATE INDEX CONCURRENTLY "__assign_decide_output_stage_rest_ix_root_yrhjqr3wmn" ON "slice"."assign_decide_output_stage_rest" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_stage_serve_ix_root_woxsq76rll";

CREATE INDEX CONCURRENTLY "__assign_decide_output_stage_serve_ix_root_woxsq76rll" ON "slice"."assign_decide_output_stage_serve" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_weighed_ix_step_mjpuijzth_4_6xa7a6vtga";

CREATE INDEX CONCURRENTLY "__assign_decide_output_weighed_ix_step_mjpuijzth_4_6xa7a6vtga" ON "slice"."assign_decide_output_weighed" USING btree ("__step_mjpuijzth4", "__pred_ordinal_rdz3ttleig", "__root_yjobx7uyrd");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_output_weighed_ix_root_step_gncwdipl43";

CREATE INDEX CONCURRENTLY "__assign_decide_output_weighed_ix_root_step_gncwdipl43" ON "slice"."assign_decide_output_weighed" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_decide_seen_read_ix_root_step_ybtvecx7oy";

CREATE INDEX CONCURRENTLY "__assign_decide_seen_read_ix_root_step_ybtvecx7oy" ON "slice"."assign_decide_seen_read" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_done_ix_root_5bapdliaci";

CREATE INDEX CONCURRENTLY "__assign_done_ix_root_5bapdliaci" ON "slice"."assign_done" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_due_ix_root_sk35qnuc2b";

CREATE INDEX CONCURRENTLY "__assign_due_ix_root_sk35qnuc2b" ON "slice"."assign_due" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_exhausted_ix_root_gsga5kdkq3";

CREATE INDEX CONCURRENTLY "__assign_exhausted_ix_root_gsga5kdkq3" ON "slice"."assign_exhausted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_failed_ix_root_qmypgaa57u";

CREATE INDEX CONCURRENTLY "__assign_failed_ix_root_qmypgaa57u" ON "slice"."assign_failed" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_fenced_ix_root_jvlqbasn7e";

CREATE INDEX CONCURRENTLY "__assign_fenced_ix_root_jvlqbasn7e" ON "slice"."assign_fenced" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_finish_ix_root_ilehlpwnxm";

CREATE INDEX CONCURRENTLY "__assign_finish_ix_root_ilehlpwnxm" ON "slice"."assign_finish" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_finish_ix_scope_step_53o4eorqpr";

CREATE INDEX CONCURRENTLY "__assign_finish_ix_scope_step_53o4eorqpr" ON "slice"."assign_finish" USING btree ("scope", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_held_ix_root_35l4gc35rc";

CREATE INDEX CONCURRENTLY "__assign_held_ix_root_35l4gc35rc" ON "slice"."assign_held" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_refusal_ix_root_qadi23h44a";

CREATE INDEX CONCURRENTLY "__assign_refusal_ix_root_qadi23h44a" ON "slice"."assign_refusal" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_result_ix_root_6rct54h6yp";

CREATE INDEX CONCURRENTLY "__assign_result_ix_root_6rct54h6yp" ON "slice"."assign_result" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_retry_ix_root_oaojw2snch";

CREATE INDEX CONCURRENTLY "__assign_retry_ix_root_oaojw2snch" ON "slice"."assign_retry" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_scope_ix_root_v6jmsbgzsq";

CREATE INDEX CONCURRENTLY "__assign_scope_ix_root_v6jmsbgzsq" ON "slice"."assign_scope" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_skipped_ix_root_dzieud2d67";

CREATE INDEX CONCURRENTLY "__assign_skipped_ix_root_dzieud2d67" ON "slice"."assign_skipped" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_start_scope_ix_root_scope_dy4riv6ey6";

CREATE INDEX CONCURRENTLY "__assign_start_scope_ix_root_scope_dy4riv6ey6" ON "slice"."assign_start_scope" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_start_step_ix_root_scope_j5eqvalej3";

CREATE INDEX CONCURRENTLY "__assign_start_step_ix_root_scope_j5eqvalej3" ON "slice"."assign_start_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_step_ix_root_scope_64vujnvoiu";

CREATE INDEX CONCURRENTLY "__assign_step_ix_root_scope_64vujnvoiu" ON "slice"."assign_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_step_ix_scope_kind_step_xn2zxx73po";

CREATE INDEX CONCURRENTLY "__assign_step_ix_scope_kind_step_xn2zxx73po" ON "slice"."assign_step" USING btree ("scope", "kind", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_within_ix_parent_root_zoknt3xjag";

CREATE INDEX CONCURRENTLY "__assign_within_ix_parent_root_zoknt3xjag" ON "slice"."assign_within" USING btree ("parent", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_within_ix_parent_scope_rjijde5lm7";

CREATE INDEX CONCURRENTLY "__assign_within_ix_parent_scope_rjijde5lm7" ON "slice"."assign_within" USING btree ("parent", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__assign_within_ix_root_lkh7fcbhwq";

CREATE INDEX CONCURRENTLY "__assign_within_ix_root_lkh7fcbhwq" ON "slice"."assign_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_admitted_ix_root_3xhdqkpeqw";

CREATE INDEX CONCURRENTLY "__chain_admitted_ix_root_3xhdqkpeqw" ON "slice"."chain_admitted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_chain_run_input_ix_root_7abe6kcg67";

CREATE INDEX CONCURRENTLY "__chain_chain_run_input_ix_root_7abe6kcg67" ON "slice"."chain_chain_run_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_dmkyo32uvz";

CREATE INDEX CONCURRENTLY "__chain_claim_ix_step_fxyms_236_d_4_pred_attempt_dmkyo32uvz" ON "slice"."chain_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_claim_ix_root_step_vf7fvyvhwc";

CREATE INDEX CONCURRENTLY "__chain_claim_ix_root_step_vf7fvyvhwc" ON "slice"."chain_claim" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_done_ix_root_lpu4obg6gs";

CREATE INDEX CONCURRENTLY "__chain_done_ix_root_lpu4obg6gs" ON "slice"."chain_done" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_due_ix_root_4j7ovoyxfr";

CREATE INDEX CONCURRENTLY "__chain_due_ix_root_4j7ovoyxfr" ON "slice"."chain_due" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_exhausted_ix_root_fjn7tzhjc7";

CREATE INDEX CONCURRENTLY "__chain_exhausted_ix_root_fjn7tzhjc7" ON "slice"."chain_exhausted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_failed_ix_root_a2qzbvndwy";

CREATE INDEX CONCURRENTLY "__chain_failed_ix_root_a2qzbvndwy" ON "slice"."chain_failed" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_fenced_ix_root_mnawzvb34e";

CREATE INDEX CONCURRENTLY "__chain_fenced_ix_root_mnawzvb34e" ON "slice"."chain_fenced" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_finish_ix_root_ypjcgcan7b";

CREATE INDEX CONCURRENTLY "__chain_finish_ix_root_ypjcgcan7b" ON "slice"."chain_finish" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_finish_ix_scope_step_om6bljb56e";

CREATE INDEX CONCURRENTLY "__chain_finish_ix_scope_step_om6bljb56e" ON "slice"."chain_finish" USING btree ("scope", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_held_ix_root_havzgkxex3";

CREATE INDEX CONCURRENTLY "__chain_held_ix_root_havzgkxex3" ON "slice"."chain_held" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_next_ix_root_from_5hhx2qutdl";

CREATE INDEX CONCURRENTLY "__chain_next_ix_root_from_5hhx2qutdl" ON "slice"."chain_next" USING btree ("root", "from");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_ordered_input_ix_root_wmmk2yqn4t";

CREATE INDEX CONCURRENTLY "__chain_ordered_input_ix_root_wmmk2yqn4t" ON "slice"."chain_ordered_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_page_input_ix_root_pguivwmlnv";

CREATE INDEX CONCURRENTLY "__chain_page_input_ix_root_pguivwmlnv" ON "slice"."chain_page_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_page_input_after_ix_root_hmbetlosxh";

CREATE INDEX CONCURRENTLY "__chain_page_input_after_ix_root_hmbetlosxh" ON "slice"."chain_page_input_after" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_page_output_ix_root_g3alpbog4o";

CREATE INDEX CONCURRENTLY "__chain_page_output_ix_root_g3alpbog4o" ON "slice"."chain_page_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_page_output_next_ix_root_r662e4fglp";

CREATE INDEX CONCURRENTLY "__chain_page_output_next_ix_root_r662e4fglp" ON "slice"."chain_page_output_next" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_page_weights_read_ix_root_step_qkx2asxvn7";

CREATE INDEX CONCURRENTLY "__chain_page_weights_read_ix_root_step_qkx2asxvn7" ON "slice"."chain_page_weights_read" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_refusal_ix_root_t2ancje4qy";

CREATE INDEX CONCURRENTLY "__chain_refusal_ix_root_t2ancje4qy" ON "slice"."chain_refusal" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_result_ix_root_cccvvlnnit";

CREATE INDEX CONCURRENTLY "__chain_result_ix_root_cccvvlnnit" ON "slice"."chain_result" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_retry_ix_root_nhtemmz6f2";

CREATE INDEX CONCURRENTLY "__chain_retry_ix_root_nhtemmz6f2" ON "slice"."chain_retry" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_scope_ix_root_idrabjw6oz";

CREATE INDEX CONCURRENTLY "__chain_scope_ix_root_idrabjw6oz" ON "slice"."chain_scope" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_skipped_ix_root_4knz5mxvl4";

CREATE INDEX CONCURRENTLY "__chain_skipped_ix_root_4knz5mxvl4" ON "slice"."chain_skipped" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_start_scope_ix_root_scope_pmsejobbzx";

CREATE INDEX CONCURRENTLY "__chain_start_scope_ix_root_scope_pmsejobbzx" ON "slice"."chain_start_scope" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_start_step_ix_root_scope_76rv5icpsa";

CREATE INDEX CONCURRENTLY "__chain_start_step_ix_root_scope_76rv5icpsa" ON "slice"."chain_start_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_step_ix_root_scope_srrhrbyetn";

CREATE INDEX CONCURRENTLY "__chain_step_ix_root_scope_srrhrbyetn" ON "slice"."chain_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_step_ix_scope_kind_step_tsdjtgaey5";

CREATE INDEX CONCURRENTLY "__chain_step_ix_scope_kind_step_tsdjtgaey5" ON "slice"."chain_step" USING btree ("scope", "kind", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_within_ix_parent_root_ou2ppyokg3";

CREATE INDEX CONCURRENTLY "__chain_within_ix_parent_root_ou2ppyokg3" ON "slice"."chain_within" USING btree ("parent", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_within_ix_parent_scope_qsgaheyd4k";

CREATE INDEX CONCURRENTLY "__chain_within_ix_parent_scope_qsgaheyd4k" ON "slice"."chain_within" USING btree ("parent", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__chain_within_ix_root_2yyvyz27do";

CREATE INDEX CONCURRENTLY "__chain_within_ix_root_2yyvyz27do" ON "slice"."chain_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_admitted_ix_root_cjavzjrmil";

CREATE INDEX CONCURRENTLY "__fan_admitted_ix_root_cjavzjrmil" ON "slice"."fan_admitted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_batch_input_ix_root_qd4jgfp6sf";

CREATE INDEX CONCURRENTLY "__fan_batch_input_ix_root_qd4jgfp6sf" ON "slice"."fan_batch_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_k77hys4jpf";

CREATE INDEX CONCURRENTLY "__fan_claim_ix_step_fxyms_236_d_4_pred_attempt_k77hys4jpf" ON "slice"."fan_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_claim_ix_root_step_t6nf6jsksj";

CREATE INDEX CONCURRENTLY "__fan_claim_ix_root_step_t6nf6jsksj" ON "slice"."fan_claim" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_done_ix_root_wzyxthndzd";

CREATE INDEX CONCURRENTLY "__fan_done_ix_root_wzyxthndzd" ON "slice"."fan_done" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_due_ix_root_x6ltys4whh";

CREATE INDEX CONCURRENTLY "__fan_due_ix_root_x6ltys4whh" ON "slice"."fan_due" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_exhausted_ix_root_2diuxfgt5s";

CREATE INDEX CONCURRENTLY "__fan_exhausted_ix_root_2diuxfgt5s" ON "slice"."fan_exhausted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_failed_ix_root_mjqlvft3l4";

CREATE INDEX CONCURRENTLY "__fan_failed_ix_root_mjqlvft3l4" ON "slice"."fan_failed" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_fan_run_input_ix_root_25alzzoykh";

CREATE INDEX CONCURRENTLY "__fan_fan_run_input_ix_root_25alzzoykh" ON "slice"."fan_fan_run_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_fenced_ix_root_3xl5uhzvmu";

CREATE INDEX CONCURRENTLY "__fan_fenced_ix_root_3xl5uhzvmu" ON "slice"."fan_fenced" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_finish_ix_root_i6xnvwhwty";

CREATE INDEX CONCURRENTLY "__fan_finish_ix_root_i6xnvwhwty" ON "slice"."fan_finish" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_finish_ix_scope_step_gv7mbzp7pp";

CREATE INDEX CONCURRENTLY "__fan_finish_ix_scope_step_gv7mbzp7pp" ON "slice"."fan_finish" USING btree ("scope", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_held_ix_root_6a5cilujsl";

CREATE INDEX CONCURRENTLY "__fan_held_ix_root_6a5cilujsl" ON "slice"."fan_held" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_refusal_ix_root_s5ydavkzd3";

CREATE INDEX CONCURRENTLY "__fan_refusal_ix_root_s5ydavkzd3" ON "slice"."fan_refusal" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_result_ix_root_lp2cxandbo";

CREATE INDEX CONCURRENTLY "__fan_result_ix_root_lp2cxandbo" ON "slice"."fan_result" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_retry_ix_root_sirifasnll";

CREATE INDEX CONCURRENTLY "__fan_retry_ix_root_sirifasnll" ON "slice"."fan_retry" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_scope_ix_root_a5wtvynqul";

CREATE INDEX CONCURRENTLY "__fan_scope_ix_root_a5wtvynqul" ON "slice"."fan_scope" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_skipped_ix_root_7ktlrax2wh";

CREATE INDEX CONCURRENTLY "__fan_skipped_ix_root_7ktlrax2wh" ON "slice"."fan_skipped" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_square_input_ix_root_zbpnkjxbkt";

CREATE INDEX CONCURRENTLY "__fan_square_input_ix_root_zbpnkjxbkt" ON "slice"."fan_square_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_square_output_ix_root_vc5qn45ria";

CREATE INDEX CONCURRENTLY "__fan_square_output_ix_root_vc5qn45ria" ON "slice"."fan_square_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_start_scope_ix_root_scope_t5ybmxw7ah";

CREATE INDEX CONCURRENTLY "__fan_start_scope_ix_root_scope_t5ybmxw7ah" ON "slice"."fan_start_scope" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_start_step_ix_root_scope_vn7amkfoey";

CREATE INDEX CONCURRENTLY "__fan_start_step_ix_root_scope_vn7amkfoey" ON "slice"."fan_start_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_step_ix_root_scope_aw525h7gua";

CREATE INDEX CONCURRENTLY "__fan_step_ix_root_scope_aw525h7gua" ON "slice"."fan_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_step_ix_scope_kind_step_5arz2gb4sb";

CREATE INDEX CONCURRENTLY "__fan_step_ix_scope_kind_step_5arz2gb4sb" ON "slice"."fan_step" USING btree ("scope", "kind", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_within_ix_parent_root_eiovyuswcz";

CREATE INDEX CONCURRENTLY "__fan_within_ix_parent_root_eiovyuswcz" ON "slice"."fan_within" USING btree ("parent", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_within_ix_parent_scope_ic53myxv2p";

CREATE INDEX CONCURRENTLY "__fan_within_ix_parent_scope_ic53myxv2p" ON "slice"."fan_within" USING btree ("parent", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__fan_within_ix_root_clgremqn26";

CREATE INDEX CONCURRENTLY "__fan_within_ix_root_clgremqn26" ON "slice"."fan_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_admitted_ix_root_ewgjxicsia";

CREATE INDEX CONCURRENTLY "__retry_admitted_ix_root_ewgjxicsia" ON "slice"."retry_admitted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_brittle_input_ix_root_5xzuq5cejn";

CREATE INDEX CONCURRENTLY "__retry_brittle_input_ix_root_5xzuq5cejn" ON "slice"."retry_brittle_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_brittle_output_ix_root_zbwyfvhpop";

CREATE INDEX CONCURRENTLY "__retry_brittle_output_ix_root_zbwyfvhpop" ON "slice"."retry_brittle_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_srdfpfzfhz";

CREATE INDEX CONCURRENTLY "__retry_claim_ix_step_fxyms_236_d_4_pred_attempt_srdfpfzfhz" ON "slice"."retry_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_claim_ix_root_step_kvsdksyi7f";

CREATE INDEX CONCURRENTLY "__retry_claim_ix_root_step_kvsdksyi7f" ON "slice"."retry_claim" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_done_ix_root_ze7pkgg6hl";

CREATE INDEX CONCURRENTLY "__retry_done_ix_root_ze7pkgg6hl" ON "slice"."retry_done" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_due_ix_root_fhrepcl5cl";

CREATE INDEX CONCURRENTLY "__retry_due_ix_root_fhrepcl5cl" ON "slice"."retry_due" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_exhausted_ix_root_zequtvgrfg";

CREATE INDEX CONCURRENTLY "__retry_exhausted_ix_root_zequtvgrfg" ON "slice"."retry_exhausted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_failed_ix_root_6jd525cfhz";

CREATE INDEX CONCURRENTLY "__retry_failed_ix_root_6jd525cfhz" ON "slice"."retry_failed" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_fenced_ix_root_4x3i3cxxnz";

CREATE INDEX CONCURRENTLY "__retry_fenced_ix_root_4x3i3cxxnz" ON "slice"."retry_fenced" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_finish_ix_root_sr33zcrg2m";

CREATE INDEX CONCURRENTLY "__retry_finish_ix_root_sr33zcrg2m" ON "slice"."retry_finish" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_finish_ix_scope_step_6tswescc6v";

CREATE INDEX CONCURRENTLY "__retry_finish_ix_scope_step_6tswescc6v" ON "slice"."retry_finish" USING btree ("scope", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_held_ix_root_ytwhkhubpt";

CREATE INDEX CONCURRENTLY "__retry_held_ix_root_ytwhkhubpt" ON "slice"."retry_held" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_ladders_input_ix_root_co4bnpgzm5";

CREATE INDEX CONCURRENTLY "__retry_ladders_input_ix_root_co4bnpgzm5" ON "slice"."retry_ladders_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_refusal_ix_root_7f4y3ykjiz";

CREATE INDEX CONCURRENTLY "__retry_refusal_ix_root_7f4y3ykjiz" ON "slice"."retry_refusal" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_result_ix_root_y3xgh3ebnm";

CREATE INDEX CONCURRENTLY "__retry_result_ix_root_y3xgh3ebnm" ON "slice"."retry_result" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_retry_ix_root_pkjsumgznf";

CREATE INDEX CONCURRENTLY "__retry_retry_ix_root_pkjsumgznf" ON "slice"."retry_retry" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_scope_ix_root_7gpsngzwhs";

CREATE INDEX CONCURRENTLY "__retry_scope_ix_root_7gpsngzwhs" ON "slice"."retry_scope" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_skipped_ix_root_uaslhltkgy";

CREATE INDEX CONCURRENTLY "__retry_skipped_ix_root_uaslhltkgy" ON "slice"."retry_skipped" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_start_scope_ix_root_scope_c6swz2xyob";

CREATE INDEX CONCURRENTLY "__retry_start_scope_ix_root_scope_c6swz2xyob" ON "slice"."retry_start_scope" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_start_step_ix_root_scope_f733eg3dwz";

CREATE INDEX CONCURRENTLY "__retry_start_step_ix_root_scope_f733eg3dwz" ON "slice"."retry_start_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_steadfast_input_ix_root_cw3fjd7jjf";

CREATE INDEX CONCURRENTLY "__retry_steadfast_input_ix_root_cw3fjd7jjf" ON "slice"."retry_steadfast_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_steadfast_output_ix_root_sp7in5arxz";

CREATE INDEX CONCURRENTLY "__retry_steadfast_output_ix_root_sp7in5arxz" ON "slice"."retry_steadfast_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_step_ix_root_scope_ogbhay3han";

CREATE INDEX CONCURRENTLY "__retry_step_ix_root_scope_ogbhay3han" ON "slice"."retry_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_step_ix_scope_kind_step_m6ufaqcqmk";

CREATE INDEX CONCURRENTLY "__retry_step_ix_scope_kind_step_m6ufaqcqmk" ON "slice"."retry_step" USING btree ("scope", "kind", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_within_ix_parent_root_ygagejv6gt";

CREATE INDEX CONCURRENTLY "__retry_within_ix_parent_root_ygagejv6gt" ON "slice"."retry_within" USING btree ("parent", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_within_ix_parent_scope_fssz5dsvdf";

CREATE INDEX CONCURRENTLY "__retry_within_ix_parent_scope_fssz5dsvdf" ON "slice"."retry_within" USING btree ("parent", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__retry_within_ix_root_lho5kgjqvt";

CREATE INDEX CONCURRENTLY "__retry_within_ix_root_lho5kgjqvt" ON "slice"."retry_within" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_admitted_ix_root_vormyuqk5x";

CREATE INDEX CONCURRENTLY "__sync_admitted_ix_root_vormyuqk5x" ON "slice"."sync_admitted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_build_input_ix_root_bo452cnu36";

CREATE INDEX CONCURRENTLY "__sync_build_input_ix_root_bo452cnu36" ON "slice"."sync_build_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_build_output_ix_root_amskeycb7k";

CREATE INDEX CONCURRENTLY "__sync_build_output_ix_root_amskeycb7k" ON "slice"."sync_build_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_fgejxj3qxw";

CREATE INDEX CONCURRENTLY "__sync_claim_ix_step_fxyms_236_d_4_pred_attempt_fgejxj3qxw" ON "slice"."sync_claim" USING btree ("__step_fxyms236d4", "__pred_attempt_xnnzpydhox", "__root_47s5vbj2pp");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_claim_ix_root_step_e3c7mrrjvs";

CREATE INDEX CONCURRENTLY "__sync_claim_ix_root_step_e3c7mrrjvs" ON "slice"."sync_claim" USING btree ("root", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_copy_input_ix_root_uxey54zae4";

CREATE INDEX CONCURRENTLY "__sync_copy_input_ix_root_uxey54zae4" ON "slice"."sync_copy_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_copy_output_ix_root_k6ia72urcq";

CREATE INDEX CONCURRENTLY "__sync_copy_output_ix_root_k6ia72urcq" ON "slice"."sync_copy_output" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_done_ix_root_4b7w6baznw";

CREATE INDEX CONCURRENTLY "__sync_done_ix_root_4b7w6baznw" ON "slice"."sync_done" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_due_ix_root_43jv75wrd2";

CREATE INDEX CONCURRENTLY "__sync_due_ix_root_43jv75wrd2" ON "slice"."sync_due" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_exclusive_key_ix_root_tfhjjf4qg2";

CREATE INDEX CONCURRENTLY "__sync_exclusive_key_ix_root_tfhjjf4qg2" ON "slice"."sync_exclusive_key" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_exhausted_ix_root_yqhpt7jtz4";

CREATE INDEX CONCURRENTLY "__sync_exhausted_ix_root_yqhpt7jtz4" ON "slice"."sync_exhausted" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_failed_ix_root_vh4bwqsmns";

CREATE INDEX CONCURRENTLY "__sync_failed_ix_root_vh4bwqsmns" ON "slice"."sync_failed" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_fenced_ix_root_peedftug4f";

CREATE INDEX CONCURRENTLY "__sync_fenced_ix_root_peedftug4f" ON "slice"."sync_fenced" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_finish_ix_root_zrpyhvrere";

CREATE INDEX CONCURRENTLY "__sync_finish_ix_root_zrpyhvrere" ON "slice"."sync_finish" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_finish_ix_scope_step_owsw7m5w74";

CREATE INDEX CONCURRENTLY "__sync_finish_ix_scope_step_owsw7m5w74" ON "slice"."sync_finish" USING btree ("scope", "step");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_gold_input_ix_root_fmnsnept43";

CREATE INDEX CONCURRENTLY "__sync_gold_input_ix_root_fmnsnept43" ON "slice"."sync_gold_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_held_ix_root_yxqvodlkmy";

CREATE INDEX CONCURRENTLY "__sync_held_ix_root_yxqvodlkmy" ON "slice"."sync_held" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_refusal_ix_root_642sem4ijz";

CREATE INDEX CONCURRENTLY "__sync_refusal_ix_root_642sem4ijz" ON "slice"."sync_refusal" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_result_ix_root_jbuoavfd4m";

CREATE INDEX CONCURRENTLY "__sync_result_ix_root_jbuoavfd4m" ON "slice"."sync_result" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_retry_ix_root_j5nndics7d";

CREATE INDEX CONCURRENTLY "__sync_retry_ix_root_j5nndics7d" ON "slice"."sync_retry" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_scope_ix_root_7f6s5dqo5t";

CREATE INDEX CONCURRENTLY "__sync_scope_ix_root_7f6s5dqo5t" ON "slice"."sync_scope" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_skipped_ix_root_cjefss5pid";

CREATE INDEX CONCURRENTLY "__sync_skipped_ix_root_cjefss5pid" ON "slice"."sync_skipped" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_start_scope_ix_root_scope_amosehm6j2";

CREATE INDEX CONCURRENTLY "__sync_start_scope_ix_root_scope_amosehm6j2" ON "slice"."sync_start_scope" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_start_step_ix_root_scope_5d3x6uas5c";

CREATE INDEX CONCURRENTLY "__sync_start_step_ix_root_scope_5d3x6uas5c" ON "slice"."sync_start_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_step_ix_root_scope_l4sfn7gzd3";

CREATE INDEX CONCURRENTLY "__sync_step_ix_root_scope_l4sfn7gzd3" ON "slice"."sync_step" USING btree ("root", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_sync_run_input_ix_root_bp43cbf2uj";

CREATE INDEX CONCURRENTLY "__sync_sync_run_input_ix_root_bp43cbf2uj" ON "slice"."sync_sync_run_input" USING btree ("root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_within_ix_parent_root_ukspdoqdvf";

CREATE INDEX CONCURRENTLY "__sync_within_ix_parent_root_ukspdoqdvf" ON "slice"."sync_within" USING btree ("parent", "root");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_within_ix_parent_scope_w4luz7lz7c";

CREATE INDEX CONCURRENTLY "__sync_within_ix_parent_scope_w4luz7lz7c" ON "slice"."sync_within" USING btree ("parent", "scope");

DROP INDEX CONCURRENTLY IF EXISTS "slice"."__sync_within_ix_root_mivp3mp4oa";

CREATE INDEX CONCURRENTLY "__sync_within_ix_root_mivp3mp4oa" ON "slice"."sync_within" USING btree ("root");
