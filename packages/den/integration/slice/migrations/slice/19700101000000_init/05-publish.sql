CREATE PUBLICATION "__live_wzkq6p2yii"
  FOR TABLE "slice_den"."assign_admitted" ("root", "scope"), "slice_den"."assign_claim" ("root", "step", "attempt"), "slice_den"."assign_fenced" ("root", "step", "attempt"), "slice_den"."assign_finish" ("root", "scope"), "slice_den"."assign_held" ("root", "step"), "slice_den"."assign_paused" ("target", "turn"), "slice_den"."assign_result" ("root", "step"), "slice_den"."assign_resumed" ("target", "turn"), "slice_den"."assign_retry" ("root", "step", "attempt"), "slice_den"."assign_root" ("root"), "slice_den"."assign_scope" ("root", "scope"), "slice_den"."assign_skipped" ("root", "scope"), "slice_den"."assign_step" ("root", "step"), "slice"."assigned" ("learner"), "slice_den"."audit" ("step"), "slice"."built" ("build"), "slice_den"."chain_admitted" ("root", "scope"), "slice_den"."chain_claim" ("root", "step", "attempt"), "slice_den"."chain_fenced" ("root", "step", "attempt"), "slice_den"."chain_finish" ("root", "scope"), "slice_den"."chain_held" ("root", "step"), "slice_den"."chain_paused" ("target", "turn"), "slice_den"."chain_requested_with" ("root"), "slice_den"."chain_result" ("root", "step"), "slice_den"."chain_resumed" ("target", "turn"), "slice_den"."chain_retry" ("root", "step", "attempt"), "slice_den"."chain_root" ("root"), "slice_den"."chain_scope" ("root", "scope"), "slice_den"."chain_skipped" ("root", "scope"), "slice_den"."chain_start_step" ("root", "scope", "ordinal"), "slice_den"."chain_step" ("root", "step"), "slice"."chimed" ("hour", "bell"), "slice_den"."clock_admitted" ("root", "scope"), "slice_den"."clock_claim" ("root", "step", "attempt"), "slice_den"."clock_fenced" ("root", "step", "attempt"), "slice_den"."clock_finish" ("root", "scope"), "slice_den"."clock_held" ("root", "step"), "slice_den"."clock_paused" ("target", "turn"), "slice_den"."clock_result" ("root", "step"), "slice_den"."clock_resumed" ("target", "turn"), "slice_den"."clock_retry" ("root", "step", "attempt"), "slice_den"."clock_root" ("root"), "slice_den"."clock_scope" ("root", "scope"), "slice_den"."clock_skipped" ("root", "scope"), "slice_den"."clock_step" ("root", "step"), "slice"."concluded" ("learner"), "slice"."copied" ("relation", "run"), "slice"."cursor" ("feed", "position"), "slice"."delivered" ("attempt"), "slice_den"."fan_admitted" ("root", "scope"), "slice_den"."fan_claim" ("root", "step", "attempt"), "slice_den"."fan_ended" ("root", "step", "attempt"), "slice_den"."fan_exclusive" ("kind", "key", "turn"), "slice_den"."fan_exclusive_key" ("root", "scope"), "slice_den"."fan_fenced" ("root", "step", "attempt"), "slice_den"."fan_finish" ("root", "scope"), "slice_den"."fan_held" ("root", "step"), "slice_den"."fan_hold" ("resource", "root", "step", "attempt"), "slice_den"."fan_paused" ("target", "turn"), "slice_den"."fan_released" ("kind", "key", "turn"), "slice_den"."fan_result" ("root", "step"), "slice_den"."fan_resumed" ("target", "turn"), "slice_den"."fan_retry" ("root", "step", "attempt"), "slice_den"."fan_root" ("root"), "slice_den"."fan_scope" ("root", "scope"), "slice_den"."fan_skipped" ("root", "scope"), "slice_den"."fan_start_scope" ("root", "scope", "ordinal"), "slice_den"."fan_start_step" ("root", "scope", "ordinal"), "slice_den"."fan_step" ("root", "step"), "slice_den"."fan_within" ("root", "scope"), "slice"."heard" ("key"), "slice"."item" ("feed", "seq", "n"), "slice"."order" ("order"), "slice"."passage", "slice_den"."retry_admitted" ("root", "scope"), "slice_den"."retry_claim" ("root", "step", "attempt"), "slice_den"."retry_exhausted" ("root", "step"), "slice_den"."retry_fenced" ("root", "step", "attempt"), "slice_den"."retry_finish" ("root", "scope"), "slice_den"."retry_held" ("root", "step"), "slice_den"."retry_paused" ("target", "turn"), "slice_den"."retry_result" ("root", "step"), "slice_den"."retry_resumed" ("target", "turn"), "slice_den"."retry_retry" ("root", "step", "attempt"), "slice_den"."retry_root" ("root"), "slice_den"."retry_scope" ("root", "scope"), "slice_den"."retry_skipped" ("root", "scope"), "slice_den"."retry_step" ("root", "step"), "slice_den"."review_admitted" ("root", "scope"), "slice_den"."review_claim" ("root", "step", "attempt"), "slice_den"."review_ended" ("root", "step", "attempt"), "slice_den"."review_fenced" ("root", "step", "attempt"), "slice_den"."review_finish" ("root", "scope"), "slice_den"."review_held" ("root", "step"), "slice_den"."review_hold" ("resource", "root", "step", "attempt"), "slice_den"."review_paused" ("target", "turn"), "slice_den"."review_result" ("root", "step"), "slice_den"."review_resumed" ("target", "turn"), "slice_den"."review_retry" ("root", "step", "attempt"), "slice_den"."review_root" ("root"), "slice_den"."review_scope" ("root", "scope"), "slice_den"."review_skipped" ("root", "scope"), "slice_den"."review_step" ("root", "step"), "slice_den"."review_within" ("root", "scope"), "slice"."reviewed" ("review", "group"), "slice"."seen" ("learner", "passage"), "slice"."settled" ("batch"), "slice"."summary" ("review"), "slice_den"."sync_admitted" ("root", "scope"), "slice_den"."sync_claim" ("root", "step", "attempt"), "slice_den"."sync_exclusive" ("kind", "key", "turn"), "slice_den"."sync_exclusive_key" ("root", "scope"), "slice_den"."sync_fenced" ("root", "step", "attempt"), "slice_den"."sync_finish" ("root", "scope"), "slice_den"."sync_held" ("root", "step"), "slice_den"."sync_paused" ("target", "turn"), "slice_den"."sync_released" ("kind", "key", "turn"), "slice_den"."sync_result" ("root", "step"), "slice_den"."sync_resumed" ("target", "turn"), "slice_den"."sync_retry" ("root", "step", "attempt"), "slice_den"."sync_root" ("root"), "slice_den"."sync_scope" ("root", "scope"), "slice_den"."sync_skipped" ("root", "scope"), "slice_den"."sync_step" ("root", "step"), "slice"."tally" ("batch"), "slice"."weight" ("feed", "factor"), "slice_den"."writeback_admitted" ("root", "scope"), "slice_den"."writeback_claim" ("root", "step", "attempt"), "slice_den"."writeback_fenced" ("root", "step", "attempt"), "slice_den"."writeback_finish" ("root", "scope"), "slice_den"."writeback_held" ("root", "step"), "slice_den"."writeback_paused" ("target", "turn"), "slice_den"."writeback_result" ("root", "step"), "slice_den"."writeback_resumed" ("target", "turn"), "slice_den"."writeback_retry" ("root", "step", "attempt"), "slice_den"."writeback_root" ("root"), "slice_den"."writeback_scope" ("root", "scope"), "slice_den"."writeback_skipped" ("root", "scope"), "slice_den"."writeback_step" ("root", "step"), "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" ("root", "scope", "ordinal"), "slice_den"."assign_assignment_input_kijoknpmnpomn" ("root", "scope"), "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" ("root", "scope"), "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" ("root", "scope"), "slice_den"."assign_assignment_input_near_acilimddcfjog" ("root", "scope", "ordinal"), "slice_den"."assign_decide_input_exclude_bpjgmijefddch" ("root", "step", "ordinal"), "slice_den"."assign_decide_input_ffhdojphbdjfc" ("root", "step"), "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" ("root", "step"), "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" ("root", "step"), "slice_den"."assign_decide_output_fkgbaoobeoima" ("root", "step"), "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" ("root", "step"), "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" ("root", "step"), "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" ("root", "step", "ordinal"), "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" ("root", "step", "ordinal"), "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" ("digest"), "slice_den"."assign_decide_read_seen_oahojgbpphboo" ("root", "step", "ordinal"), "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" ("digest"), "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" ("root", "step", "ordinal"), "slice_den"."assign_embed_input_kmlepfpdepkmo" ("root", "step"), "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" ("root", "step"), "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" ("root", "step"), "slice_den"."assign_embed_input_near_dhffcaodkgemm" ("root", "step", "ordinal"), "slice_den"."chain_chain_run_input_glnkafcnkbnnn" ("root", "scope"), "slice_den"."chain_next_bbflpfpnlejpm" ("root", "from", "ordinal"), "slice_den"."chain_ordered_input_pbjpmafopnahk" ("root", "scope"), "slice_den"."chain_page_input_after_gdigbcabbnakb" ("root", "step"), "slice_den"."chain_page_input_jhliinhchcgno" ("root", "step"), "slice_den"."chain_page_output_dniojohpmhcee" ("root", "step"), "slice_den"."chain_page_output_next_pocjijjpkpono" ("root", "step"), "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" ("digest"), "slice_den"."chain_page_read_tree_items_cokakfjlndgem" ("digest", "at"), "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" ("digest", "at"), "slice_den"."chain_page_read_tree_lakencnpkciin" ("root", "step", "ordinal"), "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" ("digest"), "slice_den"."chain_page_read_weights_agiabippcbobb" ("root", "step", "ordinal"), "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" ("digest"), "slice_den"."clock_chime_input_bfjhiocgaifco" ("root", "step"), "slice_den"."clock_close_input_bajjphdpmhlbc" ("root", "step"), "slice_den"."clock_hourly_input_nknibbhbedpnl" ("root", "scope"), "slice_den"."clock_sitting_input_bckcjcndffgmo" ("root", "scope"), "slice_den"."fan_batch_finish_output_djinnhndkglgj" ("root", "step"), "slice_den"."fan_batch_input_hjhhnklpfiilh" ("root", "scope"), "slice_den"."fan_dust_input_lelfhikaelkja" ("root", "step"), "slice_den"."fan_fan_run_input_bghibckinpfgk" ("root", "scope"), "slice_den"."fan_mop_input_ngghbiaegmghl" ("root", "step"), "slice_den"."fan_square_input_ifddbjkaokoig" ("root", "step"), "slice_den"."fan_square_output_gofcfljmlelgo" ("root", "step"), "slice_den"."fan_sweep_input_bnmfcblhkahec" ("root", "scope"), "slice_den"."fan_wanted_input_nfecjpihiaope" ("root", "scope"), "slice_den"."fan_wanted_key_ldjmcglkghhjb" ("root"), "slice_den"."retry_brittle_input_jbcpaiekdedpp" ("root", "step"), "slice_den"."retry_brittle_output_bajcdgadpoeak" ("root", "step"), "slice_den"."retry_ladders_input_fkbbgblmfmhbi" ("root", "scope"), "slice_den"."retry_patient_input_ndliolfjpjnoc" ("root", "step"), "slice_den"."retry_patient_output_geoaicaaojcfl" ("root", "step"), "slice_den"."retry_polite_input_iopjdjgdhfide" ("root", "step"), "slice_den"."retry_polite_output_nicaghgpaemah" ("root", "step"), "slice_den"."retry_steadfast_input_ebanfagjeadim" ("root", "step"), "slice_den"."retry_steadfast_output_aacklbgjpefbn" ("root", "step"), "slice_den"."retry_throttled_input_bfjgfamhjmgcd" ("root", "scope"), "slice_den"."retry_unhurried_input_mccbdnleajjif" ("root", "scope"), "slice_den"."review_analyze_input_aobppbhebnkae" ("root", "step"), "slice_den"."review_analyze_output_fhhkmphnmpkdm" ("root", "step"), "slice_den"."review_gather_input_eiadkjkkdoiel" ("root", "step"), "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" ("root", "step", "ordinal"), "slice_den"."review_questions_finish_output_kddidbknbjeof" ("root", "step"), "slice_den"."review_questions_input_jigaomgjefjfk" ("root", "scope"), "slice_den"."review_review_run_input_hpdfjnehnkdig" ("root", "scope"), "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" ("root", "scope", "ordinal"), "slice_den"."review_save_input_njbdjgekhblef" ("root", "step"), "slice_den"."review_save_output_falmopiohdlkl" ("root", "step"), "slice_den"."sync_build_input_khidlilbdjpfi" ("root", "step"), "slice_den"."sync_copy_input_fijfgeannmgef" ("root", "step"), "slice_den"."sync_gold_input_edhkhlceilnoh" ("root", "scope"), "slice_den"."sync_sync_run_input_kmejgmkijpoho" ("root", "scope"), "slice_den"."writeback_deliver_input_libhnkibecamc" ("root", "step"), "slice_den"."writeback_writeback_input_ljafdhfgfeocc" ("root", "scope"), "slice"."__ledger"
  WITH (publish_generated_columns = stored);

SELECT "r1"."c1"::"slice"."__domain_gfw43vigph" AS "value"
FROM (VALUES (2::bigint)) AS "r1"("c1");

CREATE ROLE :"slice_seats__app" LOGIN NOINHERIT;

CREATE ROLE :"slice_seats__assign_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__assign_den" NOLOGIN;

CREATE ROLE :"slice_seats__assign_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__auditor" NOLOGIN;

CREATE ROLE :"slice_seats__chain_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__chain_den" NOLOGIN;

CREATE ROLE :"slice_seats__chain_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__clock_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__clock_den" NOLOGIN;

CREATE ROLE :"slice_seats__clock_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__editor" NOLOGIN;

CREATE ROLE :"slice_seats__fan_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__fan_den" NOLOGIN;

CREATE ROLE :"slice_seats__fan_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__loader" NOLOGIN;

CREATE ROLE :"slice_seats__retry_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__retry_den" NOLOGIN;

CREATE ROLE :"slice_seats__retry_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__review_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__review_den" NOLOGIN;

CREATE ROLE :"slice_seats__review_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__sync_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__sync_den" NOLOGIN;

CREATE ROLE :"slice_seats__sync_retirer" NOLOGIN;

CREATE ROLE :"slice_seats__worker" LOGIN NOINHERIT;

CREATE ROLE :"slice_seats__writeback_coordinator" NOLOGIN;

CREATE ROLE :"slice_seats__writeback_den" NOLOGIN;

CREATE ROLE :"slice_seats__writeback_retirer" NOLOGIN;

CREATE ROLE :"__live_wzkq6p2yii" LOGIN NOINHERIT;

CREATE SCHEMA "__slice";

CREATE SCHEMA "__slice_den";

CREATE SCHEMA "slice_seats__fan_den";

CREATE SCHEMA "slice_seats__review_den";

CREATE VIEW "__slice"."assigned" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."assigned" AS "r1";

CREATE VIEW "__slice"."built" ("build", "at") AS
SELECT "r1"."build", "r1"."at"
FROM "slice"."built" AS "r1";

CREATE VIEW "__slice"."chimed" ("hour", "bell") AS
SELECT "r1"."hour", "r1"."bell"
FROM "slice"."chimed" AS "r1";

CREATE VIEW "__slice"."concluded" ("learner", "served", "weighed") AS
SELECT "r1"."learner", "r1"."served", "r1"."weighed"
FROM "slice"."concluded" AS "r1";

CREATE VIEW "__slice"."copied" ("relation", "run") AS
SELECT "r1"."relation", "r1"."run"
FROM "slice"."copied" AS "r1";

CREATE VIEW "__slice"."cursor" ("feed", "feed_name", "position") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."position"
FROM "slice"."cursor" AS "r1";

CREATE VIEW "__slice"."delivered" ("attempt") AS
SELECT "r1"."attempt"
FROM "slice"."delivered" AS "r1";

CREATE VIEW "__slice"."heard" ("key", "answered") AS
SELECT "r1"."key", "r1"."answered"
FROM "slice"."heard" AS "r1";

CREATE VIEW "__slice"."item" ("feed", "feed_name", "seq", "n") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice"."item" AS "r1";

CREATE VIEW "__slice"."order" ("order", "feed", "feed_name") AS
SELECT "r1"."order", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text"
FROM "slice"."order" AS "r1";

CREATE VIEW "__slice"."passage" ("passage", "topic", "embedding") AS
SELECT "r1"."passage", "r1"."topic", "r1"."embedding"
FROM "slice"."passage" AS "r1";

CREATE VIEW "__slice"."reviewed" ("review", "group", "count", "total") AS
SELECT "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice"."reviewed" AS "r1";

CREATE VIEW "__slice"."seen" ("learner", "passage") AS
SELECT "r1"."learner", "r1"."passage"
FROM "slice"."seen" AS "r1";

CREATE VIEW "__slice"."settled" ("batch") AS
SELECT "r1"."batch"
FROM "slice"."settled" AS "r1";

CREATE VIEW "__slice"."summary" ("review", "groups", "total") AS
SELECT "r1"."review", "r1"."groups", "r1"."total"
FROM "slice"."summary" AS "r1";

CREATE VIEW "__slice"."tally" ("batch", "count", "total") AS
SELECT "r1"."batch", "r1"."count", "r1"."total"
FROM "slice"."tally" AS "r1";

CREATE VIEW "__slice"."want" ("batch", "size") AS
SELECT "r1"."batch", "r1"."size"
FROM "slice"."want" AS "r1";

CREATE VIEW "__slice"."weight" ("feed", "feed_name", "factor") AS
SELECT "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice"."weight" AS "r1";

CREATE VIEW "__slice_den"."assign_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_admitted" AS "r1";

CREATE VIEW "__slice_den"."assign_asked_fobgfofknpfgd" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."assign_asked_fobgfofknpfgd" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_exclude_paaebdpkimebl" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_kijoknpmnpomn" ("root", "scope", "learner", "topic", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_assignment_input_kijoknpmnpomn" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" ("root", "scope", "radius") AS
SELECT "r1"."root", "r1"."scope", "r1"."radius"
FROM "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" AS "r1";

CREATE VIEW "__slice_den"."assign_assignment_input_near_acilimddcfjog" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_assignment_input_near_acilimddcfjog" AS "r1";

CREATE VIEW "__slice_den"."assign_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."assign_claim" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_exclude_bpjgmijefddch" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_decide_input_exclude_bpjgmijefddch" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_ffhdojphbdjfc" ("root", "step", "learner", "topic", "vector", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."step", "r1"."learner", "r1"."topic", "r1"."vector", "r1"."mode", ("slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_decide_input_ffhdojphbdjfc" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" ("root", "step", "radius") AS
SELECT "r1"."root", "r1"."step", "r1"."radius"
FROM "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_fkgbaoobeoima" ("root", "step", "confidence", "stage", "stage_name") AS
SELECT "r1"."root", "r1"."step", "r1"."confidence", "r1"."stage", ("slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"())["r1"."stage" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_decide_output_fkgbaoobeoima" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" ("root", "step", "passage", "distance") AS
SELECT "r1"."root", "r1"."step", "r1"."passage", "r1"."distance"
FROM "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" ("root", "step", "ordinal", "passage", "distance", "passed") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."passage", "r1"."distance", "r1"."passed"
FROM "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" AS "r1";

CREATE VIEW "__slice_den"."assign_decide_read_seen_oahojgbpphboo" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."assign_decide_read_seen_oahojgbpphboo" AS "r1";

CREATE VIEW "__slice_den"."assign_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_done" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_kmlepfpdepkmo" ("root", "step", "learner", "topic", "mode", "mode_name") AS
SELECT "r1"."root", "r1"."step", "r1"."learner", "r1"."topic", "r1"."mode", ("slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"())["r1"."mode" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_embed_input_kmlepfpdepkmo" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" ("root", "step", "radius") AS
SELECT "r1"."root", "r1"."step", "r1"."radius"
FROM "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_input_near_dhffcaodkgemm" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."assign_embed_input_near_dhffcaodkgemm" AS "r1";

CREATE VIEW "__slice_den"."assign_embed_output_ghdpbieopfmkd" ("root", "step", "vector") AS
SELECT "r1"."root", "r1"."step", "r1"."vector"
FROM "slice_den"."assign_embed_output_ghdpbieopfmkd" AS "r1";

CREATE VIEW "__slice_den"."assign_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_ended" AS "r1";

CREATE VIEW "__slice_den"."assign_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_exhausted" AS "r1";

CREATE VIEW "__slice_den"."assign_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."assign_failed" AS "r1";

CREATE VIEW "__slice_den"."assign_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_fenced" AS "r1";

CREATE VIEW "__slice_den"."assign_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."assign_finish" AS "r1";

CREATE VIEW "__slice_den"."assign_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."assign_held" AS "r1";

CREATE VIEW "__slice_den"."assign_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_paused" AS "r1";

CREATE VIEW "__slice_den"."assign_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."assign_refusal" AS "r1";

CREATE VIEW "__slice_den"."assign_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."assign_requested_with" AS "r1";

CREATE VIEW "__slice_den"."assign_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__assign_outcome_names_2mccfiah6k"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_result" AS "r1";

CREATE VIEW "__slice_den"."assign_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__assign_pausable_names_r7pjdx7o42"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."assign_resumed" AS "r1";

CREATE VIEW "__slice_den"."assign_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__assign_retry_why_names_5ckzenntb2"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."assign_retry" AS "r1";

CREATE VIEW "__slice_den"."assign_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__assign_root_kind_names_opbaefdfbo"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."assign_root" AS "r1";

CREATE VIEW "__slice_den"."assign_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."assign_scope" AS "r1";

CREATE VIEW "__slice_den"."assign_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."assign_served" AS "r1";

CREATE VIEW "__slice_den"."assign_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."assign_skipped" AS "r1";

CREATE VIEW "__slice_den"."assign_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."assign_start_step" AS "r1";

CREATE VIEW "__slice_den"."assign_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__assign_kind_names_rtvscvwquk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."assign_step" AS "r1";

CREATE VIEW "__slice_den"."audit" ("step", "root", "note") AS
SELECT "r1"."step", "r1"."root", "r1"."note"
FROM "slice_den"."audit" AS "r1";

CREATE VIEW "__slice_den"."chain_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."chain_admitted" AS "r1";

CREATE VIEW "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" AS "r1";

CREATE VIEW "__slice_den"."chain_chain_run_input_glnkafcnkbnnn" ("root", "scope", "feed", "feed_name", "pages") AS
SELECT "r1"."root", "r1"."scope", "r1"."feed", ("slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice_den"."chain_chain_run_input_glnkafcnkbnnn" AS "r1";

CREATE VIEW "__slice_den"."chain_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."chain_claim" AS "r1";

CREATE VIEW "__slice_den"."chain_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_done" AS "r1";

CREATE VIEW "__slice_den"."chain_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_ended" AS "r1";

CREATE VIEW "__slice_den"."chain_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_exhausted" AS "r1";

CREATE VIEW "__slice_den"."chain_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_failed" AS "r1";

CREATE VIEW "__slice_den"."chain_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_fenced" AS "r1";

CREATE VIEW "__slice_den"."chain_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."chain_finish" AS "r1";

CREATE VIEW "__slice_den"."chain_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."chain_held" AS "r1";

CREATE VIEW "__slice_den"."chain_next_bbflpfpnlejpm" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."chain_next_bbflpfpnlejpm" AS "r1";

CREATE VIEW "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" AS "r1";

CREATE VIEW "__slice_den"."chain_ordered_input_pbjpmafopnahk" ("root", "scope", "feed", "feed_name", "pages") AS
SELECT "r1"."root", "r1"."scope", "r1"."feed", ("slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."pages"
FROM "slice_den"."chain_ordered_input_pbjpmafopnahk" AS "r1";

CREATE VIEW "__slice_den"."chain_page_input_after_gdigbcabbnakb" ("root", "step", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."value"
FROM "slice_den"."chain_page_input_after_gdigbcabbnakb" AS "r1";

CREATE VIEW "__slice_den"."chain_page_input_jhliinhchcgno" ("root", "step", "feed", "feed_name", "seq", "pages") AS
SELECT "r1"."root", "r1"."step", "r1"."feed", ("slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."pages"
FROM "slice_den"."chain_page_input_jhliinhchcgno" AS "r1";

CREATE VIEW "__slice_den"."chain_page_output_dniojohpmhcee" ("root", "step", "seq", "items", "earlier") AS
SELECT "r1"."root", "r1"."step", "r1"."seq", "r1"."items", "r1"."earlier"
FROM "slice_den"."chain_page_output_dniojohpmhcee" AS "r1";

CREATE VIEW "__slice_den"."chain_page_output_next_pocjijjpkpono" ("root", "step", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."value"
FROM "slice_den"."chain_page_output_next_pocjijjpkpono" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_earlier_dgehlbgebidjc" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_earlier_dgehlbgebidjc" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree_items_cokakfjlndgem" ("digest", "at", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."at", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."chain_page_read_tree_items_cokakfjlndgem" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" ("digest", "at") AS
SELECT "r1"."digest", "r1"."at"
FROM "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_tree_lakencnpkciin" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_tree_lakencnpkciin" AS "r1";

CREATE VIEW "__slice_den"."chain_page_read_weights_agiabippcbobb" ("root", "step", "ordinal", "digest") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."digest"
FROM "slice_den"."chain_page_read_weights_agiabippcbobb" AS "r1";

CREATE VIEW "__slice_den"."chain_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_paused" AS "r1";

CREATE VIEW "__slice_den"."chain_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."chain_refusal" AS "r1";

CREATE VIEW "__slice_den"."chain_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."chain_requested_with" AS "r1";

CREATE VIEW "__slice_den"."chain_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__chain_outcome_names_vo4tgqx6qh"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."chain_result" AS "r1";

CREATE VIEW "__slice_den"."chain_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__chain_pausable_names_vjdoymenyq"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."chain_resumed" AS "r1";

CREATE VIEW "__slice_den"."chain_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__chain_retry_why_names_zmog33hzfy"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."chain_retry" AS "r1";

CREATE VIEW "__slice_den"."chain_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__chain_root_kind_names_ndmuh43zki"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."chain_root" AS "r1";

CREATE VIEW "__slice_den"."chain_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."chain_scope" AS "r1";

CREATE VIEW "__slice_den"."chain_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."chain_served" AS "r1";

CREATE VIEW "__slice_den"."chain_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."chain_skipped" AS "r1";

CREATE VIEW "__slice_den"."chain_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."chain_start_step" AS "r1";

CREATE VIEW "__slice_den"."chain_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__chain_kind_names_oubqrwjyau"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."chain_step" AS "r1";

CREATE VIEW "__slice_den"."clock_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."clock_admitted" AS "r1";

CREATE VIEW "__slice_den"."clock_chime_input_bfjhiocgaifco" ("root", "step", "hour", "bell") AS
SELECT "r1"."root", "r1"."step", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_chime_input_bfjhiocgaifco" AS "r1";

CREATE VIEW "__slice_den"."clock_chime_output_bddonoddgecmi" ("root", "step", "hour", "bell") AS
SELECT "r1"."root", "r1"."step", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_chime_output_bddonoddgecmi" AS "r1";

CREATE VIEW "__slice_den"."clock_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."clock_claim" AS "r1";

CREATE VIEW "__slice_den"."clock_close_input_bajjphdpmhlbc" ("root", "step", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."step", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_close_input_bajjphdpmhlbc" AS "r1";

CREATE VIEW "__slice_den"."clock_close_output_aoheikcdnbjpp" ("root", "step", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."step", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_close_output_aoheikcdnbjpp" AS "r1";

CREATE VIEW "__slice_den"."clock_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_done" AS "r1";

CREATE VIEW "__slice_den"."clock_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_ended" AS "r1";

CREATE VIEW "__slice_den"."clock_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_exhausted" AS "r1";

CREATE VIEW "__slice_den"."clock_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_failed" AS "r1";

CREATE VIEW "__slice_den"."clock_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_fenced" AS "r1";

CREATE VIEW "__slice_den"."clock_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."clock_finish" AS "r1";

CREATE VIEW "__slice_den"."clock_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."clock_held" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_finish_output_mgokiakijlfbi" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_input_nknibbhbedpnl" ("root", "scope", "hour", "bell") AS
SELECT "r1"."root", "r1"."scope", "r1"."hour", "r1"."bell"
FROM "slice_den"."clock_hourly_input_nknibbhbedpnl" AS "r1";

CREATE VIEW "__slice_den"."clock_hourly_key_cnlgnmcbbcgma" ("root", "at", "member", "member_digest") AS
SELECT "r1"."root", "r1"."at", "r1"."member", "r1"."member_digest"
FROM "slice_den"."clock_hourly_key_cnlgnmcbbcgma" AS "r1";

CREATE VIEW "__slice_den"."clock_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_paused" AS "r1";

CREATE VIEW "__slice_den"."clock_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."clock_refusal" AS "r1";

CREATE VIEW "__slice_den"."clock_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."clock_requested_with" AS "r1";

CREATE VIEW "__slice_den"."clock_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__clock_outcome_names_rqtqczot4q"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."clock_result" AS "r1";

CREATE VIEW "__slice_den"."clock_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__clock_pausable_names_phjbr2fipl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."clock_resumed" AS "r1";

CREATE VIEW "__slice_den"."clock_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__clock_retry_why_names_pjdgx4s6a4"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."clock_retry" AS "r1";

CREATE VIEW "__slice_den"."clock_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__clock_root_kind_names_3kro23qfv4"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."clock_root" AS "r1";

CREATE VIEW "__slice_den"."clock_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."clock_scope" AS "r1";

CREATE VIEW "__slice_den"."clock_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."clock_served" AS "r1";

CREATE VIEW "__slice_den"."clock_sitting_finish_output_aahppmdaoafco" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."clock_sitting_finish_output_aahppmdaoafco" AS "r1";

CREATE VIEW "__slice_den"."clock_sitting_input_bckcjcndffgmo" ("root", "scope", "sitting", "deadline") AS
SELECT "r1"."root", "r1"."scope", "r1"."sitting", "r1"."deadline"
FROM "slice_den"."clock_sitting_input_bckcjcndffgmo" AS "r1";

CREATE VIEW "__slice_den"."clock_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."clock_skipped" AS "r1";

CREATE VIEW "__slice_den"."clock_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."clock_start_step" AS "r1";

CREATE VIEW "__slice_den"."clock_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__clock_kind_names_7yqk67pwg5"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."clock_step" AS "r1";

CREATE VIEW "__slice_den"."fan_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."fan_admitted" AS "r1";

CREATE VIEW "__slice_den"."fan_batch_finish_output_djinnhndkglgj" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_batch_finish_output_djinnhndkglgj" AS "r1";

CREATE VIEW "__slice_den"."fan_batch_input_hjhhnklpfiilh" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_batch_input_hjhhnklpfiilh" AS "r1";

CREATE VIEW "__slice_den"."fan_claim" ("root", "step", "attempt", "until", "holds") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds"
FROM "slice_den"."fan_claim" AS "r1";

CREATE VIEW "__slice_den"."fan_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_done" AS "r1";

CREATE VIEW "__slice_den"."fan_dust_input_lelfhikaelkja" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_dust_input_lelfhikaelkja" AS "r1";

CREATE VIEW "__slice_den"."fan_dust_output_pgpcjjjdmhkim" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_dust_output_pgpcjjjdmhkim" AS "r1";

CREATE VIEW "__slice_den"."fan_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_ended" AS "r1";

CREATE VIEW "__slice_den"."fan_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."fan_exclusive" AS "r1";

CREATE VIEW "__slice_den"."fan_exclusive_key" ("root", "scope", "key", "id") AS
SELECT "r1"."root", "r1"."scope", "r1"."key", "r1"."id"
FROM "slice_den"."fan_exclusive_key" AS "r1";

CREATE VIEW "__slice_den"."fan_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_exhausted" AS "r1";

CREATE VIEW "__slice_den"."fan_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_failed" AS "r1";

CREATE VIEW "__slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" AS "r1";

CREATE VIEW "__slice_den"."fan_fan_run_input_bghibckinpfgk" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_fan_run_input_bghibckinpfgk" AS "r1";

CREATE VIEW "__slice_den"."fan_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_fenced" AS "r1";

CREATE VIEW "__slice_den"."fan_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."fan_finish" AS "r1";

CREATE VIEW "__slice_den"."fan_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."fan_held" AS "r1";

CREATE VIEW "__slice_den"."fan_hold" ("resource", "resource_name", "root", "step", "attempt", "at", "seat") AS
SELECT "r1"."resource", ("slice"."__fan_resource_names_tugc7yp6xo"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."seat"
FROM "slice_den"."fan_hold" AS "r1";

CREATE VIEW "__slice_den"."fan_mop_input_ngghbiaegmghl" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_mop_input_ngghbiaegmghl" AS "r1";

CREATE VIEW "__slice_den"."fan_mop_output_okmfngilefbec" ("root", "step", "sweep") AS
SELECT "r1"."root", "r1"."step", "r1"."sweep"
FROM "slice_den"."fan_mop_output_okmfngilefbec" AS "r1";

CREATE VIEW "__slice_den"."fan_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_fpk6cvxfiv"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_paused" AS "r1";

CREATE VIEW "__slice_den"."fan_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."fan_refusal" AS "r1";

CREATE VIEW "__slice_den"."fan_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."fan_released" AS "r1";

CREATE VIEW "__slice_den"."fan_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."fan_requested_with" AS "r1";

CREATE VIEW "__slice_den"."fan_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__fan_outcome_names_7pbhseigfj"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_result" AS "r1";

CREATE VIEW "__slice_den"."fan_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__fan_pausable_names_fpk6cvxfiv"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."fan_resumed" AS "r1";

CREATE VIEW "__slice_den"."fan_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__fan_retry_why_names_shpypqrqhk"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_retry" AS "r1";

CREATE VIEW "__slice_den"."fan_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__fan_root_kind_names_jqlbcidhe6"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."fan_root" AS "r1";

CREATE VIEW "__slice_den"."fan_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."fan_scope" AS "r1";

CREATE VIEW "__slice_den"."fan_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."fan_served" AS "r1";

CREATE VIEW "__slice_den"."fan_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."fan_skipped" AS "r1";

CREATE VIEW "__slice_den"."fan_square_input_ifddbjkaokoig" ("root", "step", "batch", "n") AS
SELECT "r1"."root", "r1"."step", "r1"."batch", "r1"."n"
FROM "slice_den"."fan_square_input_ifddbjkaokoig" AS "r1";

CREATE VIEW "__slice_den"."fan_square_output_gofcfljmlelgo" ("root", "step", "square") AS
SELECT "r1"."root", "r1"."step", "r1"."square"
FROM "slice_den"."fan_square_output_gofcfljmlelgo" AS "r1";

CREATE VIEW "__slice_den"."fan_start_scope" ("root", "scope", "ordinal", "child") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice_den"."fan_start_scope" AS "r1";

CREATE VIEW "__slice_den"."fan_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."fan_start_step" AS "r1";

CREATE VIEW "__slice_den"."fan_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__fan_kind_names_6jgkvuzg33"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."fan_step" AS "r1";

CREATE VIEW "__slice_den"."fan_sweep_finish_output_nebomlkgaabji" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_sweep_finish_output_nebomlkgaabji" AS "r1";

CREATE VIEW "__slice_den"."fan_sweep_input_bnmfcblhkahec" ("root", "scope", "sweep") AS
SELECT "r1"."root", "r1"."scope", "r1"."sweep"
FROM "slice_den"."fan_sweep_input_bnmfcblhkahec" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_input_nfecjpihiaope" ("root", "scope", "batch", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."batch", "r1"."size"
FROM "slice_den"."fan_wanted_input_nfecjpihiaope" AS "r1";

CREATE VIEW "__slice_den"."fan_wanted_key_ldjmcglkghhjb" ("root", "batch", "batch_digest") AS
SELECT "r1"."root", "r1"."batch", "r1"."batch_digest"
FROM "slice_den"."fan_wanted_key_ldjmcglkghhjb" AS "r1";

CREATE VIEW "__slice_den"."fan_within" ("root", "scope", "parent", "kind", "kind_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__fan_child_kind_names_i6k53d3e2e"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice_den"."fan_within" AS "r1";

CREATE VIEW "__slice_den"."retry_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."retry_admitted" AS "r1";

CREATE VIEW "__slice_den"."retry_brittle_input_jbcpaiekdedpp" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_brittle_input_jbcpaiekdedpp" AS "r1";

CREATE VIEW "__slice_den"."retry_brittle_output_bajcdgadpoeak" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_brittle_output_bajcdgadpoeak" AS "r1";

CREATE VIEW "__slice_den"."retry_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."retry_claim" AS "r1";

CREATE VIEW "__slice_den"."retry_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_done" AS "r1";

CREATE VIEW "__slice_den"."retry_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_ended" AS "r1";

CREATE VIEW "__slice_den"."retry_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_exhausted" AS "r1";

CREATE VIEW "__slice_den"."retry_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_failed" AS "r1";

CREATE VIEW "__slice_den"."retry_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_fenced" AS "r1";

CREATE VIEW "__slice_den"."retry_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."retry_finish" AS "r1";

CREATE VIEW "__slice_den"."retry_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."retry_held" AS "r1";

CREATE VIEW "__slice_den"."retry_ladders_finish_output_pgebkobjaoiih" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" AS "r1";

CREATE VIEW "__slice_den"."retry_ladders_input_fkbbgblmfmhbi" ("root", "scope", "steadfast", "brittle") AS
SELECT "r1"."root", "r1"."scope", "r1"."steadfast", "r1"."brittle"
FROM "slice_den"."retry_ladders_input_fkbbgblmfmhbi" AS "r1";

CREATE VIEW "__slice_den"."retry_patient_input_ndliolfjpjnoc" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_patient_input_ndliolfjpjnoc" AS "r1";

CREATE VIEW "__slice_den"."retry_patient_output_geoaicaaojcfl" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_patient_output_geoaicaaojcfl" AS "r1";

CREATE VIEW "__slice_den"."retry_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_paused" AS "r1";

CREATE VIEW "__slice_den"."retry_polite_input_iopjdjgdhfide" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_polite_input_iopjdjgdhfide" AS "r1";

CREATE VIEW "__slice_den"."retry_polite_output_nicaghgpaemah" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_polite_output_nicaghgpaemah" AS "r1";

CREATE VIEW "__slice_den"."retry_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."retry_refusal" AS "r1";

CREATE VIEW "__slice_den"."retry_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."retry_requested_with" AS "r1";

CREATE VIEW "__slice_den"."retry_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__retry_outcome_names_zzz2kawwsa"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."retry_result" AS "r1";

CREATE VIEW "__slice_den"."retry_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__retry_pausable_names_hen5ycf77m"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."retry_resumed" AS "r1";

CREATE VIEW "__slice_den"."retry_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__retry_retry_why_names_pwmdyzqghs"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."retry_retry" AS "r1";

CREATE VIEW "__slice_den"."retry_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__retry_root_kind_names_bhf4onc7wq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."retry_root" AS "r1";

CREATE VIEW "__slice_den"."retry_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."retry_scope" AS "r1";

CREATE VIEW "__slice_den"."retry_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."retry_served" AS "r1";

CREATE VIEW "__slice_den"."retry_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."retry_skipped" AS "r1";

CREATE VIEW "__slice_den"."retry_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."retry_start_step" AS "r1";

CREATE VIEW "__slice_den"."retry_steadfast_input_ebanfagjeadim" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_steadfast_input_ebanfagjeadim" AS "r1";

CREATE VIEW "__slice_den"."retry_steadfast_output_aacklbgjpefbn" ("root", "step", "key") AS
SELECT "r1"."root", "r1"."step", "r1"."key"
FROM "slice_den"."retry_steadfast_output_aacklbgjpefbn" AS "r1";

CREATE VIEW "__slice_den"."retry_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__retry_kind_names_yg2tu5rejg"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."retry_step" AS "r1";

CREATE VIEW "__slice_den"."retry_throttled_finish_output_plgallgljmddo" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_throttled_finish_output_plgallgljmddo" AS "r1";

CREATE VIEW "__slice_den"."retry_throttled_input_bfjgfamhjmgcd" ("root", "scope", "key") AS
SELECT "r1"."root", "r1"."scope", "r1"."key"
FROM "slice_den"."retry_throttled_input_bfjgfamhjmgcd" AS "r1";

CREATE VIEW "__slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" AS "r1";

CREATE VIEW "__slice_den"."retry_unhurried_input_mccbdnleajjif" ("root", "scope", "key") AS
SELECT "r1"."root", "r1"."scope", "r1"."key"
FROM "slice_den"."retry_unhurried_input_mccbdnleajjif" AS "r1";

CREATE VIEW "__slice_den"."review_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."review_admitted" AS "r1";

CREATE VIEW "__slice_den"."review_analyze_input_aobppbhebnkae" ("root", "step", "review", "group", "question") AS
SELECT "r1"."root", "r1"."step", "r1"."review", "r1"."group", "r1"."question"
FROM "slice_den"."review_analyze_input_aobppbhebnkae" AS "r1";

CREATE VIEW "__slice_den"."review_analyze_output_fhhkmphnmpkdm" ("root", "step", "score") AS
SELECT "r1"."root", "r1"."step", "r1"."score"
FROM "slice_den"."review_analyze_output_fhhkmphnmpkdm" AS "r1";

CREATE VIEW "__slice_den"."review_claim" ("root", "step", "attempt", "until", "holds") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until", "r1"."holds"
FROM "slice_den"."review_claim" AS "r1";

CREATE VIEW "__slice_den"."review_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_done" AS "r1";

CREATE VIEW "__slice_den"."review_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_ended" AS "r1";

CREATE VIEW "__slice_den"."review_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_exhausted" AS "r1";

CREATE VIEW "__slice_den"."review_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_failed" AS "r1";

CREATE VIEW "__slice_den"."review_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_fenced" AS "r1";

CREATE VIEW "__slice_den"."review_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."review_finish" AS "r1";

CREATE VIEW "__slice_den"."review_gather_input_eiadkjkkdoiel" ("root", "step", "review") AS
SELECT "r1"."root", "r1"."step", "r1"."review"
FROM "slice_den"."review_gather_input_eiadkjkkdoiel" AS "r1";

CREATE VIEW "__slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" ("root", "step", "ordinal", "value") AS
SELECT "r1"."root", "r1"."step", "r1"."ordinal", "r1"."value"
FROM "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" AS "r1";

CREATE VIEW "__slice_den"."review_gather_output_cgnhmechbiddp" ("root", "step", "groups") AS
SELECT "r1"."root", "r1"."step", "r1"."groups"
FROM "slice_den"."review_gather_output_cgnhmechbiddp" AS "r1";

CREATE VIEW "__slice_den"."review_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."review_held" AS "r1";

CREATE VIEW "__slice_den"."review_hold" ("resource", "resource_name", "root", "step", "attempt", "at", "seat") AS
SELECT "r1"."resource", ("slice"."__review_resource_names_ixi3gnpcnp"())["r1"."resource" + 1]::"pg_catalog"."text", "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."seat"
FROM "slice_den"."review_hold" AS "r1";

CREATE VIEW "__slice_den"."review_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_paused" AS "r1";

CREATE VIEW "__slice_den"."review_questions_finish_output_kddidbknbjeof" ("root", "step", "count", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."count", "r1"."total"
FROM "slice_den"."review_questions_finish_output_kddidbknbjeof" AS "r1";

CREATE VIEW "__slice_den"."review_questions_input_jigaomgjefjfk" ("root", "scope", "review", "group", "size") AS
SELECT "r1"."root", "r1"."scope", "r1"."review", "r1"."group", "r1"."size"
FROM "slice_den"."review_questions_input_jigaomgjefjfk" AS "r1";

CREATE VIEW "__slice_den"."review_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."review_refusal" AS "r1";

CREATE VIEW "__slice_den"."review_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."review_requested_with" AS "r1";

CREATE VIEW "__slice_den"."review_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__review_outcome_names_nlfaf7zb7f"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_result" AS "r1";

CREATE VIEW "__slice_den"."review_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__review_pausable_names_uhujnxcsz6"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."review_resumed" AS "r1";

CREATE VIEW "__slice_den"."review_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__review_retry_why_names_4ux5dj2mh3"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_retry" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_finish_output_fbgeikbjoigci" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."review_review_run_finish_output_fbgeikbjoigci" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_input_hpdfjnehnkdig" ("root", "scope", "review") AS
SELECT "r1"."root", "r1"."scope", "r1"."review"
FROM "slice_den"."review_review_run_input_hpdfjnehnkdig" AS "r1";

CREATE VIEW "__slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" ("root", "scope", "ordinal", "value") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."value"
FROM "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" AS "r1";

CREATE VIEW "__slice_den"."review_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__review_root_kind_names_uvxmjcavxb"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."review_root" AS "r1";

CREATE VIEW "__slice_den"."review_save_input_njbdjgekhblef" ("root", "step", "review", "group", "count", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."review", "r1"."group", "r1"."count", "r1"."total"
FROM "slice_den"."review_save_input_njbdjgekhblef" AS "r1";

CREATE VIEW "__slice_den"."review_save_output_falmopiohdlkl" ("root", "step", "total") AS
SELECT "r1"."root", "r1"."step", "r1"."total"
FROM "slice_den"."review_save_output_falmopiohdlkl" AS "r1";

CREATE VIEW "__slice_den"."review_saved_bppbpjmhcjbaa" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."review_saved_bppbpjmhcjbaa" AS "r1";

CREATE VIEW "__slice_den"."review_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."review_scope" AS "r1";

CREATE VIEW "__slice_den"."review_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."review_served" AS "r1";

CREATE VIEW "__slice_den"."review_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."review_skipped" AS "r1";

CREATE VIEW "__slice_den"."review_split_fnhnebdnlfmck" ("root", "from", "ordinal", "to") AS
SELECT "r1"."root", "r1"."from", "r1"."ordinal", "r1"."to"
FROM "slice_den"."review_split_fnhnebdnlfmck" AS "r1";

CREATE VIEW "__slice_den"."review_start_scope" ("root", "scope", "ordinal", "child") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."child"
FROM "slice_den"."review_start_scope" AS "r1";

CREATE VIEW "__slice_den"."review_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."review_start_step" AS "r1";

CREATE VIEW "__slice_den"."review_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__review_kind_names_j4pukr2klj"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."review_step" AS "r1";

CREATE VIEW "__slice_den"."review_within" ("root", "scope", "parent", "kind", "kind_name") AS
SELECT "r1"."root", "r1"."scope", "r1"."parent", "r1"."kind", ("slice"."__review_child_kind_names_jn3iwx7yal"())["r1"."kind" + 1]::"pg_catalog"."text"
FROM "slice_den"."review_within" AS "r1";

CREATE VIEW "__slice_den"."sync_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."sync_admitted" AS "r1";

CREATE VIEW "__slice_den"."sync_build_input_khidlilbdjpfi" ("root", "step", "build") AS
SELECT "r1"."root", "r1"."step", "r1"."build"
FROM "slice_den"."sync_build_input_khidlilbdjpfi" AS "r1";

CREATE VIEW "__slice_den"."sync_build_output_ianmlfhgbcfli" ("root", "step", "build") AS
SELECT "r1"."root", "r1"."step", "r1"."build"
FROM "slice_den"."sync_build_output_ianmlfhgbcfli" AS "r1";

CREATE VIEW "__slice_den"."sync_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."sync_claim" AS "r1";

CREATE VIEW "__slice_den"."sync_copy_input_fijfgeannmgef" ("root", "step", "relation", "run") AS
SELECT "r1"."root", "r1"."step", "r1"."relation", "r1"."run"
FROM "slice_den"."sync_copy_input_fijfgeannmgef" AS "r1";

CREATE VIEW "__slice_den"."sync_copy_output_cfficoloepjbj" ("root", "step", "run") AS
SELECT "r1"."root", "r1"."step", "r1"."run"
FROM "slice_den"."sync_copy_output_cfficoloepjbj" AS "r1";

CREATE VIEW "__slice_den"."sync_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_done" AS "r1";

CREATE VIEW "__slice_den"."sync_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_ended" AS "r1";

CREATE VIEW "__slice_den"."sync_exclusive" ("kind", "kind_name", "key", "turn", "scope") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn", "r1"."scope"
FROM "slice_den"."sync_exclusive" AS "r1";

CREATE VIEW "__slice_den"."sync_exclusive_key" ("root", "scope", "key", "id") AS
SELECT "r1"."root", "r1"."scope", "r1"."key", "r1"."id"
FROM "slice_den"."sync_exclusive_key" AS "r1";

CREATE VIEW "__slice_den"."sync_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_exhausted" AS "r1";

CREATE VIEW "__slice_den"."sync_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_failed" AS "r1";

CREATE VIEW "__slice_den"."sync_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_fenced" AS "r1";

CREATE VIEW "__slice_den"."sync_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."sync_finish" AS "r1";

CREATE VIEW "__slice_den"."sync_gold_finish_output_hkddafacepdaa" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_gold_finish_output_hkddafacepdaa" AS "r1";

CREATE VIEW "__slice_den"."sync_gold_input_edhkhlceilnoh" ("root", "scope", "build") AS
SELECT "r1"."root", "r1"."scope", "r1"."build"
FROM "slice_den"."sync_gold_input_edhkhlceilnoh" AS "r1";

CREATE VIEW "__slice_den"."sync_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."sync_held" AS "r1";

CREATE VIEW "__slice_den"."sync_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_paused" AS "r1";

CREATE VIEW "__slice_den"."sync_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."sync_refusal" AS "r1";

CREATE VIEW "__slice_den"."sync_released" ("kind", "kind_name", "key", "turn") AS
SELECT "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."turn"
FROM "slice_den"."sync_released" AS "r1";

CREATE VIEW "__slice_den"."sync_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."sync_requested_with" AS "r1";

CREATE VIEW "__slice_den"."sync_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__sync_outcome_names_xzb4y4xgki"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."sync_result" AS "r1";

CREATE VIEW "__slice_den"."sync_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__sync_pausable_names_3hzpsqgfjl"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."sync_resumed" AS "r1";

CREATE VIEW "__slice_den"."sync_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__sync_retry_why_names_o3uvvn3247"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."sync_retry" AS "r1";

CREATE VIEW "__slice_den"."sync_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__sync_root_kind_names_drp422srbk"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."sync_root" AS "r1";

CREATE VIEW "__slice_den"."sync_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."sync_scope" AS "r1";

CREATE VIEW "__slice_den"."sync_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."sync_served" AS "r1";

CREATE VIEW "__slice_den"."sync_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."sync_skipped" AS "r1";

CREATE VIEW "__slice_den"."sync_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."sync_start_step" AS "r1";

CREATE VIEW "__slice_den"."sync_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__sync_kind_names_oq6b66cstu"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."sync_step" AS "r1";

CREATE VIEW "__slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" AS "r1";

CREATE VIEW "__slice_den"."sync_sync_run_input_kmejgmkijpoho" ("root", "scope", "relation", "run") AS
SELECT "r1"."root", "r1"."scope", "r1"."relation", "r1"."run"
FROM "slice_den"."sync_sync_run_input_kmejgmkijpoho" AS "r1";

CREATE VIEW "__slice_den"."writeback_admitted" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."writeback_admitted" AS "r1";

CREATE VIEW "__slice_den"."writeback_claim" ("root", "step", "attempt", "until") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."until"
FROM "slice_den"."writeback_claim" AS "r1";

CREATE VIEW "__slice_den"."writeback_deliver_input_libhnkibecamc" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_deliver_input_libhnkibecamc" AS "r1";

CREATE VIEW "__slice_den"."writeback_deliver_output_ppecogpmgbpek" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_deliver_output_ppecogpmgbpek" AS "r1";

CREATE VIEW "__slice_den"."writeback_done" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_done" AS "r1";

CREATE VIEW "__slice_den"."writeback_ended" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_ended" AS "r1";

CREATE VIEW "__slice_den"."writeback_exhausted" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_exhausted" AS "r1";

CREATE VIEW "__slice_den"."writeback_failed" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_failed" AS "r1";

CREATE VIEW "__slice_den"."writeback_fenced" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_fenced" AS "r1";

CREATE VIEW "__slice_den"."writeback_finish" ("root", "scope", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."step"
FROM "slice_den"."writeback_finish" AS "r1";

CREATE VIEW "__slice_den"."writeback_held" ("root", "step", "attempt") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt"
FROM "slice_den"."writeback_held" AS "r1";

CREATE VIEW "__slice_den"."writeback_paused" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_paused" AS "r1";

CREATE VIEW "__slice_den"."writeback_refusal" ("root", "step", "law") AS
SELECT "r1"."root", "r1"."step", "r1"."law"
FROM "slice_den"."writeback_refusal" AS "r1";

CREATE VIEW "__slice_den"."writeback_requested_with" ("root", "fingerprint", "input") AS
SELECT "r1"."root", "r1"."fingerprint", "r1"."input"
FROM "slice_den"."writeback_requested_with" AS "r1";

CREATE VIEW "__slice_den"."writeback_result" ("root", "step", "outcome", "outcome_name") AS
SELECT "r1"."root", "r1"."step", "r1"."outcome", ("slice"."__writeback_outcome_names_oq43xsnmec"())["r1"."outcome" + 1]::"pg_catalog"."text"
FROM "slice_den"."writeback_result" AS "r1";

CREATE VIEW "__slice_den"."writeback_resumed" ("target", "target_name", "turn") AS
SELECT "r1"."target", ("slice"."__writeback_pausable_names_mqzeerbulh"())["r1"."target" + 1]::"pg_catalog"."text", "r1"."turn"
FROM "slice_den"."writeback_resumed" AS "r1";

CREATE VIEW "__slice_den"."writeback_retry" ("root", "step", "attempt", "at", "why", "why_name") AS
SELECT "r1"."root", "r1"."step", "r1"."attempt", "r1"."at", "r1"."why", ("slice"."__writeback_retry_why_names_7a7eowjbic"())["r1"."why" + 1]::"pg_catalog"."text"
FROM "slice_den"."writeback_retry" AS "r1";

CREATE VIEW "__slice_den"."writeback_root" ("root", "kind", "kind_name", "key", "at") AS
SELECT "r1"."root", "r1"."kind", ("slice"."__writeback_root_kind_names_bz7cmi256x"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."key", "r1"."at"
FROM "slice_den"."writeback_root" AS "r1";

CREATE VIEW "__slice_den"."writeback_scope" ("root", "scope") AS
SELECT "r1"."root", "r1"."scope"
FROM "slice_den"."writeback_scope" AS "r1";

CREATE VIEW "__slice_den"."writeback_served" ("environment", "at", "deployment") AS
SELECT "r1"."environment", "r1"."at", "r1"."deployment"
FROM "slice_den"."writeback_served" AS "r1";

CREATE VIEW "__slice_den"."writeback_skipped" ("root", "scope", "by") AS
SELECT "r1"."root", "r1"."scope", "r1"."by"
FROM "slice_den"."writeback_skipped" AS "r1";

CREATE VIEW "__slice_den"."writeback_start_step" ("root", "scope", "ordinal", "step") AS
SELECT "r1"."root", "r1"."scope", "r1"."ordinal", "r1"."step"
FROM "slice_den"."writeback_start_step" AS "r1";

CREATE VIEW "__slice_den"."writeback_step" ("root", "step", "kind", "kind_name", "scope", "due") AS
SELECT "r1"."root", "r1"."step", "r1"."kind", ("slice"."__writeback_kind_names_dbe6fofbjq"())["r1"."kind" + 1]::"pg_catalog"."text", "r1"."scope", "r1"."due"
FROM "slice_den"."writeback_step" AS "r1";

CREATE VIEW "__slice_den"."writeback_writeback_finish_output_mhjodpondhejh" ("root", "step") AS
SELECT "r1"."root", "r1"."step"
FROM "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" AS "r1";

CREATE VIEW "__slice_den"."writeback_writeback_input_ljafdhfgfeocc" ("root", "scope", "attempt") AS
SELECT "r1"."root", "r1"."scope", "r1"."attempt"
FROM "slice_den"."writeback_writeback_input_ljafdhfgfeocc" AS "r1";

CREATE VIEW "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y" ("digest", "passage", "topic", "distance") AS
SELECT "r1"."digest", "r1"."passage", "r1"."topic", "r1"."distance"
FROM "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" AS "r1";

CREATE VIEW "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5" ("digest", "learner", "passage") AS
SELECT "r1"."digest", "r1"."learner", "r1"."passage"
FROM "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" AS "r1";

CREATE VIEW "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4" ("digest", "feed", "feed_name", "seq", "n") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."seq", "r1"."n"
FROM "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" AS "r1";

CREATE VIEW "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w" ("digest", "feed", "feed_name", "factor", "items") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor", "r1"."items"
FROM "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" AS "r1";

CREATE VIEW "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr" ("digest", "feed", "feed_name", "factor") AS
SELECT "r1"."digest", "r1"."feed", ("slice"."__feed_names_azjbqebc6i"())["r1"."feed" + 1]::"pg_catalog"."text", "r1"."factor"
FROM "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" AS "r1";

CREATE VIEW "slice_seats__fan_den"."fan_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r19"."c64", "r19"."c65", ("slice"."__fan_resource_names_tugc7yp6xo"())["r19"."c65" + 1]::"pg_catalog"."text", "r19"."c66", "r19"."c67", "r19"."c68", "r19"."c69"
FROM (SELECT "r1"."attempt"::"slice"."__domain_gfw43vigph", "r1"."resource"::"slice_den"."fan_resource", "r1"."root", "r1"."seat"::"slice"."__domain_gfw43vigph", "r1"."step", "r4"."c9"::"slice"."__domain_mxhao3k6ss" FROM "slice_den"."fan_hold" AS "r1", LATERAL (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."fan_claim" AS "r3" WHERE "r1"."attempt" = "r3"."attempt" AND "r1"."root" = "r3"."root" AND "r1"."step" = "r3"."step" OFFSET 0) AS "r4"("c6", "c7", "c8", "c9") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."fan_ended" AS "r7" WHERE "r7"."attempt" = "r1"."attempt" AND "r7"."root" = "r1"."root" AND "r7"."step" = "r1"."step" AND "r7"."attempt" = "r1"."attempt" AND "r7"."root" = "r1"."root" AND "r7"."step" = "r1"."step" OFFSET 0) AS "r10"("c28", "c29", "c30")) AND NOT EXISTS (SELECT 1 FROM (SELECT "r12"."attempt", "r12"."root", "r12"."step" FROM "slice_den"."fan_held" AS "r12" WHERE "r12"."attempt" = "r1"."attempt" AND "r12"."root" = "r1"."root" AND "r12"."step" = "r1"."step" AND "r12"."attempt" = "r1"."attempt" AND "r12"."root" = "r1"."root" AND "r12"."step" = "r1"."step" OFFSET 0) AS "r15"("c43", "c44", "c45"))) AS "r19"("c64", "c65", "c66", "c67", "c68", "c69");

CREATE VIEW "slice_seats__review_den"."review_live" ("attempt", "resource", "resource_name", "root", "seat", "step", "until") WITH (security_barrier) AS
SELECT "r19"."c64", "r19"."c65", ("slice"."__review_resource_names_ixi3gnpcnp"())["r19"."c65" + 1]::"pg_catalog"."text", "r19"."c66", "r19"."c67", "r19"."c68", "r19"."c69"
FROM (SELECT "r1"."attempt"::"slice"."__domain_gfw43vigph", "r1"."resource"::"slice_den"."review_resource", "r1"."root", "r1"."seat"::"slice"."__domain_gfw43vigph", "r1"."step", "r4"."c9"::"slice"."__domain_mxhao3k6ss" FROM "slice_den"."review_hold" AS "r1", LATERAL (SELECT "r3"."attempt", "r3"."root", "r3"."step", "r3"."until" FROM "slice_den"."review_claim" AS "r3" WHERE "r1"."attempt" = "r3"."attempt" AND "r1"."root" = "r3"."root" AND "r1"."step" = "r3"."step" OFFSET 0) AS "r4"("c6", "c7", "c8", "c9") WHERE NOT EXISTS (SELECT 1 FROM (SELECT "r7"."attempt", "r7"."root", "r7"."step" FROM "slice_den"."review_ended" AS "r7" WHERE "r7"."attempt" = "r1"."attempt" AND "r7"."root" = "r1"."root" AND "r7"."step" = "r1"."step" AND "r7"."attempt" = "r1"."attempt" AND "r7"."root" = "r1"."root" AND "r7"."step" = "r1"."step" OFFSET 0) AS "r10"("c28", "c29", "c30")) AND NOT EXISTS (SELECT 1 FROM (SELECT "r12"."attempt", "r12"."root", "r12"."step" FROM "slice_den"."review_held" AS "r12" WHERE "r12"."attempt" = "r1"."attempt" AND "r12"."root" = "r1"."root" AND "r12"."step" = "r1"."step" AND "r12"."attempt" = "r1"."attempt" AND "r12"."root" = "r1"."root" AND "r12"."step" = "r1"."step" OFFSET 0) AS "r15"("c43", "c44", "c45"))) AS "r19"("c64", "c65", "c66", "c67", "c68", "c69");

GRANT :"slice_seats__assign_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__assign_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__assign_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__auditor" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__chain_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__clock_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__editor" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__fan_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__loader" TO :"slice_seats__app" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__retry_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__review_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__sync_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_coordinator" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_den" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

GRANT :"slice_seats__writeback_retirer" TO :"slice_seats__worker" WITH INHERIT FALSE, SET TRUE;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__app";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__app";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_coordinator";

GRANT SELECT ON TABLE "__slice_den"."assign_paused", "__slice_den"."assign_resumed", "__slice_den"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_paused" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_resumed" TO :"slice_seats__assign_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_served" TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() TO :"slice_seats__assign_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_den";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_claim", "__slice_den"."assign_done", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_paused", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_resumed", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_served", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice_den"."assign_asked_fobgfofknpfgd", "__slice_den"."assign_assignment_finish_output_dehjnhpeahpgb", "__slice_den"."assign_assignment_input_exclude_paaebdpkimebl", "__slice_den"."assign_assignment_input_kijoknpmnpomn", "__slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd", "__slice_den"."assign_assignment_input_mode_within_iahlinklmdadj", "__slice_den"."assign_assignment_input_near_acilimddcfjog", "__slice_den"."assign_decide_input_exclude_bpjgmijefddch", "__slice_den"."assign_decide_input_ffhdojphbdjfc", "__slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca", "__slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg", "__slice_den"."assign_decide_output_fkgbaoobeoima", "__slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca", "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y", "__slice_den"."assign_decide_read_seen_oahojgbpphboo", "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5", "__slice_den"."assign_embed_input_exclude_gcjikbkjkcefj", "__slice_den"."assign_embed_input_kmlepfpdepkmo", "__slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp", "__slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi", "__slice_den"."assign_embed_input_near_dhffcaodkgemm", "__slice_den"."assign_embed_output_ghdpbieopfmkd" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_claim" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_done" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_ended" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_exhausted" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_failed" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_fenced" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_finish" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_held" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_refusal" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_requested_with" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_result" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_retry" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_root" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_scope" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_skipped" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_step" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_kijoknpmnpomn" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_input_near_acilimddcfjog" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" TO :"slice_seats__assign_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm" TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() TO :"slice_seats__assign_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_failed_pmuglprcww"(), "slice"."__stand_assign_requested_with_3xavh4tz7a"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_root_ecnnffi3e3"(), "slice"."__stand_assign_step_qwjijdgx6j"(), "slice"."__stand_assign_assignment_input_kijoknpmnpomn_4zjcryoy43"(), "slice"."__stand_assign_assignment_input_mode_nearest_vxt2wtffpo"(), "slice"."__stand_assign_assignment_input_mode_within_oknn2mesyq"(), "slice"."__stand_assign_decide_input_ffhdojphbdjfc_2wcpr6jzag"(), "slice"."__stand_assign_decide_input_mode_nearest_sliikwmklp"(), "slice"."__stand_assign_decide_input_mode_within_7war272rv6"(), "slice"."__stand_assign_embed_input_kmlepfpdepkmo_eewc5pinsu"(), "slice"."__stand_assign_embed_input_mode_nearest_faxr7zpsfd"(), "slice"."__stand_assign_embed_input_mode_within_oiehjhalkkkfi_fhcs4pnxlw"() TO :"slice_seats__assign_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__assign_retirer";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_claim", "__slice_den"."assign_done", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice_den"."assign_asked_fobgfofknpfgd", "__slice_den"."assign_assignment_finish_output_dehjnhpeahpgb", "__slice_den"."assign_assignment_input_exclude_paaebdpkimebl", "__slice_den"."assign_assignment_input_kijoknpmnpomn", "__slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd", "__slice_den"."assign_assignment_input_mode_within_iahlinklmdadj", "__slice_den"."assign_assignment_input_near_acilimddcfjog", "__slice_den"."assign_decide_input_exclude_bpjgmijefddch", "__slice_den"."assign_decide_input_ffhdojphbdjfc", "__slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca", "__slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg", "__slice_den"."assign_decide_output_fkgbaoobeoima", "__slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca", "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y", "__slice_den"."assign_decide_read_seen_oahojgbpphboo", "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5", "__slice_den"."assign_embed_input_exclude_gcjikbkjkcefj", "__slice_den"."assign_embed_input_kmlepfpdepkmo", "__slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp", "__slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi", "__slice_den"."assign_embed_input_near_dhffcaodkgemm", "__slice_den"."assign_embed_output_ghdpbieopfmkd" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_claim" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_done" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_ended" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_exhausted" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_failed" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_fenced" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_finish" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_held" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_refusal" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_result" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_retry" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_scope" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_skipped" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_step" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_asked_fobgfofknpfgd" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_kijoknpmnpomn" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_assignment_input_near_acilimddcfjog" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_fkgbaoobeoima" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm" TO :"slice_seats__assign_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."assign_embed_output_ghdpbieopfmkd" TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() TO :"slice_seats__assign_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_failed_pmuglprcww"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_step_qwjijdgx6j"(), "slice"."__stand_assign_assignment_input_kijoknpmnpomn_4zjcryoy43"(), "slice"."__stand_assign_assignment_input_mode_nearest_vxt2wtffpo"(), "slice"."__stand_assign_assignment_input_mode_within_oknn2mesyq"(), "slice"."__stand_assign_decide_input_ffhdojphbdjfc_2wcpr6jzag"(), "slice"."__stand_assign_decide_input_mode_nearest_sliikwmklp"(), "slice"."__stand_assign_decide_input_mode_within_7war272rv6"(), "slice"."__stand_assign_decide_output_fkgbaoobeoima_67xxw2k7pi"(), "slice"."__stand_assign_decide_output_stage_rest_t7oibkktdz"(), "slice"."__stand_assign_decide_output_stage_serve_xssm6lxj3d"(), "slice"."__stand_assign_embed_input_kmlepfpdepkmo_eewc5pinsu"(), "slice"."__stand_assign_embed_input_mode_nearest_faxr7zpsfd"(), "slice"."__stand_assign_embed_input_mode_within_oiehjhalkkkfi_fhcs4pnxlw"() TO :"slice_seats__assign_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" TO :"slice_seats__assign_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice" TO :"slice_seats__auditor";

GRANT SELECT ON TABLE "__slice_den"."assign_result", "__slice_den"."assign_step", "__slice"."assigned", "__slice_den"."audit", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice_den"."fan_admitted", "__slice_den"."fan_claim", "__slice_den"."fan_finish", "__slice_den"."fan_hold", "__slice_den"."fan_result", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice_den"."retry_claim", "__slice_den"."retry_exhausted", "__slice_den"."retry_result", "__slice_den"."retry_step", "__slice_den"."review_finish", "__slice_den"."review_hold", "__slice_den"."review_result", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_finish", "__slice_den"."sync_result", "__slice_den"."sync_scope", "__slice_den"."sync_skipped", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."assign_decide_output_fkgbaoobeoima", "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y", "__slice_den"."assign_decide_read_seen_oahojgbpphboo", "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5", "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "__slice_den"."chain_chain_run_input_glnkafcnkbnnn", "__slice_den"."chain_next_bbflpfpnlejpm", "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "__slice_den"."chain_ordered_input_pbjpmafopnahk", "__slice_den"."chain_page_input_after_gdigbcabbnakb", "__slice_den"."chain_page_input_jhliinhchcgno", "__slice_den"."chain_page_output_dniojohpmhcee", "__slice_den"."chain_page_output_next_pocjijjpkpono", "__slice_den"."chain_page_read_earlier_dgehlbgebidjc", "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4", "__slice_den"."chain_page_read_tree_items_cokakfjlndgem", "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "__slice_den"."chain_page_read_tree_lakencnpkciin", "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w", "__slice_den"."chain_page_read_weights_agiabippcbobb", "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr", "__slice_den"."fan_batch_input_hjhhnklpfiilh", "__slice_den"."fan_fan_run_input_bghibckinpfgk", "__slice_den"."fan_square_input_ifddbjkaokoig", "__slice_den"."fan_square_output_gofcfljmlelgo", "__slice_den"."fan_wanted_input_nfecjpihiaope", "__slice_den"."fan_wanted_key_ldjmcglkghhjb" TO :"slice_seats__auditor";

GRANT SELECT, INSERT ON TABLE "slice_den"."audit" TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__auditor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_root_kind_live_zwogjm2ro3"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() TO :"slice_seats__auditor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_coordinator";

GRANT SELECT ON TABLE "__slice_den"."chain_paused", "__slice_den"."chain_resumed", "__slice_den"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_paused" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_resumed" TO :"slice_seats__chain_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_served" TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() TO :"slice_seats__chain_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_den";

GRANT SELECT ON TABLE "__slice_den"."chain_admitted", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_paused", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_resumed", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_served", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "__slice_den"."chain_chain_run_input_glnkafcnkbnnn", "__slice_den"."chain_next_bbflpfpnlejpm", "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "__slice_den"."chain_ordered_input_pbjpmafopnahk", "__slice_den"."chain_page_input_after_gdigbcabbnakb", "__slice_den"."chain_page_input_jhliinhchcgno", "__slice_den"."chain_page_output_dniojohpmhcee", "__slice_den"."chain_page_output_next_pocjijjpkpono", "__slice_den"."chain_page_read_earlier_dgehlbgebidjc", "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4", "__slice_den"."chain_page_read_tree_items_cokakfjlndgem", "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "__slice_den"."chain_page_read_tree_lakencnpkciin", "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w", "__slice_den"."chain_page_read_weights_agiabippcbobb", "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_claim" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_done" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ended" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_exhausted" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_failed" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_fenced" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_finish" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_held" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_refusal" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_requested_with" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_result" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_retry" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_root" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_scope" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_skipped" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_step" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_input_glnkafcnkbnnn" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_jhliinhchcgno" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items_cokakfjlndgem" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_lakencnpkciin" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights_agiabippcbobb" TO :"slice_seats__chain_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() TO :"slice_seats__chain_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_failed_nocd74knki"(), "slice"."__stand_chain_requested_with_fq22h3tdwv"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_root_mmsdkigltc"(), "slice"."__stand_chain_step_3hsz3lyxy2"(), "slice"."__stand_chain_page_input_jhliinhchcgno_72s7eqdrli"() TO :"slice_seats__chain_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__chain_retirer";

GRANT SELECT ON TABLE "__slice_den"."chain_admitted", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "__slice_den"."chain_chain_run_input_glnkafcnkbnnn", "__slice_den"."chain_next_bbflpfpnlejpm", "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "__slice_den"."chain_ordered_input_pbjpmafopnahk", "__slice_den"."chain_page_input_after_gdigbcabbnakb", "__slice_den"."chain_page_input_jhliinhchcgno", "__slice_den"."chain_page_output_dniojohpmhcee", "__slice_den"."chain_page_output_next_pocjijjpkpono", "__slice_den"."chain_page_read_earlier_dgehlbgebidjc", "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4", "__slice_den"."chain_page_read_tree_items_cokakfjlndgem", "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "__slice_den"."chain_page_read_tree_lakencnpkciin", "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w", "__slice_den"."chain_page_read_weights_agiabippcbobb", "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_claim" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_done" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ended" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_exhausted" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_failed" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_fenced" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_finish" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_held" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_refusal" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_result" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_retry" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_scope" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_skipped" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_step" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_chain_run_input_glnkafcnkbnnn" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_next_bbflpfpnlejpm" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_input_jhliinhchcgno" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_output_dniojohpmhcee" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_output_next_pocjijjpkpono" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_tree_lakencnpkciin" TO :"slice_seats__chain_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."chain_page_read_weights_agiabippcbobb" TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() TO :"slice_seats__chain_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_failed_nocd74knki"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_step_3hsz3lyxy2"(), "slice"."__stand_chain_page_input_jhliinhchcgno_72s7eqdrli"() TO :"slice_seats__chain_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" TO :"slice_seats__chain_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__clock_coordinator";

GRANT SELECT ON TABLE "__slice_den"."clock_paused", "__slice_den"."clock_resumed", "__slice_den"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_paused" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_resumed" TO :"slice_seats__clock_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_served" TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice", "__slice_den" TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__clock_den";

GRANT SELECT ON TABLE "__slice"."assigned", "__slice"."built", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_claim", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_paused", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_resumed", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_served", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."clock_chime_input_bfjhiocgaifco", "__slice_den"."clock_chime_output_bddonoddgecmi", "__slice_den"."clock_close_input_bajjphdpmhlbc", "__slice_den"."clock_close_output_aoheikcdnbjpp", "__slice_den"."clock_hourly_finish_output_mgokiakijlfbi", "__slice_den"."clock_hourly_input_nknibbhbedpnl", "__slice_den"."clock_hourly_key_cnlgnmcbbcgma", "__slice_den"."clock_sitting_finish_output_aahppmdaoafco", "__slice_den"."clock_sitting_input_bckcjcndffgmo" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_admitted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_claim" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_done" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_ended" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_exhausted" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_failed" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_fenced" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_finish" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_held" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_refusal" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_requested_with" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_result" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_retry" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_root" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_scope" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_skipped" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_start_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_step" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_chime_input_bfjhiocgaifco" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_close_input_bajjphdpmhlbc" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_input_nknibbhbedpnl" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_key_cnlgnmcbbcgma" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco" TO :"slice_seats__clock_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_input_bckcjcndffgmo" TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"(), "slice"."__feed_live_pfwkvulieq"() TO :"slice_seats__clock_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_failed_zsyt2n5qx3"(), "slice"."__stand_clock_requested_with_st4ea4apoz"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_clock_root_bfxjnnlbbr"(), "slice"."__stand_clock_step_cbbapr6dla"(), "slice"."__stand_clock_chime_input_bfjhiocgaifco_i5wa6mgnkj"(), "slice"."__stand_clock_close_input_bajjphdpmhlbc_zgk4a7xdtd"(), "slice"."__stand_clock_hourly_key_cnlgnmcbbcgma_lpqbewarwz"() TO :"slice_seats__clock_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__clock_retirer";

GRANT SELECT ON TABLE "__slice_den"."clock_admitted", "__slice_den"."clock_claim", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice_den"."clock_chime_input_bfjhiocgaifco", "__slice_den"."clock_chime_output_bddonoddgecmi", "__slice_den"."clock_close_input_bajjphdpmhlbc", "__slice_den"."clock_close_output_aoheikcdnbjpp", "__slice_den"."clock_hourly_finish_output_mgokiakijlfbi", "__slice_den"."clock_hourly_input_nknibbhbedpnl", "__slice_den"."clock_hourly_key_cnlgnmcbbcgma", "__slice_den"."clock_sitting_finish_output_aahppmdaoafco", "__slice_den"."clock_sitting_input_bckcjcndffgmo" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_admitted" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_claim" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_done" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_ended" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_exhausted" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_failed" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_fenced" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_finish" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_held" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_refusal" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_result" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_retry" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_scope" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_skipped" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_start_step" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_step" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_chime_input_bfjhiocgaifco" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_chime_output_bddonoddgecmi" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_close_input_bajjphdpmhlbc" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_close_output_aoheikcdnbjpp" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_hourly_input_nknibbhbedpnl" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco" TO :"slice_seats__clock_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."clock_sitting_input_bckcjcndffgmo" TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"() TO :"slice_seats__clock_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_failed_zsyt2n5qx3"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_clock_step_cbbapr6dla"(), "slice"."__stand_clock_chime_input_bfjhiocgaifco_i5wa6mgnkj"(), "slice"."__stand_clock_close_input_bajjphdpmhlbc_zgk4a7xdtd"() TO :"slice_seats__clock_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" TO :"slice_seats__clock_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice" TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__editor";

GRANT SELECT ON TABLE "__slice"."passage", "__slice"."seen" TO :"slice_seats__editor";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice"."passage" TO :"slice_seats__editor";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice"."seen" TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__editor";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text") TO :"slice_seats__editor";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__fan_coordinator";

GRANT SELECT ON TABLE "__slice_den"."fan_exclusive", "__slice_den"."fan_paused", "__slice_den"."fan_released", "__slice_den"."fan_resumed", "__slice_den"."fan_served" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_paused" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_released" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_resumed" TO :"slice_seats__fan_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_served" TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__fan_pausable_names_fpk6cvxfiv"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "slice_seats__fan_den" TO :"slice_seats__fan_den";

GRANT SELECT ON TABLE "__slice_den"."fan_admitted", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_paused", "__slice_den"."fan_refusal", "__slice_den"."fan_released", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_resumed", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_served", "__slice_den"."fan_skipped", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_within", "__slice_den"."fan_batch_finish_output_djinnhndkglgj", "__slice_den"."fan_batch_input_hjhhnklpfiilh", "__slice_den"."fan_dust_input_lelfhikaelkja", "__slice_den"."fan_dust_output_pgpcjjjdmhkim", "__slice_den"."fan_fan_run_finish_output_kcmicfckgdcip", "__slice_den"."fan_fan_run_input_bghibckinpfgk", "__slice_den"."fan_mop_input_ngghbiaegmghl", "__slice_den"."fan_mop_output_okmfngilefbec", "__slice_den"."fan_square_input_ifddbjkaokoig", "__slice_den"."fan_square_output_gofcfljmlelgo", "__slice_den"."fan_sweep_finish_output_nebomlkgaabji", "__slice_den"."fan_sweep_input_bnmfcblhkahec", "__slice_den"."fan_wanted_finish_output_lmjmjmcffnbda", "__slice_den"."fan_wanted_input_nfecjpihiaope", "__slice_den"."fan_wanted_key_ldjmcglkghhjb", "slice_seats__fan_den"."fan_live" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_admitted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_claim" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_done" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_ended" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exhausted" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_failed" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fenced" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_finish" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_held" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_hold" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_refusal" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_requested_with" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_result" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_retry" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_root" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_skipped" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_start_scope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_start_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_step" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_within" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_input_hjhhnklpfiilh" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_dust_input_lelfhikaelkja" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_input_bghibckinpfgk" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_mop_input_ngghbiaegmghl" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_square_input_ifddbjkaokoig" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_input_bnmfcblhkahec" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_input_nfecjpihiaope" TO :"slice_seats__fan_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_key_ldjmcglkghhjb" TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_fpk6cvxfiv"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_fan_claim_chk6cawes6"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_ended_l35bnatdrx"(), "slice"."__stand_fan_failed_ok5ebljdmh"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_hold_lndmiy4fqw"(), "slice"."__stand_fan_requested_with_cfdhaf2vfh"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_root_evnc53opne"(), "slice"."__stand_fan_step_cwlbx3l7hf"(), "slice"."__stand_fan_within_oo5pwmjabl"(), "slice"."__stand_fan_batch_input_hjhhnklpfiilh_7kl3aei6vl"(), "slice"."__stand_fan_dust_input_lelfhikaelkja_43itgxt6mz"(), "slice"."__stand_fan_mop_input_ngghbiaegmghl_365ret7qr7"(), "slice"."__stand_fan_square_input_ifddbjkaokoig_vp33jtgqnj"(), "slice"."__stand_fan_wanted_key_ldjmcglkghhjb_y7pro5icwo"() TO :"slice_seats__fan_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__fan_retirer";

GRANT SELECT ON TABLE "__slice_den"."fan_admitted", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_refusal", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_skipped", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_within", "__slice_den"."fan_batch_finish_output_djinnhndkglgj", "__slice_den"."fan_batch_input_hjhhnklpfiilh", "__slice_den"."fan_dust_input_lelfhikaelkja", "__slice_den"."fan_dust_output_pgpcjjjdmhkim", "__slice_den"."fan_fan_run_finish_output_kcmicfckgdcip", "__slice_den"."fan_fan_run_input_bghibckinpfgk", "__slice_den"."fan_mop_input_ngghbiaegmghl", "__slice_den"."fan_mop_output_okmfngilefbec", "__slice_den"."fan_square_input_ifddbjkaokoig", "__slice_den"."fan_square_output_gofcfljmlelgo", "__slice_den"."fan_sweep_finish_output_nebomlkgaabji", "__slice_den"."fan_sweep_input_bnmfcblhkahec", "__slice_den"."fan_wanted_finish_output_lmjmjmcffnbda", "__slice_den"."fan_wanted_input_nfecjpihiaope", "__slice_den"."fan_wanted_key_ldjmcglkghhjb" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_admitted" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_claim" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_done" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_ended" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_exhausted" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_failed" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fenced" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_finish" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_held" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_hold" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_refusal" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_result" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_retry" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_scope" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_skipped" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_start_scope" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_start_step" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_step" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_within" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_batch_input_hjhhnklpfiilh" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_dust_input_lelfhikaelkja" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_dust_output_pgpcjjjdmhkim" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_fan_run_input_bghibckinpfgk" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_mop_input_ngghbiaegmghl" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_mop_output_okmfngilefbec" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_square_input_ifddbjkaokoig" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_square_output_gofcfljmlelgo" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_sweep_input_bnmfcblhkahec" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" TO :"slice_seats__fan_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."fan_wanted_input_nfecjpihiaope" TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"() TO :"slice_seats__fan_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_fan_claim_chk6cawes6"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_ended_l35bnatdrx"(), "slice"."__stand_fan_failed_ok5ebljdmh"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_hold_lndmiy4fqw"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_step_cwlbx3l7hf"(), "slice"."__stand_fan_within_oo5pwmjabl"(), "slice"."__stand_fan_batch_input_hjhhnklpfiilh_7kl3aei6vl"(), "slice"."__stand_fan_dust_input_lelfhikaelkja_43itgxt6mz"(), "slice"."__stand_fan_mop_input_ngghbiaegmghl_365ret7qr7"(), "slice"."__stand_fan_square_input_ifddbjkaokoig_vp33jtgqnj"() TO :"slice_seats__fan_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" TO :"slice_seats__fan_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice" TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "vector_ext" TO :"slice_seats__loader";

GRANT SELECT ON TABLE "__slice_den"."assign_admitted", "__slice_den"."assign_claim", "__slice_den"."assign_done", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_paused", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_resumed", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_served", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice"."assigned", "__slice_den"."audit", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_paused", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_resumed", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_served", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_claim", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_paused", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_resumed", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_served", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice_den"."fan_admitted", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_paused", "__slice_den"."fan_refusal", "__slice_den"."fan_released", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_resumed", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_served", "__slice_den"."fan_skipped", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice_den"."retry_admitted", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_paused", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_resumed", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_served", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_step", "__slice_den"."review_admitted", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_paused", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_resumed", "__slice_den"."review_retry", "__slice_den"."review_root", "__slice_den"."review_scope", "__slice_den"."review_served", "__slice_den"."review_skipped", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_claim", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_held", "__slice_den"."sync_paused", "__slice_den"."sync_refusal", "__slice_den"."sync_released", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_resumed", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_served", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_paused", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_resumed", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_served", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."assign_asked_fobgfofknpfgd", "__slice_den"."assign_assignment_finish_output_dehjnhpeahpgb", "__slice_den"."assign_assignment_input_exclude_paaebdpkimebl", "__slice_den"."assign_assignment_input_kijoknpmnpomn", "__slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd", "__slice_den"."assign_assignment_input_mode_within_iahlinklmdadj", "__slice_den"."assign_assignment_input_near_acilimddcfjog", "__slice_den"."assign_decide_input_exclude_bpjgmijefddch", "__slice_den"."assign_decide_input_ffhdojphbdjfc", "__slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca", "__slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg", "__slice_den"."assign_decide_output_fkgbaoobeoima", "__slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca", "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y", "__slice_den"."assign_decide_read_seen_oahojgbpphboo", "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5", "__slice_den"."assign_embed_input_exclude_gcjikbkjkcefj", "__slice_den"."assign_embed_input_kmlepfpdepkmo", "__slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp", "__slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi", "__slice_den"."assign_embed_input_near_dhffcaodkgemm", "__slice_den"."assign_embed_output_ghdpbieopfmkd", "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "__slice_den"."chain_chain_run_input_glnkafcnkbnnn", "__slice_den"."chain_next_bbflpfpnlejpm", "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "__slice_den"."chain_ordered_input_pbjpmafopnahk", "__slice_den"."chain_page_input_after_gdigbcabbnakb", "__slice_den"."chain_page_input_jhliinhchcgno", "__slice_den"."chain_page_output_dniojohpmhcee", "__slice_den"."chain_page_output_next_pocjijjpkpono", "__slice_den"."chain_page_read_earlier_dgehlbgebidjc", "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4", "__slice_den"."chain_page_read_tree_items_cokakfjlndgem", "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "__slice_den"."chain_page_read_tree_lakencnpkciin", "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w", "__slice_den"."chain_page_read_weights_agiabippcbobb", "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr", "__slice_den"."clock_chime_input_bfjhiocgaifco", "__slice_den"."clock_chime_output_bddonoddgecmi", "__slice_den"."clock_close_input_bajjphdpmhlbc", "__slice_den"."clock_close_output_aoheikcdnbjpp", "__slice_den"."clock_hourly_finish_output_mgokiakijlfbi", "__slice_den"."clock_hourly_input_nknibbhbedpnl", "__slice_den"."clock_hourly_key_cnlgnmcbbcgma", "__slice_den"."clock_sitting_finish_output_aahppmdaoafco", "__slice_den"."clock_sitting_input_bckcjcndffgmo", "__slice_den"."fan_batch_finish_output_djinnhndkglgj", "__slice_den"."fan_batch_input_hjhhnklpfiilh", "__slice_den"."fan_dust_input_lelfhikaelkja", "__slice_den"."fan_dust_output_pgpcjjjdmhkim", "__slice_den"."fan_fan_run_finish_output_kcmicfckgdcip", "__slice_den"."fan_fan_run_input_bghibckinpfgk", "__slice_den"."fan_mop_input_ngghbiaegmghl", "__slice_den"."fan_mop_output_okmfngilefbec", "__slice_den"."fan_square_input_ifddbjkaokoig", "__slice_den"."fan_square_output_gofcfljmlelgo", "__slice_den"."fan_sweep_finish_output_nebomlkgaabji", "__slice_den"."fan_sweep_input_bnmfcblhkahec", "__slice_den"."fan_wanted_finish_output_lmjmjmcffnbda", "__slice_den"."fan_wanted_input_nfecjpihiaope", "__slice_den"."fan_wanted_key_ldjmcglkghhjb", "__slice_den"."retry_brittle_input_jbcpaiekdedpp", "__slice_den"."retry_brittle_output_bajcdgadpoeak", "__slice_den"."retry_ladders_finish_output_pgebkobjaoiih", "__slice_den"."retry_ladders_input_fkbbgblmfmhbi", "__slice_den"."retry_patient_input_ndliolfjpjnoc", "__slice_den"."retry_patient_output_geoaicaaojcfl", "__slice_den"."retry_polite_input_iopjdjgdhfide", "__slice_den"."retry_polite_output_nicaghgpaemah", "__slice_den"."retry_steadfast_input_ebanfagjeadim", "__slice_den"."retry_steadfast_output_aacklbgjpefbn", "__slice_den"."retry_throttled_finish_output_plgallgljmddo", "__slice_den"."retry_throttled_input_bfjgfamhjmgcd", "__slice_den"."retry_unhurried_finish_output_oipogmdgcfehf", "__slice_den"."retry_unhurried_input_mccbdnleajjif", "__slice_den"."review_analyze_input_aobppbhebnkae", "__slice_den"."review_analyze_output_fhhkmphnmpkdm", "__slice_den"."review_gather_input_eiadkjkkdoiel", "__slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp", "__slice_den"."review_gather_output_cgnhmechbiddp", "__slice_den"."review_questions_finish_output_kddidbknbjeof", "__slice_den"."review_questions_input_jigaomgjefjfk", "__slice_den"."review_review_run_finish_output_fbgeikbjoigci", "__slice_den"."review_review_run_input_hpdfjnehnkdig", "__slice_den"."review_review_run_input_sizes_fmllfmbfdoojd", "__slice_den"."review_save_input_njbdjgekhblef", "__slice_den"."review_save_output_falmopiohdlkl", "__slice_den"."review_saved_bppbpjmhcjbaa", "__slice_den"."review_split_fnhnebdnlfmck", "__slice_den"."sync_build_input_khidlilbdjpfi", "__slice_den"."sync_build_output_ianmlfhgbcfli", "__slice_den"."sync_copy_input_fijfgeannmgef", "__slice_den"."sync_copy_output_cfficoloepjbj", "__slice_den"."sync_gold_finish_output_hkddafacepdaa", "__slice_den"."sync_gold_input_edhkhlceilnoh", "__slice_den"."sync_sync_run_finish_output_inlpehpebjlbl", "__slice_den"."sync_sync_run_input_kmejgmkijpoho", "__slice_den"."writeback_deliver_input_libhnkibecamc", "__slice_den"."writeback_deliver_output_ppecogpmgbpek", "__slice_den"."writeback_writeback_finish_output_mhjodpondhejh", "__slice_den"."writeback_writeback_input_ljafdhfgfeocc" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."assigned" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."built" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_requested_with" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."chimed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."concluded" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."copied" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."cursor" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."delivered" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_exclusive_key" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_root" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."heard" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."item" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."order" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."passage" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_admitted" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_finish" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_step" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_within" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."reviewed" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."seen" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."settled" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."summary" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."tally" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."want" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice"."weight" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_done" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_held" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_result" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_asked_fobgfofknpfgd" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_exclude_bpjgmijefddch" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_ffhdojphbdjfc" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_fkgbaoobeoima" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_decide_read_seen_oahojgbpphboo" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_kmlepfpdepkmo" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_input_near_dhffcaodkgemm" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."assign_embed_output_ghdpbieopfmkd" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_next_bbflpfpnlejpm" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_ordered_input_pbjpmafopnahk" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_after_gdigbcabbnakb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_input_jhliinhchcgno" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_output_dniojohpmhcee" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_output_next_pocjijjpkpono" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_earlier_dgehlbgebidjc" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items_cokakfjlndgem" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_tree_lakencnpkciin" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."chain_page_read_weights_agiabippcbobb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_chime_output_bddonoddgecmi" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_close_output_aoheikcdnbjpp" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."clock_sitting_finish_output_aahppmdaoafco" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_batch_finish_output_djinnhndkglgj" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_dust_output_pgpcjjjdmhkim" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_mop_output_okmfngilefbec" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_square_output_gofcfljmlelgo" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_sweep_finish_output_nebomlkgaabji" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_input_nfecjpihiaope" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."fan_wanted_key_ldjmcglkghhjb" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_brittle_output_bajcdgadpoeak" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_patient_output_geoaicaaojcfl" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_polite_output_nicaghgpaemah" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_steadfast_output_aacklbgjpefbn" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_input_aobppbhebnkae" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_output_fhhkmphnmpkdm" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_eiadkjkkdoiel" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_output_cgnhmechbiddp" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_input_jigaomgjefjfk" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_input_njbdjgekhblef" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_output_falmopiohdlkl" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_saved_bppbpjmhcjbaa" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_split_fnhnebdnlfmck" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_build_output_ianmlfhgbcfli" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_copy_output_cfficoloepjbj" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_deliver_output_ppecogpmgbpek" TO :"slice_seats__loader";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__assign_kind_names_rtvscvwquk"(), "slice"."__assign_outcome_names_2mccfiah6k"(), "slice"."__assign_pausable_names_r7pjdx7o42"(), "slice"."__assign_retry_why_names_5ckzenntb2"(), "slice"."__assign_root_kind_names_opbaefdfbo"(), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__chain_pausable_names_vjdoymenyq"(), "slice"."__chain_retry_why_names_zmog33hzfy"(), "slice"."__chain_root_kind_names_ndmuh43zki"(), "slice"."__clock_kind_names_7yqk67pwg5"(), "slice"."__clock_outcome_names_rqtqczot4q"(), "slice"."__clock_pausable_names_phjbr2fipl"(), "slice"."__clock_retry_why_names_pjdgx4s6a4"(), "slice"."__clock_root_kind_names_3kro23qfv4"(), "slice"."__fan_child_kind_names_i6k53d3e2e"(), "slice"."__fan_kind_names_6jgkvuzg33"(), "slice"."__fan_outcome_names_7pbhseigfj"(), "slice"."__fan_pausable_names_fpk6cvxfiv"(), "slice"."__fan_resource_names_tugc7yp6xo"(), "slice"."__fan_retry_why_names_shpypqrqhk"(), "slice"."__fan_root_kind_names_jqlbcidhe6"(), "slice"."__feed_names_azjbqebc6i"(), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"(), "slice"."__assign_kind_live_epoonlekfm"(), "slice"."__assign_outcome_live_3t7oirgwzl"(), "slice"."__assign_pausable_live_spku342qp6"(), "slice"."__assign_retry_why_live_qfzksuyq3m"(), "slice"."__assign_root_kind_live_nccqmed4lq"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__chain_pausable_live_ozpbw3gnsu"(), "slice"."__chain_retry_why_live_m5qnitynhz"(), "slice"."__chain_root_kind_live_mnlnztwbz2"(), "slice"."__clock_kind_live_kem5uxahz7"(), "slice"."__clock_outcome_live_q7vjmi72sr"(), "slice"."__clock_pausable_live_waldzggn7s"(), "slice"."__clock_retry_why_live_auqnukeed5"(), "slice"."__clock_root_kind_live_dkya2k5nqw"(), "slice"."__fan_child_kind_live_lzght2aqpn"(), "slice"."__fan_kind_live_wcuqzqhqwl"(), "slice"."__fan_outcome_live_nos3iqln54"(), "slice"."__fan_pausable_live_m2rf37xwjt"(), "slice"."__fan_resource_live_yqyw4ee5fp"(), "slice"."__fan_retry_why_live_yom5egfb4x"(), "slice"."__fan_root_kind_live_zwogjm2ro3"(), "slice"."__feed_live_pfwkvulieq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"(), "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"(), "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"(), "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"(), "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"(), "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"(), "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"(), "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() TO :"slice_seats__loader";

GRANT EXECUTE ON FUNCTION "slice"."__stand_assign_done_zpmhn6mrnc"(), "slice"."__stand_assign_result_3dwqbs6psk"(), "slice"."__stand_assign_step_qwjijdgx6j"(), "slice"."__stand_chain_done_fhcl4vvjiw"(), "slice"."__stand_chain_requested_with_fq22h3tdwv"(), "slice"."__stand_chain_result_2qc7m4brl3"(), "slice"."__stand_chain_root_mmsdkigltc"(), "slice"."__stand_chain_step_3hsz3lyxy2"(), "slice"."__stand_clock_done_dja4biaxge"(), "slice"."__stand_clock_result_dk5lfugcd5"(), "slice"."__stand_fan_done_e4qldz2xtt"(), "slice"."__stand_fan_held_jx6ijuwgvx"(), "slice"."__stand_fan_result_4bsplumotk"(), "slice"."__stand_fan_root_evnc53opne"(), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"(), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_result_owlolckns5"(), "slice"."__stand_assign_decide_input_ffhdojphbdjfc_2wcpr6jzag"(), "slice"."__stand_assign_decide_input_mode_nearest_sliikwmklp"(), "slice"."__stand_assign_decide_input_mode_within_7war272rv6"(), "slice"."__stand_assign_decide_output_fkgbaoobeoima_67xxw2k7pi"(), "slice"."__stand_assign_decide_output_stage_rest_t7oibkktdz"(), "slice"."__stand_assign_decide_output_stage_serve_xssm6lxj3d"(), "slice"."__stand_assign_embed_input_kmlepfpdepkmo_eewc5pinsu"(), "slice"."__stand_assign_embed_input_mode_nearest_faxr7zpsfd"(), "slice"."__stand_assign_embed_input_mode_within_oiehjhalkkkfi_fhcs4pnxlw"(), "slice"."__stand_chain_page_input_jhliinhchcgno_72s7eqdrli"(), "slice"."__stand_fan_wanted_key_ldjmcglkghhjb_y7pro5icwo"(), "slice"."__stand_review_analyze_input_aobppbhebnkae_n5peaeon6o"(), "slice"."__stand_review_gather_input_eiadkjkkdoiel_46vusrxodo"(), "slice"."__stand_review_questions_input_jigaomgjefjfk_5x3k5au3i4"(), "slice"."__stand_review_save_input_njbdjgekhblef_ur5v4jws3f"() TO :"slice_seats__loader";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_coordinator";

GRANT SELECT ON TABLE "__slice_den"."retry_paused", "__slice_den"."retry_resumed", "__slice_den"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_paused" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_resumed" TO :"slice_seats__retry_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_served" TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_den";

GRANT SELECT ON TABLE "__slice_den"."retry_admitted", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_paused", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_resumed", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_served", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_step", "__slice_den"."retry_brittle_input_jbcpaiekdedpp", "__slice_den"."retry_brittle_output_bajcdgadpoeak", "__slice_den"."retry_ladders_finish_output_pgebkobjaoiih", "__slice_den"."retry_ladders_input_fkbbgblmfmhbi", "__slice_den"."retry_patient_input_ndliolfjpjnoc", "__slice_den"."retry_patient_output_geoaicaaojcfl", "__slice_den"."retry_polite_input_iopjdjgdhfide", "__slice_den"."retry_polite_output_nicaghgpaemah", "__slice_den"."retry_steadfast_input_ebanfagjeadim", "__slice_den"."retry_steadfast_output_aacklbgjpefbn", "__slice_den"."retry_throttled_finish_output_plgallgljmddo", "__slice_den"."retry_throttled_input_bfjgfamhjmgcd", "__slice_den"."retry_unhurried_finish_output_oipogmdgcfehf", "__slice_den"."retry_unhurried_input_mccbdnleajjif" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_admitted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_claim" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_done" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ended" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_exhausted" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_failed" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_fenced" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_finish" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_held" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_refusal" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_requested_with" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_result" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_retry" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_root" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_scope" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_skipped" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_start_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_step" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_brittle_input_jbcpaiekdedpp" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_ladders_input_fkbbgblmfmhbi" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_patient_input_ndliolfjpjnoc" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_polite_input_iopjdjgdhfide" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_steadfast_input_ebanfagjeadim" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_throttled_input_bfjgfamhjmgcd" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" TO :"slice_seats__retry_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."retry_unhurried_input_mccbdnleajjif" TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_pausable_names_hen5ycf77m"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_failed_wyonvn6i5o"(), "slice"."__stand_retry_requested_with_ilqrjj3m5y"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_retry_root_rvzhlkfxal"(), "slice"."__stand_retry_step_7csxwmutn2"(), "slice"."__stand_retry_brittle_input_jbcpaiekdedpp_nw6tdeuvqw"(), "slice"."__stand_retry_patient_input_ndliolfjpjnoc_xgt5djgzrl"(), "slice"."__stand_retry_polite_input_iopjdjgdhfide_thdczn73pf"(), "slice"."__stand_retry_steadfast_input_ebanfagjeadim_rtqhg3l443"() TO :"slice_seats__retry_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__retry_retirer";

GRANT SELECT ON TABLE "__slice_den"."retry_admitted", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_step", "__slice_den"."retry_brittle_input_jbcpaiekdedpp", "__slice_den"."retry_brittle_output_bajcdgadpoeak", "__slice_den"."retry_ladders_finish_output_pgebkobjaoiih", "__slice_den"."retry_ladders_input_fkbbgblmfmhbi", "__slice_den"."retry_patient_input_ndliolfjpjnoc", "__slice_den"."retry_patient_output_geoaicaaojcfl", "__slice_den"."retry_polite_input_iopjdjgdhfide", "__slice_den"."retry_polite_output_nicaghgpaemah", "__slice_den"."retry_steadfast_input_ebanfagjeadim", "__slice_den"."retry_steadfast_output_aacklbgjpefbn", "__slice_den"."retry_throttled_finish_output_plgallgljmddo", "__slice_den"."retry_throttled_input_bfjgfamhjmgcd", "__slice_den"."retry_unhurried_finish_output_oipogmdgcfehf", "__slice_den"."retry_unhurried_input_mccbdnleajjif" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_admitted" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_claim" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_done" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ended" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_exhausted" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_failed" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_fenced" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_finish" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_held" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_refusal" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_result" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_retry" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_scope" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_skipped" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_start_step" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_step" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_brittle_input_jbcpaiekdedpp" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_brittle_output_bajcdgadpoeak" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_ladders_input_fkbbgblmfmhbi" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_patient_input_ndliolfjpjnoc" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_patient_output_geoaicaaojcfl" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_polite_input_iopjdjgdhfide" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_polite_output_nicaghgpaemah" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_steadfast_input_ebanfagjeadim" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_steadfast_output_aacklbgjpefbn" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_throttled_finish_output_plgallgljmddo" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_throttled_input_bfjgfamhjmgcd" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" TO :"slice_seats__retry_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."retry_unhurried_input_mccbdnleajjif" TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__retry_kind_names_yg2tu5rejg"(), "slice"."__retry_outcome_names_zzz2kawwsa"(), "slice"."__retry_retry_why_names_pwmdyzqghs"(), "slice"."__retry_root_kind_names_bhf4onc7wq"(), "slice"."__retry_kind_live_lujs5xc25d"(), "slice"."__retry_outcome_live_fdo5qezp4f"(), "slice"."__retry_pausable_live_buioe34fit"(), "slice"."__retry_retry_why_live_p4et7ysqjo"(), "slice"."__retry_root_kind_live_euautuyuhd"() TO :"slice_seats__retry_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_retry_done_ll42rjotis"(), "slice"."__stand_retry_failed_wyonvn6i5o"(), "slice"."__stand_retry_result_mpvrsnerne"(), "slice"."__stand_retry_step_7csxwmutn2"(), "slice"."__stand_retry_brittle_input_jbcpaiekdedpp_nw6tdeuvqw"(), "slice"."__stand_retry_patient_input_ndliolfjpjnoc_xgt5djgzrl"(), "slice"."__stand_retry_polite_input_iopjdjgdhfide_thdczn73pf"(), "slice"."__stand_retry_steadfast_input_ebanfagjeadim_rtqhg3l443"() TO :"slice_seats__retry_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" TO :"slice_seats__retry_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__review_coordinator";

GRANT SELECT ON TABLE "__slice_den"."review_paused", "__slice_den"."review_resumed", "__slice_den"."review_served" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_paused" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_resumed" TO :"slice_seats__review_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_served" TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice", "__slice_den", "slice_seats__review_den" TO :"slice_seats__review_den";

GRANT SELECT ON TABLE "__slice"."delivered", "__slice_den"."review_admitted", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_paused", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_resumed", "__slice_den"."review_retry", "__slice_den"."review_root", "__slice_den"."review_scope", "__slice_den"."review_served", "__slice_den"."review_skipped", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice_den"."review_analyze_input_aobppbhebnkae", "__slice_den"."review_analyze_output_fhhkmphnmpkdm", "__slice_den"."review_gather_input_eiadkjkkdoiel", "__slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp", "__slice_den"."review_gather_output_cgnhmechbiddp", "__slice_den"."review_questions_finish_output_kddidbknbjeof", "__slice_den"."review_questions_input_jigaomgjefjfk", "__slice_den"."review_review_run_finish_output_fbgeikbjoigci", "__slice_den"."review_review_run_input_hpdfjnehnkdig", "__slice_den"."review_review_run_input_sizes_fmllfmbfdoojd", "__slice_den"."review_save_input_njbdjgekhblef", "__slice_den"."review_save_output_falmopiohdlkl", "__slice_den"."review_saved_bppbpjmhcjbaa", "__slice_den"."review_split_fnhnebdnlfmck", "slice_seats__review_den"."review_live" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_admitted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_claim" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_done" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_ended" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_exhausted" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_failed" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_fenced" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_finish" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_held" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_hold" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_refusal" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_requested_with" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_result" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_retry" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_root" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_skipped" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_start_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_step" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_within" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_analyze_input_aobppbhebnkae" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_eiadkjkkdoiel" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_questions_input_jigaomgjefjfk" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_input_hpdfjnehnkdig" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" TO :"slice_seats__review_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."review_save_input_njbdjgekhblef" TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_pausable_names_uhujnxcsz6"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_review_claim_hkt7qw7mpi"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_ended_h3z5bew2vq"(), "slice"."__stand_review_failed_a5vyjorx3e"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_hold_nhd6ml2ptp"(), "slice"."__stand_review_requested_with_o2plzxclt7"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_root_ejfkrp7dtz"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"(), "slice"."__stand_review_analyze_input_aobppbhebnkae_n5peaeon6o"(), "slice"."__stand_review_gather_input_eiadkjkkdoiel_46vusrxodo"(), "slice"."__stand_review_questions_input_jigaomgjefjfk_5x3k5au3i4"(), "slice"."__stand_review_save_input_njbdjgekhblef_ur5v4jws3f"() TO :"slice_seats__review_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__review_retirer";

GRANT SELECT ON TABLE "__slice_den"."review_admitted", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_retry", "__slice_den"."review_root", "__slice_den"."review_scope", "__slice_den"."review_skipped", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice_den"."review_analyze_input_aobppbhebnkae", "__slice_den"."review_analyze_output_fhhkmphnmpkdm", "__slice_den"."review_gather_input_eiadkjkkdoiel", "__slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp", "__slice_den"."review_gather_output_cgnhmechbiddp", "__slice_den"."review_questions_finish_output_kddidbknbjeof", "__slice_den"."review_questions_input_jigaomgjefjfk", "__slice_den"."review_review_run_finish_output_fbgeikbjoigci", "__slice_den"."review_review_run_input_hpdfjnehnkdig", "__slice_den"."review_review_run_input_sizes_fmllfmbfdoojd", "__slice_den"."review_save_input_njbdjgekhblef", "__slice_den"."review_save_output_falmopiohdlkl", "__slice_den"."review_saved_bppbpjmhcjbaa", "__slice_den"."review_split_fnhnebdnlfmck" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_admitted" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_claim" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_done" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_ended" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_exhausted" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_failed" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_fenced" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_finish" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_held" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_hold" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_refusal" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_result" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_retry" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_scope" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_skipped" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_start_scope" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_start_step" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_step" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_within" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_analyze_input_aobppbhebnkae" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_analyze_output_fhhkmphnmpkdm" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_input_eiadkjkkdoiel" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_gather_output_cgnhmechbiddp" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_questions_finish_output_kddidbknbjeof" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_questions_input_jigaomgjefjfk" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_finish_output_fbgeikbjoigci" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_input_hpdfjnehnkdig" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_save_input_njbdjgekhblef" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_save_output_falmopiohdlkl" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_saved_bppbpjmhcjbaa" TO :"slice_seats__review_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."review_split_fnhnebdnlfmck" TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__review_child_kind_names_jn3iwx7yal"(), "slice"."__review_kind_names_j4pukr2klj"(), "slice"."__review_outcome_names_nlfaf7zb7f"(), "slice"."__review_resource_names_ixi3gnpcnp"(), "slice"."__review_retry_why_names_4ux5dj2mh3"(), "slice"."__review_root_kind_names_uvxmjcavxb"(), "slice"."__review_child_kind_live_xb5v52t6gq"(), "slice"."__review_kind_live_3egbkjww5a"(), "slice"."__review_outcome_live_svq4irpcsp"(), "slice"."__review_pausable_live_at7bdrj2is"(), "slice"."__review_resource_live_bbskolaran"(), "slice"."__review_retry_why_live_sp7od4pwim"(), "slice"."__review_root_kind_live_vkjzjpusnp"() TO :"slice_seats__review_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_review_claim_hkt7qw7mpi"(), "slice"."__stand_review_done_ujerlpx2vl"(), "slice"."__stand_review_ended_h3z5bew2vq"(), "slice"."__stand_review_failed_a5vyjorx3e"(), "slice"."__stand_review_held_kz6nzl3mw3"(), "slice"."__stand_review_hold_nhd6ml2ptp"(), "slice"."__stand_review_result_7berxkzbzb"(), "slice"."__stand_review_step_aidfiao2mn"(), "slice"."__stand_review_within_bqv44gzoli"(), "slice"."__stand_review_analyze_input_aobppbhebnkae_n5peaeon6o"(), "slice"."__stand_review_gather_input_eiadkjkkdoiel_46vusrxodo"(), "slice"."__stand_review_questions_input_jigaomgjefjfk_5x3k5au3i4"(), "slice"."__stand_review_save_input_njbdjgekhblef_ur5v4jws3f"() TO :"slice_seats__review_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" TO :"slice_seats__review_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_coordinator";

GRANT SELECT ON TABLE "__slice_den"."sync_exclusive", "__slice_den"."sync_paused", "__slice_den"."sync_released", "__slice_den"."sync_resumed", "__slice_den"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exclusive" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_paused" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_released" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_resumed" TO :"slice_seats__sync_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_served" TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_den";

GRANT SELECT ON TABLE "__slice_den"."chain_result", "__slice_den"."chain_step", "__slice_den"."sync_admitted", "__slice_den"."sync_claim", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_held", "__slice_den"."sync_paused", "__slice_den"."sync_refusal", "__slice_den"."sync_released", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_resumed", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_served", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_build_input_khidlilbdjpfi", "__slice_den"."sync_build_output_ianmlfhgbcfli", "__slice_den"."sync_copy_input_fijfgeannmgef", "__slice_den"."sync_copy_output_cfficoloepjbj", "__slice_den"."sync_gold_finish_output_hkddafacepdaa", "__slice_den"."sync_gold_input_edhkhlceilnoh", "__slice_den"."sync_sync_run_finish_output_inlpehpebjlbl", "__slice_den"."sync_sync_run_input_kmejgmkijpoho" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_admitted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_claim" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_done" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_ended" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exclusive_key" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_exhausted" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_failed" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_fenced" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_finish" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_held" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_refusal" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_requested_with" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_result" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_retry" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_root" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_scope" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_skipped" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_start_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_step" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_build_input_khidlilbdjpfi" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_copy_input_fijfgeannmgef" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_gold_input_edhkhlceilnoh" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" TO :"slice_seats__sync_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."sync_sync_run_input_kmejgmkijpoho" TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__chain_kind_names_oubqrwjyau"(), "slice"."__chain_outcome_names_vo4tgqx6qh"(), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_pausable_names_3hzpsqgfjl"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__chain_kind_live_4t2tj7pchx"(), "slice"."__chain_outcome_live_azc7nb42gy"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_failed_uzrsh7vxay"(), "slice"."__stand_sync_requested_with_4lul7oihcy"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_sync_root_otymwhik42"(), "slice"."__stand_sync_step_mljbwcbsm5"(), "slice"."__stand_sync_build_input_khidlilbdjpfi_lsszbfcaws"(), "slice"."__stand_sync_copy_input_fijfgeannmgef_4papuncizy"() TO :"slice_seats__sync_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__sync_retirer";

GRANT SELECT ON TABLE "__slice_den"."sync_admitted", "__slice_den"."sync_claim", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_held", "__slice_den"."sync_refusal", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice_den"."sync_build_input_khidlilbdjpfi", "__slice_den"."sync_build_output_ianmlfhgbcfli", "__slice_den"."sync_copy_input_fijfgeannmgef", "__slice_den"."sync_copy_output_cfficoloepjbj", "__slice_den"."sync_gold_finish_output_hkddafacepdaa", "__slice_den"."sync_gold_input_edhkhlceilnoh", "__slice_den"."sync_sync_run_finish_output_inlpehpebjlbl", "__slice_den"."sync_sync_run_input_kmejgmkijpoho" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_admitted" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_claim" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_done" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_ended" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_exclusive_key" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_exhausted" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_failed" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_fenced" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_finish" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_held" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_refusal" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_result" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_retry" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_scope" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_skipped" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_start_step" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_step" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_build_input_khidlilbdjpfi" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_build_output_ianmlfhgbcfli" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_copy_input_fijfgeannmgef" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_copy_output_cfficoloepjbj" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_gold_finish_output_hkddafacepdaa" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_gold_input_edhkhlceilnoh" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" TO :"slice_seats__sync_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."sync_sync_run_input_kmejgmkijpoho" TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__sync_kind_names_oq6b66cstu"(), "slice"."__sync_outcome_names_xzb4y4xgki"(), "slice"."__sync_retry_why_names_o3uvvn3247"(), "slice"."__sync_root_kind_names_drp422srbk"(), "slice"."__sync_kind_live_mrzzgu2rqf"(), "slice"."__sync_outcome_live_7gndrvrenw"(), "slice"."__sync_pausable_live_7gx4kdgs6e"(), "slice"."__sync_retry_why_live_t6r5ysh2pa"(), "slice"."__sync_root_kind_live_vi4cdymudd"() TO :"slice_seats__sync_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_sync_done_4ihvwniwqp"(), "slice"."__stand_sync_failed_uzrsh7vxay"(), "slice"."__stand_sync_result_fkuahqxxbc"(), "slice"."__stand_sync_step_mljbwcbsm5"(), "slice"."__stand_sync_build_input_khidlilbdjpfi_lsszbfcaws"(), "slice"."__stand_sync_copy_input_fijfgeannmgef_4papuncizy"() TO :"slice_seats__sync_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" TO :"slice_seats__sync_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"slice_seats__worker";

GRANT EXECUTE ON FUNCTION "slice"."__snapshot_guard"("pg_catalog"."text") TO :"slice_seats__worker";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_coordinator";

GRANT SELECT ON TABLE "__slice_den"."writeback_paused", "__slice_den"."writeback_resumed", "__slice_den"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_paused" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_resumed" TO :"slice_seats__writeback_coordinator";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_served" TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_coordinator";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_coordinator";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_den";

GRANT SELECT ON TABLE "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_paused", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_resumed", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_served", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_deliver_input_libhnkibecamc", "__slice_den"."writeback_deliver_output_ppecogpmgbpek", "__slice_den"."writeback_writeback_finish_output_mhjodpondhejh", "__slice_den"."writeback_writeback_input_ljafdhfgfeocc" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_admitted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_claim" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_done" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_ended" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_exhausted" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_failed" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_fenced" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_finish" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_held" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_refusal" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_requested_with" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_result" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_retry" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_root" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_scope" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_skipped" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_start_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_step" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_deliver_input_libhnkibecamc" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" TO :"slice_seats__writeback_den";

GRANT SELECT, INSERT ON TABLE "slice_den"."writeback_writeback_input_ljafdhfgfeocc" TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_pausable_names_mqzeerbulh"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_den";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_failed_tv4kbeol35"(), "slice"."__stand_writeback_requested_with_xfqdgwx6jv"(), "slice"."__stand_writeback_result_owlolckns5"(), "slice"."__stand_writeback_root_m53pgt6gxz"(), "slice"."__stand_writeback_step_dhhgvpedc7"(), "slice"."__stand_writeback_deliver_input_libhnkibecamc_lagffiefhq"() TO :"slice_seats__writeback_den";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den" TO :"slice_seats__writeback_retirer";

GRANT SELECT ON TABLE "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."writeback_deliver_input_libhnkibecamc", "__slice_den"."writeback_deliver_output_ppecogpmgbpek", "__slice_den"."writeback_writeback_finish_output_mhjodpondhejh", "__slice_den"."writeback_writeback_input_ljafdhfgfeocc" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_admitted" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_claim" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_done" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_ended" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_exhausted" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_failed" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_fenced" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_finish" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_held" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_refusal" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_result" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_retry" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_scope" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_skipped" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_start_step" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_step" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_deliver_input_libhnkibecamc" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_deliver_output_ppecogpmgbpek" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" TO :"slice_seats__writeback_retirer";

GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE "slice_den"."writeback_writeback_input_ljafdhfgfeocc" TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__refuse"("pg_catalog"."text", "pg_catalog"."text", "pg_catalog"."text") TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__borrow"(bigint[], boolean[]) TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice"."__constant_eq577tindj"(), "slice"."__constant_ejkw66w2je"(), "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying), "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text"), "slice"."__writeback_kind_names_dbe6fofbjq"(), "slice"."__writeback_outcome_names_oq43xsnmec"(), "slice"."__writeback_retry_why_names_7a7eowjbic"(), "slice"."__writeback_root_kind_names_bz7cmi256x"(), "slice"."__writeback_kind_live_gxqp25qbem"(), "slice"."__writeback_outcome_live_haxkgy2wa4"(), "slice"."__writeback_pausable_live_rwjxemvunq"(), "slice"."__writeback_retry_why_live_6vffrr6k2o"(), "slice"."__writeback_root_kind_live_ifibfl2f7i"() TO :"slice_seats__writeback_retirer";

GRANT EXECUTE ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]), "slice"."__stand_writeback_done_ra7zoinlni"(), "slice"."__stand_writeback_failed_tv4kbeol35"(), "slice"."__stand_writeback_result_owlolckns5"(), "slice"."__stand_writeback_step_dhhgvpedc7"(), "slice"."__stand_writeback_deliver_input_libhnkibecamc_lagffiefhq"() TO :"slice_seats__writeback_retirer";

GRANT SELECT, DELETE ON TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" TO :"slice_seats__writeback_retirer";

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
GRANT USAGE ON SCHEMA "slice" TO :"__live_wzkq6p2yii";

GRANT SELECT ON TABLE "slice"."__live_secret" TO :"__live_wzkq6p2yii";

GRANT SELECT ON TABLE "slice"."__ledger" TO :"slice_seats__app", :"slice_seats__worker";

ALTER ROLE :"slice_seats__app" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice_seats__app" SET extra_float_digits = '1';

ALTER ROLE :"slice_seats__app" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice_seats__app" SET bytea_output = 'hex';

ALTER ROLE :"slice_seats__app" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice_seats__app" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice_seats__app" SET lc_time = 'C.UTF-8';

ALTER ROLE :"slice_seats__app" SET plan_cache_mode = 'force_generic_plan';

ALTER ROLE :"slice_seats__worker" SET search_path = "pg_catalog", "pg_temp";

ALTER ROLE :"slice_seats__worker" SET extra_float_digits = '1';

ALTER ROLE :"slice_seats__worker" SET DateStyle = 'ISO, YMD';

ALTER ROLE :"slice_seats__worker" SET bytea_output = 'hex';

ALTER ROLE :"slice_seats__worker" SET lc_monetary = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_numeric = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET lc_time = 'C.UTF-8';

ALTER ROLE :"slice_seats__worker" SET plan_cache_mode = 'force_generic_plan';

SELECT "vector_ext"."vector_dims"('[1]'::"vector_ext"."vector");

ALTER ROLE :"slice_seats__app" SET hnsw.iterative_scan = 'strict_order';

ALTER ROLE :"slice_seats__app" SET hnsw.max_scan_tuples = '20000';

ALTER ROLE :"slice_seats__worker" SET hnsw.iterative_scan = 'strict_order';

ALTER ROLE :"slice_seats__worker" SET hnsw.max_scan_tuples = '20000';

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
REVOKE ALL ON SCHEMA "slice", "slice_den", "slice_seats", "__slice_den", "__slice", "slice_seats__fan_den", "slice_seats__review_den" FROM PUBLIC;

REVOKE ALL ON TABLE "slice_den"."assign_admitted", "slice_den"."assign_claim", "slice_den"."assign_done", "slice_den"."assign_ended", "slice_den"."assign_exhausted", "slice_den"."assign_failed", "slice_den"."assign_fenced", "slice_den"."assign_finish", "slice_den"."assign_held", "slice_den"."assign_paused", "slice_den"."assign_refusal", "slice_den"."assign_requested_with", "slice_den"."assign_result", "slice_den"."assign_resumed", "slice_den"."assign_retry", "slice_den"."assign_root", "slice_den"."assign_scope", "slice_den"."assign_served", "slice_den"."assign_skipped", "slice_den"."assign_start_step", "slice_den"."assign_step", "slice"."assigned", "slice_den"."audit", "slice"."built", "slice_den"."chain_admitted", "slice_den"."chain_claim", "slice_den"."chain_done", "slice_den"."chain_ended", "slice_den"."chain_exhausted", "slice_den"."chain_failed", "slice_den"."chain_fenced", "slice_den"."chain_finish", "slice_den"."chain_held", "slice_den"."chain_paused", "slice_den"."chain_refusal", "slice_den"."chain_requested_with", "slice_den"."chain_result", "slice_den"."chain_resumed", "slice_den"."chain_retry", "slice_den"."chain_root", "slice_den"."chain_scope", "slice_den"."chain_served", "slice_den"."chain_skipped", "slice_den"."chain_start_step", "slice_den"."chain_step", "slice"."chimed", "slice_den"."clock_admitted", "slice_den"."clock_claim", "slice_den"."clock_done", "slice_den"."clock_ended", "slice_den"."clock_exhausted", "slice_den"."clock_failed", "slice_den"."clock_fenced", "slice_den"."clock_finish", "slice_den"."clock_held", "slice_den"."clock_paused", "slice_den"."clock_refusal", "slice_den"."clock_requested_with", "slice_den"."clock_result", "slice_den"."clock_resumed", "slice_den"."clock_retry", "slice_den"."clock_root", "slice_den"."clock_scope", "slice_den"."clock_served", "slice_den"."clock_skipped", "slice_den"."clock_start_step", "slice_den"."clock_step", "slice"."concluded", "slice"."copied", "slice"."cursor", "slice"."delivered", "slice_den"."fan_admitted", "slice_den"."fan_claim", "slice_den"."fan_done", "slice_den"."fan_ended", "slice_den"."fan_exclusive", "slice_den"."fan_exclusive_key", "slice_den"."fan_exhausted", "slice_den"."fan_failed", "slice_den"."fan_fenced", "slice_den"."fan_finish", "slice_den"."fan_held", "slice_den"."fan_hold", "slice_den"."fan_paused", "slice_den"."fan_refusal", "slice_den"."fan_released", "slice_den"."fan_requested_with", "slice_den"."fan_result", "slice_den"."fan_resumed", "slice_den"."fan_retry", "slice_den"."fan_root", "slice_den"."fan_scope", "slice_den"."fan_served", "slice_den"."fan_skipped", "slice_den"."fan_start_scope", "slice_den"."fan_start_step", "slice_den"."fan_step", "slice_den"."fan_within", "slice"."heard", "slice"."item", "slice"."order", "slice"."passage", "slice_den"."retry_admitted", "slice_den"."retry_claim", "slice_den"."retry_done", "slice_den"."retry_ended", "slice_den"."retry_exhausted", "slice_den"."retry_failed", "slice_den"."retry_fenced", "slice_den"."retry_finish", "slice_den"."retry_held", "slice_den"."retry_paused", "slice_den"."retry_refusal", "slice_den"."retry_requested_with", "slice_den"."retry_result", "slice_den"."retry_resumed", "slice_den"."retry_retry", "slice_den"."retry_root", "slice_den"."retry_scope", "slice_den"."retry_served", "slice_den"."retry_skipped", "slice_den"."retry_start_step", "slice_den"."retry_step", "slice_den"."review_admitted", "slice_den"."review_claim", "slice_den"."review_done", "slice_den"."review_ended", "slice_den"."review_exhausted", "slice_den"."review_failed", "slice_den"."review_fenced", "slice_den"."review_finish", "slice_den"."review_held", "slice_den"."review_hold", "slice_den"."review_paused", "slice_den"."review_refusal", "slice_den"."review_requested_with", "slice_den"."review_result", "slice_den"."review_resumed", "slice_den"."review_retry", "slice_den"."review_root", "slice_den"."review_scope", "slice_den"."review_served", "slice_den"."review_skipped", "slice_den"."review_start_scope", "slice_den"."review_start_step", "slice_den"."review_step", "slice_den"."review_within", "slice"."reviewed", "slice"."seen", "slice"."settled", "slice"."summary", "slice_den"."sync_admitted", "slice_den"."sync_claim", "slice_den"."sync_done", "slice_den"."sync_ended", "slice_den"."sync_exclusive", "slice_den"."sync_exclusive_key", "slice_den"."sync_exhausted", "slice_den"."sync_failed", "slice_den"."sync_fenced", "slice_den"."sync_finish", "slice_den"."sync_held", "slice_den"."sync_paused", "slice_den"."sync_refusal", "slice_den"."sync_released", "slice_den"."sync_requested_with", "slice_den"."sync_result", "slice_den"."sync_resumed", "slice_den"."sync_retry", "slice_den"."sync_root", "slice_den"."sync_scope", "slice_den"."sync_served", "slice_den"."sync_skipped", "slice_den"."sync_start_step", "slice_den"."sync_step", "slice"."tally", "slice"."want", "slice"."weight", "slice_den"."writeback_admitted", "slice_den"."writeback_claim", "slice_den"."writeback_done", "slice_den"."writeback_ended", "slice_den"."writeback_exhausted", "slice_den"."writeback_failed", "slice_den"."writeback_fenced", "slice_den"."writeback_finish", "slice_den"."writeback_held", "slice_den"."writeback_paused", "slice_den"."writeback_refusal", "slice_den"."writeback_requested_with", "slice_den"."writeback_result", "slice_den"."writeback_resumed", "slice_den"."writeback_retry", "slice_den"."writeback_root", "slice_den"."writeback_scope", "slice_den"."writeback_served", "slice_den"."writeback_skipped", "slice_den"."writeback_start_step", "slice_den"."writeback_step", "slice_den"."assign_asked_fobgfofknpfgd", "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb", "slice_den"."assign_assignment_input_exclude_paaebdpkimebl", "slice_den"."assign_assignment_input_kijoknpmnpomn", "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd", "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj", "slice_den"."assign_assignment_input_near_acilimddcfjog", "slice_den"."assign_decide_input_exclude_bpjgmijefddch", "slice_den"."assign_decide_input_ffhdojphbdjfc", "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca", "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg", "slice_den"."assign_decide_output_fkgbaoobeoima", "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca", "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q", "slice_den"."assign_decide_read_seen_oahojgbpphboo", "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6", "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj", "slice_den"."assign_embed_input_kmlepfpdepkmo", "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp", "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi", "slice_den"."assign_embed_input_near_dhffcaodkgemm", "slice_den"."assign_embed_output_ghdpbieopfmkd", "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "slice_den"."chain_chain_run_input_glnkafcnkbnnn", "slice_den"."chain_next_bbflpfpnlejpm", "slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "slice_den"."chain_ordered_input_pbjpmafopnahk", "slice_den"."chain_page_input_after_gdigbcabbnakb", "slice_den"."chain_page_input_jhliinhchcgno", "slice_den"."chain_page_output_dniojohpmhcee", "slice_den"."chain_page_output_next_pocjijjpkpono", "slice_den"."chain_page_read_earlier_dgehlbgebidjc", "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih", "slice_den"."chain_page_read_tree_items_cokakfjlndgem", "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "slice_den"."chain_page_read_tree_lakencnpkciin", "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5", "slice_den"."chain_page_read_weights_agiabippcbobb", "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar", "slice_den"."clock_chime_input_bfjhiocgaifco", "slice_den"."clock_chime_output_bddonoddgecmi", "slice_den"."clock_close_input_bajjphdpmhlbc", "slice_den"."clock_close_output_aoheikcdnbjpp", "slice_den"."clock_hourly_finish_output_mgokiakijlfbi", "slice_den"."clock_hourly_input_nknibbhbedpnl", "slice_den"."clock_hourly_key_cnlgnmcbbcgma", "slice_den"."clock_sitting_finish_output_aahppmdaoafco", "slice_den"."clock_sitting_input_bckcjcndffgmo", "slice_den"."fan_batch_finish_output_djinnhndkglgj", "slice_den"."fan_batch_input_hjhhnklpfiilh", "slice_den"."fan_dust_input_lelfhikaelkja", "slice_den"."fan_dust_output_pgpcjjjdmhkim", "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip", "slice_den"."fan_fan_run_input_bghibckinpfgk", "slice_den"."fan_mop_input_ngghbiaegmghl", "slice_den"."fan_mop_output_okmfngilefbec", "slice_den"."fan_square_input_ifddbjkaokoig", "slice_den"."fan_square_output_gofcfljmlelgo", "slice_den"."fan_sweep_finish_output_nebomlkgaabji", "slice_den"."fan_sweep_input_bnmfcblhkahec", "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda", "slice_den"."fan_wanted_input_nfecjpihiaope", "slice_den"."fan_wanted_key_ldjmcglkghhjb", "slice_den"."retry_brittle_input_jbcpaiekdedpp", "slice_den"."retry_brittle_output_bajcdgadpoeak", "slice_den"."retry_ladders_finish_output_pgebkobjaoiih", "slice_den"."retry_ladders_input_fkbbgblmfmhbi", "slice_den"."retry_patient_input_ndliolfjpjnoc", "slice_den"."retry_patient_output_geoaicaaojcfl", "slice_den"."retry_polite_input_iopjdjgdhfide", "slice_den"."retry_polite_output_nicaghgpaemah", "slice_den"."retry_steadfast_input_ebanfagjeadim", "slice_den"."retry_steadfast_output_aacklbgjpefbn", "slice_den"."retry_throttled_finish_output_plgallgljmddo", "slice_den"."retry_throttled_input_bfjgfamhjmgcd", "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf", "slice_den"."retry_unhurried_input_mccbdnleajjif", "slice_den"."review_analyze_input_aobppbhebnkae", "slice_den"."review_analyze_output_fhhkmphnmpkdm", "slice_den"."review_gather_input_eiadkjkkdoiel", "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp", "slice_den"."review_gather_output_cgnhmechbiddp", "slice_den"."review_questions_finish_output_kddidbknbjeof", "slice_den"."review_questions_input_jigaomgjefjfk", "slice_den"."review_review_run_finish_output_fbgeikbjoigci", "slice_den"."review_review_run_input_hpdfjnehnkdig", "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd", "slice_den"."review_save_input_njbdjgekhblef", "slice_den"."review_save_output_falmopiohdlkl", "slice_den"."review_saved_bppbpjmhcjbaa", "slice_den"."review_split_fnhnebdnlfmck", "slice_den"."sync_build_input_khidlilbdjpfi", "slice_den"."sync_build_output_ianmlfhgbcfli", "slice_den"."sync_copy_input_fijfgeannmgef", "slice_den"."sync_copy_output_cfficoloepjbj", "slice_den"."sync_gold_finish_output_hkddafacepdaa", "slice_den"."sync_gold_input_edhkhlceilnoh", "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl", "slice_den"."sync_sync_run_input_kmejgmkijpoho", "slice_den"."writeback_deliver_input_libhnkibecamc", "slice_den"."writeback_deliver_output_ppecogpmgbpek", "slice_den"."writeback_writeback_finish_output_mhjodpondhejh", "slice_den"."writeback_writeback_input_ljafdhfgfeocc", "__slice_den"."assign_admitted", "__slice_den"."assign_claim", "__slice_den"."assign_done", "__slice_den"."assign_ended", "__slice_den"."assign_exhausted", "__slice_den"."assign_failed", "__slice_den"."assign_fenced", "__slice_den"."assign_finish", "__slice_den"."assign_held", "__slice_den"."assign_paused", "__slice_den"."assign_refusal", "__slice_den"."assign_requested_with", "__slice_den"."assign_result", "__slice_den"."assign_resumed", "__slice_den"."assign_retry", "__slice_den"."assign_root", "__slice_den"."assign_scope", "__slice_den"."assign_served", "__slice_den"."assign_skipped", "__slice_den"."assign_start_step", "__slice_den"."assign_step", "__slice"."assigned", "__slice_den"."audit", "__slice"."built", "__slice_den"."chain_admitted", "__slice_den"."chain_claim", "__slice_den"."chain_done", "__slice_den"."chain_ended", "__slice_den"."chain_exhausted", "__slice_den"."chain_failed", "__slice_den"."chain_fenced", "__slice_den"."chain_finish", "__slice_den"."chain_held", "__slice_den"."chain_paused", "__slice_den"."chain_refusal", "__slice_den"."chain_requested_with", "__slice_den"."chain_result", "__slice_den"."chain_resumed", "__slice_den"."chain_retry", "__slice_den"."chain_root", "__slice_den"."chain_scope", "__slice_den"."chain_served", "__slice_den"."chain_skipped", "__slice_den"."chain_start_step", "__slice_den"."chain_step", "__slice"."chimed", "__slice_den"."clock_admitted", "__slice_den"."clock_claim", "__slice_den"."clock_done", "__slice_den"."clock_ended", "__slice_den"."clock_exhausted", "__slice_den"."clock_failed", "__slice_den"."clock_fenced", "__slice_den"."clock_finish", "__slice_den"."clock_held", "__slice_den"."clock_paused", "__slice_den"."clock_refusal", "__slice_den"."clock_requested_with", "__slice_den"."clock_result", "__slice_den"."clock_resumed", "__slice_den"."clock_retry", "__slice_den"."clock_root", "__slice_den"."clock_scope", "__slice_den"."clock_served", "__slice_den"."clock_skipped", "__slice_den"."clock_start_step", "__slice_den"."clock_step", "__slice"."concluded", "__slice"."copied", "__slice"."cursor", "__slice"."delivered", "__slice_den"."fan_admitted", "__slice_den"."fan_claim", "__slice_den"."fan_done", "__slice_den"."fan_ended", "__slice_den"."fan_exclusive", "__slice_den"."fan_exclusive_key", "__slice_den"."fan_exhausted", "__slice_den"."fan_failed", "__slice_den"."fan_fenced", "__slice_den"."fan_finish", "__slice_den"."fan_held", "__slice_den"."fan_hold", "__slice_den"."fan_paused", "__slice_den"."fan_refusal", "__slice_den"."fan_released", "__slice_den"."fan_requested_with", "__slice_den"."fan_result", "__slice_den"."fan_resumed", "__slice_den"."fan_retry", "__slice_den"."fan_root", "__slice_den"."fan_scope", "__slice_den"."fan_served", "__slice_den"."fan_skipped", "__slice_den"."fan_start_scope", "__slice_den"."fan_start_step", "__slice_den"."fan_step", "__slice_den"."fan_within", "__slice"."heard", "__slice"."item", "__slice"."order", "__slice"."passage", "__slice_den"."retry_admitted", "__slice_den"."retry_claim", "__slice_den"."retry_done", "__slice_den"."retry_ended", "__slice_den"."retry_exhausted", "__slice_den"."retry_failed", "__slice_den"."retry_fenced", "__slice_den"."retry_finish", "__slice_den"."retry_held", "__slice_den"."retry_paused", "__slice_den"."retry_refusal", "__slice_den"."retry_requested_with", "__slice_den"."retry_result", "__slice_den"."retry_resumed", "__slice_den"."retry_retry", "__slice_den"."retry_root", "__slice_den"."retry_scope", "__slice_den"."retry_served", "__slice_den"."retry_skipped", "__slice_den"."retry_start_step", "__slice_den"."retry_step", "__slice_den"."review_admitted", "__slice_den"."review_claim", "__slice_den"."review_done", "__slice_den"."review_ended", "__slice_den"."review_exhausted", "__slice_den"."review_failed", "__slice_den"."review_fenced", "__slice_den"."review_finish", "__slice_den"."review_held", "__slice_den"."review_hold", "__slice_den"."review_paused", "__slice_den"."review_refusal", "__slice_den"."review_requested_with", "__slice_den"."review_result", "__slice_den"."review_resumed", "__slice_den"."review_retry", "__slice_den"."review_root", "__slice_den"."review_scope", "__slice_den"."review_served", "__slice_den"."review_skipped", "__slice_den"."review_start_scope", "__slice_den"."review_start_step", "__slice_den"."review_step", "__slice_den"."review_within", "__slice"."reviewed", "__slice"."seen", "__slice"."settled", "__slice"."summary", "__slice_den"."sync_admitted", "__slice_den"."sync_claim", "__slice_den"."sync_done", "__slice_den"."sync_ended", "__slice_den"."sync_exclusive", "__slice_den"."sync_exclusive_key", "__slice_den"."sync_exhausted", "__slice_den"."sync_failed", "__slice_den"."sync_fenced", "__slice_den"."sync_finish", "__slice_den"."sync_held", "__slice_den"."sync_paused", "__slice_den"."sync_refusal", "__slice_den"."sync_released", "__slice_den"."sync_requested_with", "__slice_den"."sync_result", "__slice_den"."sync_resumed", "__slice_den"."sync_retry", "__slice_den"."sync_root", "__slice_den"."sync_scope", "__slice_den"."sync_served", "__slice_den"."sync_skipped", "__slice_den"."sync_start_step", "__slice_den"."sync_step", "__slice"."tally", "__slice"."want", "__slice"."weight", "__slice_den"."writeback_admitted", "__slice_den"."writeback_claim", "__slice_den"."writeback_done", "__slice_den"."writeback_ended", "__slice_den"."writeback_exhausted", "__slice_den"."writeback_failed", "__slice_den"."writeback_fenced", "__slice_den"."writeback_finish", "__slice_den"."writeback_held", "__slice_den"."writeback_paused", "__slice_den"."writeback_refusal", "__slice_den"."writeback_requested_with", "__slice_den"."writeback_result", "__slice_den"."writeback_resumed", "__slice_den"."writeback_retry", "__slice_den"."writeback_root", "__slice_den"."writeback_scope", "__slice_den"."writeback_served", "__slice_den"."writeback_skipped", "__slice_den"."writeback_start_step", "__slice_den"."writeback_step", "__slice_den"."assign_asked_fobgfofknpfgd", "__slice_den"."assign_assignment_finish_output_dehjnhpeahpgb", "__slice_den"."assign_assignment_input_exclude_paaebdpkimebl", "__slice_den"."assign_assignment_input_kijoknpmnpomn", "__slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd", "__slice_den"."assign_assignment_input_mode_within_iahlinklmdadj", "__slice_den"."assign_assignment_input_near_acilimddcfjog", "__slice_den"."assign_decide_input_exclude_bpjgmijefddch", "__slice_den"."assign_decide_input_ffhdojphbdjfc", "__slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca", "__slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg", "__slice_den"."assign_decide_output_fkgbaoobeoima", "__slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca", "__slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef", "__slice_den"."assign_decide_output_weighed_gpdibcghlfbhb", "__slice_den"."assign_decide_read_nearest_mlemoegfgpbbi", "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y", "__slice_den"."assign_decide_read_seen_oahojgbpphboo", "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5", "__slice_den"."assign_embed_input_exclude_gcjikbkjkcefj", "__slice_den"."assign_embed_input_kmlepfpdepkmo", "__slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp", "__slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi", "__slice_den"."assign_embed_input_near_dhffcaodkgemm", "__slice_den"."assign_embed_output_ghdpbieopfmkd", "__slice_den"."chain_chain_run_finish_output_lhniobmdeemdb", "__slice_den"."chain_chain_run_input_glnkafcnkbnnn", "__slice_den"."chain_next_bbflpfpnlejpm", "__slice_den"."chain_ordered_finish_output_nnemphmmfdblb", "__slice_den"."chain_ordered_input_pbjpmafopnahk", "__slice_den"."chain_page_input_after_gdigbcabbnakb", "__slice_den"."chain_page_input_jhliinhchcgno", "__slice_den"."chain_page_output_dniojohpmhcee", "__slice_den"."chain_page_output_next_pocjijjpkpono", "__slice_den"."chain_page_read_earlier_dgehlbgebidjc", "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4", "__slice_den"."chain_page_read_tree_items_cokakfjlndgem", "__slice_den"."chain_page_read_tree_items_first_ocgolceclfbii", "__slice_den"."chain_page_read_tree_lakencnpkciin", "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w", "__slice_den"."chain_page_read_weights_agiabippcbobb", "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr", "__slice_den"."clock_chime_input_bfjhiocgaifco", "__slice_den"."clock_chime_output_bddonoddgecmi", "__slice_den"."clock_close_input_bajjphdpmhlbc", "__slice_den"."clock_close_output_aoheikcdnbjpp", "__slice_den"."clock_hourly_finish_output_mgokiakijlfbi", "__slice_den"."clock_hourly_input_nknibbhbedpnl", "__slice_den"."clock_hourly_key_cnlgnmcbbcgma", "__slice_den"."clock_sitting_finish_output_aahppmdaoafco", "__slice_den"."clock_sitting_input_bckcjcndffgmo", "__slice_den"."fan_batch_finish_output_djinnhndkglgj", "__slice_den"."fan_batch_input_hjhhnklpfiilh", "__slice_den"."fan_dust_input_lelfhikaelkja", "__slice_den"."fan_dust_output_pgpcjjjdmhkim", "__slice_den"."fan_fan_run_finish_output_kcmicfckgdcip", "__slice_den"."fan_fan_run_input_bghibckinpfgk", "__slice_den"."fan_mop_input_ngghbiaegmghl", "__slice_den"."fan_mop_output_okmfngilefbec", "__slice_den"."fan_square_input_ifddbjkaokoig", "__slice_den"."fan_square_output_gofcfljmlelgo", "__slice_den"."fan_sweep_finish_output_nebomlkgaabji", "__slice_den"."fan_sweep_input_bnmfcblhkahec", "__slice_den"."fan_wanted_finish_output_lmjmjmcffnbda", "__slice_den"."fan_wanted_input_nfecjpihiaope", "__slice_den"."fan_wanted_key_ldjmcglkghhjb", "__slice_den"."retry_brittle_input_jbcpaiekdedpp", "__slice_den"."retry_brittle_output_bajcdgadpoeak", "__slice_den"."retry_ladders_finish_output_pgebkobjaoiih", "__slice_den"."retry_ladders_input_fkbbgblmfmhbi", "__slice_den"."retry_patient_input_ndliolfjpjnoc", "__slice_den"."retry_patient_output_geoaicaaojcfl", "__slice_den"."retry_polite_input_iopjdjgdhfide", "__slice_den"."retry_polite_output_nicaghgpaemah", "__slice_den"."retry_steadfast_input_ebanfagjeadim", "__slice_den"."retry_steadfast_output_aacklbgjpefbn", "__slice_den"."retry_throttled_finish_output_plgallgljmddo", "__slice_den"."retry_throttled_input_bfjgfamhjmgcd", "__slice_den"."retry_unhurried_finish_output_oipogmdgcfehf", "__slice_den"."retry_unhurried_input_mccbdnleajjif", "__slice_den"."review_analyze_input_aobppbhebnkae", "__slice_den"."review_analyze_output_fhhkmphnmpkdm", "__slice_den"."review_gather_input_eiadkjkkdoiel", "__slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp", "__slice_den"."review_gather_output_cgnhmechbiddp", "__slice_den"."review_questions_finish_output_kddidbknbjeof", "__slice_den"."review_questions_input_jigaomgjefjfk", "__slice_den"."review_review_run_finish_output_fbgeikbjoigci", "__slice_den"."review_review_run_input_hpdfjnehnkdig", "__slice_den"."review_review_run_input_sizes_fmllfmbfdoojd", "__slice_den"."review_save_input_njbdjgekhblef", "__slice_den"."review_save_output_falmopiohdlkl", "__slice_den"."review_saved_bppbpjmhcjbaa", "__slice_den"."review_split_fnhnebdnlfmck", "__slice_den"."sync_build_input_khidlilbdjpfi", "__slice_den"."sync_build_output_ianmlfhgbcfli", "__slice_den"."sync_copy_input_fijfgeannmgef", "__slice_den"."sync_copy_output_cfficoloepjbj", "__slice_den"."sync_gold_finish_output_hkddafacepdaa", "__slice_den"."sync_gold_input_edhkhlceilnoh", "__slice_den"."sync_sync_run_finish_output_inlpehpebjlbl", "__slice_den"."sync_sync_run_input_kmejgmkijpoho", "__slice_den"."writeback_deliver_input_libhnkibecamc", "__slice_den"."writeback_deliver_output_ppecogpmgbpek", "__slice_den"."writeback_writeback_finish_output_mhjodpondhejh", "__slice_den"."writeback_writeback_input_ljafdhfgfeocc", "slice_seats__fan_den"."fan_live", "slice_seats__review_den"."review_live" FROM PUBLIC;

REVOKE ALL ON DOMAIN "slice"."__sha256", "slice_den"."assign_kind", "slice_den"."assign_outcome", "slice_den"."assign_pausable", "slice_den"."assign_retry_why", "slice_den"."assign_root_kind", "slice_den"."chain_kind", "slice_den"."chain_outcome", "slice_den"."chain_pausable", "slice_den"."chain_retry_why", "slice_den"."chain_root_kind", "slice_den"."clock_kind", "slice_den"."clock_outcome", "slice_den"."clock_pausable", "slice_den"."clock_retry_why", "slice_den"."clock_root_kind", "slice_den"."fan_child_kind", "slice_den"."fan_kind", "slice_den"."fan_outcome", "slice_den"."fan_pausable", "slice_den"."fan_resource", "slice_den"."fan_retry_why", "slice_den"."fan_root_kind", "slice"."feed", "slice_den"."retry_kind", "slice_den"."retry_outcome", "slice_den"."retry_pausable", "slice_den"."retry_retry_why", "slice_den"."retry_root_kind", "slice_den"."review_child_kind", "slice_den"."review_kind", "slice_den"."review_outcome", "slice_den"."review_pausable", "slice_den"."review_resource", "slice_den"."review_retry_why", "slice_den"."review_root_kind", "slice_den"."sync_kind", "slice_den"."sync_outcome", "slice_den"."sync_pausable", "slice_den"."sync_retry_why", "slice_den"."sync_root_kind", "slice_den"."writeback_kind", "slice_den"."writeback_outcome", "slice_den"."writeback_pausable", "slice_den"."writeback_retry_why", "slice_den"."writeback_root_kind", "slice_den"."assign_assignment_input_mode_pgalmghonldnf", "slice_den"."assign_decide_input_mode_beoibaghjodnf", "slice_den"."assign_decide_output_stage_bjoijbfcegdbp", "slice_den"."assign_embed_input_mode_pblkjdhncepei", "slice_den"."chain_chain_run_input_feed_dcnlhjpledlkf", "slice_den"."chain_ordered_input_feed_hbpmfpphpfngm", "slice_den"."chain_page_input_feed_nlhfmgjplihkf", "slice"."__text_t4rwovzmqj", "slice"."__domain_mxhao3k6ss", "slice"."__domain_e5fpjchj5r", "slice"."__domain_mxhao3k6ss", "slice"."__domain_mxhao3k6ss", "slice"."__domain_gfw43vigph", "slice"."__domain_p7dj7oebtz", "slice"."__param_nearest_topic_4eruqlfauv", "slice"."__param_seen_learner_exdgowkpja" FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_den" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_den" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_seats" REVOKE ALL ON TABLES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES IN SCHEMA "slice_seats" REVOKE ALL ON SEQUENCES FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES REVOKE ALL ON FUNCTIONS FROM PUBLIC;

SELECT "pg_catalog"."pg_advisory_xact_lock"(5448515225636816524::bigint);
ALTER DEFAULT PRIVILEGES REVOKE ALL ON TYPES FROM PUBLIC;

COMMENT ON FUNCTION "slice"."__constant_eq577tindj"() IS 'closed constant b24eeaa98f423c4c1d92f643c7554c1ce54596cc04a269d8fd1c350f7af5ff40';

COMMENT ON FUNCTION "slice"."__constant_ejkw66w2je"() IS 'closed constant c0425c74dfc7eff7c10920bb9b085c2f0b3353baca0710384369fe1232e405b8';

COMMENT ON FUNCTION "slice"."__closed_row_cq3qq2e2aa"(bigint[], bigint, bigint, bit varying) IS 'library function closedRow (e0d05052ca72a16365ada509200b41a96287f5bf7828be0f6a8a8fea8f8bfa0d)';

COMMENT ON FUNCTION "slice"."__text_digest_2x5x4iwe4m"("pg_catalog"."text") IS 'library function textDigest (da364432aaff69eb9ff03bb55dd710826331c1394522123ddfb92b1e3d7c5ba7)';

COMMENT ON FUNCTION "slice"."__assign_kind_names_rtvscvwquk"() IS 'names of roster AssignKind (89a3cbff0adc5997cf87a5c997d0ac5c2f0e099c2743f1579471dc5d45703b53)';

COMMENT ON FUNCTION "slice"."__assign_outcome_names_2mccfiah6k"() IS 'names of roster AssignOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__assign_pausable_names_r7pjdx7o42"() IS 'names of roster AssignPausable (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON FUNCTION "slice"."__assign_retry_why_names_5ckzenntb2"() IS 'names of roster AssignRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__assign_root_kind_names_opbaefdfbo"() IS 'names of roster AssignRootKind (1c3fe9c5114875213e61eef4023fbb27b30c5ca204b84f617d53b3a1262d2815)';

COMMENT ON FUNCTION "slice"."__chain_kind_names_oubqrwjyau"() IS 'names of roster ChainKind (e7bcf98ec63bf066e30e455f58e78f32232c8dc01b1a10cba9914a6fa99d1e74)';

COMMENT ON FUNCTION "slice"."__chain_outcome_names_vo4tgqx6qh"() IS 'names of roster ChainOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__chain_pausable_names_vjdoymenyq"() IS 'names of roster ChainPausable (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_names_zmog33hzfy"() IS 'names of roster ChainRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_names_ndmuh43zki"() IS 'names of roster ChainRootKind (841dc700e92bf9c4635d6a6a2b0640acdab5fd7c3bcd500bbb711741ab48d7eb)';

COMMENT ON FUNCTION "slice"."__clock_kind_names_7yqk67pwg5"() IS 'names of roster ClockKind (470d74a7a6f92cf958567d6d47a51d8c96bb4a79460d3dcd271053aca971f13c)';

COMMENT ON FUNCTION "slice"."__clock_outcome_names_rqtqczot4q"() IS 'names of roster ClockOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__clock_pausable_names_phjbr2fipl"() IS 'names of roster ClockPausable (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_names_pjdgx4s6a4"() IS 'names of roster ClockRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_names_3kro23qfv4"() IS 'names of roster ClockRootKind (62edc48c84e06e981b949cb51c8337c58291d320e97ddaa90c0ffa0d47a1438c)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_names_i6k53d3e2e"() IS 'names of roster FanChildKind (8ded20e9870697347aad8af4862ccc68f6964e6f66ab9fd021269b219a0d455a)';

COMMENT ON FUNCTION "slice"."__fan_kind_names_6jgkvuzg33"() IS 'names of roster FanKind (f0b7414eff40e4de2ddd8656d69b20e0a311df5847900584e11891d869c9169c)';

COMMENT ON FUNCTION "slice"."__fan_outcome_names_7pbhseigfj"() IS 'names of roster FanOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__fan_pausable_names_fpk6cvxfiv"() IS 'names of roster FanPausable (cb358d730ebdebd3a9c3a57e1163016923372f8895e0dde2377cbc07aa22f3b4)';

COMMENT ON FUNCTION "slice"."__fan_resource_names_tugc7yp6xo"() IS 'names of roster FanResource (5bea949a8ab6e8182609b54fd43410c2c13a5abe4a43bb2905848fd3ad333c76)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_names_shpypqrqhk"() IS 'names of roster FanRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_names_jqlbcidhe6"() IS 'names of roster FanRootKind (e3fe543965aa8ef0f48182f18100dd7512f09c57343e7fde5cda628087d096ed)';

COMMENT ON FUNCTION "slice"."__feed_names_azjbqebc6i"() IS 'names of roster Feed (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__retry_kind_names_yg2tu5rejg"() IS 'names of roster RetryKind (52d1641ee7becdce043e47817f26bcd0053f8104ccc945dc8eee1631d285632a)';

COMMENT ON FUNCTION "slice"."__retry_outcome_names_zzz2kawwsa"() IS 'names of roster RetryOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__retry_pausable_names_hen5ycf77m"() IS 'names of roster RetryPausable (5afc5b4d0dc688a8cb761da4f852c480fcc608475687c142d6abd7f05faf8f28)';

COMMENT ON FUNCTION "slice"."__retry_retry_why_names_pwmdyzqghs"() IS 'names of roster RetryRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__retry_root_kind_names_bhf4onc7wq"() IS 'names of roster RetryRootKind (5afc5b4d0dc688a8cb761da4f852c480fcc608475687c142d6abd7f05faf8f28)';

COMMENT ON FUNCTION "slice"."__review_child_kind_names_jn3iwx7yal"() IS 'names of roster ReviewChildKind (e585af7cda5f761a356c3a25337e96da40d454ae758150759a49577600d2f0b2)';

COMMENT ON FUNCTION "slice"."__review_kind_names_j4pukr2klj"() IS 'names of roster ReviewKind (0c55b46af9d21a92397a045d5a98b91cd92ae1cee79a210d6d92ca722f50c804)';

COMMENT ON FUNCTION "slice"."__review_outcome_names_nlfaf7zb7f"() IS 'names of roster ReviewOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__review_pausable_names_uhujnxcsz6"() IS 'names of roster ReviewPausable (7ff6017ce866d4117f5ca1a9bc062a167944c3de157f8bf04e9be7ead037b00b)';

COMMENT ON FUNCTION "slice"."__review_resource_names_ixi3gnpcnp"() IS 'names of roster ReviewResource (833b456ce4c6de0e144d62ab9a919da80622a598640450650574ef374bf96815)';

COMMENT ON FUNCTION "slice"."__review_retry_why_names_4ux5dj2mh3"() IS 'names of roster ReviewRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__review_root_kind_names_uvxmjcavxb"() IS 'names of roster ReviewRootKind (56ff295fd83dd6bed36ee892223241caf26f3ada4b800c3c1ae54b28b7ad608e)';

COMMENT ON FUNCTION "slice"."__sync_kind_names_oq6b66cstu"() IS 'names of roster SyncKind (1db7074a36145942b21817905eb40c653b0824cd2fa05fe9b9549907562b977c)';

COMMENT ON FUNCTION "slice"."__sync_outcome_names_xzb4y4xgki"() IS 'names of roster SyncOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__sync_pausable_names_3hzpsqgfjl"() IS 'names of roster SyncPausable (5599aacd43f74e79063c3306c8bd73db92d44f3dcabfcb5d022a7900cfa5c56a)';

COMMENT ON FUNCTION "slice"."__sync_retry_why_names_o3uvvn3247"() IS 'names of roster SyncRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__sync_root_kind_names_drp422srbk"() IS 'names of roster SyncRootKind (5599aacd43f74e79063c3306c8bd73db92d44f3dcabfcb5d022a7900cfa5c56a)';

COMMENT ON FUNCTION "slice"."__writeback_kind_names_dbe6fofbjq"() IS 'names of roster WritebackKind (54a3dcd1be7f6066502214901f3047974d0f174a6228e1bc4f2d0ecb861e3a57)';

COMMENT ON FUNCTION "slice"."__writeback_outcome_names_oq43xsnmec"() IS 'names of roster WritebackOutcome (82a110e4a67b9eb26002a0d95cd17a2a11bb93419b6bbcf77b61d96796e4106a)';

COMMENT ON FUNCTION "slice"."__writeback_pausable_names_mqzeerbulh"() IS 'names of roster WritebackPausable (f92156d78e6d6b3d8acddabc8c25f812877811ffa6d2b4a84de1d6ef10fc80c2)';

COMMENT ON FUNCTION "slice"."__writeback_retry_why_names_7a7eowjbic"() IS 'names of roster WritebackRetryWhy (c7fd48b2222fc91d61fd8e434aa866d10c4717f9518054518655246cdaba35af)';

COMMENT ON FUNCTION "slice"."__writeback_root_kind_names_bz7cmi256x"() IS 'names of roster WritebackRootKind (f92156d78e6d6b3d8acddabc8c25f812877811ffa6d2b4a84de1d6ef10fc80c2)';

COMMENT ON FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_names_xmttbhjv35"() IS 'names of roster assign_assignment_input_mode_pgalmghonldnf (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_names_5omagnt752"() IS 'names of roster assign_decide_input_mode_beoibaghjodnf (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_names_lbsn3oin3d"() IS 'names of roster assign_decide_output_stage_bjoijbfcegdbp (339c465d1efa6f01b66b7f28251a710c6ef4b703c2ae24784db44b69786c3ad6)';

COMMENT ON FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_names_nkilz2bp6w"() IS 'names of roster assign_embed_input_mode_pblkjdhncepei (da179d771441245bb5c445fd5357c17c06fadf9a10df8441f8c4ee2d73601612)';

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_names_kaa5lptj3s"() IS 'names of roster chain_chain_run_input_feed_dcnlhjpledlkf (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_names_v7pruukmkm"() IS 'names of roster chain_ordered_input_feed_hbpmfpphpfngm (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_names_xg55anlvxp"() IS 'names of roster chain_page_input_feed_nlhfmgjplihkf (680decfc5f7c5dce0a8514706351fe286818e7840b3167b02f53f9918a3f7e66)';

COMMENT ON FUNCTION "slice"."__assign_kind_live_epoonlekfm"() IS 'live codes of roster AssignKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__assign_outcome_live_3t7oirgwzl"() IS 'live codes of roster AssignOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_pausable_live_spku342qp6"() IS 'live codes of roster AssignPausable (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__assign_retry_why_live_qfzksuyq3m"() IS 'live codes of roster AssignRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__assign_root_kind_live_nccqmed4lq"() IS 'live codes of roster AssignRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__chain_kind_live_4t2tj7pchx"() IS 'live codes of roster ChainKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_outcome_live_azc7nb42gy"() IS 'live codes of roster ChainOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_pausable_live_ozpbw3gnsu"() IS 'live codes of roster ChainPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_retry_why_live_m5qnitynhz"() IS 'live codes of roster ChainRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__chain_root_kind_live_mnlnztwbz2"() IS 'live codes of roster ChainRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_kind_live_kem5uxahz7"() IS 'live codes of roster ClockKind (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__clock_outcome_live_q7vjmi72sr"() IS 'live codes of roster ClockOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_pausable_live_waldzggn7s"() IS 'live codes of roster ClockPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__clock_retry_why_live_auqnukeed5"() IS 'live codes of roster ClockRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__clock_root_kind_live_dkya2k5nqw"() IS 'live codes of roster ClockRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_child_kind_live_lzght2aqpn"() IS 'live codes of roster FanChildKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_kind_live_wcuqzqhqwl"() IS 'live codes of roster FanKind (81c5f5fc8ba40698944d57540929dee29893d3bf66a84aacfe8dc2be09d996e3)';

COMMENT ON FUNCTION "slice"."__fan_outcome_live_nos3iqln54"() IS 'live codes of roster FanOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__fan_pausable_live_m2rf37xwjt"() IS 'live codes of roster FanPausable (591ae590686ec68aa03e699030fe62fdeae06b893d263428aab7d66397d0f1fe)';

COMMENT ON FUNCTION "slice"."__fan_resource_live_yqyw4ee5fp"() IS 'live codes of roster FanResource (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__fan_retry_why_live_yom5egfb4x"() IS 'live codes of roster FanRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__fan_root_kind_live_zwogjm2ro3"() IS 'live codes of roster FanRootKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__feed_live_pfwkvulieq"() IS 'live codes of roster Feed (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__retry_kind_live_lujs5xc25d"() IS 'live codes of roster RetryKind (81c5f5fc8ba40698944d57540929dee29893d3bf66a84aacfe8dc2be09d996e3)';

COMMENT ON FUNCTION "slice"."__retry_outcome_live_fdo5qezp4f"() IS 'live codes of roster RetryOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__retry_pausable_live_buioe34fit"() IS 'live codes of roster RetryPausable (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__retry_retry_why_live_p4et7ysqjo"() IS 'live codes of roster RetryRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__retry_root_kind_live_euautuyuhd"() IS 'live codes of roster RetryRootKind (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__review_child_kind_live_xb5v52t6gq"() IS 'live codes of roster ReviewChildKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__review_kind_live_3egbkjww5a"() IS 'live codes of roster ReviewKind (591ae590686ec68aa03e699030fe62fdeae06b893d263428aab7d66397d0f1fe)';

COMMENT ON FUNCTION "slice"."__review_outcome_live_svq4irpcsp"() IS 'live codes of roster ReviewOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__review_pausable_live_at7bdrj2is"() IS 'live codes of roster ReviewPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__review_resource_live_bbskolaran"() IS 'live codes of roster ReviewResource (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__review_retry_why_live_sp7od4pwim"() IS 'live codes of roster ReviewRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__review_root_kind_live_vkjzjpusnp"() IS 'live codes of roster ReviewRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__sync_kind_live_mrzzgu2rqf"() IS 'live codes of roster SyncKind (b74579d3b64ecff081cab2731adb2464f839e99b2eed45d65b3c1547c74f2de1)';

COMMENT ON FUNCTION "slice"."__sync_outcome_live_7gndrvrenw"() IS 'live codes of roster SyncOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__sync_pausable_live_7gx4kdgs6e"() IS 'live codes of roster SyncPausable (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__sync_retry_why_live_t6r5ysh2pa"() IS 'live codes of roster SyncRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__sync_root_kind_live_vi4cdymudd"() IS 'live codes of roster SyncRootKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_kind_live_gxqp25qbem"() IS 'live codes of roster WritebackKind (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_outcome_live_haxkgy2wa4"() IS 'live codes of roster WritebackOutcome (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__writeback_pausable_live_rwjxemvunq"() IS 'live codes of roster WritebackPausable (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__writeback_retry_why_live_6vffrr6k2o"() IS 'live codes of roster WritebackRetryWhy (172efd8b2eef24193d3dce248edca3d8416daad89c20bd6348c3a5d0e86d4d5b)';

COMMENT ON FUNCTION "slice"."__writeback_root_kind_live_ifibfl2f7i"() IS 'live codes of roster WritebackRootKind (d7a5edc3955cc1a7992fa761c9cc9bd7d80a48366065a6306e8b39e1ca3932ab)';

COMMENT ON FUNCTION "slice"."__assign_assignment_input_mode_pgalmghonldnf_live_hnhltsft3j"() IS 'live codes of roster assign_assignment_input_mode_pgalmghonldnf (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_decide_input_mode_beoibaghjodnf_live_n5fgqa2pra"() IS 'live codes of roster assign_decide_input_mode_beoibaghjodnf (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_decide_output_stage_bjoijbfcegdbp_live_bq7gftl3fd"() IS 'live codes of roster assign_decide_output_stage_bjoijbfcegdbp (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__assign_embed_input_mode_pblkjdhncepei_live_2pkpukoa7x"() IS 'live codes of roster assign_embed_input_mode_pblkjdhncepei (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_chain_run_input_feed_dcnlhjpledlkf_live_xlktrsrchl"() IS 'live codes of roster chain_chain_run_input_feed_dcnlhjpledlkf (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_ordered_input_feed_hbpmfpphpfngm_live_r3kilaismv"() IS 'live codes of roster chain_ordered_input_feed_hbpmfpphpfngm (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON FUNCTION "slice"."__chain_page_input_feed_nlhfmgjplihkf_live_ey7duvpku5"() IS 'live codes of roster chain_page_input_feed_nlhfmgjplihkf (f80b6953419f9aa8ea93323a6d5e3f06182c57018d537842383ceca681622491)';

COMMENT ON DOMAIN "slice"."__domain_gfw43vigph" IS 'domain of definition 39922592cedecf769d6df372d6df99e0b82206b0bf6dacd9722d0490f83cc782';

COMMENT ON DOMAIN "slice"."__domain_mxhao3k6ss" IS 'domain of definition be4e1f34160619e14c4a8009e96d1ced7b683a1e169a9e4d0e9e10640701b8aa';

COMMENT ON DOMAIN "slice"."__domain_e5fpjchj5r" IS 'domain of definition c6c35aac57a789c3caa4b6344f7458c40632585c23667de7b724659d897647e5';

COMMENT ON DOMAIN "slice"."__domain_p7dj7oebtz" IS 'domain of definition db25dd39e94cd7f1ccb54e669ba299e617489799d273326e340a1a533e0b94bd';

COMMENT ON DOMAIN "slice"."__text_t4rwovzmqj" IS 'text domain of definition 6f5ba169462bdb47db4c56bb5fe21d5091867333e4952f2c20b18e8fa085befc';

COMMENT ON DOMAIN "slice"."__param_nearest_topic_4eruqlfauv" IS 'pattern domain of parameter nearest.topic of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON DOMAIN "slice"."__param_seen_learner_exdgowkpja" IS 'pattern domain of parameter seen.learner of definition c83059a9a99ede4f852cdadf3bb2a8e07b8271fc5f9a41b0fb682d35dc8f9547';

COMMENT ON CONSTRAINT "__assigned_pk_72xowecbf7" ON "slice"."assigned" IS 'primary key of Assigned';

COMMENT ON CONSTRAINT "__built_pk_5tj25hcq6k" ON "slice"."built" IS 'primary key of Built';

COMMENT ON CONSTRAINT "__chimed_pk_7p6ypuplhn" ON "slice"."chimed" IS 'primary key of Chimed';

COMMENT ON CONSTRAINT "__concluded_pk_b44jbktrki" ON "slice"."concluded" IS 'primary key of Concluded';

COMMENT ON CONSTRAINT "__copied_pk_6dsi4gohbu" ON "slice"."copied" IS 'primary key of Copied';

COMMENT ON CONSTRAINT "__cursor_pk_wl2ngqny4j" ON "slice"."cursor" IS 'primary key of Cursor';

COMMENT ON CONSTRAINT "__delivered_pk_xzukubt47t" ON "slice"."delivered" IS 'primary key of Delivered';

COMMENT ON CONSTRAINT "__heard_pk_sdu7ysinks" ON "slice"."heard" IS 'primary key of Heard';

COMMENT ON CONSTRAINT "__item_pk_ai4obgmq4k" ON "slice"."item" IS 'primary key of Item';

COMMENT ON CONSTRAINT "__order_pk_qodq3est7o" ON "slice"."order" IS 'primary key of Order';

COMMENT ON CONSTRAINT "__passage_pk_kayjlxd3gv" ON "slice"."passage" IS 'primary key of Passage';

COMMENT ON CONSTRAINT "__passage_norm_embedding_d2siyt575a" ON "slice"."passage" IS 'cosine norm check of Passage.embedding';

COMMENT ON CONSTRAINT "__reviewed_pk_z3sm6wzse2" ON "slice"."reviewed" IS 'primary key of Reviewed';

COMMENT ON CONSTRAINT "__seen_pk_g4ptcxwowb" ON "slice"."seen" IS 'primary key of Seen';

COMMENT ON CONSTRAINT "__settled_pk_yitdz6z3ts" ON "slice"."settled" IS 'primary key of Settled';

COMMENT ON CONSTRAINT "__summary_pk_rpajkerfah" ON "slice"."summary" IS 'primary key of Summary';

COMMENT ON CONSTRAINT "__tally_pk_7jc66uxxx4" ON "slice"."tally" IS 'primary key of Tally';

COMMENT ON CONSTRAINT "__want_pk_exjpgudfoz" ON "slice"."want" IS 'primary key of Want';

COMMENT ON CONSTRAINT "__weight_pk_p77rl634io" ON "slice"."weight" IS 'primary key of Weight';

COMMENT ON CONSTRAINT "__assign_admitted_pk_gj2obtfaxk" ON "slice_den"."assign_admitted" IS 'primary key of AssignAdmitted';

COMMENT ON CONSTRAINT "__assign_asked_fobgfofknpfgd_pk_zwuexn4abr" ON "slice_den"."assign_asked_fobgfofknpfgd" IS 'primary key of assign_asked_fobgfofknpfgd';

COMMENT ON CONSTRAINT "__assign_asked_fobgfofknpfgd_key_root_to_mdnjlh3dek" ON "slice_den"."assign_asked_fobgfofknpfgd" IS 'key assign_asked_fobgfofknpfgd(root, to)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_pk_3tpsskfebg" ON "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" IS 'primary key of assign_assignment_finish_output_dehjnhpeahpgb';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_pk_wnc37cjl4x" ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" IS 'primary key of assign_assignment_input_exclude_paaebdpkimebl';

COMMENT ON CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_pk_k6qs6m5nlk" ON "slice_den"."assign_assignment_input_kijoknpmnpomn" IS 'primary key of assign_assignment_input_kijoknpmnpomn';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_jdmfgbfmpepjd_3ygubwe7ee" ON "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" IS 'primary key of assign_assignment_input_mode_nearest_jdmfgbfmpepjd';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_iahlinklmdadj_k3dzzitlnz" ON "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" IS 'primary key of assign_assignment_input_mode_within_iahlinklmdadj';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_pk_3b3jxdxtxb" ON "slice_den"."assign_assignment_input_near_acilimddcfjog" IS 'primary key of assign_assignment_input_near_acilimddcfjog';

COMMENT ON CONSTRAINT "__assign_claim_pk_gy4yhzk2me" ON "slice_den"."assign_claim" IS 'primary key of AssignClaim';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_pk_tl6llpszmv" ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch" IS 'primary key of assign_decide_input_exclude_bpjgmijefddch';

COMMENT ON CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_pk_coujgrn4eb" ON "slice_den"."assign_decide_input_ffhdojphbdjfc" IS 'primary key of assign_decide_input_ffhdojphbdjfc';

COMMENT ON CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_norm_vector_574jeenfoa" ON "slice_den"."assign_decide_input_ffhdojphbdjfc" IS 'cosine norm check of assign_decide_input_ffhdojphbdjfc.vector';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_ijgbegdphofca_pk_rubjswnurd" ON "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" IS 'primary key of assign_decide_input_mode_nearest_ijgbegdphofca';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fgbilcoafbdcg_pk_ofuuhlrd6i" ON "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" IS 'primary key of assign_decide_input_mode_within_fgbilcoafbdcg';

COMMENT ON CONSTRAINT "__assign_decide_output_fkgbaoobeoima_pk_fytzodueb7" ON "slice_den"."assign_decide_output_fkgbaoobeoima" IS 'primary key of assign_decide_output_fkgbaoobeoima';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_gohjkdlkfnkca_pk_l7dwonp6ee" ON "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" IS 'primary key of assign_decide_output_stage_rest_gohjkdlkfnkca';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_chfjeagmkjoef_pk_tctme2k4gh" ON "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" IS 'primary key of assign_decide_output_stage_serve_chfjeagmkjoef';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_pk_gd5vrg65vs" ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" IS 'primary key of assign_decide_output_weighed_gpdibcghlfbhb';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_pk_hgofogcnrm" ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" IS 'primary key of assign_decide_read_nearest_mlemoegfgpbbi';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_pk_uhxwelhv6p" ON "slice_den"."assign_decide_read_seen_oahojgbpphboo" IS 'primary key of assign_decide_read_seen_oahojgbpphboo';

COMMENT ON CONSTRAINT "__assign_done_pk_gzil7jvxpz" ON "slice_den"."assign_done" IS 'primary key of AssignDone';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_pk_zvylolnf22" ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" IS 'primary key of assign_embed_input_exclude_gcjikbkjkcefj';

COMMENT ON CONSTRAINT "__assign_embed_input_kmlepfpdepkmo_pk_6ageqzpcpl" ON "slice_den"."assign_embed_input_kmlepfpdepkmo" IS 'primary key of assign_embed_input_kmlepfpdepkmo';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_bdiihcbmhfojp_pk_cqwp7cc3ts" ON "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" IS 'primary key of assign_embed_input_mode_nearest_bdiihcbmhfojp';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_oiehjhalkkkfi_pk_3ksbmmvu4t" ON "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" IS 'primary key of assign_embed_input_mode_within_oiehjhalkkkfi';

COMMENT ON CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_pk_t6epbwf2fm" ON "slice_den"."assign_embed_input_near_dhffcaodkgemm" IS 'primary key of assign_embed_input_near_dhffcaodkgemm';

COMMENT ON CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_pk_5ayauadfhj" ON "slice_den"."assign_embed_output_ghdpbieopfmkd" IS 'primary key of assign_embed_output_ghdpbieopfmkd';

COMMENT ON CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_norm_vector_bnzkcziwkn" ON "slice_den"."assign_embed_output_ghdpbieopfmkd" IS 'cosine norm check of assign_embed_output_ghdpbieopfmkd.vector';

COMMENT ON CONSTRAINT "__assign_ended_pk_nriwwbcneu" ON "slice_den"."assign_ended" IS 'primary key of AssignEnded';

COMMENT ON CONSTRAINT "__assign_exhausted_pk_utz6lwqgv6" ON "slice_den"."assign_exhausted" IS 'primary key of AssignExhausted';

COMMENT ON CONSTRAINT "__assign_failed_pk_ygxslcya4o" ON "slice_den"."assign_failed" IS 'primary key of AssignFailed';

COMMENT ON CONSTRAINT "__assign_fenced_pk_y6jyfviepa" ON "slice_den"."assign_fenced" IS 'primary key of AssignFenced';

COMMENT ON CONSTRAINT "__assign_finish_pk_kfe2ztwv2z" ON "slice_den"."assign_finish" IS 'primary key of AssignFinish';

COMMENT ON CONSTRAINT "__assign_finish_key_root_step_eqtmpheihj" ON "slice_den"."assign_finish" IS 'key AssignFinish(root, step)';

COMMENT ON CONSTRAINT "__assign_held_pk_by245z7t45" ON "slice_den"."assign_held" IS 'primary key of AssignHeld';

COMMENT ON CONSTRAINT "__assign_paused_pk_ulo4grv4e2" ON "slice_den"."assign_paused" IS 'primary key of AssignPaused';

COMMENT ON CONSTRAINT "__assign_refusal_pk_xs5e4ryh4k" ON "slice_den"."assign_refusal" IS 'primary key of AssignRefusal';

COMMENT ON CONSTRAINT "__assign_requested_with_pk_on2y3g7zqy" ON "slice_den"."assign_requested_with" IS 'primary key of AssignRequestedWith';

COMMENT ON CONSTRAINT "__assign_result_pk_i2yxmpkyzr" ON "slice_den"."assign_result" IS 'primary key of AssignResult';

COMMENT ON CONSTRAINT "__assign_resumed_pk_vy5pj6hbez" ON "slice_den"."assign_resumed" IS 'primary key of AssignResumed';

COMMENT ON CONSTRAINT "__assign_retry_pk_4dcm5yzzhe" ON "slice_den"."assign_retry" IS 'primary key of AssignRetry';

COMMENT ON CONSTRAINT "__assign_root_pk_b23qqyryx4" ON "slice_den"."assign_root" IS 'primary key of AssignRoot';

COMMENT ON CONSTRAINT "__assign_root_key_root_kind_albudrr2vv" ON "slice_den"."assign_root" IS 'key AssignRoot(root, kind)';

COMMENT ON CONSTRAINT "__assign_scope_pk_xytntbncid" ON "slice_den"."assign_scope" IS 'primary key of AssignScope';

COMMENT ON CONSTRAINT "__assign_scope_key_scope_6ayivwnr6w" ON "slice_den"."assign_scope" IS 'key AssignScope(scope)';

COMMENT ON CONSTRAINT "__assign_served_pk_gahaxyiegw" ON "slice_den"."assign_served" IS 'primary key of AssignServed';

COMMENT ON CONSTRAINT "__assign_skipped_pk_5qhgbueof7" ON "slice_den"."assign_skipped" IS 'primary key of AssignSkipped';

COMMENT ON CONSTRAINT "__assign_start_step_pk_jjcfkvptmp" ON "slice_den"."assign_start_step" IS 'primary key of AssignStartStep';

COMMENT ON CONSTRAINT "__assign_start_step_key_root_step_n7nc3rlewh" ON "slice_den"."assign_start_step" IS 'key AssignStartStep(root, step)';

COMMENT ON CONSTRAINT "__assign_step_pk_2oc4ehvfzd" ON "slice_den"."assign_step" IS 'primary key of AssignStep';

COMMENT ON CONSTRAINT "__assign_step_key_step_onrbsu6v67" ON "slice_den"."assign_step" IS 'key AssignStep(step)';

COMMENT ON CONSTRAINT "__audit_pk_dcvpvv5cjz" ON "slice_den"."audit" IS 'primary key of Audit';

COMMENT ON CONSTRAINT "__chain_admitted_pk_iexc6ruxuv" ON "slice_den"."chain_admitted" IS 'primary key of ChainAdmitted';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_pk_zzbczikpuw" ON "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" IS 'primary key of chain_chain_run_finish_output_lhniobmdeemdb';

COMMENT ON CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_pk_alztg3akrz" ON "slice_den"."chain_chain_run_input_glnkafcnkbnnn" IS 'primary key of chain_chain_run_input_glnkafcnkbnnn';

COMMENT ON CONSTRAINT "__chain_claim_pk_nrr2rn3gui" ON "slice_den"."chain_claim" IS 'primary key of ChainClaim';

COMMENT ON CONSTRAINT "__chain_done_pk_tyyx2hmu3r" ON "slice_den"."chain_done" IS 'primary key of ChainDone';

COMMENT ON CONSTRAINT "__chain_ended_pk_wusc7vjjx6" ON "slice_den"."chain_ended" IS 'primary key of ChainEnded';

COMMENT ON CONSTRAINT "__chain_exhausted_pk_nc4gvildnw" ON "slice_den"."chain_exhausted" IS 'primary key of ChainExhausted';

COMMENT ON CONSTRAINT "__chain_failed_pk_m7o5m3xzrr" ON "slice_den"."chain_failed" IS 'primary key of ChainFailed';

COMMENT ON CONSTRAINT "__chain_fenced_pk_wwbie4qq5k" ON "slice_den"."chain_fenced" IS 'primary key of ChainFenced';

COMMENT ON CONSTRAINT "__chain_finish_pk_ebe75jmnzy" ON "slice_den"."chain_finish" IS 'primary key of ChainFinish';

COMMENT ON CONSTRAINT "__chain_finish_key_root_step_jhhtviztjs" ON "slice_den"."chain_finish" IS 'key ChainFinish(root, step)';

COMMENT ON CONSTRAINT "__chain_held_pk_73idl7oo5c" ON "slice_den"."chain_held" IS 'primary key of ChainHeld';

COMMENT ON CONSTRAINT "__chain_next_bbflpfpnlejpm_pk_ghpdyk35dn" ON "slice_den"."chain_next_bbflpfpnlejpm" IS 'primary key of chain_next_bbflpfpnlejpm';

COMMENT ON CONSTRAINT "__chain_next_bbflpfpnlejpm_key_root_to_yisnmqzugp" ON "slice_den"."chain_next_bbflpfpnlejpm" IS 'key chain_next_bbflpfpnlejpm(root, to)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_pk_chmuvmc35e" ON "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" IS 'primary key of chain_ordered_finish_output_nnemphmmfdblb';

COMMENT ON CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_pk_43j3r5c3o6" ON "slice_den"."chain_ordered_input_pbjpmafopnahk" IS 'primary key of chain_ordered_input_pbjpmafopnahk';

COMMENT ON CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_pk_xtmsbhhw4n" ON "slice_den"."chain_page_input_after_gdigbcabbnakb" IS 'primary key of chain_page_input_after_gdigbcabbnakb';

COMMENT ON CONSTRAINT "__chain_page_input_jhliinhchcgno_pk_mtccxzfik6" ON "slice_den"."chain_page_input_jhliinhchcgno" IS 'primary key of chain_page_input_jhliinhchcgno';

COMMENT ON CONSTRAINT "__chain_page_output_dniojohpmhcee_pk_bcssky66vu" ON "slice_den"."chain_page_output_dniojohpmhcee" IS 'primary key of chain_page_output_dniojohpmhcee';

COMMENT ON CONSTRAINT "__chain_page_output_next_pocjijjpkpono_pk_c6mpadk5z3" ON "slice_den"."chain_page_output_next_pocjijjpkpono" IS 'primary key of chain_page_output_next_pocjijjpkpono';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_pk_f3kwzbcmi6" ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc" IS 'primary key of chain_page_read_earlier_dgehlbgebidjc';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_pk_f2wweyhnbt" ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem" IS 'primary key of chain_page_read_tree_items_cokakfjlndgem';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_first_ocgolceclfbii_pk_d4rydnykbr" ON "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" IS 'primary key of chain_page_read_tree_items_first_ocgolceclfbii';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_pk_3jp64uzlas" ON "slice_den"."chain_page_read_tree_lakencnpkciin" IS 'primary key of chain_page_read_tree_lakencnpkciin';

COMMENT ON CONSTRAINT "__chain_page_read_weights_agiabippcbobb_pk_lgg2rkx6aa" ON "slice_den"."chain_page_read_weights_agiabippcbobb" IS 'primary key of chain_page_read_weights_agiabippcbobb';

COMMENT ON CONSTRAINT "__chain_paused_pk_oorovhvyps" ON "slice_den"."chain_paused" IS 'primary key of ChainPaused';

COMMENT ON CONSTRAINT "__chain_refusal_pk_4j4yw3qc6m" ON "slice_den"."chain_refusal" IS 'primary key of ChainRefusal';

COMMENT ON CONSTRAINT "__chain_requested_with_pk_lkg4jmp76c" ON "slice_den"."chain_requested_with" IS 'primary key of ChainRequestedWith';

COMMENT ON CONSTRAINT "__chain_result_pk_btw3jzlkgl" ON "slice_den"."chain_result" IS 'primary key of ChainResult';

COMMENT ON CONSTRAINT "__chain_resumed_pk_smdbyqzxn2" ON "slice_den"."chain_resumed" IS 'primary key of ChainResumed';

COMMENT ON CONSTRAINT "__chain_retry_pk_522nodru3s" ON "slice_den"."chain_retry" IS 'primary key of ChainRetry';

COMMENT ON CONSTRAINT "__chain_root_pk_wqfycdg3x5" ON "slice_den"."chain_root" IS 'primary key of ChainRoot';

COMMENT ON CONSTRAINT "__chain_root_key_root_kind_nrgbg46psl" ON "slice_den"."chain_root" IS 'key ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_scope_pk_fxzt444lf6" ON "slice_den"."chain_scope" IS 'primary key of ChainScope';

COMMENT ON CONSTRAINT "__chain_scope_key_scope_w373uqpwyq" ON "slice_den"."chain_scope" IS 'key ChainScope(scope)';

COMMENT ON CONSTRAINT "__chain_served_pk_wzbdafznld" ON "slice_den"."chain_served" IS 'primary key of ChainServed';

COMMENT ON CONSTRAINT "__chain_skipped_pk_cjdtdttlyx" ON "slice_den"."chain_skipped" IS 'primary key of ChainSkipped';

COMMENT ON CONSTRAINT "__chain_start_step_pk_dgda7shxb4" ON "slice_den"."chain_start_step" IS 'primary key of ChainStartStep';

COMMENT ON CONSTRAINT "__chain_start_step_key_root_step_ncsd5g5nar" ON "slice_den"."chain_start_step" IS 'key ChainStartStep(root, step)';

COMMENT ON CONSTRAINT "__chain_step_pk_u6x5wnvfbv" ON "slice_den"."chain_step" IS 'primary key of ChainStep';

COMMENT ON CONSTRAINT "__chain_step_key_step_32tfhd2p5e" ON "slice_den"."chain_step" IS 'key ChainStep(step)';

COMMENT ON CONSTRAINT "__clock_admitted_pk_a7wwsyakra" ON "slice_den"."clock_admitted" IS 'primary key of ClockAdmitted';

COMMENT ON CONSTRAINT "__clock_chime_input_bfjhiocgaifco_pk_ict4u2hucx" ON "slice_den"."clock_chime_input_bfjhiocgaifco" IS 'primary key of clock_chime_input_bfjhiocgaifco';

COMMENT ON CONSTRAINT "__clock_chime_output_bddonoddgecmi_pk_5oymimh556" ON "slice_den"."clock_chime_output_bddonoddgecmi" IS 'primary key of clock_chime_output_bddonoddgecmi';

COMMENT ON CONSTRAINT "__clock_claim_pk_ihqmnokjqm" ON "slice_den"."clock_claim" IS 'primary key of ClockClaim';

COMMENT ON CONSTRAINT "__clock_close_input_bajjphdpmhlbc_pk_3vzvxcu52b" ON "slice_den"."clock_close_input_bajjphdpmhlbc" IS 'primary key of clock_close_input_bajjphdpmhlbc';

COMMENT ON CONSTRAINT "__clock_close_output_aoheikcdnbjpp_pk_lsp35zfxi7" ON "slice_den"."clock_close_output_aoheikcdnbjpp" IS 'primary key of clock_close_output_aoheikcdnbjpp';

COMMENT ON CONSTRAINT "__clock_done_pk_f4vl6frrax" ON "slice_den"."clock_done" IS 'primary key of ClockDone';

COMMENT ON CONSTRAINT "__clock_ended_pk_pqp6yh3qgg" ON "slice_den"."clock_ended" IS 'primary key of ClockEnded';

COMMENT ON CONSTRAINT "__clock_exhausted_pk_4m2tieyrky" ON "slice_den"."clock_exhausted" IS 'primary key of ClockExhausted';

COMMENT ON CONSTRAINT "__clock_failed_pk_6twuzcs6kf" ON "slice_den"."clock_failed" IS 'primary key of ClockFailed';

COMMENT ON CONSTRAINT "__clock_fenced_pk_mzppv2rrab" ON "slice_den"."clock_fenced" IS 'primary key of ClockFenced';

COMMENT ON CONSTRAINT "__clock_finish_pk_eqj7fcnrnq" ON "slice_den"."clock_finish" IS 'primary key of ClockFinish';

COMMENT ON CONSTRAINT "__clock_finish_key_root_step_gg4t25lynz" ON "slice_den"."clock_finish" IS 'key ClockFinish(root, step)';

COMMENT ON CONSTRAINT "__clock_held_pk_qqxrvee2gy" ON "slice_den"."clock_held" IS 'primary key of ClockHeld';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_pk_tfaztk3rrt" ON "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" IS 'primary key of clock_hourly_finish_output_mgokiakijlfbi';

COMMENT ON CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_pk_edrc5sftv5" ON "slice_den"."clock_hourly_input_nknibbhbedpnl" IS 'primary key of clock_hourly_input_nknibbhbedpnl';

COMMENT ON CONSTRAINT "__clock_hourly_key_cnlgnmcbbcgma_pk_5jtg5z5hg7" ON "slice_den"."clock_hourly_key_cnlgnmcbbcgma" IS 'primary key of clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON CONSTRAINT "__clock_hourly_key_cnlgnmcbbcgma_key_at_member_p7vwfwrkdp" ON "slice_den"."clock_hourly_key_cnlgnmcbbcgma" IS 'key clock_hourly_key_cnlgnmcbbcgma(at, memberDigest)';

COMMENT ON CONSTRAINT "__clock_paused_pk_fsld2lekav" ON "slice_den"."clock_paused" IS 'primary key of ClockPaused';

COMMENT ON CONSTRAINT "__clock_refusal_pk_dslb6cgxa3" ON "slice_den"."clock_refusal" IS 'primary key of ClockRefusal';

COMMENT ON CONSTRAINT "__clock_requested_with_pk_4p3mwvs5e3" ON "slice_den"."clock_requested_with" IS 'primary key of ClockRequestedWith';

COMMENT ON CONSTRAINT "__clock_result_pk_yptcdjm6pu" ON "slice_den"."clock_result" IS 'primary key of ClockResult';

COMMENT ON CONSTRAINT "__clock_resumed_pk_iqjwv5tioc" ON "slice_den"."clock_resumed" IS 'primary key of ClockResumed';

COMMENT ON CONSTRAINT "__clock_retry_pk_4kyiqeoeqd" ON "slice_den"."clock_retry" IS 'primary key of ClockRetry';

COMMENT ON CONSTRAINT "__clock_root_pk_rnmiw3efr2" ON "slice_den"."clock_root" IS 'primary key of ClockRoot';

COMMENT ON CONSTRAINT "__clock_root_key_root_kind_e4vt5g6ggk" ON "slice_den"."clock_root" IS 'key ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_scope_pk_dux445xz6c" ON "slice_den"."clock_scope" IS 'primary key of ClockScope';

COMMENT ON CONSTRAINT "__clock_scope_key_scope_ikor7cy7lf" ON "slice_den"."clock_scope" IS 'key ClockScope(scope)';

COMMENT ON CONSTRAINT "__clock_served_pk_t5lm3cvd5b" ON "slice_den"."clock_served" IS 'primary key of ClockServed';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_pk_rcyafn5tdb" ON "slice_den"."clock_sitting_finish_output_aahppmdaoafco" IS 'primary key of clock_sitting_finish_output_aahppmdaoafco';

COMMENT ON CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_pk_txnxjhnoqp" ON "slice_den"."clock_sitting_input_bckcjcndffgmo" IS 'primary key of clock_sitting_input_bckcjcndffgmo';

COMMENT ON CONSTRAINT "__clock_skipped_pk_2whj2jo6zo" ON "slice_den"."clock_skipped" IS 'primary key of ClockSkipped';

COMMENT ON CONSTRAINT "__clock_start_step_pk_qgw6bnuo54" ON "slice_den"."clock_start_step" IS 'primary key of ClockStartStep';

COMMENT ON CONSTRAINT "__clock_start_step_key_root_step_pknqcsg3yv" ON "slice_den"."clock_start_step" IS 'key ClockStartStep(root, step)';

COMMENT ON CONSTRAINT "__clock_step_pk_jjmk3diqpl" ON "slice_den"."clock_step" IS 'primary key of ClockStep';

COMMENT ON CONSTRAINT "__clock_step_key_step_hgcnovy6vv" ON "slice_den"."clock_step" IS 'key ClockStep(step)';

COMMENT ON CONSTRAINT "__fan_admitted_pk_jzt7rtrzny" ON "slice_den"."fan_admitted" IS 'primary key of FanAdmitted';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_pk_yuf2jtxwsr" ON "slice_den"."fan_batch_finish_output_djinnhndkglgj" IS 'primary key of fan_batch_finish_output_djinnhndkglgj';

COMMENT ON CONSTRAINT "__fan_batch_input_hjhhnklpfiilh_pk_3f46cdvt7m" ON "slice_den"."fan_batch_input_hjhhnklpfiilh" IS 'primary key of fan_batch_input_hjhhnklpfiilh';

COMMENT ON CONSTRAINT "__fan_claim_pk_e7zimqppco" ON "slice_den"."fan_claim" IS 'primary key of FanClaim';

COMMENT ON CONSTRAINT "__fan_claim_key_root_step_attempt_holds_zpvvoill72" ON "slice_den"."fan_claim" IS 'key FanClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_done_pk_5u65252q52" ON "slice_den"."fan_done" IS 'primary key of FanDone';

COMMENT ON CONSTRAINT "__fan_dust_input_lelfhikaelkja_pk_7ebhfuvwoi" ON "slice_den"."fan_dust_input_lelfhikaelkja" IS 'primary key of fan_dust_input_lelfhikaelkja';

COMMENT ON CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_pk_fbuwhsiybg" ON "slice_den"."fan_dust_output_pgpcjjjdmhkim" IS 'primary key of fan_dust_output_pgpcjjjdmhkim';

COMMENT ON CONSTRAINT "__fan_ended_pk_23aeteyyv7" ON "slice_den"."fan_ended" IS 'primary key of FanEnded';

COMMENT ON CONSTRAINT "__fan_exclusive_pk_m6sgdzlvmh" ON "slice_den"."fan_exclusive" IS 'primary key of FanExclusive';

COMMENT ON CONSTRAINT "__fan_exclusive_key_pk_dqq46aar7y" ON "slice_den"."fan_exclusive_key" IS 'primary key of FanExclusiveKey';

COMMENT ON CONSTRAINT "__fan_exhausted_pk_4t3sxjskvd" ON "slice_den"."fan_exhausted" IS 'primary key of FanExhausted';

COMMENT ON CONSTRAINT "__fan_failed_pk_z4etp5dmax" ON "slice_den"."fan_failed" IS 'primary key of FanFailed';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_pk_wnlgvoqkj2" ON "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" IS 'primary key of fan_fan_run_finish_output_kcmicfckgdcip';

COMMENT ON CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_pk_3ly3t6qubv" ON "slice_den"."fan_fan_run_input_bghibckinpfgk" IS 'primary key of fan_fan_run_input_bghibckinpfgk';

COMMENT ON CONSTRAINT "__fan_fenced_pk_6tkvirerez" ON "slice_den"."fan_fenced" IS 'primary key of FanFenced';

COMMENT ON CONSTRAINT "__fan_finish_pk_6mb33urjra" ON "slice_den"."fan_finish" IS 'primary key of FanFinish';

COMMENT ON CONSTRAINT "__fan_finish_key_root_step_4hpunaiysi" ON "slice_den"."fan_finish" IS 'key FanFinish(root, step)';

COMMENT ON CONSTRAINT "__fan_held_pk_4ic6tjvac4" ON "slice_den"."fan_held" IS 'primary key of FanHeld';

COMMENT ON CONSTRAINT "__fan_hold_pk_avuqdkljvb" ON "slice_den"."fan_hold" IS 'primary key of FanHold';

COMMENT ON CONSTRAINT "__fan_hold_key_root_step_attempt_at_vy3k4db54f" ON "slice_den"."fan_hold" IS 'key FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_ngghbiaegmghl_pk_pfew5tb3ab" ON "slice_den"."fan_mop_input_ngghbiaegmghl" IS 'primary key of fan_mop_input_ngghbiaegmghl';

COMMENT ON CONSTRAINT "__fan_mop_output_okmfngilefbec_pk_wk2mcyimwx" ON "slice_den"."fan_mop_output_okmfngilefbec" IS 'primary key of fan_mop_output_okmfngilefbec';

COMMENT ON CONSTRAINT "__fan_paused_pk_3eaz2xb4qg" ON "slice_den"."fan_paused" IS 'primary key of FanPaused';

COMMENT ON CONSTRAINT "__fan_refusal_pk_7va55wo2wj" ON "slice_den"."fan_refusal" IS 'primary key of FanRefusal';

COMMENT ON CONSTRAINT "__fan_released_pk_kzdup6rx4m" ON "slice_den"."fan_released" IS 'primary key of FanReleased';

COMMENT ON CONSTRAINT "__fan_requested_with_pk_vaj2obx6si" ON "slice_den"."fan_requested_with" IS 'primary key of FanRequestedWith';

COMMENT ON CONSTRAINT "__fan_result_pk_yeear352sx" ON "slice_den"."fan_result" IS 'primary key of FanResult';

COMMENT ON CONSTRAINT "__fan_resumed_pk_w6ao5h3tp7" ON "slice_den"."fan_resumed" IS 'primary key of FanResumed';

COMMENT ON CONSTRAINT "__fan_retry_pk_7xubce4v66" ON "slice_den"."fan_retry" IS 'primary key of FanRetry';

COMMENT ON CONSTRAINT "__fan_root_pk_jesu7xtefn" ON "slice_den"."fan_root" IS 'primary key of FanRoot';

COMMENT ON CONSTRAINT "__fan_root_key_root_kind_fhgsejgmzx" ON "slice_den"."fan_root" IS 'key FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_scope_pk_7bvjfihnef" ON "slice_den"."fan_scope" IS 'primary key of FanScope';

COMMENT ON CONSTRAINT "__fan_scope_key_scope_ehh72plhww" ON "slice_den"."fan_scope" IS 'key FanScope(scope)';

COMMENT ON CONSTRAINT "__fan_served_pk_hcfoxxhdsr" ON "slice_den"."fan_served" IS 'primary key of FanServed';

COMMENT ON CONSTRAINT "__fan_skipped_pk_22erbmfzer" ON "slice_den"."fan_skipped" IS 'primary key of FanSkipped';

COMMENT ON CONSTRAINT "__fan_square_input_ifddbjkaokoig_pk_kuqh53xx3z" ON "slice_den"."fan_square_input_ifddbjkaokoig" IS 'primary key of fan_square_input_ifddbjkaokoig';

COMMENT ON CONSTRAINT "__fan_square_output_gofcfljmlelgo_pk_spxndagxwh" ON "slice_den"."fan_square_output_gofcfljmlelgo" IS 'primary key of fan_square_output_gofcfljmlelgo';

COMMENT ON CONSTRAINT "__fan_start_scope_pk_nnms2gjwyi" ON "slice_den"."fan_start_scope" IS 'primary key of FanStartScope';

COMMENT ON CONSTRAINT "__fan_start_scope_key_root_child_7zmuuriysl" ON "slice_den"."fan_start_scope" IS 'key FanStartScope(root, child)';

COMMENT ON CONSTRAINT "__fan_start_step_pk_7e247xk4mz" ON "slice_den"."fan_start_step" IS 'primary key of FanStartStep';

COMMENT ON CONSTRAINT "__fan_start_step_key_root_step_edhkhzfqxw" ON "slice_den"."fan_start_step" IS 'key FanStartStep(root, step)';

COMMENT ON CONSTRAINT "__fan_step_pk_2f4tcxnofk" ON "slice_den"."fan_step" IS 'primary key of FanStep';

COMMENT ON CONSTRAINT "__fan_step_key_step_zhkwete5vm" ON "slice_den"."fan_step" IS 'key FanStep(step)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_pk_ou34mhle6p" ON "slice_den"."fan_sweep_finish_output_nebomlkgaabji" IS 'primary key of fan_sweep_finish_output_nebomlkgaabji';

COMMENT ON CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_pk_tiq7siogma" ON "slice_den"."fan_sweep_input_bnmfcblhkahec" IS 'primary key of fan_sweep_input_bnmfcblhkahec';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_pk_dkncit67lr" ON "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" IS 'primary key of fan_wanted_finish_output_lmjmjmcffnbda';

COMMENT ON CONSTRAINT "__fan_wanted_input_nfecjpihiaope_pk_uy3dkbftrt" ON "slice_den"."fan_wanted_input_nfecjpihiaope" IS 'primary key of fan_wanted_input_nfecjpihiaope';

COMMENT ON CONSTRAINT "__fan_wanted_key_ldjmcglkghhjb_pk_l7sqyrkhjn" ON "slice_den"."fan_wanted_key_ldjmcglkghhjb" IS 'primary key of fan_wanted_key_ldjmcglkghhjb';

COMMENT ON CONSTRAINT "__fan_wanted_key_ldjmcglkghhjb_key_batch_digest_xh3pwd4kw5" ON "slice_den"."fan_wanted_key_ldjmcglkghhjb" IS 'key fan_wanted_key_ldjmcglkghhjb(batchDigest)';

COMMENT ON CONSTRAINT "__fan_within_pk_g5tswgjfa6" ON "slice_den"."fan_within" IS 'primary key of FanWithin';

COMMENT ON CONSTRAINT "__retry_admitted_pk_qyp7cminjx" ON "slice_den"."retry_admitted" IS 'primary key of RetryAdmitted';

COMMENT ON CONSTRAINT "__retry_brittle_input_jbcpaiekdedpp_pk_ceqqpqbj6x" ON "slice_den"."retry_brittle_input_jbcpaiekdedpp" IS 'primary key of retry_brittle_input_jbcpaiekdedpp';

COMMENT ON CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_pk_nycwwzjoc4" ON "slice_den"."retry_brittle_output_bajcdgadpoeak" IS 'primary key of retry_brittle_output_bajcdgadpoeak';

COMMENT ON CONSTRAINT "__retry_claim_pk_aayzt5ni6z" ON "slice_den"."retry_claim" IS 'primary key of RetryClaim';

COMMENT ON CONSTRAINT "__retry_done_pk_vtkpce7rkq" ON "slice_den"."retry_done" IS 'primary key of RetryDone';

COMMENT ON CONSTRAINT "__retry_ended_pk_hq35r7u2t2" ON "slice_den"."retry_ended" IS 'primary key of RetryEnded';

COMMENT ON CONSTRAINT "__retry_exhausted_pk_v56c23krid" ON "slice_den"."retry_exhausted" IS 'primary key of RetryExhausted';

COMMENT ON CONSTRAINT "__retry_failed_pk_mygc4onczp" ON "slice_den"."retry_failed" IS 'primary key of RetryFailed';

COMMENT ON CONSTRAINT "__retry_fenced_pk_umzicmiruo" ON "slice_den"."retry_fenced" IS 'primary key of RetryFenced';

COMMENT ON CONSTRAINT "__retry_finish_pk_yhwp5uk5cg" ON "slice_den"."retry_finish" IS 'primary key of RetryFinish';

COMMENT ON CONSTRAINT "__retry_finish_key_root_step_lrmuwwupuk" ON "slice_den"."retry_finish" IS 'key RetryFinish(root, step)';

COMMENT ON CONSTRAINT "__retry_held_pk_nvgeylmjp2" ON "slice_den"."retry_held" IS 'primary key of RetryHeld';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_pk_h43obho42w" ON "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" IS 'primary key of retry_ladders_finish_output_pgebkobjaoiih';

COMMENT ON CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_pk_p42vp772df" ON "slice_den"."retry_ladders_input_fkbbgblmfmhbi" IS 'primary key of retry_ladders_input_fkbbgblmfmhbi';

COMMENT ON CONSTRAINT "__retry_patient_input_ndliolfjpjnoc_pk_hcegriyn3i" ON "slice_den"."retry_patient_input_ndliolfjpjnoc" IS 'primary key of retry_patient_input_ndliolfjpjnoc';

COMMENT ON CONSTRAINT "__retry_patient_output_geoaicaaojcfl_pk_aivxf2sigt" ON "slice_den"."retry_patient_output_geoaicaaojcfl" IS 'primary key of retry_patient_output_geoaicaaojcfl';

COMMENT ON CONSTRAINT "__retry_paused_pk_umm2nscqny" ON "slice_den"."retry_paused" IS 'primary key of RetryPaused';

COMMENT ON CONSTRAINT "__retry_polite_input_iopjdjgdhfide_pk_of6ihcilhh" ON "slice_den"."retry_polite_input_iopjdjgdhfide" IS 'primary key of retry_polite_input_iopjdjgdhfide';

COMMENT ON CONSTRAINT "__retry_polite_output_nicaghgpaemah_pk_hf7mayw6mu" ON "slice_den"."retry_polite_output_nicaghgpaemah" IS 'primary key of retry_polite_output_nicaghgpaemah';

COMMENT ON CONSTRAINT "__retry_refusal_pk_nifndsd6pp" ON "slice_den"."retry_refusal" IS 'primary key of RetryRefusal';

COMMENT ON CONSTRAINT "__retry_requested_with_pk_hud2g5nhzq" ON "slice_den"."retry_requested_with" IS 'primary key of RetryRequestedWith';

COMMENT ON CONSTRAINT "__retry_result_pk_5fegihvmml" ON "slice_den"."retry_result" IS 'primary key of RetryResult';

COMMENT ON CONSTRAINT "__retry_resumed_pk_jdtjm5vy5r" ON "slice_den"."retry_resumed" IS 'primary key of RetryResumed';

COMMENT ON CONSTRAINT "__retry_retry_pk_slrwn4rt5d" ON "slice_den"."retry_retry" IS 'primary key of RetryRetry';

COMMENT ON CONSTRAINT "__retry_root_pk_qi2iw36jky" ON "slice_den"."retry_root" IS 'primary key of RetryRoot';

COMMENT ON CONSTRAINT "__retry_root_key_root_kind_fljwbhyeaq" ON "slice_den"."retry_root" IS 'key RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_scope_pk_fgji2phvxy" ON "slice_den"."retry_scope" IS 'primary key of RetryScope';

COMMENT ON CONSTRAINT "__retry_scope_key_scope_cxzylhyf64" ON "slice_den"."retry_scope" IS 'key RetryScope(scope)';

COMMENT ON CONSTRAINT "__retry_served_pk_wgxtug7z34" ON "slice_den"."retry_served" IS 'primary key of RetryServed';

COMMENT ON CONSTRAINT "__retry_skipped_pk_au5z33ql7a" ON "slice_den"."retry_skipped" IS 'primary key of RetrySkipped';

COMMENT ON CONSTRAINT "__retry_start_step_pk_mp77csmi26" ON "slice_den"."retry_start_step" IS 'primary key of RetryStartStep';

COMMENT ON CONSTRAINT "__retry_start_step_key_root_step_zrielh73lq" ON "slice_den"."retry_start_step" IS 'key RetryStartStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_ebanfagjeadim_pk_6t725e3tkx" ON "slice_den"."retry_steadfast_input_ebanfagjeadim" IS 'primary key of retry_steadfast_input_ebanfagjeadim';

COMMENT ON CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_pk_jdxwdga2zr" ON "slice_den"."retry_steadfast_output_aacklbgjpefbn" IS 'primary key of retry_steadfast_output_aacklbgjpefbn';

COMMENT ON CONSTRAINT "__retry_step_pk_opjqidwhzg" ON "slice_den"."retry_step" IS 'primary key of RetryStep';

COMMENT ON CONSTRAINT "__retry_step_key_step_nrthvwlxer" ON "slice_den"."retry_step" IS 'key RetryStep(step)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_pk_pto4qhajx7" ON "slice_den"."retry_throttled_finish_output_plgallgljmddo" IS 'primary key of retry_throttled_finish_output_plgallgljmddo';

COMMENT ON CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_pk_b5jzz74k4s" ON "slice_den"."retry_throttled_input_bfjgfamhjmgcd" IS 'primary key of retry_throttled_input_bfjgfamhjmgcd';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_pk_dwhrndpy7r" ON "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" IS 'primary key of retry_unhurried_finish_output_oipogmdgcfehf';

COMMENT ON CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_pk_s2jaabfvgq" ON "slice_den"."retry_unhurried_input_mccbdnleajjif" IS 'primary key of retry_unhurried_input_mccbdnleajjif';

COMMENT ON CONSTRAINT "__review_admitted_pk_woy7ee4y4p" ON "slice_den"."review_admitted" IS 'primary key of ReviewAdmitted';

COMMENT ON CONSTRAINT "__review_analyze_input_aobppbhebnkae_pk_3tlc6zf5fm" ON "slice_den"."review_analyze_input_aobppbhebnkae" IS 'primary key of review_analyze_input_aobppbhebnkae';

COMMENT ON CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_pk_g4ekrcfpqs" ON "slice_den"."review_analyze_output_fhhkmphnmpkdm" IS 'primary key of review_analyze_output_fhhkmphnmpkdm';

COMMENT ON CONSTRAINT "__review_claim_pk_twa72qaol7" ON "slice_den"."review_claim" IS 'primary key of ReviewClaim';

COMMENT ON CONSTRAINT "__review_claim_key_root_step_attempt_holds_djm3xecw7o" ON "slice_den"."review_claim" IS 'key ReviewClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__review_done_pk_ve6inioidy" ON "slice_den"."review_done" IS 'primary key of ReviewDone';

COMMENT ON CONSTRAINT "__review_ended_pk_2hihcuxln2" ON "slice_den"."review_ended" IS 'primary key of ReviewEnded';

COMMENT ON CONSTRAINT "__review_exhausted_pk_5bmktauwd3" ON "slice_den"."review_exhausted" IS 'primary key of ReviewExhausted';

COMMENT ON CONSTRAINT "__review_failed_pk_7iszsjaybr" ON "slice_den"."review_failed" IS 'primary key of ReviewFailed';

COMMENT ON CONSTRAINT "__review_fenced_pk_chaexdbnzu" ON "slice_den"."review_fenced" IS 'primary key of ReviewFenced';

COMMENT ON CONSTRAINT "__review_finish_pk_ovczbakxjz" ON "slice_den"."review_finish" IS 'primary key of ReviewFinish';

COMMENT ON CONSTRAINT "__review_finish_key_root_step_cq4yeqzi25" ON "slice_den"."review_finish" IS 'key ReviewFinish(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_eiadkjkkdoiel_pk_gbhb3ypdne" ON "slice_den"."review_gather_input_eiadkjkkdoiel" IS 'primary key of review_gather_input_eiadkjkkdoiel';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_pk_jxjbxczykn" ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" IS 'primary key of review_gather_input_sizes_ifjkkjdhlfbgp';

COMMENT ON CONSTRAINT "__review_gather_output_cgnhmechbiddp_pk_qpwnlmlqdo" ON "slice_den"."review_gather_output_cgnhmechbiddp" IS 'primary key of review_gather_output_cgnhmechbiddp';

COMMENT ON CONSTRAINT "__review_held_pk_cwyo7jovuu" ON "slice_den"."review_held" IS 'primary key of ReviewHeld';

COMMENT ON CONSTRAINT "__review_hold_pk_uhb6w3fp5v" ON "slice_den"."review_hold" IS 'primary key of ReviewHold';

COMMENT ON CONSTRAINT "__review_hold_key_root_step_attempt_at_6p3v4lr6zi" ON "slice_den"."review_hold" IS 'key ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_pk_eamccblv6g" ON "slice_den"."review_paused" IS 'primary key of ReviewPaused';

COMMENT ON CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_pk_2cnmu5tf7m" ON "slice_den"."review_questions_finish_output_kddidbknbjeof" IS 'primary key of review_questions_finish_output_kddidbknbjeof';

COMMENT ON CONSTRAINT "__review_questions_input_jigaomgjefjfk_pk_2ile5frqdz" ON "slice_den"."review_questions_input_jigaomgjefjfk" IS 'primary key of review_questions_input_jigaomgjefjfk';

COMMENT ON CONSTRAINT "__review_refusal_pk_ajyglinn6r" ON "slice_den"."review_refusal" IS 'primary key of ReviewRefusal';

COMMENT ON CONSTRAINT "__review_requested_with_pk_eauvdhg7kh" ON "slice_den"."review_requested_with" IS 'primary key of ReviewRequestedWith';

COMMENT ON CONSTRAINT "__review_result_pk_o5x5griurk" ON "slice_den"."review_result" IS 'primary key of ReviewResult';

COMMENT ON CONSTRAINT "__review_resumed_pk_jqgqbkvl65" ON "slice_den"."review_resumed" IS 'primary key of ReviewResumed';

COMMENT ON CONSTRAINT "__review_retry_pk_is3m5sa5tx" ON "slice_den"."review_retry" IS 'primary key of ReviewRetry';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_pk_ufirbwdncv" ON "slice_den"."review_review_run_finish_output_fbgeikbjoigci" IS 'primary key of review_review_run_finish_output_fbgeikbjoigci';

COMMENT ON CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_pk_uu3dl3vtxh" ON "slice_den"."review_review_run_input_hpdfjnehnkdig" IS 'primary key of review_review_run_input_hpdfjnehnkdig';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_pk_dtnjsveolt" ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" IS 'primary key of review_review_run_input_sizes_fmllfmbfdoojd';

COMMENT ON CONSTRAINT "__review_root_pk_btvrw2kxvs" ON "slice_den"."review_root" IS 'primary key of ReviewRoot';

COMMENT ON CONSTRAINT "__review_root_key_root_kind_g7dcwn7ekf" ON "slice_den"."review_root" IS 'key ReviewRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_save_input_njbdjgekhblef_pk_6fwlixpogh" ON "slice_den"."review_save_input_njbdjgekhblef" IS 'primary key of review_save_input_njbdjgekhblef';

COMMENT ON CONSTRAINT "__review_save_output_falmopiohdlkl_pk_dnqpezok2g" ON "slice_den"."review_save_output_falmopiohdlkl" IS 'primary key of review_save_output_falmopiohdlkl';

COMMENT ON CONSTRAINT "__review_saved_bppbpjmhcjbaa_pk_q2r2gf3bdn" ON "slice_den"."review_saved_bppbpjmhcjbaa" IS 'primary key of review_saved_bppbpjmhcjbaa';

COMMENT ON CONSTRAINT "__review_saved_bppbpjmhcjbaa_key_root_to_z2jurtmyzn" ON "slice_den"."review_saved_bppbpjmhcjbaa" IS 'key review_saved_bppbpjmhcjbaa(root, to)';

COMMENT ON CONSTRAINT "__review_scope_pk_grsivyyp7b" ON "slice_den"."review_scope" IS 'primary key of ReviewScope';

COMMENT ON CONSTRAINT "__review_scope_key_scope_zikoayu732" ON "slice_den"."review_scope" IS 'key ReviewScope(scope)';

COMMENT ON CONSTRAINT "__review_served_pk_bkbrtbk3k7" ON "slice_den"."review_served" IS 'primary key of ReviewServed';

COMMENT ON CONSTRAINT "__review_skipped_pk_ymsn25w74u" ON "slice_den"."review_skipped" IS 'primary key of ReviewSkipped';

COMMENT ON CONSTRAINT "__review_split_fnhnebdnlfmck_pk_gxhaowqucs" ON "slice_den"."review_split_fnhnebdnlfmck" IS 'primary key of review_split_fnhnebdnlfmck';

COMMENT ON CONSTRAINT "__review_split_fnhnebdnlfmck_key_root_to_7pjeefvp6x" ON "slice_den"."review_split_fnhnebdnlfmck" IS 'key review_split_fnhnebdnlfmck(root, to)';

COMMENT ON CONSTRAINT "__review_start_scope_pk_qlm2r5uhqp" ON "slice_den"."review_start_scope" IS 'primary key of ReviewStartScope';

COMMENT ON CONSTRAINT "__review_start_scope_key_root_child_cz7ajv7kqf" ON "slice_den"."review_start_scope" IS 'key ReviewStartScope(root, child)';

COMMENT ON CONSTRAINT "__review_start_step_pk_w5suwqqg4p" ON "slice_den"."review_start_step" IS 'primary key of ReviewStartStep';

COMMENT ON CONSTRAINT "__review_start_step_key_root_step_sgv2fu4bpg" ON "slice_den"."review_start_step" IS 'key ReviewStartStep(root, step)';

COMMENT ON CONSTRAINT "__review_step_pk_gfbmnzqbc3" ON "slice_den"."review_step" IS 'primary key of ReviewStep';

COMMENT ON CONSTRAINT "__review_step_key_step_6zswnepqkd" ON "slice_den"."review_step" IS 'key ReviewStep(step)';

COMMENT ON CONSTRAINT "__review_within_pk_ohgogpkz4s" ON "slice_den"."review_within" IS 'primary key of ReviewWithin';

COMMENT ON CONSTRAINT "__sync_admitted_pk_ral53o3fpi" ON "slice_den"."sync_admitted" IS 'primary key of SyncAdmitted';

COMMENT ON CONSTRAINT "__sync_build_input_khidlilbdjpfi_pk_yiblgl4ug3" ON "slice_den"."sync_build_input_khidlilbdjpfi" IS 'primary key of sync_build_input_khidlilbdjpfi';

COMMENT ON CONSTRAINT "__sync_build_output_ianmlfhgbcfli_pk_ru726tgkge" ON "slice_den"."sync_build_output_ianmlfhgbcfli" IS 'primary key of sync_build_output_ianmlfhgbcfli';

COMMENT ON CONSTRAINT "__sync_claim_pk_s2tqnziq4u" ON "slice_den"."sync_claim" IS 'primary key of SyncClaim';

COMMENT ON CONSTRAINT "__sync_copy_input_fijfgeannmgef_pk_x637sg5i4d" ON "slice_den"."sync_copy_input_fijfgeannmgef" IS 'primary key of sync_copy_input_fijfgeannmgef';

COMMENT ON CONSTRAINT "__sync_copy_output_cfficoloepjbj_pk_ezbqmrrvgu" ON "slice_den"."sync_copy_output_cfficoloepjbj" IS 'primary key of sync_copy_output_cfficoloepjbj';

COMMENT ON CONSTRAINT "__sync_done_pk_nllomjb7og" ON "slice_den"."sync_done" IS 'primary key of SyncDone';

COMMENT ON CONSTRAINT "__sync_ended_pk_uxijjz7koz" ON "slice_den"."sync_ended" IS 'primary key of SyncEnded';

COMMENT ON CONSTRAINT "__sync_exclusive_pk_joiibnjuvf" ON "slice_den"."sync_exclusive" IS 'primary key of SyncExclusive';

COMMENT ON CONSTRAINT "__sync_exclusive_key_pk_dba4nxbky5" ON "slice_den"."sync_exclusive_key" IS 'primary key of SyncExclusiveKey';

COMMENT ON CONSTRAINT "__sync_exhausted_pk_ek6zxvo6it" ON "slice_den"."sync_exhausted" IS 'primary key of SyncExhausted';

COMMENT ON CONSTRAINT "__sync_failed_pk_gqykngewxb" ON "slice_den"."sync_failed" IS 'primary key of SyncFailed';

COMMENT ON CONSTRAINT "__sync_fenced_pk_tszx4qm2gz" ON "slice_den"."sync_fenced" IS 'primary key of SyncFenced';

COMMENT ON CONSTRAINT "__sync_finish_pk_hn7tmx25xc" ON "slice_den"."sync_finish" IS 'primary key of SyncFinish';

COMMENT ON CONSTRAINT "__sync_finish_key_root_step_mccyu3467o" ON "slice_den"."sync_finish" IS 'key SyncFinish(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_pk_ikmympt4ul" ON "slice_den"."sync_gold_finish_output_hkddafacepdaa" IS 'primary key of sync_gold_finish_output_hkddafacepdaa';

COMMENT ON CONSTRAINT "__sync_gold_input_edhkhlceilnoh_pk_4ql6udln3j" ON "slice_den"."sync_gold_input_edhkhlceilnoh" IS 'primary key of sync_gold_input_edhkhlceilnoh';

COMMENT ON CONSTRAINT "__sync_held_pk_wsme4moka4" ON "slice_den"."sync_held" IS 'primary key of SyncHeld';

COMMENT ON CONSTRAINT "__sync_paused_pk_tstk2okngj" ON "slice_den"."sync_paused" IS 'primary key of SyncPaused';

COMMENT ON CONSTRAINT "__sync_refusal_pk_mbmfornc5c" ON "slice_den"."sync_refusal" IS 'primary key of SyncRefusal';

COMMENT ON CONSTRAINT "__sync_released_pk_k7qaw2iram" ON "slice_den"."sync_released" IS 'primary key of SyncReleased';

COMMENT ON CONSTRAINT "__sync_requested_with_pk_dz754jk7j3" ON "slice_den"."sync_requested_with" IS 'primary key of SyncRequestedWith';

COMMENT ON CONSTRAINT "__sync_result_pk_jmwy2p3mqf" ON "slice_den"."sync_result" IS 'primary key of SyncResult';

COMMENT ON CONSTRAINT "__sync_resumed_pk_3xc5n2yvjk" ON "slice_den"."sync_resumed" IS 'primary key of SyncResumed';

COMMENT ON CONSTRAINT "__sync_retry_pk_6q52red7iw" ON "slice_den"."sync_retry" IS 'primary key of SyncRetry';

COMMENT ON CONSTRAINT "__sync_root_pk_daktpubfe2" ON "slice_den"."sync_root" IS 'primary key of SyncRoot';

COMMENT ON CONSTRAINT "__sync_root_key_root_kind_eiyeq632ma" ON "slice_den"."sync_root" IS 'key SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__sync_scope_pk_bg72sm6p4z" ON "slice_den"."sync_scope" IS 'primary key of SyncScope';

COMMENT ON CONSTRAINT "__sync_scope_key_scope_wd7ijpypy3" ON "slice_den"."sync_scope" IS 'key SyncScope(scope)';

COMMENT ON CONSTRAINT "__sync_served_pk_ed5gkrpyzv" ON "slice_den"."sync_served" IS 'primary key of SyncServed';

COMMENT ON CONSTRAINT "__sync_skipped_pk_yutjqacvws" ON "slice_den"."sync_skipped" IS 'primary key of SyncSkipped';

COMMENT ON CONSTRAINT "__sync_start_step_pk_4dv7h6kuu3" ON "slice_den"."sync_start_step" IS 'primary key of SyncStartStep';

COMMENT ON CONSTRAINT "__sync_start_step_key_root_step_otrdmdbrol" ON "slice_den"."sync_start_step" IS 'key SyncStartStep(root, step)';

COMMENT ON CONSTRAINT "__sync_step_pk_wfgcxdvbwo" ON "slice_den"."sync_step" IS 'primary key of SyncStep';

COMMENT ON CONSTRAINT "__sync_step_key_step_d7ugjkasz4" ON "slice_den"."sync_step" IS 'key SyncStep(step)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_pk_srsl36z6ta" ON "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" IS 'primary key of sync_sync_run_finish_output_inlpehpebjlbl';

COMMENT ON CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_pk_zoeaw7tohu" ON "slice_den"."sync_sync_run_input_kmejgmkijpoho" IS 'primary key of sync_sync_run_input_kmejgmkijpoho';

COMMENT ON CONSTRAINT "__writeback_admitted_pk_eplj3gsbzy" ON "slice_den"."writeback_admitted" IS 'primary key of WritebackAdmitted';

COMMENT ON CONSTRAINT "__writeback_claim_pk_j7bglnjq7b" ON "slice_den"."writeback_claim" IS 'primary key of WritebackClaim';

COMMENT ON CONSTRAINT "__writeback_deliver_input_libhnkibecamc_pk_h4vvbwdrkh" ON "slice_den"."writeback_deliver_input_libhnkibecamc" IS 'primary key of writeback_deliver_input_libhnkibecamc';

COMMENT ON CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_pk_kpnn2ovjgk" ON "slice_den"."writeback_deliver_output_ppecogpmgbpek" IS 'primary key of writeback_deliver_output_ppecogpmgbpek';

COMMENT ON CONSTRAINT "__writeback_done_pk_x32l3wxb3c" ON "slice_den"."writeback_done" IS 'primary key of WritebackDone';

COMMENT ON CONSTRAINT "__writeback_ended_pk_atnezxtfz6" ON "slice_den"."writeback_ended" IS 'primary key of WritebackEnded';

COMMENT ON CONSTRAINT "__writeback_exhausted_pk_sqddw6eedo" ON "slice_den"."writeback_exhausted" IS 'primary key of WritebackExhausted';

COMMENT ON CONSTRAINT "__writeback_failed_pk_g4uud6r5kb" ON "slice_den"."writeback_failed" IS 'primary key of WritebackFailed';

COMMENT ON CONSTRAINT "__writeback_fenced_pk_exblcoemag" ON "slice_den"."writeback_fenced" IS 'primary key of WritebackFenced';

COMMENT ON CONSTRAINT "__writeback_finish_pk_htcvidwpy6" ON "slice_den"."writeback_finish" IS 'primary key of WritebackFinish';

COMMENT ON CONSTRAINT "__writeback_finish_key_root_step_mwy36ww7ko" ON "slice_den"."writeback_finish" IS 'key WritebackFinish(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_pk_5tktjcet5w" ON "slice_den"."writeback_held" IS 'primary key of WritebackHeld';

COMMENT ON CONSTRAINT "__writeback_paused_pk_ncs2aff76t" ON "slice_den"."writeback_paused" IS 'primary key of WritebackPaused';

COMMENT ON CONSTRAINT "__writeback_refusal_pk_lqictdn67w" ON "slice_den"."writeback_refusal" IS 'primary key of WritebackRefusal';

COMMENT ON CONSTRAINT "__writeback_requested_with_pk_yiae7pktd3" ON "slice_den"."writeback_requested_with" IS 'primary key of WritebackRequestedWith';

COMMENT ON CONSTRAINT "__writeback_result_pk_lygppaax77" ON "slice_den"."writeback_result" IS 'primary key of WritebackResult';

COMMENT ON CONSTRAINT "__writeback_resumed_pk_qrrua45xou" ON "slice_den"."writeback_resumed" IS 'primary key of WritebackResumed';

COMMENT ON CONSTRAINT "__writeback_retry_pk_j2ien3obty" ON "slice_den"."writeback_retry" IS 'primary key of WritebackRetry';

COMMENT ON CONSTRAINT "__writeback_root_pk_a5puwyrem6" ON "slice_den"."writeback_root" IS 'primary key of WritebackRoot';

COMMENT ON CONSTRAINT "__writeback_root_key_root_kind_xcyyolrc7c" ON "slice_den"."writeback_root" IS 'key WritebackRoot(root, kind)';

COMMENT ON CONSTRAINT "__writeback_scope_pk_aywjorzcsy" ON "slice_den"."writeback_scope" IS 'primary key of WritebackScope';

COMMENT ON CONSTRAINT "__writeback_scope_key_scope_lessf5blgh" ON "slice_den"."writeback_scope" IS 'key WritebackScope(scope)';

COMMENT ON CONSTRAINT "__writeback_served_pk_pw2fwekjjm" ON "slice_den"."writeback_served" IS 'primary key of WritebackServed';

COMMENT ON CONSTRAINT "__writeback_skipped_pk_3pijvusl26" ON "slice_den"."writeback_skipped" IS 'primary key of WritebackSkipped';

COMMENT ON CONSTRAINT "__writeback_start_step_pk_sp7hkcjz7m" ON "slice_den"."writeback_start_step" IS 'primary key of WritebackStartStep';

COMMENT ON CONSTRAINT "__writeback_start_step_key_root_step_td6hftw5pk" ON "slice_den"."writeback_start_step" IS 'key WritebackStartStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_step_pk_xsrl5j4mlf" ON "slice_den"."writeback_step" IS 'primary key of WritebackStep';

COMMENT ON CONSTRAINT "__writeback_step_key_step_js3rfiokua" ON "slice_den"."writeback_step" IS 'key WritebackStep(step)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_pk_2nlialojia" ON "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" IS 'primary key of writeback_writeback_finish_output_mhjodpondhejh';

COMMENT ON CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_pk_oysiafmamn" ON "slice_den"."writeback_writeback_input_ljafdhfgfeocc" IS 'primary key of writeback_writeback_input_ljafdhfgfeocc';

COMMENT ON TABLE "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" IS 'the root relation of records assign_decide_read_nearest_mlemoegfgpbbi';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_row_pk_kw4c6ij55o" ON "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_qeus34p44q" IS 'primary key of assign_decide_read_nearest_mlemoegfgpbbiRow';

COMMENT ON TABLE "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" IS 'the root relation of records assign_decide_read_seen_oahojgbpphboo';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_row_pk_hmwq5jneqq" ON "slice_den"."__assign_decide_read_seen_oahojgbpphboo_dslrbm3ew6" IS 'primary key of assign_decide_read_seen_oahojgbpphbooRow';

COMMENT ON TABLE "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" IS 'the root relation of records chain_page_read_earlier_dgehlbgebidjc';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_row_pk_elsmuyerwp" ON "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_pxinir35ih" IS 'primary key of chain_page_read_earlier_dgehlbgebidjcRow';

COMMENT ON TABLE "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" IS 'the root relation of records chain_page_read_tree_lakencnpkciin';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_pk_7ub4nebjwy" ON "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" IS 'primary key of chain_page_read_tree_lakencnpkciinRow';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_key_digest_jplhxi7kvh" ON "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" IS 'key chain_page_read_tree_lakencnpkciinRow(digest, items)';

COMMENT ON TABLE "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" IS 'the root relation of records chain_page_read_weights_agiabippcbobb';

COMMENT ON CONSTRAINT "__chain_page_read_weights_agiabippcbobb_row_pk_n7j4766hix" ON "slice_den"."__chain_page_read_weights_agiabippcbobb_ejfk6qhpar" IS 'primary key of chain_page_read_weights_agiabippcbobbRow';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude_paaebdpkimebl"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_exclude_paaebdpkimebl"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_kijoknpmnpomn"."__tag_kind_assignment_q5nqvzv6jc" IS 'tag AssignRoot.kind = Assignment';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near_acilimddcfjog"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_assignment_input_near_acilimddcfjog"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."assign_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude_bpjgmijefddch"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_input_exclude_bpjgmijefddch"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near_dhffcaodkgemm"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."assign_embed_input_near_dhffcaodkgemm"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."assign_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."chain_chain_run_input_glnkafcnkbnnn"."__tag_kind_chain_run_ccthhdybqw" IS 'tag ChainRoot.kind = ChainRun';

COMMENT ON COLUMN "slice_den"."chain_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."chain_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."chain_ordered_input_pbjpmafopnahk"."__tag_kind_ordered_ms3hwzrkhl" IS 'tag ChainRoot.kind = Ordered';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items_cokakfjlndgem"."__copy_items_2mdhsp2eir" IS 'the owner''s count of the family chain_page_read_tree_lakencnpkciinRow.items';

COMMENT ON COLUMN "slice_den"."chain_page_read_tree_items_cokakfjlndgem"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."chain_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."clock_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."clock_hourly_input_nknibbhbedpnl"."__tag_kind_hourly_axvj7zlyzy" IS 'tag ClockRoot.kind = Hourly';

COMMENT ON COLUMN "slice_den"."clock_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."clock_sitting_input_bckcjcndffgmo"."__tag_kind_sitting_zbhu3onph5" IS 'tag ClockRoot.kind = Sitting';

COMMENT ON COLUMN "slice_den"."fan_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."fan_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."fan_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."fan_fan_run_input_bghibckinpfgk"."__tag_kind_fan_run_2liqlumqkj" IS 'tag FanRoot.kind = FanRun';

COMMENT ON COLUMN "slice_den"."fan_hold"."__copy_holds_hfzvk7t2xc" IS 'the owner''s count of the family FanClaim.holds';

COMMENT ON COLUMN "slice_den"."fan_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."fan_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."fan_sweep_input_bnmfcblhkahec"."__tag_kind_sweep_4lmrlblufr" IS 'tag FanRoot.kind = Sweep';

COMMENT ON COLUMN "slice_den"."fan_wanted_input_nfecjpihiaope"."__tag_kind_wanted_lpgalpid4g" IS 'tag FanRoot.kind = Wanted';

COMMENT ON COLUMN "slice_den"."retry_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."retry_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."retry_ladders_input_fkbbgblmfmhbi"."__tag_kind_ladders_amjml3bobr" IS 'tag RetryRoot.kind = Ladders';

COMMENT ON COLUMN "slice_den"."retry_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."retry_throttled_input_bfjgfamhjmgcd"."__tag_kind_throttled_uy63hl6qg7" IS 'tag RetryRoot.kind = Throttled';

COMMENT ON COLUMN "slice_den"."retry_unhurried_input_mccbdnleajjif"."__tag_kind_unhurried_yf3vrtngno" IS 'tag RetryRoot.kind = Unhurried';

COMMENT ON COLUMN "slice_den"."review_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."review_claim"."__pred_holds_lq7itfruzz" IS 'pred(holds)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."review_hold"."__copy_holds_a7bsyj5c52" IS 'the owner''s count of the family ReviewClaim.holds';

COMMENT ON COLUMN "slice_den"."review_hold"."__pred_at_xktcobhsti" IS 'pred(at)';

COMMENT ON COLUMN "slice_den"."review_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."review_review_run_input_hpdfjnehnkdig"."__tag_kind_review_run_npquoqpyk4" IS 'tag ReviewRoot.kind = ReviewRun';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd"."__root_yjobx7uyrd" IS 'root where Logic.ge(ordinal, 1n)';

COMMENT ON COLUMN "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd"."__pred_ordinal_e545zctcav" IS 'pred(ordinal)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."sync_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."sync_exclusive"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_gold_input_edhkhlceilnoh"."__tag_kind_gold_phmoz6zyym" IS 'tag SyncRoot.kind = Gold';

COMMENT ON COLUMN "slice_den"."sync_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."sync_sync_run_input_kmejgmkijpoho"."__tag_kind_sync_run_wmr74dvsia" IS 'tag SyncRoot.kind = SyncRun';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__root_yewsvvtcyz" IS 'root where Logic.ge(attempt, 1n)';

COMMENT ON COLUMN "slice_den"."writeback_claim"."__pred_attempt_oey4tm5xyl" IS 'pred(attempt)';

COMMENT ON COLUMN "slice_den"."writeback_paused"."__pred_turn_qryngij6c4" IS 'pred(turn)';

COMMENT ON COLUMN "slice_den"."writeback_writeback_input_ljafdhfgfeocc"."__tag_kind_writeback_7zc6o24iqm" IS 'tag WritebackRoot.kind = Writeback';

COMMENT ON COLUMN "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5"."__pred_items_3qltx5cx27" IS 'pred(items)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_key_wkzkgwjxor" ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem" IS 'key chain_page_read_tree_items_cokakfjlndgem(digest, pred(at))';

COMMENT ON CONSTRAINT "__fan_hold_key_root_step_attempt_pred_at_pr3hqe44bn" ON "slice_den"."fan_hold" IS 'key FanHold(root, step, attempt, pred(at))';

COMMENT ON CONSTRAINT "__review_hold_key_root_step_attempt_pred_at_adiit7mrkk" ON "slice_den"."review_hold" IS 'key ReviewHold(root, step, attempt, pred(at))';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_check_lww3zgpudy" ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem" IS 'check of chain_page_read_tree_items_cokakfjlndgem for law ordered chain_page_read_tree_items_cokakfjlndgem(digest, at) in fin(chain_page_read_tree_lakencnpkciinRow, items)';

COMMENT ON CONSTRAINT "__fan_hold_check_fan_hold_ordered_fan_claim_holds_zint2b2ifk" ON "slice_den"."fan_hold" IS 'check of FanHold for law ordered FanHold(root, step, attempt, at) in fin(FanClaim, holds)';

COMMENT ON CONSTRAINT "__review_hold_check_review_hold_ordered_review_claim_icnqunpnlb" ON "slice_den"."review_hold" IS 'check of ReviewHold for law ordered ReviewHold(root, step, attempt, at) in fin(ReviewClaim, holds)';

COMMENT ON CONSTRAINT "__assign_admitted_fk_root_scope_unmbbqjvuz" ON "slice_den"."assign_admitted" IS 'foreign key AssignAdmitted(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_from_35uqbuzjjo" ON "slice_den"."assign_asked_fobgfofknpfgd" IS 'foreign key assign_asked_fobgfofknpfgd(root, from) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_from_ksrpucwlti" ON "slice_den"."assign_asked_fobgfofknpfgd" IS 'foreign key assign_asked_fobgfofknpfgd(root, from) to assign_embed_output_ghdpbieopfmkd(root, step)';

COMMENT ON CONSTRAINT "__assign_asked_fobgfofknpfgd_fk_root_to_xpsfkprixb" ON "slice_den"."assign_asked_fobgfofknpfgd" IS 'foreign key assign_asked_fobgfofknpfgd(root, to) to assign_decide_input_ffhdojphbdjfc(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_fk_j3bzoyrvtb" ON "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" IS 'foreign key assign_assignment_finish_output_dehjnhpeahpgb(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_finish_output_dehjnhpeahpgb_fk_etpvd34xps" ON "slice_den"."assign_assignment_finish_output_dehjnhpeahpgb" IS 'foreign key assign_assignment_finish_output_dehjnhpeahpgb(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_t25jpjbxg2" ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" IS 'foreign key assign_assignment_input_exclude_paaebdpkimebl(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_pbgkyy77xx" ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" IS 'foreign key assign_assignment_input_exclude_paaebdpkimebl(root, scope) to assign_assignment_input_kijoknpmnpomn(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_exclude_paaebdpkimebl_fk_huhwy3lwrj" ON "slice_den"."assign_assignment_input_exclude_paaebdpkimebl" IS 'foreign key assign_assignment_input_exclude_paaebdpkimebl(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to assign_assignment_input_exclude_paaebdpkimebl(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_fk_root_bdcba6qkay" ON "slice_den"."assign_assignment_input_kijoknpmnpomn" IS 'foreign key assign_assignment_input_kijoknpmnpomn(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_kijoknpmnpomn_fk_scope_tag_hey7gpaebu" ON "slice_den"."assign_assignment_input_kijoknpmnpomn" IS 'foreign key assign_assignment_input_kijoknpmnpomn(scope, tag AssignRoot.kind = Assignment) to AssignRoot(root, kind)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_nearest_jdmfgbfmpepjd_cdgcr7vuyz" ON "slice_den"."assign_assignment_input_mode_nearest_jdmfgbfmpepjd" IS 'foreign key assign_assignment_input_mode_nearest_jdmfgbfmpepjd(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_mode_within_iahlinklmdadj_2qq5eqnfnl" ON "slice_den"."assign_assignment_input_mode_within_iahlinklmdadj" IS 'foreign key assign_assignment_input_mode_within_iahlinklmdadj(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_yxvw5ogs6d" ON "slice_den"."assign_assignment_input_near_acilimddcfjog" IS 'foreign key assign_assignment_input_near_acilimddcfjog(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_abhxul37bo" ON "slice_den"."assign_assignment_input_near_acilimddcfjog" IS 'foreign key assign_assignment_input_near_acilimddcfjog(root, scope) to assign_assignment_input_kijoknpmnpomn(root, scope)';

COMMENT ON CONSTRAINT "__assign_assignment_input_near_acilimddcfjog_fk_root_iy7m2e4j23" ON "slice_den"."assign_assignment_input_near_acilimddcfjog" IS 'foreign key assign_assignment_input_near_acilimddcfjog(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to assign_assignment_input_near_acilimddcfjog(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_step_z35ulxscvt" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_claim_fk_root_step_pred_attempt_bt5m6xhi43" ON "slice_den"."assign_claim" IS 'foreign key AssignClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_hdjjv4jedq" ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch" IS 'foreign key assign_decide_input_exclude_bpjgmijefddch(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_xhtn6pkixs" ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch" IS 'foreign key assign_decide_input_exclude_bpjgmijefddch(root, step) to assign_decide_input_ffhdojphbdjfc(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_exclude_bpjgmijefddch_fk_root_n5pioavbnr" ON "slice_den"."assign_decide_input_exclude_bpjgmijefddch" IS 'foreign key assign_decide_input_exclude_bpjgmijefddch(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to assign_decide_input_exclude_bpjgmijefddch(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_decide_input_ffhdojphbdjfc_fk_root_step_dc5aytpksr" ON "slice_den"."assign_decide_input_ffhdojphbdjfc" IS 'foreign key assign_decide_input_ffhdojphbdjfc(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_nearest_ijgbegdphofca_fk_xcu3pbhawz" ON "slice_den"."assign_decide_input_mode_nearest_ijgbegdphofca" IS 'foreign key assign_decide_input_mode_nearest_ijgbegdphofca(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_input_mode_within_fgbilcoafbdcg_fk_4elatiofnt" ON "slice_den"."assign_decide_input_mode_within_fgbilcoafbdcg" IS 'foreign key assign_decide_input_mode_within_fgbilcoafbdcg(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_rngb7c4gsl" ON "slice_den"."assign_decide_output_fkgbaoobeoima" IS 'foreign key assign_decide_output_fkgbaoobeoima(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_2k5ng7smh6" ON "slice_den"."assign_decide_output_fkgbaoobeoima" IS 'foreign key assign_decide_output_fkgbaoobeoima(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_fkgbaoobeoima_fk_root_step_3qv26zke3x" ON "slice_den"."assign_decide_output_fkgbaoobeoima" IS 'foreign key assign_decide_output_fkgbaoobeoima(root, step) to assign_decide_input_ffhdojphbdjfc(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_rest_gohjkdlkfnkca_fk_5nhffvarrx" ON "slice_den"."assign_decide_output_stage_rest_gohjkdlkfnkca" IS 'foreign key assign_decide_output_stage_rest_gohjkdlkfnkca(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_stage_serve_chfjeagmkjoef_fk_uy6iyqr4oj" ON "slice_den"."assign_decide_output_stage_serve_chfjeagmkjoef" IS 'foreign key assign_decide_output_stage_serve_chfjeagmkjoef(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_wf2rdhtsvy" ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" IS 'foreign key assign_decide_output_weighed_gpdibcghlfbhb(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_bpnbtzvn3m" ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" IS 'foreign key assign_decide_output_weighed_gpdibcghlfbhb(root, step) to assign_decide_output_fkgbaoobeoima(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_output_weighed_gpdibcghlfbhb_fk_root_ecyjf5hsks" ON "slice_den"."assign_decide_output_weighed_gpdibcghlfbhb" IS 'foreign key assign_decide_output_weighed_gpdibcghlfbhb(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to assign_decide_output_weighed_gpdibcghlfbhb(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_digest_6eir4ph3xl" ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" IS 'foreign key assign_decide_read_nearest_mlemoegfgpbbi(digest) to assign_decide_read_nearest_mlemoegfgpbbiRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_root_gvzoo3lxd5" ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" IS 'foreign key assign_decide_read_nearest_mlemoegfgpbbi(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_nearest_mlemoegfgpbbi_fk_root_wpbngffwnm" ON "slice_den"."assign_decide_read_nearest_mlemoegfgpbbi" IS 'foreign key assign_decide_read_nearest_mlemoegfgpbbi(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_digest_qqd5rjiap2" ON "slice_den"."assign_decide_read_seen_oahojgbpphboo" IS 'foreign key assign_decide_read_seen_oahojgbpphboo(digest) to assign_decide_read_seen_oahojgbpphbooRow(digest)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_root_step_i3t2je4ud6" ON "slice_den"."assign_decide_read_seen_oahojgbpphboo" IS 'foreign key assign_decide_read_seen_oahojgbpphboo(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_decide_read_seen_oahojgbpphboo_fk_root_step_rvhg25udcl" ON "slice_den"."assign_decide_read_seen_oahojgbpphboo" IS 'foreign key assign_decide_read_seen_oahojgbpphboo(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_done_fk_root_step_jnpyqphpod" ON "slice_den"."assign_done" IS 'foreign key AssignDone(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_vl5pmkbzlv" ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" IS 'foreign key assign_embed_input_exclude_gcjikbkjkcefj(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_mad3jtgvb3" ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" IS 'foreign key assign_embed_input_exclude_gcjikbkjkcefj(root, step) to assign_embed_input_kmlepfpdepkmo(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_exclude_gcjikbkjkcefj_fk_root_j6kft7kxym" ON "slice_den"."assign_embed_input_exclude_gcjikbkjkcefj" IS 'foreign key assign_embed_input_exclude_gcjikbkjkcefj(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to assign_embed_input_exclude_gcjikbkjkcefj(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_embed_input_kmlepfpdepkmo_fk_root_step_d3pnfjciyv" ON "slice_den"."assign_embed_input_kmlepfpdepkmo" IS 'foreign key assign_embed_input_kmlepfpdepkmo(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_nearest_bdiihcbmhfojp_fk_tdszs7ethi" ON "slice_den"."assign_embed_input_mode_nearest_bdiihcbmhfojp" IS 'foreign key assign_embed_input_mode_nearest_bdiihcbmhfojp(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_mode_within_oiehjhalkkkfi_fk_quiawspd5m" ON "slice_den"."assign_embed_input_mode_within_oiehjhalkkkfi" IS 'foreign key assign_embed_input_mode_within_oiehjhalkkkfi(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_g3tjla4bwp" ON "slice_den"."assign_embed_input_near_dhffcaodkgemm" IS 'foreign key assign_embed_input_near_dhffcaodkgemm(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_r37njts5tt" ON "slice_den"."assign_embed_input_near_dhffcaodkgemm" IS 'foreign key assign_embed_input_near_dhffcaodkgemm(root, step) to assign_embed_input_kmlepfpdepkmo(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_input_near_dhffcaodkgemm_fk_root_step_in4vutxgdi" ON "slice_den"."assign_embed_input_near_dhffcaodkgemm" IS 'foreign key assign_embed_input_near_dhffcaodkgemm(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to assign_embed_input_near_dhffcaodkgemm(root, step, ordinal)';

COMMENT ON CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_kifvgvihp4" ON "slice_den"."assign_embed_output_ghdpbieopfmkd" IS 'foreign key assign_embed_output_ghdpbieopfmkd(root, step) to AssignDone(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_qyxicekhha" ON "slice_den"."assign_embed_output_ghdpbieopfmkd" IS 'foreign key assign_embed_output_ghdpbieopfmkd(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_embed_output_ghdpbieopfmkd_fk_root_step_ptwq3bxxbz" ON "slice_den"."assign_embed_output_ghdpbieopfmkd" IS 'foreign key assign_embed_output_ghdpbieopfmkd(root, step) to assign_embed_input_kmlepfpdepkmo(root, step)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_step_fwsr5rmq4p" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_ended_fk_root_step_attempt_he35lvdstl" ON "slice_den"."assign_ended" IS 'foreign key AssignEnded(root, step, attempt) to AssignClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_step_cspvc4i2pv" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(root, step) to AssignFailed(root, step)';

COMMENT ON CONSTRAINT "__assign_exhausted_fk_root_step_6alordqsb5" ON "slice_den"."assign_exhausted" IS 'foreign key AssignExhausted(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_failed_fk_root_step_ipzrsjzgti" ON "slice_den"."assign_failed" IS 'foreign key AssignFailed(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_step_dnqe55jtoa" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_fenced_fk_root_step_attempt_rjjyfxo25t" ON "slice_den"."assign_fenced" IS 'foreign key AssignFenced(root, step, attempt) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_scope_az2daj5mvb" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_scope_f7uiptxzin" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_finish_fk_root_step_mkv6pbd4xq" ON "slice_den"."assign_finish" IS 'foreign key AssignFinish(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_6ut2ho42il" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step) to AssignResult(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_4jy2ibkhlr" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_held_fk_root_step_attempt_agnrzcmkqy" ON "slice_den"."assign_held" IS 'foreign key AssignHeld(root, step, attempt) to AssignClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_paused_fk_target_pred_turn_xgirbknudp" ON "slice_den"."assign_paused" IS 'foreign key AssignPaused(target, pred(turn)) to AssignResumed(target, turn)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_step_hwduhrbvbd" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(root, step) to AssignFailed(root, step)';

COMMENT ON CONSTRAINT "__assign_refusal_fk_root_step_af3aisimwq" ON "slice_den"."assign_refusal" IS 'foreign key AssignRefusal(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_requested_with_fk_root_zx4lvtx6x5" ON "slice_den"."assign_requested_with" IS 'foreign key AssignRequestedWith(root) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_result_fk_root_step_k4wpox452s" ON "slice_den"."assign_result" IS 'foreign key AssignResult(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_resumed_fk_target_turn_3xan3ax2be" ON "slice_den"."assign_resumed" IS 'foreign key AssignResumed(target, turn) to AssignPaused(target, turn)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_step_e2etghhjnd" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_retry_fk_root_step_attempt_374j3xrgm3" ON "slice_den"."assign_retry" IS 'foreign key AssignRetry(root, step, attempt) to AssignEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__assign_scope_fk_root_j4jocebgtw" ON "slice_den"."assign_scope" IS 'foreign key AssignScope(root) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_by_2bt5slbwgj" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(by) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_root_scope_jidurgue3e" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_skipped_fk_scope_x4sryze463" ON "slice_den"."assign_skipped" IS 'foreign key AssignSkipped(scope) to AssignRoot(root)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_scope_ixmywec4qv" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_scope_t7vctbm6kw" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__assign_start_step_fk_root_step_q57whinuhh" ON "slice_den"."assign_start_step" IS 'foreign key AssignStartStep(root, step) to AssignStep(root, step)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_scope_tiqkvqahkt" ON "slice_den"."assign_step" IS 'foreign key AssignStep(root, scope) to AssignAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__assign_step_fk_root_scope_4j4ldav7gl" ON "slice_den"."assign_step" IS 'foreign key AssignStep(root, scope) to AssignScope(root, scope)';

COMMENT ON CONSTRAINT "__audit_fk_step_root_eb7inhsrbm" ON "slice_den"."audit" IS 'foreign key Audit(step, root) to ChainResult(step, root)';

COMMENT ON CONSTRAINT "__chain_admitted_fk_root_scope_pyx6o74r6r" ON "slice_den"."chain_admitted" IS 'foreign key ChainAdmitted(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_fk_byyc7fcoc7" ON "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" IS 'foreign key chain_chain_run_finish_output_lhniobmdeemdb(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_chain_run_finish_output_lhniobmdeemdb_fk_hx3pepn2ki" ON "slice_den"."chain_chain_run_finish_output_lhniobmdeemdb" IS 'foreign key chain_chain_run_finish_output_lhniobmdeemdb(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_fk_root_scope_ofevnrxiou" ON "slice_den"."chain_chain_run_input_glnkafcnkbnnn" IS 'foreign key chain_chain_run_input_glnkafcnkbnnn(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_chain_run_input_glnkafcnkbnnn_fk_scope_tag_khrz236c3q" ON "slice_den"."chain_chain_run_input_glnkafcnkbnnn" IS 'foreign key chain_chain_run_input_glnkafcnkbnnn(scope, tag ChainRoot.kind = ChainRun) to ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_step_7edppg4aqs" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_claim_fk_root_step_pred_attempt_fmwmco64ak" ON "slice_den"."chain_claim" IS 'foreign key ChainClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_done_fk_root_step_7d3jwphqat" ON "slice_den"."chain_done" IS 'foreign key ChainDone(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_step_f53nmrcf4o" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ended_fk_root_step_attempt_daxikklndi" ON "slice_den"."chain_ended" IS 'foreign key ChainEnded(root, step, attempt) to ChainClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_step_4l7lqt7ji4" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(root, step) to ChainFailed(root, step)';

COMMENT ON CONSTRAINT "__chain_exhausted_fk_root_step_qen7piy3si" ON "slice_den"."chain_exhausted" IS 'foreign key ChainExhausted(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_failed_fk_root_step_wgrsezdykc" ON "slice_den"."chain_failed" IS 'foreign key ChainFailed(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_step_zoq4smze5v" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_fenced_fk_root_step_attempt_rjs5xdup6v" ON "slice_den"."chain_fenced" IS 'foreign key ChainFenced(root, step, attempt) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_scope_id3fnylkst" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_scope_cun3ubklxj" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_finish_fk_root_step_6graxxwr3k" ON "slice_den"."chain_finish" IS 'foreign key ChainFinish(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_qp5rohxglc" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_pzstggr5uz" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_held_fk_root_step_attempt_itfckrv27c" ON "slice_den"."chain_held" IS 'foreign key ChainHeld(root, step, attempt) to ChainClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_from_ttb3r2e3wo" ON "slice_den"."chain_next_bbflpfpnlejpm" IS 'foreign key chain_next_bbflpfpnlejpm(root, from) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_from_s23iaz7k4t" ON "slice_den"."chain_next_bbflpfpnlejpm" IS 'foreign key chain_next_bbflpfpnlejpm(root, from) to chain_page_output_dniojohpmhcee(root, step)';

COMMENT ON CONSTRAINT "__chain_next_bbflpfpnlejpm_fk_root_to_25czrorqdi" ON "slice_den"."chain_next_bbflpfpnlejpm" IS 'foreign key chain_next_bbflpfpnlejpm(root, to) to chain_page_input_jhliinhchcgno(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_fk_root_prd5vpo6nw" ON "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" IS 'foreign key chain_ordered_finish_output_nnemphmmfdblb(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_finish_output_nnemphmmfdblb_fk_root_glxwffdxca" ON "slice_den"."chain_ordered_finish_output_nnemphmmfdblb" IS 'foreign key chain_ordered_finish_output_nnemphmmfdblb(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_fk_root_scope_4wbbqttwrc" ON "slice_den"."chain_ordered_input_pbjpmafopnahk" IS 'foreign key chain_ordered_input_pbjpmafopnahk(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_ordered_input_pbjpmafopnahk_fk_scope_tag_2cg2jugtjz" ON "slice_den"."chain_ordered_input_pbjpmafopnahk" IS 'foreign key chain_ordered_input_pbjpmafopnahk(scope, tag ChainRoot.kind = Ordered) to ChainRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_fk_root_step_2a5gepmdde" ON "slice_den"."chain_page_input_after_gdigbcabbnakb" IS 'foreign key chain_page_input_after_gdigbcabbnakb(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_input_after_gdigbcabbnakb_fk_root_step_ucbqoyoryv" ON "slice_den"."chain_page_input_after_gdigbcabbnakb" IS 'foreign key chain_page_input_after_gdigbcabbnakb(root, step) to chain_page_input_jhliinhchcgno(root, step)';

COMMENT ON CONSTRAINT "__chain_page_input_jhliinhchcgno_fk_root_step_brqgvf5ues" ON "slice_den"."chain_page_input_jhliinhchcgno" IS 'foreign key chain_page_input_jhliinhchcgno(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_e6oabafyfi" ON "slice_den"."chain_page_output_dniojohpmhcee" IS 'foreign key chain_page_output_dniojohpmhcee(root, step) to ChainDone(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_ix6wkewdmc" ON "slice_den"."chain_page_output_dniojohpmhcee" IS 'foreign key chain_page_output_dniojohpmhcee(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_dniojohpmhcee_fk_root_step_fyaqgoqxlm" ON "slice_den"."chain_page_output_dniojohpmhcee" IS 'foreign key chain_page_output_dniojohpmhcee(root, step) to chain_page_input_jhliinhchcgno(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_next_pocjijjpkpono_fk_root_step_jkq5323gej" ON "slice_den"."chain_page_output_next_pocjijjpkpono" IS 'foreign key chain_page_output_next_pocjijjpkpono(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_output_next_pocjijjpkpono_fk_root_step_hfgxjmvswz" ON "slice_den"."chain_page_output_next_pocjijjpkpono" IS 'foreign key chain_page_output_next_pocjijjpkpono(root, step) to chain_page_output_dniojohpmhcee(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_digest_fliospbzhi" ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc" IS 'foreign key chain_page_read_earlier_dgehlbgebidjc(digest) to chain_page_read_earlier_dgehlbgebidjcRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_root_step_bqcbnwxoj3" ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc" IS 'foreign key chain_page_read_earlier_dgehlbgebidjc(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_earlier_dgehlbgebidjc_fk_root_step_bkqwbd5ush" ON "slice_den"."chain_page_read_earlier_dgehlbgebidjc" IS 'foreign key chain_page_read_earlier_dgehlbgebidjc(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_fk_digest_4modrznro7" ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem" IS 'foreign key chain_page_read_tree_items_cokakfjlndgem(digest, the owner''s count of the family chain_page_read_tree_lakencnpkciinRow.items) to chain_page_read_tree_lakencnpkciinRow(digest, items)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_cokakfjlndgem_fk_digest_pbqepdotso" ON "slice_den"."chain_page_read_tree_items_cokakfjlndgem" IS 'foreign key chain_page_read_tree_items_cokakfjlndgem(digest, pred(at)) to chain_page_read_tree_items_cokakfjlndgem(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_items_first_ocgolceclfbii_fk_mgphk6o3je" ON "slice_den"."chain_page_read_tree_items_first_ocgolceclfbii" IS 'foreign key chain_page_read_tree_items_first_ocgolceclfbii(digest, at) to chain_page_read_tree_items_cokakfjlndgem(digest, at)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_digest_ldmoxivlxi" ON "slice_den"."chain_page_read_tree_lakencnpkciin" IS 'foreign key chain_page_read_tree_lakencnpkciin(digest) to chain_page_read_tree_lakencnpkciinRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_root_step_frbz4lpc64" ON "slice_den"."chain_page_read_tree_lakencnpkciin" IS 'foreign key chain_page_read_tree_lakencnpkciin(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_fk_root_step_o4fqqo6wla" ON "slice_den"."chain_page_read_tree_lakencnpkciin" IS 'foreign key chain_page_read_tree_lakencnpkciin(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_digest_ftgcofflar" ON "slice_den"."chain_page_read_weights_agiabippcbobb" IS 'foreign key chain_page_read_weights_agiabippcbobb(digest) to chain_page_read_weights_agiabippcbobbRow(digest)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_root_step_rv2po42axm" ON "slice_den"."chain_page_read_weights_agiabippcbobb" IS 'foreign key chain_page_read_weights_agiabippcbobb(root, step) to ChainResult(root, step)';

COMMENT ON CONSTRAINT "__chain_page_read_weights_agiabippcbobb_fk_root_step_qutwvqfwtk" ON "slice_den"."chain_page_read_weights_agiabippcbobb" IS 'foreign key chain_page_read_weights_agiabippcbobb(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_paused_fk_target_pred_turn_mokmv27wuy" ON "slice_den"."chain_paused" IS 'foreign key ChainPaused(target, pred(turn)) to ChainResumed(target, turn)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_step_ykkkqcajv4" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(root, step) to ChainFailed(root, step)';

COMMENT ON CONSTRAINT "__chain_refusal_fk_root_step_nfh5xnnucb" ON "slice_den"."chain_refusal" IS 'foreign key ChainRefusal(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_requested_with_fk_root_kaou5g6ytt" ON "slice_den"."chain_requested_with" IS 'foreign key ChainRequestedWith(root) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_result_fk_root_step_ocbnaznecu" ON "slice_den"."chain_result" IS 'foreign key ChainResult(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_resumed_fk_target_turn_qdtxs3euay" ON "slice_den"."chain_resumed" IS 'foreign key ChainResumed(target, turn) to ChainPaused(target, turn)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_step_ovrtf36jcq" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_retry_fk_root_step_attempt_t2kbhcxstx" ON "slice_den"."chain_retry" IS 'foreign key ChainRetry(root, step, attempt) to ChainEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__chain_scope_fk_root_3oxsnvnyqm" ON "slice_den"."chain_scope" IS 'foreign key ChainScope(root) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_by_s5hrvg2lf3" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(by) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_root_scope_ghpfmtf7sw" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_skipped_fk_scope_2p7bml3674" ON "slice_den"."chain_skipped" IS 'foreign key ChainSkipped(scope) to ChainRoot(root)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_scope_lvxzyapkkz" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_scope_csyj2bv7zv" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__chain_start_step_fk_root_step_3v26ol7z45" ON "slice_den"."chain_start_step" IS 'foreign key ChainStartStep(root, step) to ChainStep(root, step)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_scope_yfe4j5xzze" ON "slice_den"."chain_step" IS 'foreign key ChainStep(root, scope) to ChainAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__chain_step_fk_root_scope_2dsmwvsjfx" ON "slice_den"."chain_step" IS 'foreign key ChainStep(root, scope) to ChainScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_admitted_fk_root_scope_qiiqqqcffn" ON "slice_den"."clock_admitted" IS 'foreign key ClockAdmitted(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_chime_input_bfjhiocgaifco_fk_root_step_rw6melas6n" ON "slice_den"."clock_chime_input_bfjhiocgaifco" IS 'foreign key clock_chime_input_bfjhiocgaifco(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_w4ercimpde" ON "slice_den"."clock_chime_output_bddonoddgecmi" IS 'foreign key clock_chime_output_bddonoddgecmi(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_ehiybcrd66" ON "slice_den"."clock_chime_output_bddonoddgecmi" IS 'foreign key clock_chime_output_bddonoddgecmi(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_chime_output_bddonoddgecmi_fk_root_step_akiu5mtl5b" ON "slice_den"."clock_chime_output_bddonoddgecmi" IS 'foreign key clock_chime_output_bddonoddgecmi(root, step) to clock_chime_input_bfjhiocgaifco(root, step)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_step_hnkgjikniq" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_claim_fk_root_step_pred_attempt_s6bkkwaqnz" ON "slice_den"."clock_claim" IS 'foreign key ClockClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_close_input_bajjphdpmhlbc_fk_root_step_p545f5xf2t" ON "slice_den"."clock_close_input_bajjphdpmhlbc" IS 'foreign key clock_close_input_bajjphdpmhlbc(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_5v6cfjvcfn" ON "slice_den"."clock_close_output_aoheikcdnbjpp" IS 'foreign key clock_close_output_aoheikcdnbjpp(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_rs2wlcsyjf" ON "slice_den"."clock_close_output_aoheikcdnbjpp" IS 'foreign key clock_close_output_aoheikcdnbjpp(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_close_output_aoheikcdnbjpp_fk_root_step_nrqhnj225k" ON "slice_den"."clock_close_output_aoheikcdnbjpp" IS 'foreign key clock_close_output_aoheikcdnbjpp(root, step) to clock_close_input_bajjphdpmhlbc(root, step)';

COMMENT ON CONSTRAINT "__clock_done_fk_root_step_yq4qhavboe" ON "slice_den"."clock_done" IS 'foreign key ClockDone(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_step_gx5kdzotda" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_ended_fk_root_step_attempt_drvkyvybmh" ON "slice_den"."clock_ended" IS 'foreign key ClockEnded(root, step, attempt) to ClockClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_step_ifbdfsiptr" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(root, step) to ClockFailed(root, step)';

COMMENT ON CONSTRAINT "__clock_exhausted_fk_root_step_gaqpfdbyl3" ON "slice_den"."clock_exhausted" IS 'foreign key ClockExhausted(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_failed_fk_root_step_g4aoka6lo5" ON "slice_den"."clock_failed" IS 'foreign key ClockFailed(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_step_cr4zsb2h6l" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_fenced_fk_root_step_attempt_kyyyl7ahsl" ON "slice_den"."clock_fenced" IS 'foreign key ClockFenced(root, step, attempt) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_scope_tzo2gy4k4n" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_scope_6z7ojozft7" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_finish_fk_root_step_3vz6t66zne" ON "slice_den"."clock_finish" IS 'foreign key ClockFinish(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_cumpf2bq5c" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step) to ClockResult(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_4lmqwyfsx6" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_held_fk_root_step_attempt_ob3nh2i5w6" ON "slice_den"."clock_held" IS 'foreign key ClockHeld(root, step, attempt) to ClockClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_fk_root_6ekvrq7ufc" ON "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" IS 'foreign key clock_hourly_finish_output_mgokiakijlfbi(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_hourly_finish_output_mgokiakijlfbi_fk_root_rcsiczixsr" ON "slice_den"."clock_hourly_finish_output_mgokiakijlfbi" IS 'foreign key clock_hourly_finish_output_mgokiakijlfbi(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_fk_root_scope_q3vtb26evr" ON "slice_den"."clock_hourly_input_nknibbhbedpnl" IS 'foreign key clock_hourly_input_nknibbhbedpnl(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_hourly_input_nknibbhbedpnl_fk_scope_tag_kind_uvs7k5nmzl" ON "slice_den"."clock_hourly_input_nknibbhbedpnl" IS 'foreign key clock_hourly_input_nknibbhbedpnl(scope, tag ClockRoot.kind = Hourly) to ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_paused_fk_target_pred_turn_7tgjovpr6x" ON "slice_den"."clock_paused" IS 'foreign key ClockPaused(target, pred(turn)) to ClockResumed(target, turn)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_step_fgakzza4gr" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(root, step) to ClockFailed(root, step)';

COMMENT ON CONSTRAINT "__clock_refusal_fk_root_step_aurtl3zqby" ON "slice_den"."clock_refusal" IS 'foreign key ClockRefusal(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_requested_with_fk_root_pyuj4tglmv" ON "slice_den"."clock_requested_with" IS 'foreign key ClockRequestedWith(root) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_result_fk_root_step_uh7cpzsyxr" ON "slice_den"."clock_result" IS 'foreign key ClockResult(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_resumed_fk_target_turn_45dwn4cwo5" ON "slice_den"."clock_resumed" IS 'foreign key ClockResumed(target, turn) to ClockPaused(target, turn)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_step_l5mlehgaai" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_retry_fk_root_step_attempt_vut5icvrra" ON "slice_den"."clock_retry" IS 'foreign key ClockRetry(root, step, attempt) to ClockEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__clock_scope_fk_root_xasutriv42" ON "slice_den"."clock_scope" IS 'foreign key ClockScope(root) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_fk_root_xbwfmykyln" ON "slice_den"."clock_sitting_finish_output_aahppmdaoafco" IS 'foreign key clock_sitting_finish_output_aahppmdaoafco(root, step) to ClockDone(root, step)';

COMMENT ON CONSTRAINT "__clock_sitting_finish_output_aahppmdaoafco_fk_root_tyh3x5vbe2" ON "slice_den"."clock_sitting_finish_output_aahppmdaoafco" IS 'foreign key clock_sitting_finish_output_aahppmdaoafco(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_fk_root_scope_famaduuyyq" ON "slice_den"."clock_sitting_input_bckcjcndffgmo" IS 'foreign key clock_sitting_input_bckcjcndffgmo(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_sitting_input_bckcjcndffgmo_fk_scope_tag_aynkte3ofn" ON "slice_den"."clock_sitting_input_bckcjcndffgmo" IS 'foreign key clock_sitting_input_bckcjcndffgmo(scope, tag ClockRoot.kind = Sitting) to ClockRoot(root, kind)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_by_nuxpfr6rlt" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(by) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_root_scope_umaapw5huy" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_skipped_fk_scope_oi3a3bn4yj" ON "slice_den"."clock_skipped" IS 'foreign key ClockSkipped(scope) to ClockRoot(root)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_scope_m4fy3w5rcl" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_scope_nbmml3ni7y" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__clock_start_step_fk_root_step_ysvl2b4s4g" ON "slice_den"."clock_start_step" IS 'foreign key ClockStartStep(root, step) to ClockStep(root, step)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_scope_77guzwc2dq" ON "slice_den"."clock_step" IS 'foreign key ClockStep(root, scope) to ClockAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__clock_step_fk_root_scope_k3rk7n4jq2" ON "slice_den"."clock_step" IS 'foreign key ClockStep(root, scope) to ClockScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_admitted_fk_root_scope_paiega74y2" ON "slice_den"."fan_admitted" IS 'foreign key FanAdmitted(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_fk_root_step_wtpatcsbbc" ON "slice_den"."fan_batch_finish_output_djinnhndkglgj" IS 'foreign key fan_batch_finish_output_djinnhndkglgj(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_batch_finish_output_djinnhndkglgj_fk_root_step_4dfjcha3ug" ON "slice_den"."fan_batch_finish_output_djinnhndkglgj" IS 'foreign key fan_batch_finish_output_djinnhndkglgj(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_batch_input_hjhhnklpfiilh_fk_root_scope_daf7lh3cft" ON "slice_den"."fan_batch_input_hjhhnklpfiilh" IS 'foreign key fan_batch_input_hjhhnklpfiilh(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_2xkxna4wne" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_attempt_pred_holds_6ej2el2klx" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root, step, attempt, pred(holds)) to FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_claim_fk_root_step_pred_attempt_thlj3gkwmg" ON "slice_den"."fan_claim" IS 'foreign key FanClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_done_fk_root_step_snckhrcktc" ON "slice_den"."fan_done" IS 'foreign key FanDone(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_input_lelfhikaelkja_fk_root_step_ij3vde62k2" ON "slice_den"."fan_dust_input_lelfhikaelkja" IS 'foreign key fan_dust_input_lelfhikaelkja(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_reqrpfthlf" ON "slice_den"."fan_dust_output_pgpcjjjdmhkim" IS 'foreign key fan_dust_output_pgpcjjjdmhkim(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_ig6drxonbd" ON "slice_den"."fan_dust_output_pgpcjjjdmhkim" IS 'foreign key fan_dust_output_pgpcjjjdmhkim(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_dust_output_pgpcjjjdmhkim_fk_root_step_feq4d25qhc" ON "slice_den"."fan_dust_output_pgpcjjjdmhkim" IS 'foreign key fan_dust_output_pgpcjjjdmhkim(root, step) to fan_dust_input_lelfhikaelkja(root, step)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_step_g7lfuycwwy" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_ended_fk_root_step_attempt_sludbzdnea" ON "slice_den"."fan_ended" IS 'foreign key FanEnded(root, step, attempt) to FanClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_exclusive_fk_kind_key_pred_turn_dyvewabv75" ON "slice_den"."fan_exclusive" IS 'foreign key FanExclusive(kind, key, pred(turn)) to FanReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__fan_exclusive_key_fk_root_scope_w4wlpmkbb6" ON "slice_den"."fan_exclusive_key" IS 'foreign key FanExclusiveKey(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_step_lfol3zhscm" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(root, step) to FanFailed(root, step)';

COMMENT ON CONSTRAINT "__fan_exhausted_fk_root_step_txucm4khfj" ON "slice_den"."fan_exhausted" IS 'foreign key FanExhausted(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_failed_fk_root_step_e3uoiynnze" ON "slice_den"."fan_failed" IS 'foreign key FanFailed(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_fk_root_p5prfna6ey" ON "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" IS 'foreign key fan_fan_run_finish_output_kcmicfckgdcip(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_finish_output_kcmicfckgdcip_fk_root_3kvjuutpt3" ON "slice_den"."fan_fan_run_finish_output_kcmicfckgdcip" IS 'foreign key fan_fan_run_finish_output_kcmicfckgdcip(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_fk_root_scope_epacvxotoj" ON "slice_den"."fan_fan_run_input_bghibckinpfgk" IS 'foreign key fan_fan_run_input_bghibckinpfgk(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_fan_run_input_bghibckinpfgk_fk_scope_tag_kind_6mn6hzbxps" ON "slice_den"."fan_fan_run_input_bghibckinpfgk" IS 'foreign key fan_fan_run_input_bghibckinpfgk(scope, tag FanRoot.kind = FanRun) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_step_xby6ndghkk" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_fenced_fk_root_step_attempt_kxzdzh7oiz" ON "slice_den"."fan_fenced" IS 'foreign key FanFenced(root, step, attempt) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_scope_3z53mfbjar" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_scope_4wzngp66gg" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_finish_fk_root_step_hd27i2yklh" ON "slice_den"."fan_finish" IS 'foreign key FanFinish(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_4pr6zebh4l" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step) to FanResult(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_673ozjicob" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_held_fk_root_step_attempt_bflumufwqp" ON "slice_den"."fan_held" IS 'foreign key FanHeld(root, step, attempt) to FanClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_step_attempt_copy_holds_hnnbabpski" ON "slice_den"."fan_hold" IS 'foreign key FanHold(root, step, attempt, the owner''s count of the family FanClaim.holds) to FanClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__fan_hold_fk_root_step_attempt_pred_at_lene3l2wo7" ON "slice_den"."fan_hold" IS 'foreign key FanHold(root, step, attempt, pred(at)) to FanHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__fan_mop_input_ngghbiaegmghl_fk_root_step_5tt7fxp6mw" ON "slice_den"."fan_mop_input_ngghbiaegmghl" IS 'foreign key fan_mop_input_ngghbiaegmghl(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_od5s5f26ry" ON "slice_den"."fan_mop_output_okmfngilefbec" IS 'foreign key fan_mop_output_okmfngilefbec(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_muit6plxnd" ON "slice_den"."fan_mop_output_okmfngilefbec" IS 'foreign key fan_mop_output_okmfngilefbec(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_mop_output_okmfngilefbec_fk_root_step_4zdvoczmj3" ON "slice_den"."fan_mop_output_okmfngilefbec" IS 'foreign key fan_mop_output_okmfngilefbec(root, step) to fan_mop_input_ngghbiaegmghl(root, step)';

COMMENT ON CONSTRAINT "__fan_paused_fk_target_pred_turn_flvtnhgqoq" ON "slice_den"."fan_paused" IS 'foreign key FanPaused(target, pred(turn)) to FanResumed(target, turn)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_step_qseur2r4dj" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(root, step) to FanFailed(root, step)';

COMMENT ON CONSTRAINT "__fan_refusal_fk_root_step_4l2iz5yiww" ON "slice_den"."fan_refusal" IS 'foreign key FanRefusal(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_released_fk_kind_key_turn_3w24p2wqa2" ON "slice_den"."fan_released" IS 'foreign key FanReleased(kind, key, turn) to FanExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__fan_requested_with_fk_root_4p6mpdfivp" ON "slice_den"."fan_requested_with" IS 'foreign key FanRequestedWith(root) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_result_fk_root_step_mm2j7nmocm" ON "slice_den"."fan_result" IS 'foreign key FanResult(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_resumed_fk_target_turn_c5d76zka2w" ON "slice_den"."fan_resumed" IS 'foreign key FanResumed(target, turn) to FanPaused(target, turn)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_step_dji2iap5lk" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_retry_fk_root_step_attempt_qtwk5f4wb3" ON "slice_den"."fan_retry" IS 'foreign key FanRetry(root, step, attempt) to FanEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__fan_scope_fk_root_peo7vjux2b" ON "slice_den"."fan_scope" IS 'foreign key FanScope(root) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_by_ptbn5ftpw3" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(by) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_root_scope_zoezs3f2j3" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_skipped_fk_scope_5rsfnka2al" ON "slice_den"."fan_skipped" IS 'foreign key FanSkipped(scope) to FanRoot(root)';

COMMENT ON CONSTRAINT "__fan_square_input_ifddbjkaokoig_fk_root_step_6hz2vcplr3" ON "slice_den"."fan_square_input_ifddbjkaokoig" IS 'foreign key fan_square_input_ifddbjkaokoig(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_vosc66fdyu" ON "slice_den"."fan_square_output_gofcfljmlelgo" IS 'foreign key fan_square_output_gofcfljmlelgo(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_s4wnsqlied" ON "slice_den"."fan_square_output_gofcfljmlelgo" IS 'foreign key fan_square_output_gofcfljmlelgo(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_square_output_gofcfljmlelgo_fk_root_step_6bae22x6wh" ON "slice_den"."fan_square_output_gofcfljmlelgo" IS 'foreign key fan_square_output_gofcfljmlelgo(root, step) to fan_square_input_ifddbjkaokoig(root, step)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_child_p2ruy7qsg2" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, child) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_scope_q3eun6lixq" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_scope_fk_root_scope_ayer7ncuhn" ON "slice_den"."fan_start_scope" IS 'foreign key FanStartScope(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_scope_ocnak7go4o" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_scope_yfg5db7u23" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_start_step_fk_root_step_ml4otyqd5u" ON "slice_den"."fan_start_step" IS 'foreign key FanStartStep(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_scope_mnnzqu5muv" ON "slice_den"."fan_step" IS 'foreign key FanStep(root, scope) to FanAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__fan_step_fk_root_scope_7hmxdgnve3" ON "slice_den"."fan_step" IS 'foreign key FanStep(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_fk_root_step_psgd5sq3q2" ON "slice_den"."fan_sweep_finish_output_nebomlkgaabji" IS 'foreign key fan_sweep_finish_output_nebomlkgaabji(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_sweep_finish_output_nebomlkgaabji_fk_root_step_phqkivzlcs" ON "slice_den"."fan_sweep_finish_output_nebomlkgaabji" IS 'foreign key fan_sweep_finish_output_nebomlkgaabji(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_fk_root_scope_nu6n3ulq77" ON "slice_den"."fan_sweep_input_bnmfcblhkahec" IS 'foreign key fan_sweep_input_bnmfcblhkahec(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_sweep_input_bnmfcblhkahec_fk_scope_tag_kind_56crixfthm" ON "slice_den"."fan_sweep_input_bnmfcblhkahec" IS 'foreign key fan_sweep_input_bnmfcblhkahec(scope, tag FanRoot.kind = Sweep) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_fk_root_dlmd5n5s6x" ON "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" IS 'foreign key fan_wanted_finish_output_lmjmjmcffnbda(root, step) to FanDone(root, step)';

COMMENT ON CONSTRAINT "__fan_wanted_finish_output_lmjmjmcffnbda_fk_root_v27dfd5fwc" ON "slice_den"."fan_wanted_finish_output_lmjmjmcffnbda" IS 'foreign key fan_wanted_finish_output_lmjmjmcffnbda(root, step) to FanStep(root, step)';

COMMENT ON CONSTRAINT "__fan_wanted_input_nfecjpihiaope_fk_root_scope_szs26jwm6f" ON "slice_den"."fan_wanted_input_nfecjpihiaope" IS 'foreign key fan_wanted_input_nfecjpihiaope(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_wanted_input_nfecjpihiaope_fk_scope_tag_kind_ovipsq45eq" ON "slice_den"."fan_wanted_input_nfecjpihiaope" IS 'foreign key fan_wanted_input_nfecjpihiaope(scope, tag FanRoot.kind = Wanted) to FanRoot(root, kind)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_parent_7jmxi4kbha" ON "slice_den"."fan_within" IS 'foreign key FanWithin(root, parent) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__fan_within_fk_root_scope_s4ljjlq6zp" ON "slice_den"."fan_within" IS 'foreign key FanWithin(root, scope) to FanScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_admitted_fk_root_scope_4whpx2yoko" ON "slice_den"."retry_admitted" IS 'foreign key RetryAdmitted(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_brittle_input_jbcpaiekdedpp_fk_root_step_5iwkaevmim" ON "slice_den"."retry_brittle_input_jbcpaiekdedpp" IS 'foreign key retry_brittle_input_jbcpaiekdedpp(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_7isjgtifrp" ON "slice_den"."retry_brittle_output_bajcdgadpoeak" IS 'foreign key retry_brittle_output_bajcdgadpoeak(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_hmorypfg7m" ON "slice_den"."retry_brittle_output_bajcdgadpoeak" IS 'foreign key retry_brittle_output_bajcdgadpoeak(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_brittle_output_bajcdgadpoeak_fk_root_step_neill3zaoz" ON "slice_den"."retry_brittle_output_bajcdgadpoeak" IS 'foreign key retry_brittle_output_bajcdgadpoeak(root, step) to retry_brittle_input_jbcpaiekdedpp(root, step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_step_y3nttmzxe7" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_claim_fk_root_step_pred_attempt_ygcziesx4q" ON "slice_den"."retry_claim" IS 'foreign key RetryClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_done_fk_root_step_d6c7pi2dpp" ON "slice_den"."retry_done" IS 'foreign key RetryDone(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_step_tet57bx36t" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ended_fk_root_step_attempt_zmythu6lea" ON "slice_den"."retry_ended" IS 'foreign key RetryEnded(root, step, attempt) to RetryClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_step_ysmlpu2xyq" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(root, step) to RetryFailed(root, step)';

COMMENT ON CONSTRAINT "__retry_exhausted_fk_root_step_37kf6fgbfy" ON "slice_den"."retry_exhausted" IS 'foreign key RetryExhausted(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_failed_fk_root_step_uguij74dd4" ON "slice_den"."retry_failed" IS 'foreign key RetryFailed(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_step_ippcs3eeog" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_fenced_fk_root_step_attempt_yjqggn34wn" ON "slice_den"."retry_fenced" IS 'foreign key RetryFenced(root, step, attempt) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_scope_zjjmku4ngd" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_scope_ybtoj7rtci" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_finish_fk_root_step_uxc6mv3jae" ON "slice_den"."retry_finish" IS 'foreign key RetryFinish(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_n2vjs67jaj" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step) to RetryResult(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_etlrrjjeex" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_held_fk_root_step_attempt_hfwaf4utod" ON "slice_den"."retry_held" IS 'foreign key RetryHeld(root, step, attempt) to RetryClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_fk_root_bdk6uwjijf" ON "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" IS 'foreign key retry_ladders_finish_output_pgebkobjaoiih(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_ladders_finish_output_pgebkobjaoiih_fk_root_cc4naafs7e" ON "slice_den"."retry_ladders_finish_output_pgebkobjaoiih" IS 'foreign key retry_ladders_finish_output_pgebkobjaoiih(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_fk_root_scope_dscc4f5g5a" ON "slice_den"."retry_ladders_input_fkbbgblmfmhbi" IS 'foreign key retry_ladders_input_fkbbgblmfmhbi(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_ladders_input_fkbbgblmfmhbi_fk_scope_tag_apshlwxk2o" ON "slice_den"."retry_ladders_input_fkbbgblmfmhbi" IS 'foreign key retry_ladders_input_fkbbgblmfmhbi(scope, tag RetryRoot.kind = Ladders) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_patient_input_ndliolfjpjnoc_fk_root_step_jf5nfrekgb" ON "slice_den"."retry_patient_input_ndliolfjpjnoc" IS 'foreign key retry_patient_input_ndliolfjpjnoc(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_ccbbldop3y" ON "slice_den"."retry_patient_output_geoaicaaojcfl" IS 'foreign key retry_patient_output_geoaicaaojcfl(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_ivmvt2iaor" ON "slice_den"."retry_patient_output_geoaicaaojcfl" IS 'foreign key retry_patient_output_geoaicaaojcfl(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_patient_output_geoaicaaojcfl_fk_root_step_q6e5xa7rlk" ON "slice_den"."retry_patient_output_geoaicaaojcfl" IS 'foreign key retry_patient_output_geoaicaaojcfl(root, step) to retry_patient_input_ndliolfjpjnoc(root, step)';

COMMENT ON CONSTRAINT "__retry_paused_fk_target_pred_turn_i33p2skdd4" ON "slice_den"."retry_paused" IS 'foreign key RetryPaused(target, pred(turn)) to RetryResumed(target, turn)';

COMMENT ON CONSTRAINT "__retry_polite_input_iopjdjgdhfide_fk_root_step_64wntnyk6c" ON "slice_den"."retry_polite_input_iopjdjgdhfide" IS 'foreign key retry_polite_input_iopjdjgdhfide(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_ybzxoswu4a" ON "slice_den"."retry_polite_output_nicaghgpaemah" IS 'foreign key retry_polite_output_nicaghgpaemah(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_7wa4wfc3aw" ON "slice_den"."retry_polite_output_nicaghgpaemah" IS 'foreign key retry_polite_output_nicaghgpaemah(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_polite_output_nicaghgpaemah_fk_root_step_bzkwxwrb7g" ON "slice_den"."retry_polite_output_nicaghgpaemah" IS 'foreign key retry_polite_output_nicaghgpaemah(root, step) to retry_polite_input_iopjdjgdhfide(root, step)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_step_vhxwkfyqu3" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(root, step) to RetryFailed(root, step)';

COMMENT ON CONSTRAINT "__retry_refusal_fk_root_step_cxbne35gly" ON "slice_den"."retry_refusal" IS 'foreign key RetryRefusal(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_requested_with_fk_root_xpqnsapd2c" ON "slice_den"."retry_requested_with" IS 'foreign key RetryRequestedWith(root) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_result_fk_root_step_i63yrf2jjz" ON "slice_den"."retry_result" IS 'foreign key RetryResult(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_resumed_fk_target_turn_x2e4jllxuy" ON "slice_den"."retry_resumed" IS 'foreign key RetryResumed(target, turn) to RetryPaused(target, turn)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_step_f6jn5krklx" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_retry_fk_root_step_attempt_khdzeotgev" ON "slice_den"."retry_retry" IS 'foreign key RetryRetry(root, step, attempt) to RetryEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__retry_scope_fk_root_p6ulzqc36r" ON "slice_den"."retry_scope" IS 'foreign key RetryScope(root) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_by_jf24rn5sep" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(by) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_root_scope_as5s7uohkr" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_skipped_fk_scope_my57tu4oty" ON "slice_den"."retry_skipped" IS 'foreign key RetrySkipped(scope) to RetryRoot(root)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_scope_phyy3twhmr" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_scope_e3jd5sddhk" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_start_step_fk_root_step_tjvsrtkfqg" ON "slice_den"."retry_start_step" IS 'foreign key RetryStartStep(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_input_ebanfagjeadim_fk_root_step_vwjvy2iwcu" ON "slice_den"."retry_steadfast_input_ebanfagjeadim" IS 'foreign key retry_steadfast_input_ebanfagjeadim(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_gqicojr7ng" ON "slice_den"."retry_steadfast_output_aacklbgjpefbn" IS 'foreign key retry_steadfast_output_aacklbgjpefbn(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_slw4tov7rg" ON "slice_den"."retry_steadfast_output_aacklbgjpefbn" IS 'foreign key retry_steadfast_output_aacklbgjpefbn(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_steadfast_output_aacklbgjpefbn_fk_root_step_4ttuaowh4k" ON "slice_den"."retry_steadfast_output_aacklbgjpefbn" IS 'foreign key retry_steadfast_output_aacklbgjpefbn(root, step) to retry_steadfast_input_ebanfagjeadim(root, step)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_scope_xe4735gsrg" ON "slice_den"."retry_step" IS 'foreign key RetryStep(root, scope) to RetryAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__retry_step_fk_root_scope_ubjxxgucjq" ON "slice_den"."retry_step" IS 'foreign key RetryStep(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_fk_b5kwbg7uj2" ON "slice_den"."retry_throttled_finish_output_plgallgljmddo" IS 'foreign key retry_throttled_finish_output_plgallgljmddo(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_throttled_finish_output_plgallgljmddo_fk_avm4tyqim5" ON "slice_den"."retry_throttled_finish_output_plgallgljmddo" IS 'foreign key retry_throttled_finish_output_plgallgljmddo(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_fk_root_scope_m3tdeepprg" ON "slice_den"."retry_throttled_input_bfjgfamhjmgcd" IS 'foreign key retry_throttled_input_bfjgfamhjmgcd(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_throttled_input_bfjgfamhjmgcd_fk_scope_tag_csfxidqzuk" ON "slice_den"."retry_throttled_input_bfjgfamhjmgcd" IS 'foreign key retry_throttled_input_bfjgfamhjmgcd(scope, tag RetryRoot.kind = Throttled) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_fk_dfsja4cue6" ON "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" IS 'foreign key retry_unhurried_finish_output_oipogmdgcfehf(root, step) to RetryDone(root, step)';

COMMENT ON CONSTRAINT "__retry_unhurried_finish_output_oipogmdgcfehf_fk_uoatrndcct" ON "slice_den"."retry_unhurried_finish_output_oipogmdgcfehf" IS 'foreign key retry_unhurried_finish_output_oipogmdgcfehf(root, step) to RetryStep(root, step)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_fk_root_scope_ctlpwsurlj" ON "slice_den"."retry_unhurried_input_mccbdnleajjif" IS 'foreign key retry_unhurried_input_mccbdnleajjif(root, scope) to RetryScope(root, scope)';

COMMENT ON CONSTRAINT "__retry_unhurried_input_mccbdnleajjif_fk_scope_tag_famxuo3ceu" ON "slice_den"."retry_unhurried_input_mccbdnleajjif" IS 'foreign key retry_unhurried_input_mccbdnleajjif(scope, tag RetryRoot.kind = Unhurried) to RetryRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_admitted_fk_root_scope_wpazxz5qvc" ON "slice_den"."review_admitted" IS 'foreign key ReviewAdmitted(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_analyze_input_aobppbhebnkae_fk_root_step_gneu6his5j" ON "slice_den"."review_analyze_input_aobppbhebnkae" IS 'foreign key review_analyze_input_aobppbhebnkae(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_jyd5erlgdd" ON "slice_den"."review_analyze_output_fhhkmphnmpkdm" IS 'foreign key review_analyze_output_fhhkmphnmpkdm(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_ok3biiie2r" ON "slice_den"."review_analyze_output_fhhkmphnmpkdm" IS 'foreign key review_analyze_output_fhhkmphnmpkdm(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_analyze_output_fhhkmphnmpkdm_fk_root_step_jnyfn76tag" ON "slice_den"."review_analyze_output_fhhkmphnmpkdm" IS 'foreign key review_analyze_output_fhhkmphnmpkdm(root, step) to review_analyze_input_aobppbhebnkae(root, step)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_7f6aefekwa" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_attempt_pred_holds_4fz52sncza" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root, step, attempt, pred(holds)) to ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_claim_fk_root_step_pred_attempt_77xjl3onsd" ON "slice_den"."review_claim" IS 'foreign key ReviewClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_done_fk_root_step_glhq6szbww" ON "slice_den"."review_done" IS 'foreign key ReviewDone(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_ended_fk_root_step_7wr4emeec6" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_ended_fk_root_step_attempt_5k7tdgg5nm" ON "slice_den"."review_ended" IS 'foreign key ReviewEnded(root, step, attempt) to ReviewClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_step_7u7yvsyo3u" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(root, step) to ReviewFailed(root, step)';

COMMENT ON CONSTRAINT "__review_exhausted_fk_root_step_uadodb5yiw" ON "slice_den"."review_exhausted" IS 'foreign key ReviewExhausted(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_failed_fk_root_step_fmegqiyhwt" ON "slice_den"."review_failed" IS 'foreign key ReviewFailed(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_step_kdzvzqe26m" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_fenced_fk_root_step_attempt_kxthyqyqwb" ON "slice_den"."review_fenced" IS 'foreign key ReviewFenced(root, step, attempt) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_scope_gmmfvaopci" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_scope_av5o3ybt2d" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_finish_fk_root_step_ev6ctqell2" ON "slice_den"."review_finish" IS 'foreign key ReviewFinish(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_eiadkjkkdoiel_fk_root_step_bdemvpwpeg" ON "slice_den"."review_gather_input_eiadkjkkdoiel" IS 'foreign key review_gather_input_eiadkjkkdoiel(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_u3aopm7o27" ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" IS 'foreign key review_gather_input_sizes_ifjkkjdhlfbgp(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_4q6x3ysvil" ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" IS 'foreign key review_gather_input_sizes_ifjkkjdhlfbgp(root, step) to review_gather_input_eiadkjkkdoiel(root, step)';

COMMENT ON CONSTRAINT "__review_gather_input_sizes_ifjkkjdhlfbgp_fk_root_f5jkb5stoq" ON "slice_den"."review_gather_input_sizes_ifjkkjdhlfbgp" IS 'foreign key review_gather_input_sizes_ifjkkjdhlfbgp(root where Logic.ge(ordinal, 1n), step, pred(ordinal)) to review_gather_input_sizes_ifjkkjdhlfbgp(root, step, ordinal)';

COMMENT ON CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_vw4wqiivq7" ON "slice_den"."review_gather_output_cgnhmechbiddp" IS 'foreign key review_gather_output_cgnhmechbiddp(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_iek5saifzo" ON "slice_den"."review_gather_output_cgnhmechbiddp" IS 'foreign key review_gather_output_cgnhmechbiddp(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_gather_output_cgnhmechbiddp_fk_root_step_ak2wnwtozd" ON "slice_den"."review_gather_output_cgnhmechbiddp" IS 'foreign key review_gather_output_cgnhmechbiddp(root, step) to review_gather_input_eiadkjkkdoiel(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_377oxpprpb" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step) to ReviewResult(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_6ucwevd65f" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_held_fk_root_step_attempt_43pd26ucr5" ON "slice_den"."review_held" IS 'foreign key ReviewHeld(root, step, attempt) to ReviewClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_step_attempt_copy_holds_4jxl3l2dff" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(root, step, attempt, the owner''s count of the family ReviewClaim.holds) to ReviewClaim(root, step, attempt, holds)';

COMMENT ON CONSTRAINT "__review_hold_fk_root_step_attempt_pred_at_sqpugy4xri" ON "slice_den"."review_hold" IS 'foreign key ReviewHold(root, step, attempt, pred(at)) to ReviewHold(root, step, attempt, at)';

COMMENT ON CONSTRAINT "__review_paused_fk_target_pred_turn_rig5fmgcvc" ON "slice_den"."review_paused" IS 'foreign key ReviewPaused(target, pred(turn)) to ReviewResumed(target, turn)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_fk_lj2oliae65" ON "slice_den"."review_questions_finish_output_kddidbknbjeof" IS 'foreign key review_questions_finish_output_kddidbknbjeof(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_questions_finish_output_kddidbknbjeof_fk_k6l25pt4vl" ON "slice_den"."review_questions_finish_output_kddidbknbjeof" IS 'foreign key review_questions_finish_output_kddidbknbjeof(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_questions_input_jigaomgjefjfk_fk_root_scope_5vetrkt5au" ON "slice_den"."review_questions_input_jigaomgjefjfk" IS 'foreign key review_questions_input_jigaomgjefjfk(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_step_i325iogm4w" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(root, step) to ReviewFailed(root, step)';

COMMENT ON CONSTRAINT "__review_refusal_fk_root_step_ksoewu53t4" ON "slice_den"."review_refusal" IS 'foreign key ReviewRefusal(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_requested_with_fk_root_qr6x7qjzy6" ON "slice_den"."review_requested_with" IS 'foreign key ReviewRequestedWith(root) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_result_fk_root_step_m7ddrhxqqw" ON "slice_den"."review_result" IS 'foreign key ReviewResult(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_resumed_fk_target_turn_nvm252hscc" ON "slice_den"."review_resumed" IS 'foreign key ReviewResumed(target, turn) to ReviewPaused(target, turn)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_step_ifbhbgbjic" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_retry_fk_root_step_attempt_iuo24rnbik" ON "slice_den"."review_retry" IS 'foreign key ReviewRetry(root, step, attempt) to ReviewEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_fk_xwrsmhid4t" ON "slice_den"."review_review_run_finish_output_fbgeikbjoigci" IS 'foreign key review_review_run_finish_output_fbgeikbjoigci(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_review_run_finish_output_fbgeikbjoigci_fk_zykulei24p" ON "slice_den"."review_review_run_finish_output_fbgeikbjoigci" IS 'foreign key review_review_run_finish_output_fbgeikbjoigci(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_fk_root_qm52msb2il" ON "slice_den"."review_review_run_input_hpdfjnehnkdig" IS 'foreign key review_review_run_input_hpdfjnehnkdig(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_hpdfjnehnkdig_fk_scope_tag_wmatfzkrvr" ON "slice_den"."review_review_run_input_hpdfjnehnkdig" IS 'foreign key review_review_run_input_hpdfjnehnkdig(scope, tag ReviewRoot.kind = ReviewRun) to ReviewRoot(root, kind)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_4pm52sixq4" ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" IS 'foreign key review_review_run_input_sizes_fmllfmbfdoojd(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_ogfrxt4co7" ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" IS 'foreign key review_review_run_input_sizes_fmllfmbfdoojd(root, scope) to review_review_run_input_hpdfjnehnkdig(root, scope)';

COMMENT ON CONSTRAINT "__review_review_run_input_sizes_fmllfmbfdoojd_fk_cvaggknojz" ON "slice_den"."review_review_run_input_sizes_fmllfmbfdoojd" IS 'foreign key review_review_run_input_sizes_fmllfmbfdoojd(root where Logic.ge(ordinal, 1n), scope, pred(ordinal)) to review_review_run_input_sizes_fmllfmbfdoojd(root, scope, ordinal)';

COMMENT ON CONSTRAINT "__review_save_input_njbdjgekhblef_fk_root_step_hph2jxpy5e" ON "slice_den"."review_save_input_njbdjgekhblef" IS 'foreign key review_save_input_njbdjgekhblef(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_uhq3buuxmn" ON "slice_den"."review_save_output_falmopiohdlkl" IS 'foreign key review_save_output_falmopiohdlkl(root, step) to ReviewDone(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_dcn5fzeh3x" ON "slice_den"."review_save_output_falmopiohdlkl" IS 'foreign key review_save_output_falmopiohdlkl(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_save_output_falmopiohdlkl_fk_root_step_z3szm3mfag" ON "slice_den"."review_save_output_falmopiohdlkl" IS 'foreign key review_save_output_falmopiohdlkl(root, step) to review_save_input_njbdjgekhblef(root, step)';

COMMENT ON CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_from_ugh7rl3qr3" ON "slice_den"."review_saved_bppbpjmhcjbaa" IS 'foreign key review_saved_bppbpjmhcjbaa(root, from) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_from_cft6j2vfjj" ON "slice_den"."review_saved_bppbpjmhcjbaa" IS 'foreign key review_saved_bppbpjmhcjbaa(root, from) to review_questions_finish_output_kddidbknbjeof(root, step)';

COMMENT ON CONSTRAINT "__review_saved_bppbpjmhcjbaa_fk_root_to_d3vv6faeie" ON "slice_den"."review_saved_bppbpjmhcjbaa" IS 'foreign key review_saved_bppbpjmhcjbaa(root, to) to review_save_input_njbdjgekhblef(root, step)';

COMMENT ON CONSTRAINT "__review_scope_fk_root_rc4vyqpoku" ON "slice_den"."review_scope" IS 'foreign key ReviewScope(root) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_skipped_fk_by_mzoxrlpp7w" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(by) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_skipped_fk_root_scope_o5jk25ddgb" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_skipped_fk_scope_zgzwa7kzos" ON "slice_den"."review_skipped" IS 'foreign key ReviewSkipped(scope) to ReviewRoot(root)';

COMMENT ON CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_from_fs3vq6s7ng" ON "slice_den"."review_split_fnhnebdnlfmck" IS 'foreign key review_split_fnhnebdnlfmck(root, from) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_from_r4ebrn52i6" ON "slice_den"."review_split_fnhnebdnlfmck" IS 'foreign key review_split_fnhnebdnlfmck(root, from) to review_gather_output_cgnhmechbiddp(root, step)';

COMMENT ON CONSTRAINT "__review_split_fnhnebdnlfmck_fk_root_to_r4y6o4qwyg" ON "slice_den"."review_split_fnhnebdnlfmck" IS 'foreign key review_split_fnhnebdnlfmck(root, to) to review_questions_input_jigaomgjefjfk(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_child_u342utzlud" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, child) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_scope_ax6i5m4tah" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_start_scope_fk_root_scope_ewcgg4gkqi" ON "slice_den"."review_start_scope" IS 'foreign key ReviewStartScope(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_scope_elajx6ojmn" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_scope_hm4o5wnnq3" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_start_step_fk_root_step_hydxoqk6ko" ON "slice_den"."review_start_step" IS 'foreign key ReviewStartStep(root, step) to ReviewStep(root, step)';

COMMENT ON CONSTRAINT "__review_step_fk_root_scope_a6ifj3up6d" ON "slice_den"."review_step" IS 'foreign key ReviewStep(root, scope) to ReviewAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__review_step_fk_root_scope_4m7aoxywg2" ON "slice_den"."review_step" IS 'foreign key ReviewStep(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_within_fk_root_parent_xrlmd76tph" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(root, parent) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__review_within_fk_root_scope_2kmwa6l6ye" ON "slice_den"."review_within" IS 'foreign key ReviewWithin(root, scope) to ReviewScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_admitted_fk_root_scope_qm32lzefa4" ON "slice_den"."sync_admitted" IS 'foreign key SyncAdmitted(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_build_input_khidlilbdjpfi_fk_root_step_tarspcft2d" ON "slice_den"."sync_build_input_khidlilbdjpfi" IS 'foreign key sync_build_input_khidlilbdjpfi(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_4zzwcwh744" ON "slice_den"."sync_build_output_ianmlfhgbcfli" IS 'foreign key sync_build_output_ianmlfhgbcfli(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_jr7bqlhkwb" ON "slice_den"."sync_build_output_ianmlfhgbcfli" IS 'foreign key sync_build_output_ianmlfhgbcfli(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_build_output_ianmlfhgbcfli_fk_root_step_zi6kl54fmz" ON "slice_den"."sync_build_output_ianmlfhgbcfli" IS 'foreign key sync_build_output_ianmlfhgbcfli(root, step) to sync_build_input_khidlilbdjpfi(root, step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_step_quvtx5ttao" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_claim_fk_root_step_pred_attempt_bol6pjm3eo" ON "slice_den"."sync_claim" IS 'foreign key SyncClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_copy_input_fijfgeannmgef_fk_root_step_xujiegk6xs" ON "slice_den"."sync_copy_input_fijfgeannmgef" IS 'foreign key sync_copy_input_fijfgeannmgef(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_pfqc66yuqd" ON "slice_den"."sync_copy_output_cfficoloepjbj" IS 'foreign key sync_copy_output_cfficoloepjbj(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_c4yylopuhc" ON "slice_den"."sync_copy_output_cfficoloepjbj" IS 'foreign key sync_copy_output_cfficoloepjbj(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_copy_output_cfficoloepjbj_fk_root_step_p5mfu6k6a2" ON "slice_den"."sync_copy_output_cfficoloepjbj" IS 'foreign key sync_copy_output_cfficoloepjbj(root, step) to sync_copy_input_fijfgeannmgef(root, step)';

COMMENT ON CONSTRAINT "__sync_done_fk_root_step_ftvlmvrpba" ON "slice_den"."sync_done" IS 'foreign key SyncDone(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_step_i2lhyuwibk" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_ended_fk_root_step_attempt_n3qg5glb33" ON "slice_den"."sync_ended" IS 'foreign key SyncEnded(root, step, attempt) to SyncClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_exclusive_fk_kind_key_pred_turn_opo5gkimc4" ON "slice_den"."sync_exclusive" IS 'foreign key SyncExclusive(kind, key, pred(turn)) to SyncReleased(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_exclusive_key_fk_root_scope_ru5tdbmjnc" ON "slice_den"."sync_exclusive_key" IS 'foreign key SyncExclusiveKey(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_step_22ldo45blt" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(root, step) to SyncFailed(root, step)';

COMMENT ON CONSTRAINT "__sync_exhausted_fk_root_step_kmkjf7jent" ON "slice_den"."sync_exhausted" IS 'foreign key SyncExhausted(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_failed_fk_root_step_myvzlf5ffc" ON "slice_den"."sync_failed" IS 'foreign key SyncFailed(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_step_rx2gydw664" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_fenced_fk_root_step_attempt_hkkt227xm7" ON "slice_den"."sync_fenced" IS 'foreign key SyncFenced(root, step, attempt) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_scope_n57v7sorjw" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_scope_nkwaqqjkro" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_finish_fk_root_step_gtaz64zwer" ON "slice_den"."sync_finish" IS 'foreign key SyncFinish(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_fk_root_step_krjzposexg" ON "slice_den"."sync_gold_finish_output_hkddafacepdaa" IS 'foreign key sync_gold_finish_output_hkddafacepdaa(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_finish_output_hkddafacepdaa_fk_root_step_x4gplol7ba" ON "slice_den"."sync_gold_finish_output_hkddafacepdaa" IS 'foreign key sync_gold_finish_output_hkddafacepdaa(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_gold_input_edhkhlceilnoh_fk_root_scope_pjza23hjnq" ON "slice_den"."sync_gold_input_edhkhlceilnoh" IS 'foreign key sync_gold_input_edhkhlceilnoh(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_gold_input_edhkhlceilnoh_fk_scope_tag_kind_6fzo4gn2rc" ON "slice_den"."sync_gold_input_edhkhlceilnoh" IS 'foreign key sync_gold_input_edhkhlceilnoh(scope, tag SyncRoot.kind = Gold) to SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_ehzwf7un2t" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step) to SyncResult(root, step)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_vuwropgke7" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_held_fk_root_step_attempt_mcpqusift2" ON "slice_den"."sync_held" IS 'foreign key SyncHeld(root, step, attempt) to SyncClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_paused_fk_target_pred_turn_ovy6ezc3ey" ON "slice_den"."sync_paused" IS 'foreign key SyncPaused(target, pred(turn)) to SyncResumed(target, turn)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_step_yvga4jg2h6" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(root, step) to SyncFailed(root, step)';

COMMENT ON CONSTRAINT "__sync_refusal_fk_root_step_65sxus7ykl" ON "slice_den"."sync_refusal" IS 'foreign key SyncRefusal(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_released_fk_kind_key_turn_e54e5at4ya" ON "slice_den"."sync_released" IS 'foreign key SyncReleased(kind, key, turn) to SyncExclusive(kind, key, turn)';

COMMENT ON CONSTRAINT "__sync_requested_with_fk_root_bihshryreo" ON "slice_den"."sync_requested_with" IS 'foreign key SyncRequestedWith(root) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_result_fk_root_step_dkzpapizq3" ON "slice_den"."sync_result" IS 'foreign key SyncResult(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_resumed_fk_target_turn_x3nw56h4tx" ON "slice_den"."sync_resumed" IS 'foreign key SyncResumed(target, turn) to SyncPaused(target, turn)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_step_mugwrgmigc" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_retry_fk_root_step_attempt_cg4q7avist" ON "slice_den"."sync_retry" IS 'foreign key SyncRetry(root, step, attempt) to SyncEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__sync_scope_fk_root_wx7v6qyztc" ON "slice_den"."sync_scope" IS 'foreign key SyncScope(root) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_by_wk5g3hkdey" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(by) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_root_scope_dct5o42l56" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_skipped_fk_scope_hufe6pzhes" ON "slice_den"."sync_skipped" IS 'foreign key SyncSkipped(scope) to SyncRoot(root)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_scope_e4yzl2gkau" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_scope_nacgozh2kl" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_start_step_fk_root_step_btl5tfw67n" ON "slice_den"."sync_start_step" IS 'foreign key SyncStartStep(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_scope_uniymuuxtn" ON "slice_den"."sync_step" IS 'foreign key SyncStep(root, scope) to SyncAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__sync_step_fk_root_scope_enzxhjw2gj" ON "slice_den"."sync_step" IS 'foreign key SyncStep(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_fk_root_hro44mmtkn" ON "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" IS 'foreign key sync_sync_run_finish_output_inlpehpebjlbl(root, step) to SyncDone(root, step)';

COMMENT ON CONSTRAINT "__sync_sync_run_finish_output_inlpehpebjlbl_fk_root_6ofbne5u3n" ON "slice_den"."sync_sync_run_finish_output_inlpehpebjlbl" IS 'foreign key sync_sync_run_finish_output_inlpehpebjlbl(root, step) to SyncStep(root, step)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_fk_root_scope_ehrwdj4d7o" ON "slice_den"."sync_sync_run_input_kmejgmkijpoho" IS 'foreign key sync_sync_run_input_kmejgmkijpoho(root, scope) to SyncScope(root, scope)';

COMMENT ON CONSTRAINT "__sync_sync_run_input_kmejgmkijpoho_fk_scope_tag_shnsvcdl5x" ON "slice_den"."sync_sync_run_input_kmejgmkijpoho" IS 'foreign key sync_sync_run_input_kmejgmkijpoho(scope, tag SyncRoot.kind = SyncRun) to SyncRoot(root, kind)';

COMMENT ON CONSTRAINT "__writeback_admitted_fk_root_scope_qqqzahnyf2" ON "slice_den"."writeback_admitted" IS 'foreign key WritebackAdmitted(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_step_zg75zksbji" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_claim_fk_root_step_pred_attempt_4zvl2uw25a" ON "slice_den"."writeback_claim" IS 'foreign key WritebackClaim(root where Logic.ge(attempt, 1n), step, pred(attempt)) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_deliver_input_libhnkibecamc_fk_root_step_zfg2qgn7ou" ON "slice_den"."writeback_deliver_input_libhnkibecamc" IS 'foreign key writeback_deliver_input_libhnkibecamc(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_rshc5kjhke" ON "slice_den"."writeback_deliver_output_ppecogpmgbpek" IS 'foreign key writeback_deliver_output_ppecogpmgbpek(root, step) to WritebackDone(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_4wnfijqcac" ON "slice_den"."writeback_deliver_output_ppecogpmgbpek" IS 'foreign key writeback_deliver_output_ppecogpmgbpek(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_deliver_output_ppecogpmgbpek_fk_root_i4igavu5eo" ON "slice_den"."writeback_deliver_output_ppecogpmgbpek" IS 'foreign key writeback_deliver_output_ppecogpmgbpek(root, step) to writeback_deliver_input_libhnkibecamc(root, step)';

COMMENT ON CONSTRAINT "__writeback_done_fk_root_step_bzwxzhndka" ON "slice_den"."writeback_done" IS 'foreign key WritebackDone(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_step_am67uqomrg" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_ended_fk_root_step_attempt_qh4jnsspop" ON "slice_den"."writeback_ended" IS 'foreign key WritebackEnded(root, step, attempt) to WritebackClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_step_gfmcwvfpwb" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(root, step) to WritebackFailed(root, step)';

COMMENT ON CONSTRAINT "__writeback_exhausted_fk_root_step_xwgnlixkqu" ON "slice_den"."writeback_exhausted" IS 'foreign key WritebackExhausted(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_failed_fk_root_step_ep5ube2q2t" ON "slice_den"."writeback_failed" IS 'foreign key WritebackFailed(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_step_jryffdx4b3" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_fenced_fk_root_step_attempt_scgwb3deqz" ON "slice_den"."writeback_fenced" IS 'foreign key WritebackFenced(root, step, attempt) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_scope_wktu6oamh6" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_scope_2ufa2arlo5" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_finish_fk_root_step_x7bocjavzm" ON "slice_den"."writeback_finish" IS 'foreign key WritebackFinish(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_5jfudzwxhs" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step) to WritebackResult(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_ujyn46mfgy" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_held_fk_root_step_attempt_7rv7r23ugx" ON "slice_den"."writeback_held" IS 'foreign key WritebackHeld(root, step, attempt) to WritebackClaim(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_paused_fk_target_pred_turn_rvsgo6wgpe" ON "slice_den"."writeback_paused" IS 'foreign key WritebackPaused(target, pred(turn)) to WritebackResumed(target, turn)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_step_xpfkdcxaxw" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(root, step) to WritebackFailed(root, step)';

COMMENT ON CONSTRAINT "__writeback_refusal_fk_root_step_sjojme5rf4" ON "slice_den"."writeback_refusal" IS 'foreign key WritebackRefusal(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_requested_with_fk_root_72fgh2eqe3" ON "slice_den"."writeback_requested_with" IS 'foreign key WritebackRequestedWith(root) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_result_fk_root_step_hpxhblq2jh" ON "slice_den"."writeback_result" IS 'foreign key WritebackResult(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_resumed_fk_target_turn_vfx6l6vk75" ON "slice_den"."writeback_resumed" IS 'foreign key WritebackResumed(target, turn) to WritebackPaused(target, turn)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_step_mqrj7w6oik" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_retry_fk_root_step_attempt_w6r4myovu5" ON "slice_den"."writeback_retry" IS 'foreign key WritebackRetry(root, step, attempt) to WritebackEnded(root, step, attempt)';

COMMENT ON CONSTRAINT "__writeback_scope_fk_root_ewz6khigbz" ON "slice_den"."writeback_scope" IS 'foreign key WritebackScope(root) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_by_3dxz35zl4d" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(by) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_root_scope_oiafhni4pk" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_skipped_fk_scope_4nuhyyemgw" ON "slice_den"."writeback_skipped" IS 'foreign key WritebackSkipped(scope) to WritebackRoot(root)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_scope_rlujmxpldi" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_scope_hro4duvhvg" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_start_step_fk_root_step_6rk46kjksz" ON "slice_den"."writeback_start_step" IS 'foreign key WritebackStartStep(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_scope_4chp4gjey5" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(root, scope) to WritebackAdmitted(root, scope)';

COMMENT ON CONSTRAINT "__writeback_step_fk_root_scope_2ldlcdao3z" ON "slice_den"."writeback_step" IS 'foreign key WritebackStep(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_fk_7orqppjowz" ON "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" IS 'foreign key writeback_writeback_finish_output_mhjodpondhejh(root, step) to WritebackDone(root, step)';

COMMENT ON CONSTRAINT "__writeback_writeback_finish_output_mhjodpondhejh_fk_6mtpysqho7" ON "slice_den"."writeback_writeback_finish_output_mhjodpondhejh" IS 'foreign key writeback_writeback_finish_output_mhjodpondhejh(root, step) to WritebackStep(root, step)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_fk_root_52sfglnunj" ON "slice_den"."writeback_writeback_input_ljafdhfgfeocc" IS 'foreign key writeback_writeback_input_ljafdhfgfeocc(root, scope) to WritebackScope(root, scope)';

COMMENT ON CONSTRAINT "__writeback_writeback_input_ljafdhfgfeocc_fk_scope_c6ffzcrmj7" ON "slice_den"."writeback_writeback_input_ljafdhfgfeocc" IS 'foreign key writeback_writeback_input_ljafdhfgfeocc(scope, tag WritebackRoot.kind = Writeback) to WritebackRoot(root, kind)';

COMMENT ON CONSTRAINT "__chain_page_read_tree_lakencnpkciin_row_fk_digest_xoi5z4ltkv" ON "slice_den"."__chain_page_read_tree_lakencnpkciin_wke2qksxq5" IS 'foreign key chain_page_read_tree_lakencnpkciinRow(digest, pred(items)) to chain_page_read_tree_items_cokakfjlndgem(digest, at)';

COMMENT ON TABLE "slice_den"."__head_assign_claim_attempt_h744pvqs3v" IS 'head table of AssignClaim.attempt';

COMMENT ON CONSTRAINT "__head_assign_claim_attempt_pk_ukplhioyap" ON "slice_den"."__head_assign_claim_attempt_h744pvqs3v" IS 'primary key of the head table of AssignClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" IS 'head table of ChainClaim.attempt';

COMMENT ON CONSTRAINT "__head_chain_claim_attempt_pk_uil6dupsak" ON "slice_den"."__head_chain_claim_attempt_n5yg3h2b6a" IS 'primary key of the head table of ChainClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" IS 'head table of ClockClaim.attempt';

COMMENT ON CONSTRAINT "__head_clock_claim_attempt_pk_qk5yhk2dpe" ON "slice_den"."__head_clock_claim_attempt_ddh5rjlfkk" IS 'primary key of the head table of ClockClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_fan_claim_attempt_u34lm72lgr" IS 'head table of FanClaim.attempt';

COMMENT ON CONSTRAINT "__head_fan_claim_attempt_pk_fxxlbksulz" ON "slice_den"."__head_fan_claim_attempt_u34lm72lgr" IS 'primary key of the head table of FanClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_retry_claim_attempt_exbl6vgycp" IS 'head table of RetryClaim.attempt';

COMMENT ON CONSTRAINT "__head_retry_claim_attempt_pk_ejhdquayr7" ON "slice_den"."__head_retry_claim_attempt_exbl6vgycp" IS 'primary key of the head table of RetryClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" IS 'head table of ReviewClaim.attempt';

COMMENT ON CONSTRAINT "__head_review_claim_attempt_pk_zws5xp3jki" ON "slice_den"."__head_review_claim_attempt_lsmvyy7ajm" IS 'primary key of the head table of ReviewClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" IS 'head table of SyncClaim.attempt';

COMMENT ON CONSTRAINT "__head_sync_claim_attempt_pk_xgyze7x7sx" ON "slice_den"."__head_sync_claim_attempt_dtv5nw4b3m" IS 'primary key of the head table of SyncClaim.attempt';

COMMENT ON TABLE "slice_den"."__head_writeback_claim_attempt_pk673p2jar" IS 'head table of WritebackClaim.attempt';

COMMENT ON CONSTRAINT "__head_writeback_claim_attempt_pk_iervt3geuj" ON "slice_den"."__head_writeback_claim_attempt_pk673p2jar" IS 'primary key of the head table of WritebackClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_assign_claim_attempt_wafvnidpqp"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of AssignClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_chain_claim_attempt_fn4w5elo4b"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ChainClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_clock_claim_attempt_ofrgvxuwnp"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ClockClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_fan_claim_attempt_chhiwa5h36"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of FanClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_retry_claim_attempt_djs2c6uume"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of RetryClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_review_claim_attempt_xxo4vl3amg"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of ReviewClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_sync_claim_attempt_26b5li3j4v"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of SyncClaim.attempt';

COMMENT ON FUNCTION "slice_den"."__stamp_writeback_claim_attempt_iasyjokmx7"("slice"."__sha256"[], "slice"."__sha256"[]) IS 'stamp function of WritebackClaim.attempt';

COMMENT ON INDEX "slice"."__passage_ix_embedding_ujugi77ft2" IS 'hnsw index Passage(embedding vectorCosine)';

COMMENT ON INDEX "slice_den"."__assign_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_m6yuaw7627" IS 'btree index AssignClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__assign_paused_ix_pred_turn_qryngij_6_c_4_target_aoi6sp74el" IS 'btree index AssignPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__assign_result_ix_root_outcome_step_ddttgrf23v" IS 'btree index AssignResult(root, outcome, step)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_by_phe5rdziqg" IS 'btree index AssignSkipped(by)';

COMMENT ON INDEX "slice_den"."__assign_skipped_ix_scope_ftup4gbap6" IS 'btree index AssignSkipped(scope)';

COMMENT ON INDEX "slice_den"."__assign_step_ix_root_scope_kind_drsz5mwtr4" IS 'btree index AssignStep(root, scope, kind)';

COMMENT ON INDEX "slice_den"."__chain_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_sic5xhruts" IS 'btree index ChainClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__chain_paused_ix_pred_turn_qryngij_6_c_4_target_ltz6nzangf" IS 'btree index ChainPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__chain_result_ix_root_outcome_step_3fchhz2atb" IS 'btree index ChainResult(root, outcome, step)';

COMMENT ON INDEX "slice_den"."__chain_result_ix_step_root_e43oo27e2e" IS 'btree index ChainResult(step, root)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_by_2c45vyfwzy" IS 'btree index ChainSkipped(by)';

COMMENT ON INDEX "slice_den"."__chain_skipped_ix_scope_jvrcbbmf2m" IS 'btree index ChainSkipped(scope)';

COMMENT ON INDEX "slice_den"."__chain_step_ix_root_scope_kind_7y3wfct5o4" IS 'btree index ChainStep(root, scope, kind)';

COMMENT ON INDEX "slice_den"."__clock_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_76aawvjtpr" IS 'btree index ClockClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__clock_paused_ix_pred_turn_qryngij_6_c_4_target_m3753rncus" IS 'btree index ClockPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_by_252vuphujb" IS 'btree index ClockSkipped(by)';

COMMENT ON INDEX "slice_den"."__clock_skipped_ix_scope_vlmkgoc4qh" IS 'btree index ClockSkipped(scope)';

COMMENT ON INDEX "slice_den"."__clock_step_ix_root_scope_xautpoatwk" IS 'btree index ClockStep(root, scope)';

COMMENT ON INDEX "slice_den"."__fan_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_root_eihagatfae" IS 'btree index FanClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__fan_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_utbrcrsxai" IS 'btree index FanExclusive(__pred_turn_qryngij6c4, kind, key)';

COMMENT ON INDEX "slice_den"."__fan_hold_ix_resource_seat_s7bnw22355" IS 'btree index FanHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__fan_paused_ix_pred_turn_qryngij_6_c_4_target_yrplqpn2fl" IS 'btree index FanPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__fan_result_ix_root_outcome_step_srquy2zczs" IS 'btree index FanResult(root, outcome, step)';

COMMENT ON INDEX "slice_den"."__fan_result_ix_step_root_gzzhwer4f4" IS 'btree index FanResult(step, root)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_by_3aejofkhor" IS 'btree index FanSkipped(by)';

COMMENT ON INDEX "slice_den"."__fan_skipped_ix_scope_h5pzdoa32a" IS 'btree index FanSkipped(scope)';

COMMENT ON INDEX "slice_den"."__fan_step_ix_root_scope_kind_u5r7xvxvzl" IS 'btree index FanStep(root, scope, kind)';

COMMENT ON INDEX "slice_den"."__fan_within_ix_root_parent_kind_3fui4hg5uo" IS 'btree index FanWithin(root, parent, kind)';

COMMENT ON INDEX "slice_den"."__retry_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_66l375ycrl" IS 'btree index RetryClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__retry_paused_ix_pred_turn_qryngij_6_c_4_target_mucldaev6r" IS 'btree index RetryPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__retry_result_ix_root_outcome_step_o6dp2ckkon" IS 'btree index RetryResult(root, outcome, step)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_by_s7pekf7xtg" IS 'btree index RetrySkipped(by)';

COMMENT ON INDEX "slice_den"."__retry_skipped_ix_scope_pj72ptncqt" IS 'btree index RetrySkipped(scope)';

COMMENT ON INDEX "slice_den"."__retry_step_ix_root_scope_kind_2fjaoxcf4e" IS 'btree index RetryStep(root, scope, kind)';

COMMENT ON INDEX "slice_den"."__review_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_guo6f4ktdf" IS 'btree index ReviewClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__review_hold_ix_resource_seat_3p66dnxzad" IS 'btree index ReviewHold(resource, seat)';

COMMENT ON INDEX "slice_den"."__review_paused_ix_pred_turn_qryngij_6_c_4_target_ss2ligwgbm" IS 'btree index ReviewPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__review_result_ix_root_outcome_step_7fbtzenqei" IS 'btree index ReviewResult(root, outcome, step)';

COMMENT ON INDEX "slice_den"."__review_result_ix_step_root_vz6d5jl67t" IS 'btree index ReviewResult(step, root)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_by_6z5g634njq" IS 'btree index ReviewSkipped(by)';

COMMENT ON INDEX "slice_den"."__review_skipped_ix_scope_ypzvqrmdce" IS 'btree index ReviewSkipped(scope)';

COMMENT ON INDEX "slice_den"."__review_step_ix_root_scope_kind_y6rly7sw5c" IS 'btree index ReviewStep(root, scope, kind)';

COMMENT ON INDEX "slice_den"."__review_within_ix_root_parent_kind_olszbr3xpq" IS 'btree index ReviewWithin(root, parent, kind)';

COMMENT ON INDEX "slice_den"."__sync_claim_ix_step_pred_attempt_oey_4_tm_5_xyl_2krihntk52" IS 'btree index SyncClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__sync_exclusive_ix_pred_turn_qryngij_6_c_4_kind_key_6ngsicnwod" IS 'btree index SyncExclusive(__pred_turn_qryngij6c4, kind, key)';

COMMENT ON INDEX "slice_den"."__sync_paused_ix_pred_turn_qryngij_6_c_4_target_tey4wi2fqb" IS 'btree index SyncPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__sync_result_ix_step_root_mbhvrwajkq" IS 'btree index SyncResult(step, root)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_by_ttq6dm55n2" IS 'btree index SyncSkipped(by)';

COMMENT ON INDEX "slice_den"."__sync_skipped_ix_scope_d5pw2mcp56" IS 'btree index SyncSkipped(scope)';

COMMENT ON INDEX "slice_den"."__sync_step_ix_root_scope_l4sfn7gzd3" IS 'btree index SyncStep(root, scope)';

COMMENT ON INDEX "slice_den"."__writeback_claim_ix_step_pred_attempt_oey_4_tm_5_6cvrydc2i4" IS 'btree index WritebackClaim(step, __pred_attempt_oey4tm5xyl, __root_yewsvvtcyz)';

COMMENT ON INDEX "slice_den"."__writeback_paused_ix_pred_turn_qryngij_6_c_4_target_c4qyccrebd" IS 'btree index WritebackPaused(__pred_turn_qryngij6c4, target)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_by_3ei4k4fj53" IS 'btree index WritebackSkipped(by)';

COMMENT ON INDEX "slice_den"."__writeback_skipped_ix_scope_dwesxm2rrj" IS 'btree index WritebackSkipped(scope)';

COMMENT ON INDEX "slice_den"."__writeback_step_ix_root_scope_oebhktgfcr" IS 'btree index WritebackStep(root, scope)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_exclude_paaebdpkimebl_ix_lsqx5rrooj" IS 'btree index assign_assignment_input_exclude_paaebdpkimebl(scope, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_kijoknpmnpomn_ix_scope_zdpoxekskw" IS 'btree index assign_assignment_input_kijoknpmnpomn(scope, root)';

COMMENT ON INDEX "slice_den"."__assign_assignment_input_near_acilimddcfjog_ix_ngwsts3irx" IS 'btree index assign_assignment_input_near_acilimddcfjog(scope, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__assign_decide_input_exclude_bpjgmijefddch_ix_step_6rlogjl7jq" IS 'btree index assign_decide_input_exclude_bpjgmijefddch(step, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__assign_decide_output_weighed_gpdibcghlfbhb_ix_step_zdgovsbsev" IS 'btree index assign_decide_output_weighed_gpdibcghlfbhb(step, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_ix_digest_us4gjyqbtv" IS 'btree index assign_decide_read_nearest_mlemoegfgpbbi(digest)';

COMMENT ON INDEX "slice_den"."__assign_decide_read_seen_oahojgbpphboo_ix_digest_n3rctyjuzy" IS 'btree index assign_decide_read_seen_oahojgbpphboo(digest)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_exclude_gcjikbkjkcefj_ix_step_jgr3ucl5k4" IS 'btree index assign_embed_input_exclude_gcjikbkjkcefj(step, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__assign_embed_input_near_dhffcaodkgemm_ix_step_pred_zabtvlrk6i" IS 'btree index assign_embed_input_near_dhffcaodkgemm(step, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__chain_chain_run_input_glnkafcnkbnnn_ix_scope_7m6xdpeomo" IS 'btree index chain_chain_run_input_glnkafcnkbnnn(scope)';

COMMENT ON INDEX "slice_den"."__chain_ordered_input_pbjpmafopnahk_ix_scope_gclfowop2l" IS 'btree index chain_ordered_input_pbjpmafopnahk(scope)';

COMMENT ON INDEX "slice_den"."__chain_page_read_earlier_dgehlbgebidjc_ix_digest_q7w3wfuylq" IS 'btree index chain_page_read_earlier_dgehlbgebidjc(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_tree_lakencnpkciin_ix_digest_sol43yx6xx" IS 'btree index chain_page_read_tree_lakencnpkciin(digest)';

COMMENT ON INDEX "slice_den"."__chain_page_read_weights_agiabippcbobb_ix_digest_qnr675qazv" IS 'btree index chain_page_read_weights_agiabippcbobb(digest)';

COMMENT ON INDEX "slice_den"."__clock_hourly_input_nknibbhbedpnl_ix_scope_na4mazfm64" IS 'btree index clock_hourly_input_nknibbhbedpnl(scope)';

COMMENT ON INDEX "slice_den"."__clock_sitting_input_bckcjcndffgmo_ix_scope_nlybghgcg4" IS 'btree index clock_sitting_input_bckcjcndffgmo(scope)';

COMMENT ON INDEX "slice_den"."__fan_fan_run_input_bghibckinpfgk_ix_scope_5v7nebwox5" IS 'btree index fan_fan_run_input_bghibckinpfgk(scope)';

COMMENT ON INDEX "slice_den"."__fan_sweep_input_bnmfcblhkahec_ix_scope_nyr7qv2ge5" IS 'btree index fan_sweep_input_bnmfcblhkahec(scope)';

COMMENT ON INDEX "slice_den"."__fan_wanted_input_nfecjpihiaope_ix_scope_ppupq7qr45" IS 'btree index fan_wanted_input_nfecjpihiaope(scope)';

COMMENT ON INDEX "slice_den"."__retry_ladders_input_fkbbgblmfmhbi_ix_scope_6eoc3fpsao" IS 'btree index retry_ladders_input_fkbbgblmfmhbi(scope)';

COMMENT ON INDEX "slice_den"."__retry_throttled_input_bfjgfamhjmgcd_ix_scope_i4u2dji4dx" IS 'btree index retry_throttled_input_bfjgfamhjmgcd(scope)';

COMMENT ON INDEX "slice_den"."__retry_unhurried_input_mccbdnleajjif_ix_scope_4m5wrectvc" IS 'btree index retry_unhurried_input_mccbdnleajjif(scope)';

COMMENT ON INDEX "slice_den"."__review_gather_input_sizes_ifjkkjdhlfbgp_ix_step_vcdd25oxo7" IS 'btree index review_gather_input_sizes_ifjkkjdhlfbgp(step, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_hpdfjnehnkdig_ix_scope_hfevxoj22z" IS 'btree index review_review_run_input_hpdfjnehnkdig(scope)';

COMMENT ON INDEX "slice_den"."__review_review_run_input_sizes_fmllfmbfdoojd_ix_kznjp7hcu6" IS 'btree index review_review_run_input_sizes_fmllfmbfdoojd(scope, __pred_ordinal_e545zctcav, __root_yjobx7uyrd)';

COMMENT ON INDEX "slice_den"."__sync_gold_input_edhkhlceilnoh_ix_scope_bq7edqqruo" IS 'btree index sync_gold_input_edhkhlceilnoh(scope)';

COMMENT ON INDEX "slice_den"."__sync_sync_run_input_kmejgmkijpoho_ix_scope_6ubhv5r27a" IS 'btree index sync_sync_run_input_kmejgmkijpoho(scope)';

COMMENT ON INDEX "slice_den"."__writeback_writeback_input_ljafdhfgfeocc_ix_scope_oc5ydzp43g" IS 'btree index writeback_writeback_input_ljafdhfgfeocc(scope)';

COMMENT ON FUNCTION "slice"."__reader_news_assign_done_y4burpgr4f"() IS 'the reader of the delta of news of AssignDone';

COMMENT ON FUNCTION "slice"."__reader_news_assign_failed_3ifwklheph"() IS 'the reader of the delta of news of AssignFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_requested_with_qjnor3taeu"() IS 'the reader of the delta of olds of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_result_o6zk4nq2uc"() IS 'the reader of the delta of olds of AssignResult';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_result_bteqeemhw5"() IS 'the reader of the delta of olds of AssignResult';

COMMENT ON FUNCTION "slice"."__reader_news_assign_root_z3pifk6sfr"() IS 'the reader of the delta of news of AssignRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_step_2o7dsj4psv"() IS 'the reader of the delta of olds of AssignStep';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_step_5tpdkqyp6c"() IS 'the reader of the delta of olds of AssignStep';

COMMENT ON FUNCTION "slice"."__reader_news_chain_done_6q6b4sarfc"() IS 'the reader of the delta of news of ChainDone';

COMMENT ON FUNCTION "slice"."__reader_news_chain_failed_ppnk66z7ty"() IS 'the reader of the delta of news of ChainFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_requested_with_ut4rqu54qy"() IS 'the reader of the delta of olds of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_result_2ip2a2o3mo"() IS 'the reader of the delta of olds of ChainResult';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_result_kxslyjrxrw"() IS 'the reader of the delta of olds of ChainResult';

COMMENT ON FUNCTION "slice"."__reader_news_chain_root_pqx66geszw"() IS 'the reader of the delta of news of ChainRoot';

COMMENT ON FUNCTION "slice"."__reader_news_chain_root_qk467afork"() IS 'the reader of the delta of news of ChainRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_chain_step_4j62aj7fdt"() IS 'the reader of the delta of olds of ChainStep';

COMMENT ON FUNCTION "slice"."__reader_news_clock_done_bfsl4zlq4r"() IS 'the reader of the delta of news of ClockDone';

COMMENT ON FUNCTION "slice"."__reader_news_clock_failed_eeyxyf4ht4"() IS 'the reader of the delta of news of ClockFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_requested_with_noqhn7v56g"() IS 'the reader of the delta of olds of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_result_mfuoxxlrmq"() IS 'the reader of the delta of olds of ClockResult';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_result_f6ym3k23iw"() IS 'the reader of the delta of olds of ClockResult';

COMMENT ON FUNCTION "slice"."__reader_news_clock_root_zmsmnuu25h"() IS 'the reader of the delta of news of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_news_clock_root_uuhbc5qlvq"() IS 'the reader of the delta of news of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_root_ewhrqq5f2w"() IS 'the reader of the delta of olds of ClockRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_step_ixpdftpona"() IS 'the reader of the delta of olds of ClockStep';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_step_qlc5ewdcgi"() IS 'the reader of the delta of olds of ClockStep';

COMMENT ON FUNCTION "slice"."__reader_news_fan_claim_knqfarxmq4"() IS 'the reader of the delta of news of FanClaim';

COMMENT ON FUNCTION "slice"."__reader_news_fan_claim_5alrwyw54k"() IS 'the reader of the delta of news of FanClaim';

COMMENT ON FUNCTION "slice"."__reader_news_fan_done_w4vpsn7web"() IS 'the reader of the delta of news of FanDone';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_ended_ji66tn3kxi"() IS 'the reader of the delta of olds of FanEnded';

COMMENT ON FUNCTION "slice"."__reader_news_fan_failed_amemxtznzb"() IS 'the reader of the delta of news of FanFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_held_au6y26wv2r"() IS 'the reader of the delta of olds of FanHeld';

COMMENT ON FUNCTION "slice"."__reader_news_fan_hold_22lokdzhdu"() IS 'the reader of the delta of news of FanHold';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_requested_with_24ufi6tkwi"() IS 'the reader of the delta of olds of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_result_svzra5ioyu"() IS 'the reader of the delta of olds of FanResult';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_result_tup5kbpnro"() IS 'the reader of the delta of olds of FanResult';

COMMENT ON FUNCTION "slice"."__reader_news_fan_root_dq63umhtk7"() IS 'the reader of the delta of news of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_news_fan_root_fw65rwwpie"() IS 'the reader of the delta of news of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_news_fan_root_e7p4pksetz"() IS 'the reader of the delta of news of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_root_bssc2sfesm"() IS 'the reader of the delta of olds of FanRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_step_aibharr75g"() IS 'the reader of the delta of olds of FanStep';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_step_m2p5wuecxp"() IS 'the reader of the delta of olds of FanStep';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_step_wudn4xqbfd"() IS 'the reader of the delta of olds of FanStep';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_within_kyfw5fcyw7"() IS 'the reader of the delta of olds of FanWithin';

COMMENT ON FUNCTION "slice"."__reader_news_retry_done_br6sqtvlch"() IS 'the reader of the delta of news of RetryDone';

COMMENT ON FUNCTION "slice"."__reader_news_retry_failed_ktpv4wy7hm"() IS 'the reader of the delta of news of RetryFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_requested_with_t36s4unfgy"() IS 'the reader of the delta of olds of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_result_as3detxkgc"() IS 'the reader of the delta of olds of RetryResult';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_result_mt54byec3u"() IS 'the reader of the delta of olds of RetryResult';

COMMENT ON FUNCTION "slice"."__reader_news_retry_root_bywi7z5hxa"() IS 'the reader of the delta of news of RetryRoot';

COMMENT ON FUNCTION "slice"."__reader_news_retry_root_6fwc35yyrm"() IS 'the reader of the delta of news of RetryRoot';

COMMENT ON FUNCTION "slice"."__reader_news_retry_root_mtt6ib7jg2"() IS 'the reader of the delta of news of RetryRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_keb2tzl532"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_hdotm4iepz"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_hgzwvvlyjl"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_olds_retry_step_brpazmjjvr"() IS 'the reader of the delta of olds of RetryStep';

COMMENT ON FUNCTION "slice"."__reader_news_review_claim_hcpxcqvs4h"() IS 'the reader of the delta of news of ReviewClaim';

COMMENT ON FUNCTION "slice"."__reader_news_review_claim_73y43aw46b"() IS 'the reader of the delta of news of ReviewClaim';

COMMENT ON FUNCTION "slice"."__reader_news_review_done_mrxi7z2aos"() IS 'the reader of the delta of news of ReviewDone';

COMMENT ON FUNCTION "slice"."__reader_olds_review_ended_6sx6bojyw5"() IS 'the reader of the delta of olds of ReviewEnded';

COMMENT ON FUNCTION "slice"."__reader_news_review_failed_fclqhoislj"() IS 'the reader of the delta of news of ReviewFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_review_held_yiwvlfbq4x"() IS 'the reader of the delta of olds of ReviewHeld';

COMMENT ON FUNCTION "slice"."__reader_news_review_hold_q3xznbmvpd"() IS 'the reader of the delta of news of ReviewHold';

COMMENT ON FUNCTION "slice"."__reader_olds_review_requested_with_ygv3daxy4f"() IS 'the reader of the delta of olds of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_review_result_pcfm24ttnc"() IS 'the reader of the delta of olds of ReviewResult';

COMMENT ON FUNCTION "slice"."__reader_olds_review_result_a2bearicwk"() IS 'the reader of the delta of olds of ReviewResult';

COMMENT ON FUNCTION "slice"."__reader_news_review_root_vin4dpcipu"() IS 'the reader of the delta of news of ReviewRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_review_step_73y7bfrocd"() IS 'the reader of the delta of olds of ReviewStep';

COMMENT ON FUNCTION "slice"."__reader_olds_review_step_mgayu6lths"() IS 'the reader of the delta of olds of ReviewStep';

COMMENT ON FUNCTION "slice"."__reader_olds_review_step_tm6jgyfac2"() IS 'the reader of the delta of olds of ReviewStep';

COMMENT ON FUNCTION "slice"."__reader_olds_review_within_iji5ac3j7w"() IS 'the reader of the delta of olds of ReviewWithin';

COMMENT ON FUNCTION "slice"."__reader_news_sync_done_v7nikpyxe5"() IS 'the reader of the delta of news of SyncDone';

COMMENT ON FUNCTION "slice"."__reader_news_sync_failed_urxukv2tqt"() IS 'the reader of the delta of news of SyncFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_requested_with_avb3kd6xae"() IS 'the reader of the delta of olds of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_result_nvwysv4fb5"() IS 'the reader of the delta of olds of SyncResult';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_result_3a2xi56if7"() IS 'the reader of the delta of olds of SyncResult';

COMMENT ON FUNCTION "slice"."__reader_news_sync_root_hbesvkxtsw"() IS 'the reader of the delta of news of SyncRoot';

COMMENT ON FUNCTION "slice"."__reader_news_sync_root_liresgzpuw"() IS 'the reader of the delta of news of SyncRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_step_zs7xxtt4vk"() IS 'the reader of the delta of olds of SyncStep';

COMMENT ON FUNCTION "slice"."__reader_olds_sync_step_nwo7sqkibk"() IS 'the reader of the delta of olds of SyncStep';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_done_7psuzxuvog"() IS 'the reader of the delta of news of WritebackDone';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_failed_nsmo5bmfom"() IS 'the reader of the delta of news of WritebackFailed';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_requested_with_ahgmbensmg"() IS 'the reader of the delta of olds of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_result_rgmvkln2wq"() IS 'the reader of the delta of olds of WritebackResult';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_result_2fsxeieb7t"() IS 'the reader of the delta of olds of WritebackResult';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_root_b3tbia24ni"() IS 'the reader of the delta of news of WritebackRoot';

COMMENT ON FUNCTION "slice"."__reader_olds_writeback_step_ulgtxsn5nk"() IS 'the reader of the delta of olds of WritebackStep';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_kijoknpmnpomn_yfh3u7pmjl"() IS 'the reader of the delta of news of assign_assignment_input_kijoknpmnpomn';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_kijoknpmnpomn_mp6va67fl2"() IS 'the reader of the delta of news of assign_assignment_input_kijoknpmnpomn';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_kijoknpmnpomn_5axzbdrmfm"() IS 'the reader of the delta of olds of assign_assignment_input_kijoknpmnpomn';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_kijoknpmnpomn_3r7rddq6bw"() IS 'the reader of the delta of olds of assign_assignment_input_kijoknpmnpomn';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_mode_nearest_dly2n7rqgj"() IS 'the reader of the delta of news of assign_assignment_input_mode_nearest_jdmfgbfmpepjd';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_mode_nearest_yxr2ml4xgd"() IS 'the reader of the delta of olds of assign_assignment_input_mode_nearest_jdmfgbfmpepjd';

COMMENT ON FUNCTION "slice"."__reader_news_assign_assignment_input_mode_within_xnsr6btobx"() IS 'the reader of the delta of news of assign_assignment_input_mode_within_iahlinklmdadj';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_assignment_input_mode_within_whfbrc7uvn"() IS 'the reader of the delta of olds of assign_assignment_input_mode_within_iahlinklmdadj';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_ffhdojphbdjfc_4brax5wjhz"() IS 'the reader of the delta of news of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_ffhdojphbdjfc_67ttmw6sju"() IS 'the reader of the delta of news of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_ffhdojphbdjfc_wdiolbgbj4"() IS 'the reader of the delta of news of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_ffhdojphbdjfc_ggpvlgybs4"() IS 'the reader of the delta of olds of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_ffhdojphbdjfc_7jwsexfocc"() IS 'the reader of the delta of olds of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_mode_nearest_olo5i5kmqg"() IS 'the reader of the delta of news of assign_decide_input_mode_nearest_ijgbegdphofca';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_mode_nearest_5p7wwudxud"() IS 'the reader of the delta of olds of assign_decide_input_mode_nearest_ijgbegdphofca';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_input_mode_within_olzqz5crct"() IS 'the reader of the delta of news of assign_decide_input_mode_within_fgbilcoafbdcg';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_input_mode_within_xbfboic6qw"() IS 'the reader of the delta of olds of assign_decide_input_mode_within_fgbilcoafbdcg';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_fkgbaoobeoima_5ygc2i5ftr"() IS 'the reader of the delta of news of assign_decide_output_fkgbaoobeoima';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_fkgbaoobeoima_3ufm6kikiw"() IS 'the reader of the delta of news of assign_decide_output_fkgbaoobeoima';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_fkgbaoobeoima_q4c7jvb2dv"() IS 'the reader of the delta of olds of assign_decide_output_fkgbaoobeoima';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_fkgbaoobeoima_2rplrt3ly5"() IS 'the reader of the delta of olds of assign_decide_output_fkgbaoobeoima';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_stage_rest_uwvtpijch7"() IS 'the reader of the delta of news of assign_decide_output_stage_rest_gohjkdlkfnkca';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_stage_rest_rxcdaszif7"() IS 'the reader of the delta of olds of assign_decide_output_stage_rest_gohjkdlkfnkca';

COMMENT ON FUNCTION "slice"."__reader_news_assign_decide_output_stage_serve_b2wznmtiw6"() IS 'the reader of the delta of news of assign_decide_output_stage_serve_chfjeagmkjoef';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_decide_output_stage_serve_ulv7aehjyk"() IS 'the reader of the delta of olds of assign_decide_output_stage_serve_chfjeagmkjoef';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_kmlepfpdepkmo_aq2itbdvbg"() IS 'the reader of the delta of news of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_kmlepfpdepkmo_s4tg7nzhuz"() IS 'the reader of the delta of news of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_kmlepfpdepkmo_662ew3updc"() IS 'the reader of the delta of news of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_kmlepfpdepkmo_tkc6bz6acu"() IS 'the reader of the delta of olds of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_kmlepfpdepkmo_y6gkrgvk4t"() IS 'the reader of the delta of olds of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_mode_nearest_fizay73622"() IS 'the reader of the delta of news of assign_embed_input_mode_nearest_bdiihcbmhfojp';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_mode_nearest_4f4p2vehl3"() IS 'the reader of the delta of olds of assign_embed_input_mode_nearest_bdiihcbmhfojp';

COMMENT ON FUNCTION "slice"."__reader_news_assign_embed_input_mode_within_vwrmz3x6yp"() IS 'the reader of the delta of news of assign_embed_input_mode_within_oiehjhalkkkfi';

COMMENT ON FUNCTION "slice"."__reader_olds_assign_embed_input_mode_within_p4q56w62fz"() IS 'the reader of the delta of olds of assign_embed_input_mode_within_oiehjhalkkkfi';

COMMENT ON FUNCTION "slice"."__reader_news_chain_page_input_jhliinhchcgno_mescuzqrdq"() IS 'the reader of the delta of news of chain_page_input_jhliinhchcgno';

COMMENT ON FUNCTION "slice"."__reader_news_clock_chime_input_bfjhiocgaifco_wuz6q44okm"() IS 'the reader of the delta of news of clock_chime_input_bfjhiocgaifco';

COMMENT ON FUNCTION "slice"."__reader_news_clock_close_input_bajjphdpmhlbc_5fxevicyc5"() IS 'the reader of the delta of news of clock_close_input_bajjphdpmhlbc';

COMMENT ON FUNCTION "slice"."__reader_news_clock_hourly_key_cnlgnmcbbcgma_jgugh52ed7"() IS 'the reader of the delta of news of clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__reader_olds_clock_hourly_key_cnlgnmcbbcgma_eitxojsjza"() IS 'the reader of the delta of olds of clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__reader_news_fan_batch_input_hjhhnklpfiilh_ewmcw752gx"() IS 'the reader of the delta of news of fan_batch_input_hjhhnklpfiilh';

COMMENT ON FUNCTION "slice"."__reader_news_fan_dust_input_lelfhikaelkja_lyespbdvoc"() IS 'the reader of the delta of news of fan_dust_input_lelfhikaelkja';

COMMENT ON FUNCTION "slice"."__reader_news_fan_mop_input_ngghbiaegmghl_owv2fjxifq"() IS 'the reader of the delta of news of fan_mop_input_ngghbiaegmghl';

COMMENT ON FUNCTION "slice"."__reader_news_fan_square_input_ifddbjkaokoig_ibwvcebn3n"() IS 'the reader of the delta of news of fan_square_input_ifddbjkaokoig';

COMMENT ON FUNCTION "slice"."__reader_news_fan_wanted_key_ldjmcglkghhjb_xsbg7whh7p"() IS 'the reader of the delta of news of fan_wanted_key_ldjmcglkghhjb';

COMMENT ON FUNCTION "slice"."__reader_olds_fan_wanted_key_ldjmcglkghhjb_xyoi275gwc"() IS 'the reader of the delta of olds of fan_wanted_key_ldjmcglkghhjb';

COMMENT ON FUNCTION "slice"."__reader_news_retry_brittle_input_jbcpaiekdedpp_r7ig2agexk"() IS 'the reader of the delta of news of retry_brittle_input_jbcpaiekdedpp';

COMMENT ON FUNCTION "slice"."__reader_news_retry_patient_input_ndliolfjpjnoc_flvois2lwl"() IS 'the reader of the delta of news of retry_patient_input_ndliolfjpjnoc';

COMMENT ON FUNCTION "slice"."__reader_news_retry_polite_input_iopjdjgdhfide_zwrvbhintb"() IS 'the reader of the delta of news of retry_polite_input_iopjdjgdhfide';

COMMENT ON FUNCTION "slice"."__reader_news_retry_steadfast_input_ebanfagjeadim_okvb4xe4il"() IS 'the reader of the delta of news of retry_steadfast_input_ebanfagjeadim';

COMMENT ON FUNCTION "slice"."__reader_news_review_analyze_input_aobppbhebnkae_sznzxtvsah"() IS 'the reader of the delta of news of review_analyze_input_aobppbhebnkae';

COMMENT ON FUNCTION "slice"."__reader_news_review_gather_input_eiadkjkkdoiel_ri74fuhzcl"() IS 'the reader of the delta of news of review_gather_input_eiadkjkkdoiel';

COMMENT ON FUNCTION "slice"."__reader_news_review_questions_input_jigaomgjefjfk_k3uouxbl6e"() IS 'the reader of the delta of news of review_questions_input_jigaomgjefjfk';

COMMENT ON FUNCTION "slice"."__reader_news_review_save_input_njbdjgekhblef_hpxuevmpmf"() IS 'the reader of the delta of news of review_save_input_njbdjgekhblef';

COMMENT ON FUNCTION "slice"."__reader_news_sync_build_input_khidlilbdjpfi_62im6wlwao"() IS 'the reader of the delta of news of sync_build_input_khidlilbdjpfi';

COMMENT ON FUNCTION "slice"."__reader_news_sync_copy_input_fijfgeannmgef_eipuiltp62"() IS 'the reader of the delta of news of sync_copy_input_fijfgeannmgef';

COMMENT ON FUNCTION "slice"."__reader_news_writeback_deliver_input_libhnkibecamc_lk4j354tul"() IS 'the reader of the delta of news of writeback_deliver_input_libhnkibecamc';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_34tzcxl26w"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write adds to FanClaim';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_iz46wxrc4n"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write removes from FanEnded';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_xv3pzwjw6y"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write removes from FanHeld';

COMMENT ON FUNCTION "slice"."__judge_fan_live_check_fan_seat_below_count_fnm53ono2n"() IS 'the rule judge''s block of rule check FanSeatBelowCount of FanLive over the rows a write adds to FanHold';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_wnl6qdupjr"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write adds to ReviewClaim';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_xjodxgzn5d"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write removes from ReviewEnded';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_gitg7o7vto"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write removes from ReviewHeld';

COMMENT ON FUNCTION "slice"."__judge_review_live_check_review_seat_below_count_hog4qzzuc6"() IS 'the rule judge''s block of rule check ReviewSeatBelowCount of ReviewLive over the rows a write adds to ReviewHold';

COMMENT ON FUNCTION "slice"."__judge_assign_done_in_assign_result_4mu6t5mltj"() IS 'the rule judge''s block of rule AssignDone(root, step) in AssignResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_failed_in_assign_result_rrfurnngc2"() IS 'the rule judge''s block of rule AssignFailed(root, step) in AssignResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_root_kind_in_assign_requested_with_y64bqe4ut6"() IS 'the rule judge''s block of rule AssignRoot(root) where Logic.eq(kind, "Assignment") in AssignRequestedWith(root) over the rows a write removes from AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_assign_root_kind_in_assign_requested_with_ig6jexlxad"() IS 'the rule judge''s block of rule AssignRoot(root) where Logic.eq(kind, "Assignment") in AssignRequestedWith(root) over the rows a write adds to AssignRoot';

COMMENT ON FUNCTION "slice"."__judge_chain_done_in_chain_result_675t5ij4i2"() IS 'the rule judge''s block of rule ChainDone(root, step) in ChainResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_failed_in_chain_result_dicz7rfd3b"() IS 'the rule judge''s block of rule ChainFailed(root, step) in ChainResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_2g35gu6lam"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "ChainRun") in ChainRequestedWith(root) over the rows a write removes from ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_fu5aypedgi"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "ChainRun") in ChainRequestedWith(root) over the rows a write adds to ChainRoot';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_suf4d2xedk"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "Ordered") in ChainRequestedWith(root) over the rows a write removes from ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_chain_root_kind_in_chain_requested_with_j2ulvdfjrv"() IS 'the rule judge''s block of rule ChainRoot(root) where Logic.eq(kind, "Ordered") in ChainRequestedWith(root) over the rows a write adds to ChainRoot';

COMMENT ON FUNCTION "slice"."__judge_clock_done_in_clock_result_xjrqrd2b2m"() IS 'the rule judge''s block of rule ClockDone(root, step) in ClockResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_failed_in_clock_result_rclmfokwzo"() IS 'the rule judge''s block of rule ClockFailed(root, step) in ClockResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_hourly_key_2zrf7spbwq"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Hourly") in clock_hourly_key_cnlgnmcbbcgma(root) over the rows a write adds to ClockRoot';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_hourly_key_xli73u7ubt"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Hourly") in clock_hourly_key_cnlgnmcbbcgma(root) over the rows a write removes from clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_requested_with_nn6fidtjod"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Sitting") in ClockRequestedWith(root) over the rows a write removes from ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_clock_root_kind_in_clock_requested_with_6jo3ttvghk"() IS 'the rule judge''s block of rule ClockRoot(root) where Logic.eq(kind, "Sitting") in ClockRequestedWith(root) over the rows a write adds to ClockRoot';

COMMENT ON FUNCTION "slice"."__judge_fan_done_in_fan_result_igvbhkk2tv"() IS 'the rule judge''s block of rule FanDone(root, step) in FanResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_failed_in_fan_result_r57me4fbko"() IS 'the rule judge''s block of rule FanFailed(root, step) in FanResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_z6ih3mmhmt"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "FanRun") in FanRequestedWith(root) over the rows a write removes from FanRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_6nh5nfwfrn"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "FanRun") in FanRequestedWith(root) over the rows a write adds to FanRoot';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_nfhma7opa6"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Sweep") in FanRequestedWith(root) over the rows a write removes from FanRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_requested_with_4sxcj54q7c"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Sweep") in FanRequestedWith(root) over the rows a write adds to FanRoot';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_wanted_key_4sfxv6konr"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Wanted") in fan_wanted_key_ldjmcglkghhjb(root) over the rows a write adds to FanRoot';

COMMENT ON FUNCTION "slice"."__judge_fan_root_kind_in_fan_wanted_key_ixxignkjwd"() IS 'the rule judge''s block of rule FanRoot(root) where Logic.eq(kind, "Wanted") in fan_wanted_key_ldjmcglkghhjb(root) over the rows a write removes from fan_wanted_key_ldjmcglkghhjb';

COMMENT ON FUNCTION "slice"."__judge_retry_done_in_retry_result_q344fhh2mm"() IS 'the rule judge''s block of rule RetryDone(root, step) in RetryResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_failed_in_retry_result_xaecmonhtp"() IS 'the rule judge''s block of rule RetryFailed(root, step) in RetryResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_m5ockpoegg"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Ladders") in RetryRequestedWith(root) over the rows a write removes from RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_hd36ur5p5y"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Ladders") in RetryRequestedWith(root) over the rows a write adds to RetryRoot';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_gm364fr33q"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Throttled") in RetryRequestedWith(root) over the rows a write removes from RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_kfhiwxwz2p"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Throttled") in RetryRequestedWith(root) over the rows a write adds to RetryRoot';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_tir4f2gguc"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Unhurried") in RetryRequestedWith(root) over the rows a write removes from RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_retry_root_kind_in_retry_requested_with_tda34kljpn"() IS 'the rule judge''s block of rule RetryRoot(root) where Logic.eq(kind, "Unhurried") in RetryRequestedWith(root) over the rows a write adds to RetryRoot';

COMMENT ON FUNCTION "slice"."__judge_review_done_in_review_result_ibz3jfbnei"() IS 'the rule judge''s block of rule ReviewDone(root, step) in ReviewResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_failed_in_review_result_whygze7zq6"() IS 'the rule judge''s block of rule ReviewFailed(root, step) in ReviewResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_root_kind_in_review_requested_with_hatpm4ojfs"() IS 'the rule judge''s block of rule ReviewRoot(root) where Logic.eq(kind, "ReviewRun") in ReviewRequestedWith(root) over the rows a write removes from ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_review_root_kind_in_review_requested_with_hhj4i66uge"() IS 'the rule judge''s block of rule ReviewRoot(root) where Logic.eq(kind, "ReviewRun") in ReviewRequestedWith(root) over the rows a write adds to ReviewRoot';

COMMENT ON FUNCTION "slice"."__judge_sync_done_in_sync_result_yjfymgp3lh"() IS 'the rule judge''s block of rule SyncDone(root, step) in SyncResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_failed_in_sync_result_zp7mocg4uv"() IS 'the rule judge''s block of rule SyncFailed(root, step) in SyncResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_kusky6jvzy"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "Gold") in SyncRequestedWith(root) over the rows a write removes from SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_hexkxczyoq"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "Gold") in SyncRequestedWith(root) over the rows a write adds to SyncRoot';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_vn5v767dh6"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "SyncRun") in SyncRequestedWith(root) over the rows a write removes from SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_sync_root_kind_in_sync_requested_with_rxyj5ibblk"() IS 'the rule judge''s block of rule SyncRoot(root) where Logic.eq(kind, "SyncRun") in SyncRequestedWith(root) over the rows a write adds to SyncRoot';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_in_writeback_result_d3jnna5bbp"() IS 'the rule judge''s block of rule WritebackDone(root, step) in WritebackResult(root, step) where Logic.eq(outcome, "done") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_failed_in_writeback_result_ingi2erzkx"() IS 'the rule judge''s block of rule WritebackFailed(root, step) in WritebackResult(root, step) where Logic.eq(outcome, "failed") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_root_kind_in_writeback_requested_snbntsro4u"() IS 'the rule judge''s block of rule WritebackRoot(root) where Logic.eq(kind, "Writeback") in WritebackRequestedWith(root) over the rows a write removes from WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__judge_writeback_root_kind_in_writeback_requested_u62dvi57jv"() IS 'the rule judge''s block of rule WritebackRoot(root) where Logic.eq(kind, "Writeback") in WritebackRequestedWith(root) over the rows a write adds to WritebackRoot';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_kijoknpmnpomn_mode_gvnrd5v3xz"() IS 'the rule judge''s block of rule assign_assignment_input_kijoknpmnpomn(root, scope) where Logic.eq(mode, "Nearest") in assign_assignment_input_mode_nearest_jdmfgbfmpepjd(root, scope) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_kijoknpmnpomn_mode_frduljtwb5"() IS 'the rule judge''s block of rule assign_assignment_input_kijoknpmnpomn(root, scope) where Logic.eq(mode, "Within") in assign_assignment_input_mode_within_iahlinklmdadj(root, scope) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_sbmg3wrba7"() IS 'the rule judge''s block of rule assign_assignment_input_mode_nearest_jdmfgbfmpepjd(root, scope) in assign_assignment_input_kijoknpmnpomn(root, scope) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_within_dlb7e5f4qq"() IS 'the rule judge''s block of rule assign_assignment_input_mode_within_iahlinklmdadj(root, scope) in assign_assignment_input_kijoknpmnpomn(root, scope) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ffhdojphbdjfc_in_assign_maqdj5k36j"() IS 'the rule judge''s block of rule assign_decide_input_ffhdojphbdjfc(root, step) in AssignStep(root, step) where Logic.eq(kind, "Decide") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ffhdojphbdjfc_mode_in_khmg526jwa"() IS 'the rule judge''s block of rule assign_decide_input_ffhdojphbdjfc(root, step) where Logic.eq(mode, "Nearest") in assign_decide_input_mode_nearest_ijgbegdphofca(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ffhdojphbdjfc_mode_in_7bb7nvsgft"() IS 'the rule judge''s block of rule assign_decide_input_ffhdojphbdjfc(root, step) where Logic.eq(mode, "Within") in assign_decide_input_mode_within_fgbilcoafbdcg(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_4tw6w7nfgq"() IS 'the rule judge''s block of rule assign_decide_input_mode_nearest_ijgbegdphofca(root, step) in assign_decide_input_ffhdojphbdjfc(root, step) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_within_3km6adit6z"() IS 'the rule judge''s block of rule assign_decide_input_mode_within_fgbilcoafbdcg(root, step) in assign_decide_input_ffhdojphbdjfc(root, step) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_fkgbaoobeoima_stage_in_wcq4bw6yur"() IS 'the rule judge''s block of rule assign_decide_output_fkgbaoobeoima(root, step) where Logic.eq(stage, "Rest") in assign_decide_output_stage_rest_gohjkdlkfnkca(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_fkgbaoobeoima_stage_in_f3ooqjksc2"() IS 'the rule judge''s block of rule assign_decide_output_fkgbaoobeoima(root, step) where Logic.eq(stage, "Serve") in assign_decide_output_stage_serve_chfjeagmkjoef(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_kr4hai63i6"() IS 'the rule judge''s block of rule assign_decide_output_stage_rest_gohjkdlkfnkca(root, step) in assign_decide_output_fkgbaoobeoima(root, step) where Logic.eq(stage, "Rest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_serve_5baectbewp"() IS 'the rule judge''s block of rule assign_decide_output_stage_serve_chfjeagmkjoef(root, step) in assign_decide_output_fkgbaoobeoima(root, step) where Logic.eq(stage, "Serve") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_kmlepfpdepkmo_in_assign_qrgngzhiqk"() IS 'the rule judge''s block of rule assign_embed_input_kmlepfpdepkmo(root, step) in AssignStep(root, step) where Logic.eq(kind, "Embed") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_kmlepfpdepkmo_mode_in_hbzxunjj65"() IS 'the rule judge''s block of rule assign_embed_input_kmlepfpdepkmo(root, step) where Logic.eq(mode, "Nearest") in assign_embed_input_mode_nearest_bdiihcbmhfojp(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_kmlepfpdepkmo_mode_in_kgjweuqazv"() IS 'the rule judge''s block of rule assign_embed_input_kmlepfpdepkmo(root, step) where Logic.eq(mode, "Within") in assign_embed_input_mode_within_oiehjhalkkkfi(root, step) over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_2ujgopdk6c"() IS 'the rule judge''s block of rule assign_embed_input_mode_nearest_bdiihcbmhfojp(root, step) in assign_embed_input_kmlepfpdepkmo(root, step) where Logic.eq(mode, "Nearest") over its units';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_within_oiehjhalkkkfi_kmqzq2cvfb"() IS 'the rule judge''s block of rule assign_embed_input_mode_within_oiehjhalkkkfi(root, step) in assign_embed_input_kmlepfpdepkmo(root, step) where Logic.eq(mode, "Within") over its units';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_jhliinhchcgno_in_chain_step_nd6qv6dzlj"() IS 'the rule judge''s block of rule chain_page_input_jhliinhchcgno(root, step) in ChainStep(root, step) where Logic.eq(kind, "Page") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_bfjhiocgaifco_in_clock_tlag2xjywv"() IS 'the rule judge''s block of rule clock_chime_input_bfjhiocgaifco(root, step) in ClockStep(root, step) where Logic.eq(kind, "Chime") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_close_input_bajjphdpmhlbc_in_clock_s7gstsyqhs"() IS 'the rule judge''s block of rule clock_close_input_bajjphdpmhlbc(root, step) in ClockStep(root, step) where Logic.eq(kind, "Close") over its units';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_cnlgnmcbbcgma_in_clock_root_hnfp5nmgnd"() IS 'the rule judge''s block of rule clock_hourly_key_cnlgnmcbbcgma(root) in ClockRoot(root) where Logic.eq(kind, "Hourly") over the rows a write removes from ClockRoot';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_cnlgnmcbbcgma_in_clock_root_2i5m5saqk3"() IS 'the rule judge''s block of rule clock_hourly_key_cnlgnmcbbcgma(root) in ClockRoot(root) where Logic.eq(kind, "Hourly") over the rows a write adds to clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_hjhhnklpfiilh_in_fan_within_cwc4etrhjn"() IS 'the rule judge''s block of rule fan_batch_input_hjhhnklpfiilh(root, scope) in FanWithin(root, scope) where Logic.eq(kind, "Batch") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_lelfhikaelkja_in_fan_step_zlrls4olhh"() IS 'the rule judge''s block of rule fan_dust_input_lelfhikaelkja(root, step) in FanStep(root, step) where Logic.eq(kind, "Dust") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_mop_input_ngghbiaegmghl_in_fan_step_ww2sprix2s"() IS 'the rule judge''s block of rule fan_mop_input_ngghbiaegmghl(root, step) in FanStep(root, step) where Logic.eq(kind, "Mop") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_square_input_ifddbjkaokoig_in_fan_step_q3rmnb5roa"() IS 'the rule judge''s block of rule fan_square_input_ifddbjkaokoig(root, step) in FanStep(root, step) where Logic.eq(kind, "Square") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_ldjmcglkghhjb_in_fan_root_yohtrtszfe"() IS 'the rule judge''s block of rule fan_wanted_key_ldjmcglkghhjb(root) in FanRoot(root) where Logic.eq(kind, "Wanted") over the rows a write removes from FanRoot';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_ldjmcglkghhjb_in_fan_root_3ag3toxwac"() IS 'the rule judge''s block of rule fan_wanted_key_ldjmcglkghhjb(root) in FanRoot(root) where Logic.eq(kind, "Wanted") over the rows a write adds to fan_wanted_key_ldjmcglkghhjb';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_jbcpaiekdedpp_in_retry_k7gwicvfip"() IS 'the rule judge''s block of rule retry_brittle_input_jbcpaiekdedpp(root, step) in RetryStep(root, step) where Logic.eq(kind, "Brittle") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_patient_input_ndliolfjpjnoc_in_retry_3aopovofrx"() IS 'the rule judge''s block of rule retry_patient_input_ndliolfjpjnoc(root, step) in RetryStep(root, step) where Logic.eq(kind, "Patient") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_polite_input_iopjdjgdhfide_in_retry_wqubwpdkys"() IS 'the rule judge''s block of rule retry_polite_input_iopjdjgdhfide(root, step) in RetryStep(root, step) where Logic.eq(kind, "Polite") over its units';

COMMENT ON FUNCTION "slice"."__judge_retry_steadfast_input_ebanfagjeadim_in_retry_emez5c3kkw"() IS 'the rule judge''s block of rule retry_steadfast_input_ebanfagjeadim(root, step) in RetryStep(root, step) where Logic.eq(kind, "Steadfast") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_aobppbhebnkae_in_review_rjfywjh3dt"() IS 'the rule judge''s block of rule review_analyze_input_aobppbhebnkae(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Analyze") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_gather_input_eiadkjkkdoiel_in_review_6ajba7seeq"() IS 'the rule judge''s block of rule review_gather_input_eiadkjkkdoiel(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Gather") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_jigaomgjefjfk_in_suhradf7aq"() IS 'the rule judge''s block of rule review_questions_input_jigaomgjefjfk(root, scope) in ReviewWithin(root, scope) where Logic.eq(kind, "Questions") over its units';

COMMENT ON FUNCTION "slice"."__judge_review_save_input_njbdjgekhblef_in_review_al5kshyuhv"() IS 'the rule judge''s block of rule review_save_input_njbdjgekhblef(root, step) in ReviewStep(root, step) where Logic.eq(kind, "Save") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_khidlilbdjpfi_in_sync_step_zyzftuhru6"() IS 'the rule judge''s block of rule sync_build_input_khidlilbdjpfi(root, step) in SyncStep(root, step) where Logic.eq(kind, "Build") over its units';

COMMENT ON FUNCTION "slice"."__judge_sync_copy_input_fijfgeannmgef_in_sync_step_kzx3flco2f"() IS 'the rule judge''s block of rule sync_copy_input_fijfgeannmgef(root, step) in SyncStep(root, step) where Logic.eq(kind, "Copy") over its units';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_libhnkibecamc_in_bhkpa2qclj"() IS 'the rule judge''s block of rule writeback_deliver_input_libhnkibecamc(root, step) in WritebackStep(root, step) where Logic.eq(kind, "Deliver") over its units';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_tml3jzipqt"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanClaim';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_rsvzhfp6ug"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanEnded';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_5pedmcfadq"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write removes from FanHeld';

COMMENT ON FUNCTION "slice"."__judge_fan_live_key_resource_seat_nru5iz6quv"() IS 'the rule judge''s block of rule key FanLive(resource, seat) over the rows a write adds to FanHold';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_546bvon4yy"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewClaim';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ogqous6mhr"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewEnded';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_btbkuztx56"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write removes from ReviewHeld';

COMMENT ON FUNCTION "slice"."__judge_review_live_key_resource_seat_ahhaxk5zwx"() IS 'the rule judge''s block of rule key ReviewLive(resource, seat) over the rows a write adds to ReviewHold';

COMMENT ON FUNCTION "slice"."__judge_assign_done_hjsux6cb6r"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_requested_with_hyywr2ftov"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_root_6r3ohziuof"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of AssignRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_done_7blz2jjczl"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_requested_with_i7beucymph"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_root_3ul5qninm3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ChainRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_done_nw5m6y7otq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_requested_with_t4ltokajyn"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_root_nat24ww5us"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_root_wv6vzxfaxg"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ClockRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_claim_s3j4rvtcvs"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_done_2nmscmmvlu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_ended_6lkn5mmmar"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanEnded and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_held_dhl6funig6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanHeld and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_hold_xpwnh3rc3e"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanHold and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_requested_with_6u7nk63iyh"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_root_3xv3pboblw"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_root_vrtvh7ucis"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of FanRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_done_us2mduacrm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_requested_with_j3ssvefp33"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_root_cmlflfqapn"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of RetryRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_claim_az6lkkq33b"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewClaim and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_done_xzuqwzrsjm"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_ended_z2tfnoj2wi"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewEnded and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_held_wah4syhkpo"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewHeld and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_hold_mggi2ob7td"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewHold and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_requested_with_kvjjtfrbmb"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_root_eoqbpnyblg"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of ReviewRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_done_psjgmjlxp6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_requested_with_nxw6j5ooqc"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_root_b5i4biztjp"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of SyncRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_done_c7valompmz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackDone and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_requested_with_6hg6i3kgj7"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackRequestedWith and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_root_fosk74oqmk"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of WritebackRoot and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_kijoknpmnpomn_vo6xagirbp"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_assignment_input_kijoknpmnpomn and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_assignment_input_mode_nearest_fmjbkdl3yj"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_assignment_input_mode_nearest_jdmfgbfmpepjd and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_ffhdojphbdjfc_5ilao3l7iu"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_decide_input_ffhdojphbdjfc and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_input_mode_nearest_ostkbgvo33"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_decide_input_mode_nearest_ijgbegdphofca and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_fkgbaoobeoima_6f3mcnbzp7"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_decide_output_fkgbaoobeoima and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_decide_output_stage_rest_hc7fgclj4e"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_decide_output_stage_rest_gohjkdlkfnkca and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_assign_embed_input_mode_nearest_kzjxk2rgl4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of assign_embed_input_mode_nearest_bdiihcbmhfojp and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_chain_page_input_jhliinhchcgno_hhovbcsxr3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of chain_page_input_jhliinhchcgno and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_chime_input_bfjhiocgaifco_mezoddi4rz"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of clock_chime_input_bfjhiocgaifco and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_cnlgnmcbbcgma_3rn4mnoei3"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of clock_hourly_key_cnlgnmcbbcgma and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_clock_hourly_key_cnlgnmcbbcgma_jg2rgbjarw"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of clock_hourly_key_cnlgnmcbbcgma and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_batch_input_hjhhnklpfiilh_wuhll2leqs"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of fan_batch_input_hjhhnklpfiilh and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_dust_input_lelfhikaelkja_zaupoerthc"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of fan_dust_input_lelfhikaelkja and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_ldjmcglkghhjb_gkbgbjcn5x"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of fan_wanted_key_ldjmcglkghhjb and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_fan_wanted_key_ldjmcglkghhjb_i3tnpbjuq4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of fan_wanted_key_ldjmcglkghhjb and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_retry_brittle_input_jbcpaiekdedpp_4ow7ufgae4"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of retry_brittle_input_jbcpaiekdedpp and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_analyze_input_aobppbhebnkae_5gcwgtq7v6"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of review_analyze_input_aobppbhebnkae and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_review_questions_input_jigaomgjefjfk_2aepjem65i"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of review_questions_input_jigaomgjefjfk and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_sync_build_input_khidlilbdjpfi_bzh52od3yq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of sync_build_input_khidlilbdjpfi and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__judge_writeback_deliver_input_libhnkibecamc_u4ukwxvkeq"("pg_catalog"."text"[]) IS 'the rule judge of the deltas of writeback_deliver_input_libhnkibecamc and the relations its rules join it to';

COMMENT ON FUNCTION "slice"."__capture_assign_done_ma3msfdp3b"() IS 'rule capture of AssignDone';

COMMENT ON FUNCTION "slice"."__capture_assign_failed_cqtrnqesux"() IS 'rule capture of AssignFailed';

COMMENT ON FUNCTION "slice"."__capture_assign_requested_with_h2atfyvv4s"() IS 'rule capture of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_assign_result_3zix6jjqic"() IS 'rule capture of AssignResult';

COMMENT ON FUNCTION "slice"."__capture_assign_root_lbkcscnsqf"() IS 'rule capture of AssignRoot';

COMMENT ON FUNCTION "slice"."__capture_assign_step_bxkkty5l67"() IS 'rule capture of AssignStep';

COMMENT ON FUNCTION "slice"."__capture_chain_done_3sufn6jr7y"() IS 'rule capture of ChainDone';

COMMENT ON FUNCTION "slice"."__capture_chain_failed_pmft65pzdb"() IS 'rule capture of ChainFailed';

COMMENT ON FUNCTION "slice"."__capture_chain_requested_with_haahw5wmk6"() IS 'rule capture of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_chain_result_y3xtf6otn5"() IS 'rule capture of ChainResult';

COMMENT ON FUNCTION "slice"."__capture_chain_root_3cootamwgf"() IS 'rule capture of ChainRoot';

COMMENT ON FUNCTION "slice"."__capture_chain_step_2uxbeo7tjg"() IS 'rule capture of ChainStep';

COMMENT ON FUNCTION "slice"."__capture_clock_done_dfh6reh5mi"() IS 'rule capture of ClockDone';

COMMENT ON FUNCTION "slice"."__capture_clock_failed_6qny3r6u6y"() IS 'rule capture of ClockFailed';

COMMENT ON FUNCTION "slice"."__capture_clock_requested_with_wh65uqc7ii"() IS 'rule capture of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_clock_result_jy4vcxcejz"() IS 'rule capture of ClockResult';

COMMENT ON FUNCTION "slice"."__capture_clock_root_tuedr7b4mb"() IS 'rule capture of ClockRoot';

COMMENT ON FUNCTION "slice"."__capture_clock_step_u5p64rffid"() IS 'rule capture of ClockStep';

COMMENT ON FUNCTION "slice"."__capture_fan_claim_ctcrhycatd"() IS 'rule capture of FanClaim';

COMMENT ON FUNCTION "slice"."__capture_fan_done_mvcdb3g7le"() IS 'rule capture of FanDone';

COMMENT ON FUNCTION "slice"."__capture_fan_ended_gzzovkkada"() IS 'rule capture of FanEnded';

COMMENT ON FUNCTION "slice"."__capture_fan_failed_ecscfsee25"() IS 'rule capture of FanFailed';

COMMENT ON FUNCTION "slice"."__capture_fan_held_ekrigwpm7j"() IS 'rule capture of FanHeld';

COMMENT ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() IS 'rule capture of FanHold';

COMMENT ON FUNCTION "slice"."__capture_fan_requested_with_owmaj7huz2"() IS 'rule capture of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_fan_result_tevufz2c53"() IS 'rule capture of FanResult';

COMMENT ON FUNCTION "slice"."__capture_fan_root_cjk7n6ydwg"() IS 'rule capture of FanRoot';

COMMENT ON FUNCTION "slice"."__capture_fan_step_hmyykvgk4j"() IS 'rule capture of FanStep';

COMMENT ON FUNCTION "slice"."__capture_fan_within_pwsrdikydc"() IS 'rule capture of FanWithin';

COMMENT ON FUNCTION "slice"."__capture_retry_done_b7rnilmjoe"() IS 'rule capture of RetryDone';

COMMENT ON FUNCTION "slice"."__capture_retry_failed_jarzybi4cd"() IS 'rule capture of RetryFailed';

COMMENT ON FUNCTION "slice"."__capture_retry_requested_with_jgpz6kopmj"() IS 'rule capture of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_retry_result_oof7kiqgid"() IS 'rule capture of RetryResult';

COMMENT ON FUNCTION "slice"."__capture_retry_root_nujht4q2jp"() IS 'rule capture of RetryRoot';

COMMENT ON FUNCTION "slice"."__capture_retry_step_gox3p6ldla"() IS 'rule capture of RetryStep';

COMMENT ON FUNCTION "slice"."__capture_review_claim_qyslgqsqs7"() IS 'rule capture of ReviewClaim';

COMMENT ON FUNCTION "slice"."__capture_review_done_gxpax2oqid"() IS 'rule capture of ReviewDone';

COMMENT ON FUNCTION "slice"."__capture_review_ended_3o7fwr7f2y"() IS 'rule capture of ReviewEnded';

COMMENT ON FUNCTION "slice"."__capture_review_failed_3nd4cow637"() IS 'rule capture of ReviewFailed';

COMMENT ON FUNCTION "slice"."__capture_review_held_p4ye73l7sh"() IS 'rule capture of ReviewHeld';

COMMENT ON FUNCTION "slice"."__capture_review_hold_3d64vgpezl"() IS 'rule capture of ReviewHold';

COMMENT ON FUNCTION "slice"."__capture_review_requested_with_lzc5wr45yq"() IS 'rule capture of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_review_result_m25jokn327"() IS 'rule capture of ReviewResult';

COMMENT ON FUNCTION "slice"."__capture_review_root_qgu5iwjyle"() IS 'rule capture of ReviewRoot';

COMMENT ON FUNCTION "slice"."__capture_review_step_3y2i7xqqpk"() IS 'rule capture of ReviewStep';

COMMENT ON FUNCTION "slice"."__capture_review_within_aqblir65lf"() IS 'rule capture of ReviewWithin';

COMMENT ON FUNCTION "slice"."__capture_sync_done_ohhkaujpgx"() IS 'rule capture of SyncDone';

COMMENT ON FUNCTION "slice"."__capture_sync_failed_xpbhxdlx72"() IS 'rule capture of SyncFailed';

COMMENT ON FUNCTION "slice"."__capture_sync_requested_with_xfv4yl7s46"() IS 'rule capture of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_sync_result_led6m2o22r"() IS 'rule capture of SyncResult';

COMMENT ON FUNCTION "slice"."__capture_sync_root_s5cwtqjc6s"() IS 'rule capture of SyncRoot';

COMMENT ON FUNCTION "slice"."__capture_sync_step_35gtwztkwz"() IS 'rule capture of SyncStep';

COMMENT ON FUNCTION "slice"."__capture_writeback_done_qfh7utr7q5"() IS 'rule capture of WritebackDone';

COMMENT ON FUNCTION "slice"."__capture_writeback_failed_xewjzd2yye"() IS 'rule capture of WritebackFailed';

COMMENT ON FUNCTION "slice"."__capture_writeback_requested_with_2rygwrqbml"() IS 'rule capture of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__capture_writeback_result_cd63iav5l7"() IS 'rule capture of WritebackResult';

COMMENT ON FUNCTION "slice"."__capture_writeback_root_4gkeh6e4ge"() IS 'rule capture of WritebackRoot';

COMMENT ON FUNCTION "slice"."__capture_writeback_step_dklkh3hpav"() IS 'rule capture of WritebackStep';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_kijoknpmnpomn_rxujbbpoef"() IS 'rule capture of assign_assignment_input_kijoknpmnpomn';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_mode_nearest_klirr7raw7"() IS 'rule capture of assign_assignment_input_mode_nearest_jdmfgbfmpepjd';

COMMENT ON FUNCTION "slice"."__capture_assign_assignment_input_mode_within_4wx7no7xu3"() IS 'rule capture of assign_assignment_input_mode_within_iahlinklmdadj';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_ffhdojphbdjfc_mfeqwopj3h"() IS 'rule capture of assign_decide_input_ffhdojphbdjfc';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_mode_nearest_7jrsdnadlf"() IS 'rule capture of assign_decide_input_mode_nearest_ijgbegdphofca';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_input_mode_within_i6swg4ynv7"() IS 'rule capture of assign_decide_input_mode_within_fgbilcoafbdcg';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_fkgbaoobeoima_fwkbpsftra"() IS 'rule capture of assign_decide_output_fkgbaoobeoima';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_stage_rest_dldhh2mdlb"() IS 'rule capture of assign_decide_output_stage_rest_gohjkdlkfnkca';

COMMENT ON FUNCTION "slice"."__capture_assign_decide_output_stage_serve_3qjeseaoqd"() IS 'rule capture of assign_decide_output_stage_serve_chfjeagmkjoef';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_kmlepfpdepkmo_4izx7456pr"() IS 'rule capture of assign_embed_input_kmlepfpdepkmo';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_mode_nearest_niyoltxefo"() IS 'rule capture of assign_embed_input_mode_nearest_bdiihcbmhfojp';

COMMENT ON FUNCTION "slice"."__capture_assign_embed_input_mode_within_y7wwn24b6u"() IS 'rule capture of assign_embed_input_mode_within_oiehjhalkkkfi';

COMMENT ON FUNCTION "slice"."__capture_chain_page_input_jhliinhchcgno_pn3m4aq6fd"() IS 'rule capture of chain_page_input_jhliinhchcgno';

COMMENT ON FUNCTION "slice"."__capture_clock_chime_input_bfjhiocgaifco_sr22n7amv4"() IS 'rule capture of clock_chime_input_bfjhiocgaifco';

COMMENT ON FUNCTION "slice"."__capture_clock_close_input_bajjphdpmhlbc_rcioouaxx3"() IS 'rule capture of clock_close_input_bajjphdpmhlbc';

COMMENT ON FUNCTION "slice"."__capture_clock_hourly_key_cnlgnmcbbcgma_63plh5wkx2"() IS 'rule capture of clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__capture_fan_batch_input_hjhhnklpfiilh_wdieuse7ap"() IS 'rule capture of fan_batch_input_hjhhnklpfiilh';

COMMENT ON FUNCTION "slice"."__capture_fan_dust_input_lelfhikaelkja_kfcv5jab4n"() IS 'rule capture of fan_dust_input_lelfhikaelkja';

COMMENT ON FUNCTION "slice"."__capture_fan_mop_input_ngghbiaegmghl_wzytnemjg6"() IS 'rule capture of fan_mop_input_ngghbiaegmghl';

COMMENT ON FUNCTION "slice"."__capture_fan_square_input_ifddbjkaokoig_wpmymh2enn"() IS 'rule capture of fan_square_input_ifddbjkaokoig';

COMMENT ON FUNCTION "slice"."__capture_fan_wanted_key_ldjmcglkghhjb_iehha34smm"() IS 'rule capture of fan_wanted_key_ldjmcglkghhjb';

COMMENT ON FUNCTION "slice"."__capture_retry_brittle_input_jbcpaiekdedpp_6du25dzjlf"() IS 'rule capture of retry_brittle_input_jbcpaiekdedpp';

COMMENT ON FUNCTION "slice"."__capture_retry_patient_input_ndliolfjpjnoc_lue44yspgs"() IS 'rule capture of retry_patient_input_ndliolfjpjnoc';

COMMENT ON FUNCTION "slice"."__capture_retry_polite_input_iopjdjgdhfide_vd32g5rmgj"() IS 'rule capture of retry_polite_input_iopjdjgdhfide';

COMMENT ON FUNCTION "slice"."__capture_retry_steadfast_input_ebanfagjeadim_z4dxrnfvbc"() IS 'rule capture of retry_steadfast_input_ebanfagjeadim';

COMMENT ON FUNCTION "slice"."__capture_review_analyze_input_aobppbhebnkae_jttgrvwqc7"() IS 'rule capture of review_analyze_input_aobppbhebnkae';

COMMENT ON FUNCTION "slice"."__capture_review_gather_input_eiadkjkkdoiel_xqjuzbfsvm"() IS 'rule capture of review_gather_input_eiadkjkkdoiel';

COMMENT ON FUNCTION "slice"."__capture_review_questions_input_jigaomgjefjfk_7jjtdm3bl3"() IS 'rule capture of review_questions_input_jigaomgjefjfk';

COMMENT ON FUNCTION "slice"."__capture_review_save_input_njbdjgekhblef_33j7k5en3l"() IS 'rule capture of review_save_input_njbdjgekhblef';

COMMENT ON FUNCTION "slice"."__capture_sync_build_input_khidlilbdjpfi_r7bqx63jea"() IS 'rule capture of sync_build_input_khidlilbdjpfi';

COMMENT ON FUNCTION "slice"."__capture_sync_copy_input_fijfgeannmgef_u6iihw3vp4"() IS 'rule capture of sync_copy_input_fijfgeannmgef';

COMMENT ON FUNCTION "slice"."__capture_writeback_deliver_input_libhnkibecamc_wydpthxtka"() IS 'rule capture of writeback_deliver_input_libhnkibecamc';

COMMENT ON FUNCTION "slice"."__stand_assign_done_zpmhn6mrnc"() IS 'the stand-up of the rule judge''s session tables a write of AssignDone needs';

COMMENT ON FUNCTION "slice"."__stand_assign_failed_pmuglprcww"() IS 'the stand-up of the rule judge''s session tables a write of AssignFailed needs';

COMMENT ON FUNCTION "slice"."__stand_assign_requested_with_3xavh4tz7a"() IS 'the stand-up of the rule judge''s session tables a write of AssignRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_assign_result_3dwqbs6psk"() IS 'the stand-up of the rule judge''s session tables a write of AssignResult needs';

COMMENT ON FUNCTION "slice"."__stand_assign_root_ecnnffi3e3"() IS 'the stand-up of the rule judge''s session tables a write of AssignRoot needs';

COMMENT ON FUNCTION "slice"."__stand_assign_step_qwjijdgx6j"() IS 'the stand-up of the rule judge''s session tables a write of AssignStep needs';

COMMENT ON FUNCTION "slice"."__stand_chain_done_fhcl4vvjiw"() IS 'the stand-up of the rule judge''s session tables a write of ChainDone needs';

COMMENT ON FUNCTION "slice"."__stand_chain_failed_nocd74knki"() IS 'the stand-up of the rule judge''s session tables a write of ChainFailed needs';

COMMENT ON FUNCTION "slice"."__stand_chain_requested_with_fq22h3tdwv"() IS 'the stand-up of the rule judge''s session tables a write of ChainRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_chain_result_2qc7m4brl3"() IS 'the stand-up of the rule judge''s session tables a write of ChainResult needs';

COMMENT ON FUNCTION "slice"."__stand_chain_root_mmsdkigltc"() IS 'the stand-up of the rule judge''s session tables a write of ChainRoot needs';

COMMENT ON FUNCTION "slice"."__stand_chain_step_3hsz3lyxy2"() IS 'the stand-up of the rule judge''s session tables a write of ChainStep needs';

COMMENT ON FUNCTION "slice"."__stand_clock_done_dja4biaxge"() IS 'the stand-up of the rule judge''s session tables a write of ClockDone needs';

COMMENT ON FUNCTION "slice"."__stand_clock_failed_zsyt2n5qx3"() IS 'the stand-up of the rule judge''s session tables a write of ClockFailed needs';

COMMENT ON FUNCTION "slice"."__stand_clock_requested_with_st4ea4apoz"() IS 'the stand-up of the rule judge''s session tables a write of ClockRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_clock_result_dk5lfugcd5"() IS 'the stand-up of the rule judge''s session tables a write of ClockResult needs';

COMMENT ON FUNCTION "slice"."__stand_clock_root_bfxjnnlbbr"() IS 'the stand-up of the rule judge''s session tables a write of ClockRoot needs';

COMMENT ON FUNCTION "slice"."__stand_clock_step_cbbapr6dla"() IS 'the stand-up of the rule judge''s session tables a write of ClockStep needs';

COMMENT ON FUNCTION "slice"."__stand_fan_claim_chk6cawes6"() IS 'the stand-up of the rule judge''s session tables a write of FanClaim needs';

COMMENT ON FUNCTION "slice"."__stand_fan_done_e4qldz2xtt"() IS 'the stand-up of the rule judge''s session tables a write of FanDone needs';

COMMENT ON FUNCTION "slice"."__stand_fan_ended_l35bnatdrx"() IS 'the stand-up of the rule judge''s session tables a write of FanEnded needs';

COMMENT ON FUNCTION "slice"."__stand_fan_failed_ok5ebljdmh"() IS 'the stand-up of the rule judge''s session tables a write of FanFailed needs';

COMMENT ON FUNCTION "slice"."__stand_fan_held_jx6ijuwgvx"() IS 'the stand-up of the rule judge''s session tables a write of FanHeld needs';

COMMENT ON FUNCTION "slice"."__stand_fan_hold_lndmiy4fqw"() IS 'the stand-up of the rule judge''s session tables a write of FanHold needs';

COMMENT ON FUNCTION "slice"."__stand_fan_requested_with_cfdhaf2vfh"() IS 'the stand-up of the rule judge''s session tables a write of FanRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_fan_result_4bsplumotk"() IS 'the stand-up of the rule judge''s session tables a write of FanResult needs';

COMMENT ON FUNCTION "slice"."__stand_fan_root_evnc53opne"() IS 'the stand-up of the rule judge''s session tables a write of FanRoot needs';

COMMENT ON FUNCTION "slice"."__stand_fan_step_cwlbx3l7hf"() IS 'the stand-up of the rule judge''s session tables a write of FanStep needs';

COMMENT ON FUNCTION "slice"."__stand_fan_within_oo5pwmjabl"() IS 'the stand-up of the rule judge''s session tables a write of FanWithin needs';

COMMENT ON FUNCTION "slice"."__stand_retry_done_ll42rjotis"() IS 'the stand-up of the rule judge''s session tables a write of RetryDone needs';

COMMENT ON FUNCTION "slice"."__stand_retry_failed_wyonvn6i5o"() IS 'the stand-up of the rule judge''s session tables a write of RetryFailed needs';

COMMENT ON FUNCTION "slice"."__stand_retry_requested_with_ilqrjj3m5y"() IS 'the stand-up of the rule judge''s session tables a write of RetryRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_retry_result_mpvrsnerne"() IS 'the stand-up of the rule judge''s session tables a write of RetryResult needs';

COMMENT ON FUNCTION "slice"."__stand_retry_root_rvzhlkfxal"() IS 'the stand-up of the rule judge''s session tables a write of RetryRoot needs';

COMMENT ON FUNCTION "slice"."__stand_retry_step_7csxwmutn2"() IS 'the stand-up of the rule judge''s session tables a write of RetryStep needs';

COMMENT ON FUNCTION "slice"."__stand_review_claim_hkt7qw7mpi"() IS 'the stand-up of the rule judge''s session tables a write of ReviewClaim needs';

COMMENT ON FUNCTION "slice"."__stand_review_done_ujerlpx2vl"() IS 'the stand-up of the rule judge''s session tables a write of ReviewDone needs';

COMMENT ON FUNCTION "slice"."__stand_review_ended_h3z5bew2vq"() IS 'the stand-up of the rule judge''s session tables a write of ReviewEnded needs';

COMMENT ON FUNCTION "slice"."__stand_review_failed_a5vyjorx3e"() IS 'the stand-up of the rule judge''s session tables a write of ReviewFailed needs';

COMMENT ON FUNCTION "slice"."__stand_review_held_kz6nzl3mw3"() IS 'the stand-up of the rule judge''s session tables a write of ReviewHeld needs';

COMMENT ON FUNCTION "slice"."__stand_review_hold_nhd6ml2ptp"() IS 'the stand-up of the rule judge''s session tables a write of ReviewHold needs';

COMMENT ON FUNCTION "slice"."__stand_review_requested_with_o2plzxclt7"() IS 'the stand-up of the rule judge''s session tables a write of ReviewRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_review_result_7berxkzbzb"() IS 'the stand-up of the rule judge''s session tables a write of ReviewResult needs';

COMMENT ON FUNCTION "slice"."__stand_review_root_ejfkrp7dtz"() IS 'the stand-up of the rule judge''s session tables a write of ReviewRoot needs';

COMMENT ON FUNCTION "slice"."__stand_review_step_aidfiao2mn"() IS 'the stand-up of the rule judge''s session tables a write of ReviewStep needs';

COMMENT ON FUNCTION "slice"."__stand_review_within_bqv44gzoli"() IS 'the stand-up of the rule judge''s session tables a write of ReviewWithin needs';

COMMENT ON FUNCTION "slice"."__stand_sync_done_4ihvwniwqp"() IS 'the stand-up of the rule judge''s session tables a write of SyncDone needs';

COMMENT ON FUNCTION "slice"."__stand_sync_failed_uzrsh7vxay"() IS 'the stand-up of the rule judge''s session tables a write of SyncFailed needs';

COMMENT ON FUNCTION "slice"."__stand_sync_requested_with_4lul7oihcy"() IS 'the stand-up of the rule judge''s session tables a write of SyncRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_sync_result_fkuahqxxbc"() IS 'the stand-up of the rule judge''s session tables a write of SyncResult needs';

COMMENT ON FUNCTION "slice"."__stand_sync_root_otymwhik42"() IS 'the stand-up of the rule judge''s session tables a write of SyncRoot needs';

COMMENT ON FUNCTION "slice"."__stand_sync_step_mljbwcbsm5"() IS 'the stand-up of the rule judge''s session tables a write of SyncStep needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_done_ra7zoinlni"() IS 'the stand-up of the rule judge''s session tables a write of WritebackDone needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_failed_tv4kbeol35"() IS 'the stand-up of the rule judge''s session tables a write of WritebackFailed needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_requested_with_xfqdgwx6jv"() IS 'the stand-up of the rule judge''s session tables a write of WritebackRequestedWith needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_result_owlolckns5"() IS 'the stand-up of the rule judge''s session tables a write of WritebackResult needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_root_m53pgt6gxz"() IS 'the stand-up of the rule judge''s session tables a write of WritebackRoot needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_step_dhhgvpedc7"() IS 'the stand-up of the rule judge''s session tables a write of WritebackStep needs';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_kijoknpmnpomn_4zjcryoy43"() IS 'the stand-up of the rule judge''s session tables a write of assign_assignment_input_kijoknpmnpomn needs';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_mode_nearest_vxt2wtffpo"() IS 'the stand-up of the rule judge''s session tables a write of assign_assignment_input_mode_nearest_jdmfgbfmpepjd needs';

COMMENT ON FUNCTION "slice"."__stand_assign_assignment_input_mode_within_oknn2mesyq"() IS 'the stand-up of the rule judge''s session tables a write of assign_assignment_input_mode_within_iahlinklmdadj needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_ffhdojphbdjfc_2wcpr6jzag"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_input_ffhdojphbdjfc needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_mode_nearest_sliikwmklp"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_input_mode_nearest_ijgbegdphofca needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_input_mode_within_7war272rv6"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_input_mode_within_fgbilcoafbdcg needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_fkgbaoobeoima_67xxw2k7pi"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_output_fkgbaoobeoima needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_stage_rest_t7oibkktdz"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_output_stage_rest_gohjkdlkfnkca needs';

COMMENT ON FUNCTION "slice"."__stand_assign_decide_output_stage_serve_xssm6lxj3d"() IS 'the stand-up of the rule judge''s session tables a write of assign_decide_output_stage_serve_chfjeagmkjoef needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_kmlepfpdepkmo_eewc5pinsu"() IS 'the stand-up of the rule judge''s session tables a write of assign_embed_input_kmlepfpdepkmo needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_mode_nearest_faxr7zpsfd"() IS 'the stand-up of the rule judge''s session tables a write of assign_embed_input_mode_nearest_bdiihcbmhfojp needs';

COMMENT ON FUNCTION "slice"."__stand_assign_embed_input_mode_within_oiehjhalkkkfi_fhcs4pnxlw"() IS 'the stand-up of the rule judge''s session tables a write of assign_embed_input_mode_within_oiehjhalkkkfi needs';

COMMENT ON FUNCTION "slice"."__stand_chain_page_input_jhliinhchcgno_72s7eqdrli"() IS 'the stand-up of the rule judge''s session tables a write of chain_page_input_jhliinhchcgno needs';

COMMENT ON FUNCTION "slice"."__stand_clock_chime_input_bfjhiocgaifco_i5wa6mgnkj"() IS 'the stand-up of the rule judge''s session tables a write of clock_chime_input_bfjhiocgaifco needs';

COMMENT ON FUNCTION "slice"."__stand_clock_close_input_bajjphdpmhlbc_zgk4a7xdtd"() IS 'the stand-up of the rule judge''s session tables a write of clock_close_input_bajjphdpmhlbc needs';

COMMENT ON FUNCTION "slice"."__stand_clock_hourly_key_cnlgnmcbbcgma_lpqbewarwz"() IS 'the stand-up of the rule judge''s session tables a write of clock_hourly_key_cnlgnmcbbcgma needs';

COMMENT ON FUNCTION "slice"."__stand_fan_batch_input_hjhhnklpfiilh_7kl3aei6vl"() IS 'the stand-up of the rule judge''s session tables a write of fan_batch_input_hjhhnklpfiilh needs';

COMMENT ON FUNCTION "slice"."__stand_fan_dust_input_lelfhikaelkja_43itgxt6mz"() IS 'the stand-up of the rule judge''s session tables a write of fan_dust_input_lelfhikaelkja needs';

COMMENT ON FUNCTION "slice"."__stand_fan_mop_input_ngghbiaegmghl_365ret7qr7"() IS 'the stand-up of the rule judge''s session tables a write of fan_mop_input_ngghbiaegmghl needs';

COMMENT ON FUNCTION "slice"."__stand_fan_square_input_ifddbjkaokoig_vp33jtgqnj"() IS 'the stand-up of the rule judge''s session tables a write of fan_square_input_ifddbjkaokoig needs';

COMMENT ON FUNCTION "slice"."__stand_fan_wanted_key_ldjmcglkghhjb_y7pro5icwo"() IS 'the stand-up of the rule judge''s session tables a write of fan_wanted_key_ldjmcglkghhjb needs';

COMMENT ON FUNCTION "slice"."__stand_retry_brittle_input_jbcpaiekdedpp_nw6tdeuvqw"() IS 'the stand-up of the rule judge''s session tables a write of retry_brittle_input_jbcpaiekdedpp needs';

COMMENT ON FUNCTION "slice"."__stand_retry_patient_input_ndliolfjpjnoc_xgt5djgzrl"() IS 'the stand-up of the rule judge''s session tables a write of retry_patient_input_ndliolfjpjnoc needs';

COMMENT ON FUNCTION "slice"."__stand_retry_polite_input_iopjdjgdhfide_thdczn73pf"() IS 'the stand-up of the rule judge''s session tables a write of retry_polite_input_iopjdjgdhfide needs';

COMMENT ON FUNCTION "slice"."__stand_retry_steadfast_input_ebanfagjeadim_rtqhg3l443"() IS 'the stand-up of the rule judge''s session tables a write of retry_steadfast_input_ebanfagjeadim needs';

COMMENT ON FUNCTION "slice"."__stand_review_analyze_input_aobppbhebnkae_n5peaeon6o"() IS 'the stand-up of the rule judge''s session tables a write of review_analyze_input_aobppbhebnkae needs';

COMMENT ON FUNCTION "slice"."__stand_review_gather_input_eiadkjkkdoiel_46vusrxodo"() IS 'the stand-up of the rule judge''s session tables a write of review_gather_input_eiadkjkkdoiel needs';

COMMENT ON FUNCTION "slice"."__stand_review_questions_input_jigaomgjefjfk_5x3k5au3i4"() IS 'the stand-up of the rule judge''s session tables a write of review_questions_input_jigaomgjefjfk needs';

COMMENT ON FUNCTION "slice"."__stand_review_save_input_njbdjgekhblef_ur5v4jws3f"() IS 'the stand-up of the rule judge''s session tables a write of review_save_input_njbdjgekhblef needs';

COMMENT ON FUNCTION "slice"."__stand_sync_build_input_khidlilbdjpfi_lsszbfcaws"() IS 'the stand-up of the rule judge''s session tables a write of sync_build_input_khidlilbdjpfi needs';

COMMENT ON FUNCTION "slice"."__stand_sync_copy_input_fijfgeannmgef_4papuncizy"() IS 'the stand-up of the rule judge''s session tables a write of sync_copy_input_fijfgeannmgef needs';

COMMENT ON FUNCTION "slice"."__stand_writeback_deliver_input_libhnkibecamc_lagffiefhq"() IS 'the stand-up of the rule judge''s session tables a write of writeback_deliver_input_libhnkibecamc needs';

COMMENT ON FUNCTION "slice"."__immutable_assign_paused_5n3oauuljz"() IS 'immutability guard of AssignPaused';

COMMENT ON FUNCTION "slice"."__immutable_assign_requested_with_jfazpuokod"() IS 'immutability guard of AssignRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_assign_resumed_wcgii3wia6"() IS 'immutability guard of AssignResumed';

COMMENT ON FUNCTION "slice"."__immutable_assign_root_z5tsxfpw75"() IS 'immutability guard of AssignRoot';

COMMENT ON FUNCTION "slice"."__immutable_assign_served_7za7irllan"() IS 'immutability guard of AssignServed';

COMMENT ON FUNCTION "slice"."__immutable_assigned_tbugyxabsc"() IS 'immutability guard of Assigned';

COMMENT ON FUNCTION "slice"."__immutable_audit_tvhiun4dxz"() IS 'immutability guard of Audit';

COMMENT ON FUNCTION "slice"."__immutable_built_2sr4obr6b3"() IS 'immutability guard of Built';

COMMENT ON FUNCTION "slice"."__immutable_chain_paused_aoyhzggt5w"() IS 'immutability guard of ChainPaused';

COMMENT ON FUNCTION "slice"."__immutable_chain_requested_with_lphulmotb2"() IS 'immutability guard of ChainRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_chain_resumed_pyb74if2ds"() IS 'immutability guard of ChainResumed';

COMMENT ON FUNCTION "slice"."__immutable_chain_root_kfhmbkwvfv"() IS 'immutability guard of ChainRoot';

COMMENT ON FUNCTION "slice"."__immutable_chain_served_dqa4yeivrn"() IS 'immutability guard of ChainServed';

COMMENT ON FUNCTION "slice"."__immutable_chimed_gtkcd6vluu"() IS 'immutability guard of Chimed';

COMMENT ON FUNCTION "slice"."__immutable_clock_paused_3ykaw355ga"() IS 'immutability guard of ClockPaused';

COMMENT ON FUNCTION "slice"."__immutable_clock_requested_with_qdxfqqbips"() IS 'immutability guard of ClockRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_clock_resumed_yqfyfvv7pj"() IS 'immutability guard of ClockResumed';

COMMENT ON FUNCTION "slice"."__immutable_clock_root_75oloon3nz"() IS 'immutability guard of ClockRoot';

COMMENT ON FUNCTION "slice"."__immutable_clock_served_rxiknybpmu"() IS 'immutability guard of ClockServed';

COMMENT ON FUNCTION "slice"."__immutable_concluded_usqwygcl43"() IS 'immutability guard of Concluded';

COMMENT ON FUNCTION "slice"."__immutable_copied_nroyctccyr"() IS 'immutability guard of Copied';

COMMENT ON FUNCTION "slice"."__immutable_cursor_yzelwkrjiw"() IS 'immutability guard of Cursor';

COMMENT ON FUNCTION "slice"."__immutable_delivered_bv4bssb7wd"() IS 'immutability guard of Delivered';

COMMENT ON FUNCTION "slice"."__immutable_fan_exclusive_wlob4hbpim"() IS 'immutability guard of FanExclusive';

COMMENT ON FUNCTION "slice"."__immutable_fan_paused_ybdsv5d4um"() IS 'immutability guard of FanPaused';

COMMENT ON FUNCTION "slice"."__immutable_fan_released_kx4eveefrz"() IS 'immutability guard of FanReleased';

COMMENT ON FUNCTION "slice"."__immutable_fan_requested_with_jx75cuglpf"() IS 'immutability guard of FanRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_fan_resumed_euttpstg26"() IS 'immutability guard of FanResumed';

COMMENT ON FUNCTION "slice"."__immutable_fan_root_vjstxtlelj"() IS 'immutability guard of FanRoot';

COMMENT ON FUNCTION "slice"."__immutable_fan_served_xsm6rsme66"() IS 'immutability guard of FanServed';

COMMENT ON FUNCTION "slice"."__immutable_heard_fdsu5343fb"() IS 'immutability guard of Heard';

COMMENT ON FUNCTION "slice"."__immutable_item_4ldnoxfrc7"() IS 'immutability guard of Item';

COMMENT ON FUNCTION "slice"."__immutable_order_ben75ltrft"() IS 'immutability guard of Order';

COMMENT ON FUNCTION "slice"."__immutable_retry_paused_ss7djxjrej"() IS 'immutability guard of RetryPaused';

COMMENT ON FUNCTION "slice"."__immutable_retry_requested_with_mw5llz3rby"() IS 'immutability guard of RetryRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_retry_resumed_dlzqou5yma"() IS 'immutability guard of RetryResumed';

COMMENT ON FUNCTION "slice"."__immutable_retry_root_tebbmtjoyc"() IS 'immutability guard of RetryRoot';

COMMENT ON FUNCTION "slice"."__immutable_retry_served_hyzc4o4ezw"() IS 'immutability guard of RetryServed';

COMMENT ON FUNCTION "slice"."__immutable_review_paused_cmayqb3lyz"() IS 'immutability guard of ReviewPaused';

COMMENT ON FUNCTION "slice"."__immutable_review_requested_with_3oturoaqs5"() IS 'immutability guard of ReviewRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_review_resumed_yerv455d7e"() IS 'immutability guard of ReviewResumed';

COMMENT ON FUNCTION "slice"."__immutable_review_root_po3ofptpdd"() IS 'immutability guard of ReviewRoot';

COMMENT ON FUNCTION "slice"."__immutable_review_served_klodk5ysgl"() IS 'immutability guard of ReviewServed';

COMMENT ON FUNCTION "slice"."__immutable_reviewed_al7kpguevt"() IS 'immutability guard of Reviewed';

COMMENT ON FUNCTION "slice"."__immutable_settled_wamxlunuss"() IS 'immutability guard of Settled';

COMMENT ON FUNCTION "slice"."__immutable_summary_eaie3elgpy"() IS 'immutability guard of Summary';

COMMENT ON FUNCTION "slice"."__immutable_sync_exclusive_wp25ozdfpb"() IS 'immutability guard of SyncExclusive';

COMMENT ON FUNCTION "slice"."__immutable_sync_paused_2kerwzow7r"() IS 'immutability guard of SyncPaused';

COMMENT ON FUNCTION "slice"."__immutable_sync_released_vxed37ia4q"() IS 'immutability guard of SyncReleased';

COMMENT ON FUNCTION "slice"."__immutable_sync_requested_with_75aana3qd2"() IS 'immutability guard of SyncRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_sync_resumed_tbwsh2hgo7"() IS 'immutability guard of SyncResumed';

COMMENT ON FUNCTION "slice"."__immutable_sync_root_hayadibiof"() IS 'immutability guard of SyncRoot';

COMMENT ON FUNCTION "slice"."__immutable_sync_served_a7364rtkid"() IS 'immutability guard of SyncServed';

COMMENT ON FUNCTION "slice"."__immutable_tally_6vtadbiqmv"() IS 'immutability guard of Tally';

COMMENT ON FUNCTION "slice"."__immutable_want_t63kc73bus"() IS 'immutability guard of Want';

COMMENT ON FUNCTION "slice"."__immutable_weight_sby3z3ax7g"() IS 'immutability guard of Weight';

COMMENT ON FUNCTION "slice"."__immutable_writeback_paused_wlprgt3byb"() IS 'immutability guard of WritebackPaused';

COMMENT ON FUNCTION "slice"."__immutable_writeback_requested_with_7ilwkltxjy"() IS 'immutability guard of WritebackRequestedWith';

COMMENT ON FUNCTION "slice"."__immutable_writeback_resumed_vv3hrewq67"() IS 'immutability guard of WritebackResumed';

COMMENT ON FUNCTION "slice"."__immutable_writeback_root_ysmkev76k2"() IS 'immutability guard of WritebackRoot';

COMMENT ON FUNCTION "slice"."__immutable_writeback_served_eyz5dxxige"() IS 'immutability guard of WritebackServed';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_nearest_mlemoegfgpbbi_w3ccj53jyj"() IS 'immutability guard of assign_decide_read_nearest_mlemoegfgpbbiRow';

COMMENT ON FUNCTION "slice"."__immutable_assign_decide_read_seen_oahojgbpphboo_enimsfuqsy"() IS 'immutability guard of assign_decide_read_seen_oahojgbpphbooRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_earlier_dgehlbgebidjc_dvgtmnwss5"() IS 'immutability guard of chain_page_read_earlier_dgehlbgebidjcRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_items_cokakfjlndgem_vfyivli2ca"() IS 'immutability guard of chain_page_read_tree_items_cokakfjlndgem';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_items_first_nk3kwpaoy2"() IS 'immutability guard of chain_page_read_tree_items_first_ocgolceclfbii';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_tree_lakencnpkciin_row_w6vayttbca"() IS 'immutability guard of chain_page_read_tree_lakencnpkciinRow';

COMMENT ON FUNCTION "slice"."__immutable_chain_page_read_weights_agiabippcbobb_neiyqz46uv"() IS 'immutability guard of chain_page_read_weights_agiabippcbobbRow';

COMMENT ON FUNCTION "slice"."__immutable_clock_hourly_key_cnlgnmcbbcgma_i5bki5jhcf"() IS 'immutability guard of clock_hourly_key_cnlgnmcbbcgma';

COMMENT ON FUNCTION "slice"."__immutable_fan_wanted_key_ldjmcglkghhjb_uktppxiuxq"() IS 'immutability guard of fan_wanted_key_ldjmcglkghhjb';

COMMENT ON ROLE :"__live_wzkq6p2yii" IS 'live source of slice';

COMMENT ON VIEW "__slice_den"."__assign_decide_read_nearest_mlemoegfgpbbi_2vs6z2uv4y" IS 'whole view of the root relation of records assign_decide_read_nearest_mlemoegfgpbbi';

COMMENT ON VIEW "__slice_den"."__assign_decide_read_seen_oahojgbpphboo_evmwj6qjq5" IS 'whole view of the root relation of records assign_decide_read_seen_oahojgbpphboo';

COMMENT ON VIEW "__slice_den"."__chain_page_read_earlier_dgehlbgebidjc_kpkyhi4gs4" IS 'whole view of the root relation of records chain_page_read_earlier_dgehlbgebidjc';

COMMENT ON VIEW "__slice_den"."__chain_page_read_tree_lakencnpkciin_yxrftmct4w" IS 'whole view of the root relation of records chain_page_read_tree_lakencnpkciin';

COMMENT ON VIEW "__slice_den"."__chain_page_read_weights_agiabippcbobb_mmooyrirhr" IS 'whole view of the root relation of records chain_page_read_weights_agiabippcbobb';
