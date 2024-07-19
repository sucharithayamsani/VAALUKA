import uvm_pkg::*;
import hbus_pkg::*;
`include "uvm_macros.svh"
`include "../hbus/sv/hbus_if.sv"
`include "../channel/sv/channel_if.sv"
`include "../yapp/sv/yapp.svh"
`include "../channel/sv/channel.svh"
`include "../yapp/sv/yapp_router.sv"
module top();
  bit clock;
  bit reset;
  logic in_suspend;

yapp_if in0 (clock, reset); 
base_test test;
hbus_if hb0(clock,reset);
channel_if ch0(clock,reset);
channel_if ch1(clock,reset);
channel_if ch2(clock,reset);

yapp_router dut(.clock(clock),
                .reset(reset),
                .in_data(in0.in_data),
                .in_data_vld(in0.in_data_vld),
                .in_suspend(in0.in_suspend),
                .suspend_0('b0),
                .suspend_1('b0),
                .suspend_2('b0),
                .data_0(ch0.data), 
                .data_vld_0(ch0.data_vld), 
                .data_1(ch1.data),  
                .data_vld_1(ch1.data_vld), 
                .data_2(ch2.data),  
                .data_vld_2(ch2.data_vld));
initial  begin
  //in_suspend <= 'b0;
  yapp_vif_config ::set(null,"*","vif",in0);
  channel_vif_config::set(null,"*","vif",ch0);
  channel_vif_config::set(null,"*","vif",ch1);
  channel_vif_config::set(null,"*","vif",ch2);
  hbus_vif_config::set(null,"*","vif",hb0);



  //uvm_config_db#(virtual yapp_if)::set(null,"*"," ",in0);
  uvm_config_db#(base_test)::set(null,"*","env",test);
  run_test("simple_test");
end

always  begin
#5 clock=~clock;
end

initial  begin
reset = 1;
#20 reset = 0;
end
endmodule
