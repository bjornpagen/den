DROP TRIGGER "__rule_fan_live_check_fan_seat_below_count_yebtxevyos" ON "slice"."fan_hold";

DROP TRIGGER "__rule_fan_live_check_fan_seat_below_count_yebtxevyos" ON "slice"."fan_freed";

DROP FUNCTION "slice"."__rule_fan_hold_fan_live_check_fan_seat_below_count_zmpbuhqfcd"() RESTRICT;

DROP FUNCTION "slice"."__rule_fan_freed_fan_live_check_fan_seat_below_count_jksgj45pcq"() RESTRICT;

COMMENT ON FUNCTION "slice"."__capture_fan_freed_r2nc4uaetx"() IS 'rule capture of FanFreed';

COMMENT ON FUNCTION "slice"."__capture_fan_hold_ddvc7a2pzn"() IS 'rule capture of FanHold';
