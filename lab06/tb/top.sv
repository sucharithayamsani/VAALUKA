import uvm_pkg::*;
`include "../sv/yapp_router.sv"
`include "uvm_macros.svh"
`include "../sv/yapp.svh"
module top();
  bit clock;
  bit reset;
  logic in_suspend;

yapp_if in0 (clock, reset); 
base_test test;

yapp_router dut(.clock(clock),
                .reset(reset),
                .in_data(in0.in_data),
                .in_data_vld(in0.in_data_vld),
                .in_suspend(in0.in_suspend),
                .suspend_0('b0),
                .suspend_1('b0),
                .suspend_2('b0)); 
initial  begin
  //in_suspend <= 'b0;
  yapp_vif_config ::set(null,"*","vif",in0);
 // uvm_config_db#(virtual yapp_if)::set(null,"*"," ",in0);
  uvm_config_db#(base_test)::set(null,"*","env",test);
  run_test("exhaustive_seq_test");
end

always  begin
#5 clock=~clock;
end

initial  begin
reset = 1;
#20 reset = 0;
end
endmodule
