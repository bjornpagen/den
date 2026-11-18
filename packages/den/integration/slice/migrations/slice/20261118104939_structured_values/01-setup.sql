CREATE FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_assignment_input_mode_names_w3ldolcqbb"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Nearest","Within"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_input_mode_names_zoydpw665o"() FROM PUBLIC;

CREATE FUNCTION "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"() RETURNS "pg_catalog"."name"[]
LANGUAGE sql IMMUTABLE PARALLEL SAFE
RETURN '{"Serve","Rest"}'::"pg_catalog"."name"[];

REVOKE ALL ON FUNCTION "slice"."__assign_decide_output_stage_names_vvnbi7fwx4"() FROM PUBLIC;

CREATE DOMAIN "slice"."assign_assignment_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_assignment_input_mode_names_w3ldolcqbb"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_decide_input_mode" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_decide_input_mode_names_zoydpw665o"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);

CREATE DOMAIN "slice"."assign_decide_output_stage" AS smallint CONSTRAINT "check" CHECK (VALUE IS NULL OR (("slice"."__assign_decide_output_stage_names_vvnbi7fwx4"())[VALUE + 1] <> ''::"pg_catalog"."name") IS TRUE);
