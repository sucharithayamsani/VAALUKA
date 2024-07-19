import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../sv/yapp.svh"
module top();
base_test test;
initial
begin
run_test("exhaustive_seq_test");
end
initial
begin
uvm_config_db#(base_test)::set(null,"*","env",test);
end
endmodule
