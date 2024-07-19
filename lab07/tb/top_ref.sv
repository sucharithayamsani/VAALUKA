import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../sv/yapp.svh"
module top();
base_test test;
yapp_if in0(clock,reset);
initial
begin
yapp_vif_config ::set(null,"*","vif",in0);
end
initial
begin
run_test("exhaustive_seq_test");
end
initial
begin
uvm_config_db#(base_test)::set(null,"*","env",test);
end
endmodule
