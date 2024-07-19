`ifndef TOP_SV
`define TOP_SV

import uvm_pkg::*;
import hbus_pkg::*;
`include "uvm_macros.svh"
`include "../yapp/sv/yapp.svh"
`include "../channel/sv/channel.svh"
`include "../channel/sv/channel_if.sv"
`include "../hbus/sv/hbus_if.sv"


module top();
  bit clock;
  bit reset;
  logic in_suspend;

always  begin
#5 clock=~clock;
end

always  begin
reset = 0;
#1;
repeat(2) begin
reset =1;
#10;
end
forever begin
#5 reset = 0;
end
end


yapp_if in0 (clock, reset); 
hbus_if hb0_if(clock,reset);
channel_if ch0_if(clock,reset);
channel_if ch1_if(clock,reset);
channel_if ch2_if(clock,reset);

yapp_router dut(.clock(clock),
                .reset(reset),
                .in_data(in0.in_data),
                .in_data_vld(in0.in_data_vld),
                .in_suspend(in0.in_suspend),
                .suspend_0(ch0_if.suspend),
                .suspend_1(ch1_if.suspend),
                .suspend_2(ch1_if.suspend),
                .data_0(ch0_if.data), 
                .data_vld_0(ch0_if.data_vld), 
                .data_1(ch1_if.data),  
                .data_vld_1(ch1_if.data_vld), 
                .data_2(ch2_if.data),  
                .data_vld_2(ch2_if.data_vld)
                .haddr (hb0_if.haddr),
                .hdata(hb0_if.hdata_w),
                .hen(hb0_if.hen),
                .hwr_rd(hb0_if.hwr_rd)
                );
initial  begin
  yapp_vif_config ::set(null,"uvm_test_top.router_inst.env.*","vif",in0);
  channel_vif_config::set(null,"uvm_test_top.router_inst.ch0.*","vif",ch0_if);
  channel_vif_config::set(null,"uvm_test_top.router_inst.ch1.*","vif",ch1_if);
  channel_vif_config::set(null,"uvm_test_top.router_inst.ch2.*","vif",ch2_if);
  hbus_vif_config::set(null,"uvm_test_top.router_inst.hbus_h.*","vif",hb0_if);
end 
initial begin
  run_test("router_vtest_lib");
end


endmodule

`endif //TOP_SV
