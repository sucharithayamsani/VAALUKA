import uvm_pkg::*;
`include "uvm_macros.svh"
`include "../sv/yapp.svh"
`include "yapp_test_lib.sv"
module top();
initial
begin
run_test("set_config_test");
end

endmodule
