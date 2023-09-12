library verilog;
use verilog.vl_types.all;
entity sig_control is
    generic(
        RED             : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        YELLOW          : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        GREEN           : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        S0              : vl_notype;
        S1              : vl_notype;
        S2              : vl_notype;
        S3              : vl_notype;
        S4              : vl_notype
    );
    port(
        hwy             : out    vl_logic_vector(2 downto 0);
        crd             : out    vl_logic_vector(2 downto 0);
        x               : in     vl_logic;
        clock           : in     vl_logic;
        clear           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RED : constant is 1;
    attribute mti_svvh_generic_type of YELLOW : constant is 1;
    attribute mti_svvh_generic_type of GREEN : constant is 1;
    attribute mti_svvh_generic_type of S0 : constant is 3;
    attribute mti_svvh_generic_type of S1 : constant is 3;
    attribute mti_svvh_generic_type of S2 : constant is 3;
    attribute mti_svvh_generic_type of S3 : constant is 3;
    attribute mti_svvh_generic_type of S4 : constant is 3;
end sig_control;
